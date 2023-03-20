class UsersSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :email,
    :confirmed

  def confirmed 
    object.confirmed?
  end
end
