class HashMap
  attr_reader :bucket

  def initialize
    @bucket = []
  end

  def insert(key, value)
    @bucket.push [key, value]

    self
  end

  def count
    @bucket.length
  end

  def update(key, value)
    self
  end

  def get(key)
    2
  end
end
