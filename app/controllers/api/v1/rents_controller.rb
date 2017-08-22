module Api
  module V1
    class RentsController < ApiController
      before_action :set_locale

      def create
        rent = Rent.new(rents_params)
        authorize rent
        rents = CreateRent.call(rents_params)
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
