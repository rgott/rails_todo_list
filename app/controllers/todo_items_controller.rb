class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo List item was delete."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todo_list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Moved Down"
  end

  def moveup
    @todo_item.update(position: @todo_item.position - 1)
    redirect_to @todo_list, notice: "#{@todo_item.content} Moved Up"
  end

  def movedown
    @todo_item.update(position: @todo_item.position + 1)
    redirect_to @todo_list, notice:  "#{@todo_item.content} Moved Down"

  end


  def notcomplete
    @todo_item.update_attribute(:completed_at, nil)
    redirect_to @todo_list, notice: "Todo item completed"
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
