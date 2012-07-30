module ApplicationHelper
  def field(f, attribute, options = {})
    label_name = options.delete(:label)
    type = options.delete(:type) || :text_field
    content_tag(:div, (f.label(attribute, label_name) + f.send(type, attribute, options)), :class => "field")
  end
end
