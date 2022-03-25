class ListsController < ApplicationController
protect_from_forgery :except => [:destroy]
  def index
    @lists = List.all
  end
  def new
    @list = List.new
  end
 
  def create
    @list = List.new(params.require(:list).permit(:title,:start,:end))
    if @list.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :lists
    else  
      render"new"
    end
  end
  
  def show
    @list = List.find(params[:id])
  end
 
  def edit
    @list = List.find(params[:id])
  end
 
  def update
    @list = List.find(params[:id])
      if @list.update(params.require(:list).permit(:title,:start,:end))
        flash[:notice] = "スケジュールを更新しました"
        redirect_to :lists
      else
        render "edit"
      end
  end
 
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :lists
  end
end
