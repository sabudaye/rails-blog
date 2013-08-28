class ApplicationDecorator < Draper::Decorator
  #NOTE взято отсюда https://gist.github.com/vlasar/5003493
  def self.collection_decorator_class
    CollectionDecorator
  end
end
