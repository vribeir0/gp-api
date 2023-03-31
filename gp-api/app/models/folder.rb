# == Schema Information
#
# Table name: folders
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  user_id    :bigint
#
# Indexes
#
#  index_folders_on_user_id  (user_id)
#
class Folder < ActiveRecord::Base
    belongs_to :user
    has_many :tasks, dependent: :destroy

    validates :name, presence: true
end
