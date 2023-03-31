# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  deadline   :datetime
#  status     :string           not null
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  folder_id  :bigint
#
# Indexes
#
#  index_tasks_on_folder_id  (folder_id)
#
class Task < ActiveRecord::Base
  extend Enumerize
  belongs_to :folder

  validates :text,  presence: true

  enumerize :status, in: [:active, :inactive], default: :active, predicates: true
end
