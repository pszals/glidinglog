require './models/user'

describe User do
  describe "password validation" do

    after do
      described_class.all.destroy
    end

    it 'authenticates' do
      user = described_class.create(username: "user", password: "password")

      expect(user.authenticate("password")).to eq(true)
    end

    it 'does not authenticate' do
      user = described_class.create(username: "user", password: "password")

      expect(user.authenticate("wrong")).to eq(false)
    end
  end
end
