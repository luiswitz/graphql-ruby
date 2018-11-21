Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createLink, function: Resolvers::CreateArticle.new
end
