module Resolvers
  class SignInUser < GraphQL::Function
    argument :signInData, !Types::AuthProviderEmailInput

    type do
      name 'SignInPayload'

      field :token, types.String
      field :user, Types::UserType
    end

    def call(_obj, args, _ctx)
      input = args[:signInData]

      unless input
        return nil
      end

      user = User.find_by(email: input[:email])

      unless user
        return nil
      end

      unless user.authenticate(input[:password])
        return nil
      end

      token = crypt.encrypt_and_sign("user-id:#{user.id}")

      OpenStruct.new(
        user: user,
        token: token
      )
    end

    private

    def encryptor_arg
      Rails.application.secrets[:secret_key_base].byteslice(0..31)
    end

    def crypt
      ActiveSupport::MessageEncryptor.new(encryptor_arg)
    end
  end
end
