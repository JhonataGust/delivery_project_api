module V1
  module Users
    class MessagesController < ApplicationController
      before_action :set_message, only: [:update]

      def create
        @message = Message.create(set_message_param_attr)
      end

      def update
        @message.update(message: set_message_param_attr[:message], user_id: set_message_param_attr[:user_id], edited: true)
      end

      private

      def set_message_param_attr
        message_attr = message_param
        message_attr[:user_id] = @user.id
        message_attr
      end

      def set_message
        @message = Message.find_by(id: params[:id])

        return render json: { error: 'Message not found' }, status: 404 if @message.nil?
      end

      def message_param
        params.require(:message).permit(:message, :reference_type, :reference_id, :rate)
      end
    end
  end
end
