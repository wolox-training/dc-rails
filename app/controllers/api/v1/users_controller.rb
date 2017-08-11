module Api
  module V1
    class UsersController < ApiController
      include Wor::Paginate
      before_action :current_user

      def rents_index
        authorize current_user
        render_paginated current_user.rents, each_serializer: UserRentSerializer
      end
    end
  end
end
