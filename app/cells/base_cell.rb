# coding: utf-8
class BaseCell < Cell::Rails
  helper ApplicationHelper
  include Devise::Controllers::Helpers
  helper_method :current_user
  
end