RSpec::Matchers.define :match_fields do |expected|
  match do |actual|
    expected.keys.each do |field|
      expect(actual[field.to_s].type.to_s).to eq(expected[field])
    end
  end

  failure_message do |actual|
    missing_fields = expected.keys - actual.symbolize_keys.keys

    "Fields doesn't match. #{missing_fields} are missing"
  end
end
