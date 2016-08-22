class Room < ActiveRecord::Base
  validates_presence_of :title, :location, :description
  validates_length_of :description, minimum: 30, allow_blank: false
  scope :most_recent, -> { order('created_at DESC') }

  # Associations
  belongs_to :user


  def complete_name
    "#{title}, #{location}"
  end
end
