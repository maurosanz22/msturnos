module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?
    
    sentence = "Por favor verifique que los datos sean correctos"

    html = <<-HTML
    <div id="error_explanation" style="color:red;">
      <h4>#{sentence}</h4>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end