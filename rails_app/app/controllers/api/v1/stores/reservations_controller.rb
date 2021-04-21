module Api::V1
  class Stores::ReservationsController < BaseApiController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!, except: [:create]

    def create
      reversion = current_user.reservations.create!(reversion_params)
      render json: reversion, serializer: Api::V1::ReservationSerializer
    end

    private

      def reversion_params
        params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                            :inquiry, :reservation_number, :user_id, :store_id)
      end
  end
end
