json.extract! lead, :id, :first_name, :last_name, :email, :company, :phone, :city, :created_by, :created_at, :updated_at
json.url lead_url(lead, format: :json)
