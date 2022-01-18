class MembershipsController < ApplicationController
    validate :client_only_has_one_membership_at_gym

    def client_only_has_one_membership_at_gym
        if Memebership.find_by client_id: client_id, gym_id: gym_id
            errors.add :client_id, :gym_id, message: "A gym may only give one membership to a single client."
        end
    end
end
