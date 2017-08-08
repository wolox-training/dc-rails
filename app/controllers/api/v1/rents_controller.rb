module Api
  module V1
    class RentsController < ApiController

      def create
        # new_rent = Rent.new(rents_params)
        new_rent = current_user.rents.build
        new_rent.assign_attributes(rents_params)
        if new_rent.save
          head :created
        else
          render json: new_rent.errors.as_json
        end
      end

      private
      def rents_params
        params.require(:rent).permit(:book_id, :from, :to)
      end
    end
  end
end
