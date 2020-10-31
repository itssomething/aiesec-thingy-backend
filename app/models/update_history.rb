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
end
