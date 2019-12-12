class PostsController < ApplicationController
  # GET /posts
  def index
    Post.all
  end

  # POST /posts
  def create
    create = Posts::Create.call(params: params)
    if create.success?
      json_response(create.resource)
    else
      json_response({ message: create.message }, create.status)
    end
  end

  # GET /top_five_posts
  def top_five_posts
    posts = Posts::TopFivePosts.call(params: params)
    json_response(posts)
  end
end
