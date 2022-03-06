class RestaurantsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
    before_action :current_user


    def index
        @restaurants = Restaurant.all
    end

    def show
        @reviews = @restaurant.reviews
    end

    def new
        @restaurant = Restaurant.new
    end

    def create   
        @cuisines = ["Mexican", "Asian", "Italian", "American", "Seafood", "Other"]
        @restaurant = Restaurant.find_by(restaurant_name: params[:restaurant][:restaurant_name])
            if @restaurant
                flash[:message] = "This restaurant already exists. Please add a different"
                redirect_to restaurants_path
            else
                @restaurant = Restaurant.new(restaurant_params)
                @restaurant.user_id = session[:user_id]   
                @restaurant.save                    #where validations happen
                if !@restaurant.cuisine_id
                    render :new
                else
                    redirect_to restaurant_path(@restaurant)
                end
            end
        end


    def edit
    
    end

    def update
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else
            render :edit
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to user_path(@current_user)
    end


    private

    def restaurant_params
        params.require(:restaurant).permit(:restaurant_name, :address, :city, :state, :user_id, :cuisine_id, cuisine_attributes: [:name])
    end

    def find_restaurant
        @restaurant = Restaurant.find_by(id: params[:id])
    end

end