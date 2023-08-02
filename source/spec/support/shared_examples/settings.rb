shared_examples "a setting" do |field|
  context 'when nothing is set set' do
    let(:env_hash) do
      { "timeshift_#{field}" => nil }
    end

    it do
      expect(settings.public_send(field)).to be_nil
    end
  end

  context 'when only env is set' do
    let(:value) { SecureRandom.hex(32) }

    let(:env_hash) do
      { "timeshift_#{field}" => value }
    end

    it 'returns the value from env' do
      expect(settings.public_send(field)).to eq(value)
    end
  end

  context 'when only db is set' do
    let(:value) { SecureRandom.hex(32) }

    before do
      create(:active_setting, key: field, value: value)
    end

    it 'returns the value from db' do
      expect(settings.public_send(field)).to eq(value)
    end
  end

  context 'when env and db are set' do
    let(:value) { SecureRandom.hex(32) }

    let(:env_hash) do
      { "timeshift_#{field}" => value }
    end

    before do
      create(:active_setting, key: field)
    end

    it 'returns the value from env' do
      expect(settings.public_send(field)).to eq(value)
    end
  end

end
