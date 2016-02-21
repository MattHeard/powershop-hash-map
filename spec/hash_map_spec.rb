require_relative '../hash_map'

RSpec.describe HashMap do
  describe "#insert" do
    it "inserts a key value pair" do
      expect(HashMap.new.insert("apples", 1)).to eq true
    end
  end

  describe "#count" do
    it "returns a count of 1 after inserting 1 key value pair" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)

      expect(hash_map.count).to eq 1
    end
  end
end
