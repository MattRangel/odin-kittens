class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.attributes = kitten_params
    if @kitten.save
      redirect_to @kitten
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
