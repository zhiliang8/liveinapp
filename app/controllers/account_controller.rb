# coding:utf-8
class AccountController < Devise::RegistrationsController
  layout 'two_column', :except => ['new', 'create']
  set_tab :dashboard, :only => %w(index)
  set_tab :my_account, :except => %w(index)
  set_tab :basic, :account, :only => %(edit)
  set_tab :password, :account, :only => %(edit_password)
  
  def index
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  end
  
  def edit_password
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  end
  
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    # If the user has filled in any of the password fields, we'll update their password
    any_passwords = %w(password password_confirmation current_password).any? do |field|
      params[resource_name][field].present?
    end
    update_method = any_passwords ? :update_with_password : :update_without_password

    if resource.send(update_method, params[resource_name])
      set_flash_message :notice, :updated if is_navigational_format?
      sign_in resource_name, resource, :bypass => true
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with resource
    end
  end
  
  protected
    def after_update_path_for(resource)
      edit_registration_path(resource)
    end
end
