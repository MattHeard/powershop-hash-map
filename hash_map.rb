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
    if has_key?(key)
      (@buckets[hash(key)] || []).select { |pair| pair[0] == key }.first[1] = value
    else
      insert(key, value)
    end

    self
  end

  def get(key)
    if has_key?(key)
      (@buckets[hash(key)] || []).select { |pair| pair[0] == key }.first[1]
    end
  end

  def delete(key)
    (@buckets[hash(key)] || []).reject! { |pair| pair[0] == key }

    self
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
    key.to_s.chars.map(&:ord).inject { |product, n| product * n } % 10007
  end
end
