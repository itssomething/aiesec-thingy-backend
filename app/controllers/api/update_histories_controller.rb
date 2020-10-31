class Api::UpdateHistoriesController < ApiController
  def index
    @update_histories = UpdateHistory.fetch_list(params[:type])
  end

  def create
    @update_history = UpdateHistory.new(opp_params)

    if @update_history.save
      render json: { message: "ok" }, status: :ok
    else
      render json: { message: "bad request" }, status: :bad_request
    end
  end

  private

  def opp_params
    params.permit(:opp_id, :project_name, :description)
  end
end
