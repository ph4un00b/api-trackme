class ActionSerializer < ActiveModel::Serializer
  attributes :id, :description, :cycles, :cycle_type, :feeling, :schedule
end
