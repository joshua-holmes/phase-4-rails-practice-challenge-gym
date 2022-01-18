class ClientsController < ApplicationController
    def show
        client = Client.find params[:id]
        render json: client
    end

    def index
        render json: Client.all
    end

    def update
        client = Client.find params[:id]
        client.update client_params
        render json: client, status: :created
    end

    private

    def client_params
        params.permit :name, :age
    end
end
