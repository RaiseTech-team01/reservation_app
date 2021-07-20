module Api::V1
  class Stores::ReservationsController < BaseApiController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :verify_authenticity_token
    before_action :authenticate_store!

    def index
      reservations = current_store.reservations
      render json: reservations, each_serializer: Api::V1::ReservationSerializer
    end

    def show
      reservation = current_store.reservations.find(params[:id])
      render json: reservation, serializer: Api::V1::ReservationSerializer
    end

    private

      def record_not_found
        render json: {
          errors: {
            messege: "申し訳ありません。指定した予約データは存在しません",
          },
        }, status: :not_found
      end
  end
end
