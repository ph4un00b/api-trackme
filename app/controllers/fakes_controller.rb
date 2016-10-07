class FakesController < ApplicationController
    # GET /fakes
    def index
        fakes = Fake.all
        render json: fakes
    end
end
