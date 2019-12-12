module Patterns
  class Service
    attr_reader :result

    def self.call(*args)
      new(*args).tap do |service|
        service.instance_variable_set(
            "@result",
            service.call
        )
      end
    end

    def call
      raise NotImplementedError
    end

    def translate(key,value)
      I18n.t!(key, value)
    rescue I18n::MissingTranslationData
      'Unable to Continue. If the problem persists, please contact us by submitting a query via Help Centre.'
    end

  end
end