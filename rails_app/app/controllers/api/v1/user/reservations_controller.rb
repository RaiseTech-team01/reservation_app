module Api::V1
  class User::ReservationsController < BaseApiController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user, { only: [:index, :show, :create, :update, :destroy] }

    def index
      # ログインユーザーの予約一覧を表示
      reservations = current_user.reservations
      render json: reservations, each_serializer: Api::V1::ReservationSerializer
    end

    def show
      # ログインユーザーの指定店舗の予約一覧を表示
      reservations = current_user.reservations.where(store_id: params[:store_id])
      reservation = reservations.find(params[:id])
      render json: reservation, serializer: Api::V1::ReservationSerializer
    end

    def create
      reservation = current_user.reservations.build(reservation_params)

      # 生成した予約番号を格納
      reservation.reservation_number = reservation.create_reservation_num

      # 指定店舗があることを確認し格納
      reservation.store_id = Store.find(params[:store_id]).id
      reservation.save!

      render json: reservation, serializer: Api::V1::ReservationSerializer
    end

    def update
      # 対象の予約を検索する
      reservations = current_user.reservations.where(store_id: params[:store_id])

      if reservations.exists?(params[:reservation][:id])
        reservation = reservations.find(params[:reservation][:id])
        reservation.update!(reservation_params)
        render json: reservation, serializer: Api::V1::ReservationSerializer
      else
        self.record_not_found
      end
    end

    def destroy
      # 予約削除
      reservations = current_user.reservations.where(store_id: params[:store_id])

      if reservations.exists?(params[:reservation][:id])
        reservation = reservations.find(params[:reservation][:id])
        reservation.destroy!
      else
        self.record_not_found
      end
    end

    private

      def record_not_found
        # TODO: この書き方は間違っている.
        # JSON形式で、クライアントにも伝わる適切なErrorメッセージを書く
        render json: {
          store_id: params[:store_id],
          status: 404,
          messege: "申し訳ありません。指定した予約データは存在しません",
        }, status: :not_found
      end

      def reservation_params
        params.require(:reservation).permit(:date_at, :date_on, :number_people, :menu, :budget,
                                            :inquiry, :user_id, :store_id)
      end
  end
end
