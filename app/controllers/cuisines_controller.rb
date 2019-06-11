class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all

    render("cuisine_templates/index.html.erb")
  end

  def show
    @restaurant = Restaurant.new
    @cuisine = Cuisine.find(params.fetch("id_to_display"))

    render("cuisine_templates/show.html.erb")
  end

  def new_form
    @cuisine = Cuisine.new

    render("cuisine_templates/new_form.html.erb")
  end

  def create_row
    @cuisine = Cuisine.new

    @cuisine.name = params.fetch("name")

    if @cuisine.valid?
      @cuisine.save

      redirect_back(:fallback_location => "/cuisines", :notice => "Cuisine created successfully.")
    else
      render("cuisine_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @cuisine = Cuisine.find(params.fetch("prefill_with_id"))

    render("cuisine_templates/edit_form.html.erb")
  end

  def update_row
    @cuisine = Cuisine.find(params.fetch("id_to_modify"))

    @cuisine.name = params.fetch("name")

    if @cuisine.valid?
      @cuisine.save

      redirect_to("/cuisines/#{@cuisine.id}", :notice => "Cuisine updated successfully.")
    else
      render("cuisine_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @cuisine = Cuisine.find(params.fetch("id_to_remove"))

    @cuisine.destroy

    redirect_to("/cuisines", :notice => "Cuisine deleted successfully.")
  end
end
