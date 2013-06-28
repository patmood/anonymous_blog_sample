get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/posts' do
  @tag_string = 
  erb :posts
end

get '/posts/new' do
  erb :new_post
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/posts/update' do
  @post = Post.find(params[:id])
  @post = Post.create(:title => params[:title],:body => params[:body], :tags => convert_tags_to_array(params[:tags]))
  redirect '/posts'
end

post '/posts/new' do

  @new_post = Post.create(:title => params[:title],:body => params[:body], :tags => convert_tags_to_array(params[:tags]))
  redirect '/posts'
end

get '/posts/delete/:id' do
  Post.destroy(params[:id])
  redirect '/posts'
end

get '/tags/:name' do
  @posts = []
  @tag = params[:name]
  tag_id = Tag.find_by_name(params[:name]).id.to_i

  post_ids = PostsTag.find_all_by_tag_id(tag_id)

  post_ids.each do |x|
    @posts << Post.find(x.post_id)
  end

  @posts
  erb :tags
end
