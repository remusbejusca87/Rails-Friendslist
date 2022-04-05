json.extract! friendstable, :id, :first_name, :last_name, :email, :phone, :twitter, :created_at, :updated_at
json.url friendstable_url(friendstable, format: :json)
