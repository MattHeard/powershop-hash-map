class HashMap
  attr_reader :bucket

  def initialize
    @bucket = []
  end

  def insert(key, value)
    if @bucket.none? { |pair| pair[0] == key }
      @bucket.push [key, value]
    end

    self
  end

  def count
    @bucket.length
  end

  def update(key, value)
    if @bucket.any? { |pair| pair[0] == key }
      @bucket.select { |pair| pair[0] == key }.first[1] = value
    else
      insert(key, value)
    end

    self
  end

  def get(key)
    if @bucket.any? { |pair| pair[0] == key }
      @bucket.select { |pair| pair[0] == key }.first[1]
    end
  end

  def delete(key)
    @bucket.reject! { |pair| pair[0] == key }
  end
end
