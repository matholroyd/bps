module AcceptanceEmailHelpers
  # Finds the latest email to match the given options, locates an HTML link
  # matching the given text, and visits it. Options is not validated - they
  # are passed straight through to the found mail object.
  def click_link_in_email(text, options)
    mail = find_email_matching(options)
    unless mail
      fail "Could not locate mail matching: #{options.inspect}"
    end

    element = Nokogiri::HTML(mail.body.to_s).css('a').detect {|x| x.text == text }
    unless element
      fail "Could not find link with text '#{text}' in:\n\n#{mail.body.to_s}"
    end

    visit strip_hostname(element.attribute('href').value)
  end

  def strip_hostname(url)
    uri = URI.parse(url)
    DBC.assert(!uri.host.blank?, "Host was not set in email url => #{url}")
    [uri.path, uri.query].compact.join('?')
  end
  
  def email_to(email)
    mail = find_email_matching(:to => email)
    DBC.assert(!mail.nil?, "Expected to find an email to #{email}")
    mail
  end
end

RSpec.configuration.include AcceptanceEmailHelpers
