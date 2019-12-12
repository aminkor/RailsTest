module Posts
  class Create < Patterns::Service
    attr_reader :resource, :message, :status

    def initialize(params: nil)
      @params = params
      @success = false
    end

    def call
      post = Post.new(post_params)
      if post.save!
        @resource = post
        @success = true
      end
    end

    def success?
      @success
    end

    private

    def post_params
      @params.permit(:user_id, :title, :body)
    end
  end
end
