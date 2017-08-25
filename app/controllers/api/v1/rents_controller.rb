module Api
  module V1
    class RentsController < ApiController
      before_action :set_locale

      def create
        authorize current_user, :create_rent?
        rents = CreateRent.call(params: rents_params)
        if rents.success?
          head :created
        else
          render json: { error: rents.message }
        end
      end

      private

      def rents_params
        params.require(:rent).permit(:user_id, :book_id, :from, :to)
      end
    end
  end
end
