json.data @update_histories do |history|
  json.id history.id
  json.opp_id history.opp_id
  json.project_name history.project_name
  json.description history.description
end
