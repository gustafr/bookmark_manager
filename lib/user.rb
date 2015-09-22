class User

include DataMapper::Resource

property :id, Serial
property :email, String
property :password, String
property :created_at, DateTime
end