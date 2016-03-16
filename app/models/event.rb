class Event < ActiveRecord::Base
belongs_to :category
validates_presence_of :name
has_many :attendees
has_one :location
has_many :event_groupships
has_many :groups, :through => :event_groupships
accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
end
