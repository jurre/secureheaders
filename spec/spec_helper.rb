require 'rubygems'
require 'rspec'
require 'rack'
require 'pry-nav'

require 'coveralls'
Coveralls.wear!

require File.join(File.dirname(__FILE__), '..', 'lib', 'secure_headers')



USER_AGENTS = {
  firefox: 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:14.0) Gecko/20100101 Firefox/14.0.1',
  chrome: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.56 Safari/536.5',
  ie: 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/5.0)',
  opera: 'Opera/9.80 (Windows NT 6.1; U; es-ES) Presto/2.9.181 Version/12.00',
  ios5: "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3",
  ios6: "Mozilla/5.0 (iPhone; CPU iPhone OS 614 like Mac OS X) AppleWebKit/536.26 (KHTML like Gecko) Version/6.0 Mobile/10B350 Safari/8536.25",
  safari5: "Mozilla/5.0 (iPad; CPU OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko ) Version/5.1 Mobile/9B176 Safari/7534.48.3",
  safari5_1: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_3) AppleWebKit/534.55.3 (KHTML, like Gecko) Version/5.1.3 Safari/534.53.10",
  safari6: "Mozilla/5.0 (Macintosh; Intel Mac OS X 1084) AppleWebKit/536.30.1 (KHTML like Gecko) Version/6.0.5 Safari/536.30.1"
}

def expect_default_values(hash)
  expect(hash[SecureHeaders::CSP::HEADER_NAME]).to eq(SecureHeaders::CSP::DEFAULT_VALUE)
  expect(hash[SecureHeaders::XFrameOptions::HEADER_NAME]).to eq(SecureHeaders::XFrameOptions::DEFAULT_VALUE)
  expect(hash[SecureHeaders::XDownloadOptions::HEADER_NAME]).to eq(SecureHeaders::XDownloadOptions::DEFAULT_VALUE)
  expect(hash[SecureHeaders::StrictTransportSecurity::HEADER_NAME]).to eq(SecureHeaders::StrictTransportSecurity::DEFAULT_VALUE)
  expect(hash[SecureHeaders::XXssProtection::HEADER_NAME]).to eq(SecureHeaders::XXssProtection::DEFAULT_VALUE)
  expect(hash[SecureHeaders::XContentTypeOptions::HEADER_NAME]).to eq(SecureHeaders::XContentTypeOptions::DEFAULT_VALUE)
  expect(hash[SecureHeaders::XPermittedCrossDomainPolicies::HEADER_NAME]).to eq(SecureHeaders::XPermittedCrossDomainPolicies::DEFAULT_VALUE)
end

module SecureHeaders
  class Configuration
    class << self
      def clear_configurations
        @configurations = nil
      end
    end
  end
end

def reset_config
  SecureHeaders::Configuration.clear_configurations
end
