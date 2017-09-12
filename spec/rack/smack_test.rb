require 'spec_helper.rb'

describe Rack::Smack do
  before do
    mock_app do
      use Rack::Smack
      run DEFAULT_APP
    end
  end

  context 'trying to access suspicious content' do
    it 'bans user' do
      get '/wp-login.php'
      expect(last_response.status).to eq 403
    end

    it 'continues blocking' do
      get '/'
      expect(last_response.status).to eq 403
    end
  end

  context 'normal content requests' do
    it 'does nothing' do
      get '/', nil, 'REMOTE_ADDR' => '127.0.0.2'
      expect(last_response.status).to eq 200
    end
  end
end
