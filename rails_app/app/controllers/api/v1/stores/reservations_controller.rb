module Api::V1
  class Stores::ReservationsController < BaseApiController
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
  end
end
