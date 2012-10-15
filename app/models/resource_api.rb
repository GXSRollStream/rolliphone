class ResourceAPI
  HOST = "192.168.1.146:3000"
  BASE_URL = "http://#{HOST}/iphone"

  def self.get(url)
    error = Pointer.new(:object)
    raw_data = NSData.alloc.initWithContentsOfURL(NSURL.URLWithString("#{BASE_URL}/#{url}"))
    NSJSONSerialization.JSONObjectWithData(raw_data, options:NSJSONReadingMutableContainers, error:error)
  end
end
