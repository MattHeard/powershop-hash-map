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

    it "returns unaltered hash map when inserting with a key that is already inserted" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)

      expect(hash_map.insert("apples", 2).bucket).not_to include ["apples", 2]
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

    it "inserts a new pair given an missing key" do
      hash_map = HashMap.new

      hash_map.update("apples", 3)
      expect(hash_map.get("apples")).to eq 3
    end
  end

  describe "#get" do
    it "gets a value at valid key" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)

      expect(hash_map.get("apples")).to eq 1
    end

    it "returns nil when given an invalid key" do
      hash_map = HashMap.new

      expect(hash_map.get("bananas")).to eq nil
    end
  end

  describe "#delete" do
    it "removes a key value pair given a key" do
      hash_map = HashMap.new
      hash_map.insert("apples", 1)
      expect(hash_map.get("apples")).to eq 1

      hash_map.delete("apples")

      expect(hash_map.bucket).not_to include ["apples", 1]
    end
  end
end
