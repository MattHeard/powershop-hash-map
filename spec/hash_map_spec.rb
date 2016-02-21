require_relative '../hash_map'

RSpec.describe HashMap do
  describe "#insert" do
    it "returns a hash map" do
      hash_map = HashMap.new
      subject = hash_map.insert("apples", 1)

      expect(subject).to be_truthy
      expect(subject).to eq hash_map
    end

    it "modifies the hash map object" do
      hash_map = HashMap.new
      expect(hash_map.bucket).to be_empty

      hash_map.insert("apples", 1)
      expect(hash_map.bucket).not_to be_empty
    end

    it "makes the correct change to the hash map" do
      hash_map = HashMap.new
      expect(hash_map.bucket).to be_empty

      hash_map.insert("apples", 1)
      expect(hash_map.bucket).to include ["apples", 1]
    end

    it "chains expressions" do
      hash_map = HashMap.new
      subject = hash_map.insert("apples", 1).insert("bananas", 1)

      expect(subject).to be_truthy
      expect(subject).to eq hash_map
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
