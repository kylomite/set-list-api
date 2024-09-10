class Song < ApplicationRecord
  belongs_to :artist
  before_save { |song| song.popularity = calculate_popularity }

  def average_plays_per_day
    if created_at.nil? || play_count.nil? || play_count == 0
      return 0
    end

    days_since_creation = ((Time.now - created_at) / 1.day).ceil
    
    play_count / days_since_creation
  end

  private

  def calculate_popularity
    if play_count > 5
      'high'
    else
      'low'
    end
  end
end