class UsersSerializer < ActiveModel::Serializer
  attributes :id, 
    :name,
    :email,
    :confirmed_at
end
