class Hash
  def symbolize_keys
    hash = {}
    keys.each do |key|
      case (v = delete(key))
      when Hash
        v = v.symbolize_keys
      when Array
        v = v.map{|x| (x.symbolize_keys rescue x) }
      end
      hash[(key.to_sym rescue key) || key] = v
    end
    hash
  end

  def symbolize_keys!
    keys.each do |key|
      case (v = delete(key))
      when Hash
        v = v.symbolize_keys
      when Array
        v = v.map{|x| (x.symbolize_keys rescue x) }
      end
      self[(key.to_sym rescue key) || key] = v
    end
    self
  end
end
