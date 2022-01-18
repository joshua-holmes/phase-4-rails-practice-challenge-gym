class GymsController < ApplicationController
    def show
        gym = Gym.find params[:id]
        render json: gym
    end

    def destroy
        gym = Gym.find params[:id]
        gym.memberships.destroy_all
        gym.destroy
        render head: :no_content
    end

    def index
        render json: Gym.all
    end

    def update
        gym = Gym.find params[:id]
        gym.update gym_params
        render json: gym, status: :created
    end

    private

    def gym_params
        params.permit :name, :address
    end
end
