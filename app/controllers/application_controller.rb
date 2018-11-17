class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/' do
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end



end
