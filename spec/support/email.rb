module EmailHelpers

  def find_email_matching(options)
    options[:from] = extract_plain_email(options[:from]) if options[:from]
    options[:to]   = extract_plain_email(options[:to]) if options[:to]
    
    ActionMailer::Base.deliveries.reverse.detect do |mail|
      options.all? do |method, value|
        [*mail.send(method)].any? {|x| x.include?(value) }
      end
    end
  end

  # Emails can look like "bill@example.com" or "Bill <bill@example.com>", hence 
  # grab only the plain email address bit
  def extract_plain_email(email)
    email[/([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})/i]
  end

  # Called on a User. Will regexp match all the
  # given fields against any email delivered to that user. Supported fields:
  #   :subject
  #   :body
  RSpec::Matchers.define :receive_email do |options = {}|
    match do |recipient|
      find_email_matching(options_with_recipient(options, recipient))
    end

    failure_message_for_should do |recipient|
      <<-EOS
Expected to receive an email matching #{options_with_recipient(options, recipient).inspect}"}
Received:
  #{ActionMailer::Base.deliveries.map {|x| "#{x.to.join(', ')}: #{x.subject}" }.join("\n  ")}
EOS
    end

    failure_message_for_should_not do |recipient|
      <<-EOS
Expected not to receive an email matching #{options_with_recipient(options, recipient).inspect}"}
Received:
  #{ActionMailer::Base.deliveries.map {|x| "#{x.to.join(', ')}: #{x.subject}" }.join("\n  ")}
EOS
    end

    def options_with_recipient(options, recipient)
      options.merge(to: email_for_recipient(recipient))
    end

    def email_for_recipient(recipient)
      if recipient.is_a?(String)
        recipient
      else
        recipient.email
      end
    end

  end

end


RSpec.configuration.include EmailHelpers