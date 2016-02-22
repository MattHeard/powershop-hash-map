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
    @bucket.select { |pair| pair[0] == key }.first[1] = value

    self
  end

  def get(key)
    @bucket.select { |pair| pair[0] == key }.first[1]
  end
end
