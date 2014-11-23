class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    @position_x = params[:position_x]
    @position_y = params[:position_y]

    respond_to do |format|
      format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
       format.js { render :new, status: 200, location: @tag }
    end
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.js { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.js { render json: @tag.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:character_id, :position_x, :position_y)
  end

end
