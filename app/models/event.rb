class Event < ActiveRecord::Base
belongs_to :category
validates_presence_of :name
has_many :attendees
has_one :location

end
