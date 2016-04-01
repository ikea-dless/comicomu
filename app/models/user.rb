class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy

  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        username: auth.info.name,
        email: User.get_email(auth)
      )
    end
    user
  end

  # providerがある場合（Twitter経由で認証した）は、
  # passwordは要求しないようにする。
  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    # パスワードが空の場合
    if encrypted_password.blank?
      # パスワードがなくても更新できる
      update_attributes(params, *options)
    else
      super
    end
  end

  private

    def self.get_email(auth)
      email = auth.info.email
      email = "#{auth.provider}-#{auth.uid}@example.com" if email.blank?
      email
    end
end
