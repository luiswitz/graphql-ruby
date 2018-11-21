class Resolvers::CreateArticle < GraphQL::Function
  argument :title, !types.String
  argument :body, !types.String

  type Types::ArticleType

  def call(_obj, args, _ctx)
    Article.create(
      title: args[:title],
      body: args[:body]
    )
  end
end
