require 'spec_helper'

describe 'Home' do
  let(:app) { GlidingLog.new }

  it 'displays the home page' do
    get '/'

    expect(last_response.status).to eq(200)
  end
end
