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
      redirect_to @kitten, flash: { congrats: "Successfully updated!" }
    else
      flash[:scorn] = "You put a bad value!"
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten.save
      redirect_to @kitten, flash: { congrats: "Successfully created!" }
    else
      flash[:scorn] = "You put a bad value!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, flash: { congrats: "Successfully destroyed!" }
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
