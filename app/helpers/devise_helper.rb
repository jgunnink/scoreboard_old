module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger" role="alert"> <button type="button"
    class="close" data-dismiss="alert">x</button>
      <h4>Oops! Please check the following, and try again:</h4>#{messages}
    </div>
    HTML

    html.html_safe
  end
end