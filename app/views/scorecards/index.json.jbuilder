json.array!(@scorecards) do |scorecard|
  json.extract! scorecard, :id, :description
  json.url scorecard_url(scorecard, format: :json)
end
