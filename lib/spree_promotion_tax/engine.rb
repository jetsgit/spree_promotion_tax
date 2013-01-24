module SpreePromotionTax
  class Engine < Rails::Engine
    engine_name 'spree_promotion_tax'

    config.autoload_paths += %W(#{config.root}/lib)

   
    initializer 'spree.register.promotion_tax', :after => "spree.register.calculators" do |app|
       app.config.spree.calculators.tax_rates << Spree::Calculator::PromotionTax
    end

      # initializer "spree.register.calculators" do |app|
	# app.config.spree.calculators.tax_rates =
	#   [Spree::Calculator::PromotionTax]
      # end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
