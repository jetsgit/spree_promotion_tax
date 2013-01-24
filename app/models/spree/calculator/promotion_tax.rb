require_dependency 'spree/calculator'

module Spree
  class Calculator::PromotionTax < Calculator::DefaultTax
    def self.description
       I18n.t(:promotion_tax)
    end

    def compute(computable)
       super
    end
    private
      def rate
        self.calculable
      end
     def compute_order(order)
	matched_line_items = order.line_items.select do |line_item|
	     line_item.product.tax_category == rate.tax_category
	end
       line_items_total = matched_line_items.sum(&:total) 
       adjusted_total = line_items_total + order.promotions_total
       order.line_items.empty? ? 0 : adjusted_total * rate.amount
     end

     def compute_line_item(line_item) 
	super
     end 
     def round_to_two_places(amount) 
	super
     end
     def deduced_total_by_rate(total, rate) 
	super
     end
  end 
    
end

