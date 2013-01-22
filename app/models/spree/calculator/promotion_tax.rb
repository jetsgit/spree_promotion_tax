require_dependency 'spree/calculator'
module Spree
  class Calculator::PromotionTax < Calculator::DefaultTax
    private
      def compute_order(order)
        matched_line_items = order.line_items.select do |line_item|
          line_item.product.tax_category == rate.tax_category
        end

        line_items_total = matched_line_items.sum(&:total)

        promotion_adjustments_total = order.adjustments.eligible.promotion.sum(&:amount)

        total = promotion_adjustments_total + line_items_total

        round_to_two_places(total * rate.amount)
      end
    end 
end

