class HashMap
  def initialize
    @buckets = []
  end

  def insert(key, value)
    @buckets[hash(key)] ||= []

    if @buckets[hash(key)].none? { |pair| pair[0] == key }
      @buckets[hash(key)].push [key, value]
    end

    self
  end

  def count
    @buckets.count { |bucket| !bucket.nil? && !bucket.empty? }
  end

  def update(key, value)
    @buckets[hash(key)].select { |pair| pair[0] == key }.first[1] = value

    self
  end

  def get(key)
    @buckets[hash(key)].select { |pair| pair[0] == key }.first[1]
  end

  def biggest_bucket_size
    @buckets.reject(&:nil?).map(&:size).max || 0
  end

  def empty?
    @buckets.flatten(1).size == 0
  end

  def has_key?(key)
    (@buckets[hash(key)] || []).any? { |pair| pair[0] == key }
  end

  def hash(key)
    key.size
  end
end
