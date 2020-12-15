class FinstagramPost < ActiveRecord::Base

    belongs_to :user
    has_many :comments
    has_many :likes

    validates_presence_of :user

    def humanized_time_ago
        time_ago_in_seconds = Time.now - self.created_at
        time_ago_in_minutes = time_ago_in_seconds /60

        if time_ago_in_minutes >= 60
            "#{(time_ago_in_minutes /60).to_i} hours ago"
        else
            "#{time_ago_in_minutes.to_i} minutes ago"
        end
 # (this is where your associations are, e.g. has_many :finstagram_posts, etc.)...

  # validations in between association definitions and methods!
  validates :photo_url, :user, presence: true

  # (this is where your def humanized_time_ago method is, along with the rest of your methods in this file)...


    end

    def like_count
        self.likes.size
    end

    def comment_count
        self.comments.size
    end

end