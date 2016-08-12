require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    # post '/new' do
    #   erb :show
    # end

    post '/pirates' do
      #binding.pry
      @pirate = Pirate.new(params[:pirate])
        params[:pirate][:ships].each do |details|
          Ship.new(details)
        end
        @ships = Ship.all
      erb :'pirates/show'
    end

    # {"pirate"=>{"name"=>"a", "weight"=>"b", "height"=>"c", "ships"=>[{"name"=>"d", "type"=>"e", "booty"=>"f"}, {"name"=>"g", "type"=>"h", "booty"=>"i"}]}}

  end
end
