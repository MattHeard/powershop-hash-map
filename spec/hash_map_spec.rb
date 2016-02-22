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
      expect(hash_map).to be_empty

      hash_map.insert("apples", 1)
      expect(hash_map).not_to be_empty
    end

    it "makes the correct change to the hash map" do
      hash_map = HashMap.new
      expect(hash_map).to be_empty

      hash_map.insert("apples", 1)
      expect(hash_map.has_key?("apples")).to be true
    end

    it "chains expressions" do
      hash_map = HashMap.new
      subject = hash_map.insert("apples", 1).insert("bananas", 1)

      expect(subject).to be_truthy
      expect(subject).to eq hash_map
    end

    it "returns unaltered hash map when inserting with a key that is already inserted" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)

      expect(hash_map.insert("apples", 2).get("apples")).not_to eq 2
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

  describe "#update" do
    it "returns a hash map" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)
      subject = hash_map.update("apples", 2)

      expect(subject).to be_truthy
      expect(subject).to eq hash_map
    end

    it "updates the value at given key" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)
      hash_map.update("apples", 2)

      expect(hash_map.get("apples")).to eq 2

      hash_map.update("apples", 3)
      expect(hash_map.get("apples")).to eq 3
    end
  end

  describe "#biggest_bucket_size" do
    it "returns 0 when hash map is empty" do
      hash_map = HashMap.new

      expect(hash_map.biggest_bucket_size).to eq 0
    end

    it "returns 1 when a single element is added" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)

      expect(hash_map.biggest_bucket_size).to eq 1
    end

    it "returns 1 when two elements with different, non-colliding keys are added" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)
      hash_map.insert("bananas", 1)

      expect(hash_map.biggest_bucket_size).to eq 1
    end

    it "returns 2 when two elements with different, colliding keys are added" do
      hash_map = HashMap.new
      hash_map.insert("apple", 1)
      hash_map.insert("peach", 1)

      expect(hash_map.biggest_bucket_size).to eq 2
    end

    it "returns 2 when some elements have colliding keys" do
      hash_map = HashMap.new
      hash_map.insert("apple", 1)
      hash_map.insert("banana", 2)
      hash_map.insert("peach", 3)

      expect(hash_map.biggest_bucket_size).to eq 2
    end
  end

  describe "#has_key?" do
    it "returns false when hash map does not contain given key" do
      hash_map = HashMap.new
      expect(hash_map.has_key?("apple")).to be false
    end
  end
end
