class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :amount_spent_on_memberships

  def amount_spent_on_memberships
    object.memberships.sum :charge
  end
end
