Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['phng4ppqvqx6gf6y']
Braintree::Configuration.public_key = ENV['g9wwc4j5png82cp5']
Braintree::Configuration.private_key = ENV['11e2635fef7fcc600de045b2c1e75d23']