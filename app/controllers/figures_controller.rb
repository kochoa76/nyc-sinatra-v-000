class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'figures/edit'
    end

  patch '/figures/:id/edit' do
      @figure = Figure.create(params[:figure])
      if !params[:title][:name].empty?
        @figure.titles << Figure.create(params[:title][:name])
      end

      if !params[:landmark][:name].empty?
        @figure.landmarks << Landmark.create(params[:landmark][:title])
      end
      @figure.save
      redirect to "/figures/#{@figure.id}"
    end


  post '/figures' do
     @figure = Figure.create(params["figure"])
     if !params[:landmark][:name].empty?
       @figure.landmarks << Landmark.create(params[:landmark])
     end

     if !params[:title][:name].empty?
       @figure.titles << Title.create(params[:title])
     end

     @figure.save
     redirect to "/figures/#{@figure.id}"
   end
 end
