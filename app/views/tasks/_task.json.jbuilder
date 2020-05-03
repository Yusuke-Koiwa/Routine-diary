json.extract! task, :id, :score, :body, :start_time, :created_at, :updated_at
json.url task_url(task, format: :json)
