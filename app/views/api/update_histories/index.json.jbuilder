json.data @update_histories do |history|
  json.opp_id history["opp_id"]
  json.update_count history["count"]
  json.last_updated_at history["max"].to_time.strftime("%F %H:%M:%S")
end
