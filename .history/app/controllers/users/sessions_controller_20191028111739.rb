# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
      respond_to :json
      after_action :notify_pusher_login, only: :create
      before_action :notify_pusher_logout, only: :destroy


      def notify_pusher_login
        user = User.find(current_user.id)
        user.update(is_signed_in: true)
        notify_pusher 'login'
      end

      def notify_pusher_logout
        user = User.find(current_user.id)
        user.update(is_signed_in: false)
        notify_pusher 'logout'
      end

      def notify_pusher(activity_type)
        Pusher.trigger('activity', activity_type, current_user.as_json)
      end

      private

      def respond_with(resource, _opts = {})
        render json: resource
      end

      def respond_to_on_destroy
        head :no_content
      end

end
