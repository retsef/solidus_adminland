class ApplicationComponent < ViewComponent::Base
  include ViewComponentContrib::TranslationHelper

  private

  def identifier
    @identifier ||= self.class.name.sub('::Component', '').underscore.split('/').join('--')
  end

  def unique_id
    @unique_id ||= SecureRandom.uuid
  end

  def class_for(name, from: identifier)
    "c-#{from}-#{name}"
  end
end
