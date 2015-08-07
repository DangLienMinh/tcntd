ActiveAdmin::Dependency.devise! ActiveAdmin::Dependency::Requirements::DEVISE

require 'devise'

module ActiveAdmin
  module Devise

    def self.config
      {
        path: ActiveAdmin.application.default_namespace || "/",
        controllers: ActiveAdmin::Devise.controllers,
        path_names: { sign_in: 'login', sign_out: "logout" },
        sign_out_via: [*::Devise.sign_out_via, ActiveAdmin.application.logout_link_method].uniq
      }
    end

    def self.controllers
      {
        sessions: "active_admin/devise/sessions",
        passwords: "active_admin/devise/passwords",
        unlocks: "active_admin/devise/unlocks",
        registrations: "active_admin/devise/registrations",
        confirmations: "active_admin/devise/confirmations"
      }
    end

    module Controller
      extend ::ActiveSupport::Concern
      included do
        layout 'active_admin_logged_out'
        helper ::ActiveAdmin::ViewHelpers
      end

      # Redirect to the default namespace on logout
      def root_path
        namespace = ActiveAdmin.application.default_namespace.presence
        root_path_method = [namespace, :root_path].compact.join('_')

        path = if Helpers::Routes.respond_to? root_path_method
                 Helpers::Routes.send root_path_method
               else
                 # Guess a root_path when url_helpers not helpful
                 "/#{namespace}"
               end

        # NOTE: `relative_url_root` is deprecated by rails.
        #       Remove prefix here if it is removed completely.
        prefix = Rails.configuration.action_controller[:relative_url_root] || ''
        prefix + path
      end
    end

    class SessionsController < ::Devise::SessionsController
      #include ::ActiveAdmin::Devise::Controller::InternalHelpers
      include ::ActiveAdmin::Devise::Controller
      before_filter :captcha_valid, :only => [ :create]
      skip_before_filter :require_no_authentication, :only => [:new]
      $check=0
      $global_count=0
      $global_attemp=0

      def captcha_valid
        login_email=params[:admin_user][:email]

        found_user=AdminUser.where(email: login_email)
        attemps=-1
        if found_user.blank?
          $global_count+=1 
        else
          attemps=found_user.first.failed_attempts
          $global_attemp=attemps
        end
        
       
        if $global_count+$global_attemp>4
          $check=1
          if verify_recaptcha
            $global_attemp=0
          else
            redirect_to new_admin_user_session_path
          end
        else
          $check=0
        end
      end

      def new
        super
      end

      def create
        self.resource = warden.authenticate!(auth_options)
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        $global_count=0
        
        $check=0
        respond_with resource, location: after_sign_in_path_for(resource)
      end



    end

    class PasswordsController < ::Devise::PasswordsController
      include ::ActiveAdmin::Devise::Controller
    end

    class UnlocksController < ::Devise::UnlocksController
      include ::ActiveAdmin::Devise::Controller
    end

    class RegistrationsController < ::Devise::RegistrationsController
       include ::ActiveAdmin::Devise::Controller
    end

    class ConfirmationsController < ::Devise::ConfirmationsController
       include ::ActiveAdmin::Devise::Controller
    end

    def self.controllers_for_filters
      [SessionsController, PasswordsController, UnlocksController,
        RegistrationsController, ConfirmationsController
      ]
    end

  end
end