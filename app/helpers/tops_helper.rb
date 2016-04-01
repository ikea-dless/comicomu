module TopsHelper
  def post_status(post)
    case post.status
    when 'progressing'
      'panel panel-info'
    when 'completed'
      'panel panel-success'
    when 'closed'
      'panel panel-danger'
    end
  end
end
