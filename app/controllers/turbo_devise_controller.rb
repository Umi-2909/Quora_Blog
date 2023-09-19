class TurboDeviseController < ApplicationController
  class TurboStreamResponder < ActionController::Responder
    def to_turbo_stream
      handle_turbo_stream_response
    rescue ActionView::MissingTemplate => error
      handle_missing_template_response(error)
    end

    private

    def handle_turbo_stream_response
      controller.render(options.merge(formats: :html))
    end

    def handle_missing_template_response(error)
      if get?
        raise error
      elsif has_errors? && default_action
        render_unprocessable_entity_response
      else
        redirect_to_navigation_location
      end
    end

    def render_unprocessable_entity_response
      render rendering_options.merge(formats: :html, status: :unprocessable_entity)
    end

    def redirect_to_navigation_location
      redirect_to navigation_location
    end
  end

  self.responder = TurboStreamResponder
  respond_to :html, :turbo_stream
end
