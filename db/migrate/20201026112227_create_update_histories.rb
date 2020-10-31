class CreateUpdateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :update_histories do |t|
      t.bigint :opp_id
      t.string :project_name
      t.text :description

      t.timestamps
    end
  end
end
