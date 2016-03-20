module PdflibMini
  Error = Class.new(SimpleDelegator)
  ERROR = Error.new(-1)

  class Handle < SimpleDelegator
    def self.create(*args)
      if args.first == -1
        ERROR
      else
        new(*args)
      end
    end
  end
end
