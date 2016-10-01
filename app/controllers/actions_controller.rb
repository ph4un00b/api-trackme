class ActionsController < ApplicationController
    def index
        actions = Action.all
        render json: actions
    end
end
