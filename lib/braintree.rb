module Braintree
  
  def gateway
    env = Braintree::Configuration.environment = :sandbox
    @gateway ||= Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => 'phng4ppqvqx6gf6y',
      :public_key => 'g9wwc4j5png82cp5',
      :private_key => '11e2635fef7fcc600de045b2c1e75d23',
    )
  end

end