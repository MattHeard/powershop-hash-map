require_relative '../hash_map'

RSpec.describe HashMap do
  describe "#insert" do
    it "inserts a key value pair" do
      expect(HashMap.new.insert("apples", 1)).to eq true
    end
  end
end
