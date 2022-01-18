class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, :gym_id, :charge, presence: true
  validate :client_only_has_one_membership_at_gym

    def client_only_has_one_membership_at_gym
        if Membership.find_by client_id: client_id, gym_id: gym_id
            errors.add :client_id, :gym_id, message: "A gym may only give one membership to a single client."
        end
    end
end
