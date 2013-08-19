class ApplicationController < ActionController::Base
  include Concerns::FlashHelper

  protect_from_forgery
end