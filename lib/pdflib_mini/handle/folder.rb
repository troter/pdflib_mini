module PdflibMini
  module Handle
    class Folder < Base
      def initialize(folder, p)
        super(folder)
        @p = p
      end

      # 12.6 PDF Packages and Portfolios
      # int add_portfolio_folder(int parent, string foldername, string optlist)
      def add_portfolio_folder(*args)
        @p.add_portfolio_folder(self, *args)
      end

      # 12.6 PDF Packages and Portfolios
      # int add_portfolio_file(int folder, string filename, string optlist)
      def add_portfolio_file(*args)
        @p.add_portfolio_file(self, *args)
      end
    end
  end
end
