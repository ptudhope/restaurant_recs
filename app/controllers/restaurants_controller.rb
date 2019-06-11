class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    render("restaurant_templates/index.html.erb")
  end

  def show
    @restaurant = Restaurant.find(params.fetch("id_to_display"))

    render("restaurant_templates/show.html.erb")
  end

  def new_form
    @restaurant = Restaurant.new

    render("restaurant_templates/new_form.html.erb")
  end

  def create_row
    @restaurant = Restaurant.new

    @restaurant.name = params.fetch("name")
    @restaurant.address = params.fetch("address")
    @restaurant.comments_count = params.fetch("comments_count")
    @restaurant.cuisine_id = params.fetch("cuisine_id")

    if @restaurant.valid?
      @restaurant.save

      redirect_back(:fallback_location => "/restaurants", :notice => "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant = Restaurant.find(params.fetch("prefill_with_id"))

    render("restaurant_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant = Restaurant.find(params.fetch("id_to_modify"))

    @restaurant.name = params.fetch("name")
    @restaurant.address = params.fetch("address")
    @restaurant.comments_count = params.fetch("comments_count")
    @restaurant.cuisine_id = params.fetch("cuisine_id")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/restaurants", :notice => "Restaurant deleted successfully.")
  end
end
