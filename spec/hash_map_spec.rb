require_relative '../hash_map'

RSpec.describe HashMap do
  describe "#insert" do
    it "returns a non-empty bucket" do
      hash_map = HashMap.new
      subject = hash_map.insert("apples", 1)

      expect(subject).to be_truthy
      expect(subject).to eq hash_map.bucket
    end

    xit "returns false when inserting with a key that is already inserted" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)
      expect(hash_map.insert("apples", 2)).to eq false
    end
  end

  describe "#count" do
    it "returns a count of 1 after inserting 1 key value pair" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)

      expect(hash_map.count).to eq 1
    end

    it "returns a count of 2 after inserting 2 key value pairs" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)
      hash_map.insert("bananas", 1)

      expect(hash_map.count).to eq 2
    end
  end
end
