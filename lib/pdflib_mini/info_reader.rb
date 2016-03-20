module PdflibMini
  module InfoReader
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def info_raw_reader(method_name, keyword)
        define_method(keyword) do |optlist = ''|
          public_send(method_name, keyword, optlist)
        end
      end

      def info_string_reader(method_name, keyword)
        define_method(keyword) do |optlist = ''|
          result = public_send(method_name, keyword, optlist).to_i
          return nil if result == -1
          @p.get_string(result, '')
        end
      end

      def info_handle_reader(method_name, keyword, handle)
        class_name = handle.to_s.capitalize
        define_method(keyword) do |optlist = ''|
          result = public_send(method_name, keyword, optlist).to_i
          PdflibMini.const_get(class_name).create(result, @p)
        end
      end

      def info_reader(method_name, keyword, type)
        case type
        when :raw
          info_raw_reader(method_name, keyword)
        when :string
          info_string_reader(method_name, keyword)
        else
          info_handle_reader(method_name, keyword, type)
        end
      end
    end
  end
end
