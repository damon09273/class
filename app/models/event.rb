class Event < ActiveRecord::Base
belongs_to :category
validates_presence_of :name
has_many :attendees
has_one :location
accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
end
