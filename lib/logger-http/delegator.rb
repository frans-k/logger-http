class Delegator
  def initialize obj
    @obj = obj
  end

  def method_missing name, *args
    puts name, args.inspect
    @obj.send(name, *args)
  end
end
