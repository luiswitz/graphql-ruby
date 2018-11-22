Types::AuthProviderEmailInput = GraphQL::InputObjectType.define do
  name 'AUTH_PROVIDER_EMAIL_INPUT'

  argument :email, !types.String
  argument :password, !types.String
end
