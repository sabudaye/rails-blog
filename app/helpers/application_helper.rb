module ApplicationHelper
  #NOTE like EDU
  def han(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end
end
