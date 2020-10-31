# == Schema Information
#
# Table name: update_histories
#
#  id           :bigint           not null, primary key
#  description  :text(65535)
#  project_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  opp_id       :bigint
#
class UpdateHistory < ApplicationRecord
  validates :opp_id, presence: true

  class << self
    def fetch_list type
      query = self.group(:opp_id).select("max(created_at) as max, count(opp_id) as count, opp_id")

      if type == "recently"
        query = query.order(max: :desc)
      elsif type == "edit_count"
        query = query.order(count: :desc)
      else
        query = query.order(opp_id: :asc)
      end

      JSON.parse(query.to_json)
    end
  end
end
