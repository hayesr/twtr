class Query
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :tweets
  # accepts_nested_attributes_for :tweets, :allow_destroy => true
  
  field :username, type: String
  
  def response=(response)
    if response.kind_of? Array
      response.each do |t|
        tweet = tweets.new(t.to_hash)
        tweet.text = t.full_text
        
      end
    end
  end
  
end
