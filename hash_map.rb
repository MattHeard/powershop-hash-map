class HashMap
  def initialize
    @bucket = []
  end

  def insert(key, value)
    @bucket.push [key, value]

    true
  end

  def count
    @bucket.length
  end
end
