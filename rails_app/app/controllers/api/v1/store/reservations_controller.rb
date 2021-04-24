class Api::V1::Store::ReservationsController < Api::V1::BaseApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:create]

  def create
    reversion = current_user.reservations.build(reversion_params)
    reversion.store_id = Store.find(params["store_id"]).id
    reversion.save!

    render json: reversion, serializer: Api::V1::ReservationSerializer
  end

  private

    def reversion_params
      params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                          :inquiry, :reservation_number, :user_id, :store_id)
    end
end
