module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      message = resolve_not_found_message(e)
      json_response({ message: message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveModel::ForbiddenAttributesError do |e|
      json_response({ message: e.message }, :forbidden)
    end



  end


end