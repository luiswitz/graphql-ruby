Types::ArticleType = GraphQL::ObjectType.define do
  name 'article'

  field :id, !types.ID
  field :title, !types.String
  field :body, !types.String
end
