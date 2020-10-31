class Api::UpdateHistoriesController < ActionController::API
  def index
    @update_histories = UpdateHistory.all.order(created_at: :desc)
  end

  def create
    @update_history = UpdateHistory.new(opp_params)

    if @update_history.save
      render json: { message: "ok" }, status: 200
    else
      render json: { message: "bad request" }, status: 400
    end
  end

  private

  def opp_params
    params.permit(:opp_id, :project_name, :description)
  end
end
