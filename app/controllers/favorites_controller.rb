class FavoritesController < ApplicationController
  def index
    @q = Favorite.ransack(params[:q])
    @favorites = @q.result(:distinct => true).includes(:user, :restaurant).page(params[:page]).per(10)

    render("favorite_templates/index.html.erb")
  end

  def show
    @favorite = Favorite.find(params.fetch("id_to_display"))

    render("favorite_templates/show.html.erb")
  end

  def new_form
    @favorite = Favorite.new

    render("favorite_templates/new_form.html.erb")
  end

  def create_row
    @favorite = Favorite.new

    @favorite.restaurant_id = params.fetch("restaurant_id")
    @favorite.user_id = params.fetch("user_id")

    if @favorite.valid?
      @favorite.save

      redirect_back(:fallback_location => "/favorites", :notice => "Favorite created successfully.")
    else
      render("favorite_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_restaurant
    @favorite = Favorite.new

    @favorite.restaurant_id = params.fetch("restaurant_id")
    @favorite.user_id = params.fetch("user_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/restaurants/#{@favorite.restaurant_id}", notice: "Favorite created successfully.")
    else
      render("favorite_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite = Favorite.find(params.fetch("prefill_with_id"))

    render("favorite_templates/edit_form.html.erb")
  end

  def update_row
    @favorite = Favorite.find(params.fetch("id_to_modify"))

    @favorite.restaurant_id = params.fetch("restaurant_id")
    @favorite.user_id = params.fetch("user_id")

    if @favorite.valid?
      @favorite.save

      redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite updated successfully.")
    else
      render("favorite_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/users/#{@favorite.user_id}", notice: "Favorite deleted successfully.")
  end

  def destroy_row_from_restaurant
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/restaurants/#{@favorite.restaurant_id}", notice: "Favorite deleted successfully.")
  end

  def destroy_row
    @favorite = Favorite.find(params.fetch("id_to_remove"))

    @favorite.destroy

    redirect_to("/favorites", :notice => "Favorite deleted successfully.")
  end
end
