module Blazer
  module NoOpMailer
    class << self

      @default = nil
      def default(args)
        @default = args
      end

      @layout = nil
      def layout(args)
        @layout = args
      end

      def default_url_options
        {}
      end
    end

    def deliver_now
    end
  end
  begin
    ActionMailer::Base
  rescue NameError
    Mailer = NoOpMailer
  else
    Mailer = ActionMailer::Base
  end
end
