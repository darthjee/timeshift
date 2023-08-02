shared_examples "a setting" do |field|
  let(:value)          { SecureRandom.hex(32) }
  let(:default_value)  { nil }
  let(:expected_class) { String }
  let(:expected_default_class) { NilClass }

  let(:env_hash) do
    { "timeshift_#{field}" => nil }
  end

  it do
    expect(settings.public_send(field)).to eq(default_value)
  end

  it do
    expect(settings.public_send(field)).to be_a(expected_default_class)
  end

  context 'when only env is set' do
    let(:env_hash) do
      { "timeshift_#{field}" => value }
    end

    it 'returns the value from env' do
      expect(settings.public_send(field)).to eq(value)
    end

    it do
      expect(settings.public_send(field)).to be_a(expected_class)
    end
  end

  context 'when only db is set' do
    before do
      create(:active_setting, key: field, value: value)
    end

    it 'returns the value from db' do
      expect(settings.public_send(field)).to eq(value)
    end

    it do
      expect(settings.public_send(field)).to be_a(expected_class)
    end
  end

  context 'when env and db are set' do
    let(:env_hash) do
      { "timeshift_#{field}" => value }
    end

    before do
      create(:active_setting, key: field)
    end

    it 'returns the value from env' do
      expect(settings.public_send(field)).to eq(value)
    end

    it do
      expect(settings.public_send(field)).to be_a(expected_class)
    end
  end
end
