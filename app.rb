require 'sinatra/base'
require_relative './lib/bookmarks'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    erb(:bookmarks)
  end

  get '/add-bookmark' do
    erb(:add_bookmark)
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'], title: params['title'])
    redirect '/bookmarks'
  end

  run! if app_file == $0  
end