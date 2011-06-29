class ApplicationController < ActionController::Base
  include Admin::Controllers::HasContent

  protect_from_forgery
  layout :layout

  managable_content_ignore_namespace 'admin', 'devise', 'ckeditor', 'jammit', 'errors'
  managable_layout_content_for :contact_info, :about

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

  def layout
    devise_controller? ? 'login' : 'application'
  end
end
