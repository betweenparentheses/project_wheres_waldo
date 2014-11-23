class TagsController < ApplicationController
  respond_to :html, :js

  def index
    @tags = Tag.all
  end

  # def create
  #   @tag = Tag.new
  #   if @tag.save(tag_params)

  #   end
  # end

  def create
  @task = Task.new(task_params)

  respond_to do |format|
  if @task.save

  # Standard HTML rendering options
  format.html { redirect_to @task, notice: 'Task was successfully created.' }

  # Render the `:show` template with a 
  # "201: created" status and inform the 
  # browser that it's located at the @show path
  # This is NOT a redirection... it just tells
  # the browser where this new resource is located.
  # Consider it best practice with little
  # practical value.
  # The payload is still the `:show` template.
  format.json { render :show, status: :created, location: @task }
  else

  # Standard stuff
  format.html { render :new }

  # Render a specific JSON payload which is 
  # the errors object from our failed Task
  format.json { render json: @task.errors, status: :unprocessable_entity }
  end
  end
  end

  def update
  end

  def destroy
  end

end
