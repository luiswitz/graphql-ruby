require 'rails_helper'

RSpec.describe Resolvers::SignInUser do
  subject { described_class.new }

  let(:obj) { nil }
  let(:ctx) do
    {
      session: { token: nil }
    }
  end

  let(:args) do
    {
      signInData: {
        email: 'the@mail.com',
        password: 'thesecurepassword'
      }
    }
  end

  let(:user) do
    User.create(
      name: 'John',
      email: 'the@mail.com',
      password: 'thesecurepassword'
    )
  end

  let(:call) do
    subject.call(obj, args, ctx)
  end

  describe '#call' do
    context 'successful sign in' do
      let(:encryptor_arg) do
        Rails.application.secrets.secrets[:secret_key_base].byteslice(0..31)
      end

      let(:encryptor) { ActiveSupport::MessageEncryptor }
      let(:crypt) { double(:crypt) }
      let(:token) { 'the-token' }

      before do
        expect(encryptor).to receive(:new).and_return(crypt)

        expect(User).to receive(:find_by)
          .with(email: 'the@mail.com')
          .and_return(user)

        expect(user).to receive(:authenticate)
          .with('thesecurepassword')
          .and_return(true)

        expect(crypt).to receive(:encrypt_and_sign)
          .with("user-id:#{user.id}")
          .and_return(token)
      end

      it 'signs in the user' do
        expected_response = OpenStruct.new(
          {
            user: user,
            token: token
          }
        )

        expect(call).to eq(expected_response)
      end

      it 'stores token on the session' do
        call

        expect(ctx[:session][:token]).to eq(token)
      end
    end

    context 'unsuccessful sign in' do
      context 'with a wrong user' do
        let(:args) do
          {
            signInData: {
              email: 'wrong@mail.com'
            }
          }
        end

        it 'returns nil' do
          expect(call).to eq(nil)
        end
      end

      context 'with the wrong password' do
        let(:args) do
          {
            signInData: {
              email: user.email,
              password: 'thewrongpassword'
            }
          }
        end

        it 'returns nil' do
          expect(call).to eq(nil)
        end
      end

      context 'with invalid arguments' do
        let(:args) { {} }

        it 'returns nil' do
          expect(call).to eq(nil)
        end
      end
    end
  end
end
