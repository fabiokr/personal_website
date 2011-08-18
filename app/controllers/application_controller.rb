class ApplicationController < ActionController::Base
  include ManageableContent::Controllers::Dsl

  protect_from_forgery

  manageable_layout_content_for :contact_info
  manageable_content_for        :title, :description, :keywords

  respond_to :html

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  end

  before_filter do
    I18n.locale = params[:locale] || Rails.configuration.i18n.locale
  end

  protected

  def render_not_found(exception)
    render :template => "/errors/404.html.erb", :status => 404
  end

  def render_error(exception)
    render :template => "/errors/500.html.erb", :status => 500
  end
end
