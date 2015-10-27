require 'spec_helper'

describe 'Home' do
  let(:app) { GlidingLog.new }

  it 'displays the home page' do
    get '/'

    expect(last_response.status).to eq(200)
  end

  describe 'authentication' do
    describe 'when not signed in' do
      it 'allows access only to /, /signup, /login' do
        get '/flights'
        expect(last_response.status).to eq(302)
      end
    end

    describe 'when signed in' do
      after do
        User.all.destroy
      end

      it 'allows access only to /, /signup, /login' do
        signup
        login

        get '/flights'

        expect(last_response.status).to eq(200)
      end
    end
  end
end
