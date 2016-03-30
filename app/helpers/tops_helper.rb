module TopsHelper
  def post_status(post)
    case post.status
    when 'progressing'
      'panel panel-success'
    when 'completed'
      'panel panel-info'
    when 'closed'
      'panel panel-danger'
    end
  end
end
