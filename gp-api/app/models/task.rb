# == Schema Information
#
# Table name: tasks
#
#  id       :bigint           not null, primary key
#  deadline :datetime
#  status   :string           not null
#  text     :string           not null
#
class Task < ActiveRecord::Base
  extend Enumerize

  validates :text,  presence: true

  enumerize :status, in: [:active, :inactive], default: :active, predicates: true

  private
        
end
