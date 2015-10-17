# events
# name              string, not null
# description       text
# user_id           integer, not null
# date              datetime, not null
# active            boolean
class Event < ActiveRecord::Base

  belongs_to :user
  has_many :user_events
  has_many :users, through: :user_events
end
