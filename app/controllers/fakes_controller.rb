class FakesController < ApplicationController
    # GET /fakes
    def index
        fakes = Fake.all
        # fakes = [{id:4, name: 'jamon'}]
        sleep 3
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

    # POST /fakes
    def create
        fake = Fake.new(fake_params)

        if fake.save
            sleep 3
            render json: fake, status: :created, location: fake
        else
            render json: fake.errors, status: :unprocessable_entity
        end
    end

    # DELETE /fakes/1
    def destroy
        fake = Fake.find(params[:id])
        fake.destroy
    end

    private
        def fake_params
            params.permit(:name)
        end
end
