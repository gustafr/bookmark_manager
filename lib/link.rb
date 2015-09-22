class Link

include DataMapper::Resource 

property :id, Serial
property :title, String
property :description, Text
property :url, String
property :created_at, DateTime


  # def self.get_links
  # [
  #   {title: 'Care Of Carl', url: 'http://www.careofcarl.com', description: 'The best online store for premium brand menswear!', tags: ['clothes', 'shoes'], created_by: 'gustaf.rudholm@gmail.com', created_at: Time.now}, {title: 'RUM21', url: 'http://www.rum21.se', description: 'The best online store for premium brand furniture!', tags: ['furniture', 'design'], created_by: 'gustaf.rudholm@gmail.com', created_at: Time.now},
  #   ]
  # end
end