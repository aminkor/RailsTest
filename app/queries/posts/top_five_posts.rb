module Posts
    class TopFivePosts < Patterns::Query
      #try to make this as dry as possible
      def self.call(params:)
        results = []
        results = Post.top_five.map do |p|
            {
                id: p.id,
                title: p.title,
                body: p.body,
                comments_count: p.comments.size
            }
        end
      end
    end
  end