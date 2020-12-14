json.extract! issue, :id, :name, :email, :telephone, :message, :closed, :created_at, :updated_at
json.url issue_url(issue, format: :json)
