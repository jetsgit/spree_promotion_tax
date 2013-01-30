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

       unless order.tax_cloud_transaction.nil?

	    cloud_rate = order.tax_cloud_transaction.amount / ( line_items_total + order.ship_total )  

	    unless order.adjustments.promotion.blank? 

		adjusted_total = line_items_total + order.promotions_total + order.ship_total

		unless adjusted_total.nil?  
		   round_to_two_places( adjusted_total * cloud_rate ) 
		else
		   round_to_two_places(line_items_total * cloud_rate)
		end
	    end
	
       else

	  round_to_two_places(line_items_total * rate.amount) 

       end 
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

