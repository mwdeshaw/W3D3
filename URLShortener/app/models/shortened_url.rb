# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedURL < ApplicationRecord
  validates :user_id, presence: true, uniqueness: true
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true


  def self.random_code 
    url = SecureRandom.urlsafe_base64
    while self.exists?(short_url: url) 
      url = SecureRandom.urlsafe_base64
    end

    url
  end

  def self.generate_short_url(user, long_url)
    new_url = self.new(long_url: long_url, short_url: self.random_code, user_id: user.id)
    new_url.save!
  end

end
