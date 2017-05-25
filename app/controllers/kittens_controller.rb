class KittensController < ApplicationController
  before_action :age_options, only: [:edit, :new]

  def index
    @kittens= Kitten.all 
    respond_to do |format|
      format.html 
      format.json {render :json => @kittens}
    end
  end

  def new
    @kitten = Kitten.new
    @form_url_options = [url:{controller: :kittens, action: :create}]#[url: '/kitten', method: 'post']
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @kitten}
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
    @form_url_options = [url:{controller: :kittens, action: :update}, method: 'put', id: params[:id]]
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "You created a kitten!"
      redirect_to(action: :show, id: @kitten.id)
    else
      redirect_to(root_url)
    end
  end

  def update
    if @kitten = Kitten.find_by_id(params[:kitten][:id])
      Kitten.update(@kitten.id,kitten_params)
      flash[:success] = "You updated a kitten!"
      redirect_to(action: :show, id: @kitten.id)
    else
      redirect_to(root_url)
    end
  end

  def destroy
    if @kitten = Kitten.find_by_id(params[:id])
      @kitten.destroy
      flash[:success] = "You deleted #{@kitten.name} who is #{@kitten.age} year(s) old."
      redirect_to root_url
    else
      redirect_to(action: :show, id: params[:id])
    end
  end


  private

  def age_options
    @age_options = (1..50).to_a.map {|x| [x,x]}
  end

  def kitten_params
    params.require(:kitten).permit(:name,:age,:cuteness,:softness)
  end
end
