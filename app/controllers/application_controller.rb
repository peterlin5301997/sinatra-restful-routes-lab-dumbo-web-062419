class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do 
    @recipe = Recipe.all.find(params[:id])
    erb :show
  end

  delete '/recipes/:id' do 
    @recipe = Recipe.all.find(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.all.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.all.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

end
