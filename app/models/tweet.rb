class Tweet
  include Mongoid::Document
  embedded_in :query
  
  field :contributors
  field :coordinates
  field :created_at
  field :favorited
  field :geo
  # field :id
  field :id_str
  field :in_reply_to_screen_name
  field :in_reply_to_status_id
  field :in_reply_to_status_id_str
  field :in_reply_to_user_id
  field :in_reply_to_user_id_str
  field :place
  field :retweet_count
  field :retweeted
  field :source
  field :text
  field :truncated
  field :user
  
end