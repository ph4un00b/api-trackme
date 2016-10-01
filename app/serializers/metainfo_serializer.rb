class MetainfoSerializer < ActiveModel::Serializer
  attributes :id, :user, :meta_type, :name, :image
end
