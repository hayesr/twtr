class Query
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :tweets
  # accepts_nested_attributes_for :tweets, :allow_destroy => true
  
  field :username, type: String
  
  def response=(response)
    if response.kind_of? Array
      response.each do |t|
        tweets.new(t.to_hash)
      end
    end
  end
  
end
