class HomesController < ApplicationController

  manageable_content_for :body, :image

  def index
  end
end
