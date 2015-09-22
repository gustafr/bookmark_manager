class Link

include DataMapper::Resource

property :id, Serial
property :title, String
property :description, Text
property :url, String
property :created_at, DateTime
property :created_by, String

# has n, :taggings
# has n, :links, through: :taggings

end