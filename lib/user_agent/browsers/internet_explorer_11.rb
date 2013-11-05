class UserAgent
  module Browsers
    class InternetExplorer11 < UserAgent::Browsers::InternetExplorer
      def self.extend?(agent)
        agent.application &&
          agent.application.comment &&
          agent.application.comment[0] =~ /Windows NT/ &&
          agent.application.comment[3] =~ /rv:[\d\.]+/
      end

      def browser
        "Internet Explorer"
      end

      def version
        Version.new(application.comment[3].sub("rv:", ""))
      end

      def compatibility
        "compatible"
      end

      def os
        OperatingSystems.normalize_os(application.comment[0])
      end
    end
  end
end