class ActionsController < ApplicationController

    # GET /actions
    def index
        actions = Action.all
        render json: actions
    end

    # GET /actions/1
    def show
        action = Action.find(params[:id])
        render json: action
    end

    # POST /actions
    def create
        @action = Action.new(action_params)

        if @action.save
            render json: @action, status: :created, location: @action
        else
            render json: @action.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /actions/1
    def update
        @action = Action.find(params[:id])
        if @action.update(action_params)
            render json: @action
        else
            render json: @action.errors, status: :unprocessable_entity
        end
    end

    # DELETE /actions/1
    def destroy
        @action = Action.find(params[:id])
        @action.destroy
    end

    private
        def action_params
            # params.require(:user).permit(:description, :cycles, :cycle_type, :feeling, :schedule)
            params.permit(:description, :cycles, :cycle_type, :feeling, :schedule)
        end
end
