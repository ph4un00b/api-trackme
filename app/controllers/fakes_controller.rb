class FakesController < ApplicationController
    # GET /fakes
    def index
        fakes = Fake.all
        render json: fakes
    end

    # PATCH/PUT /fakes/1
    def update
        fake = Fake.find(params[:id])
        if fake.update(fake_params)
            render json: fake
        else
            render json: fake.errors, status: :unprocessable_entity
        end
    end

    private
        def fake_params
            params.permit(:name)
        end
end
