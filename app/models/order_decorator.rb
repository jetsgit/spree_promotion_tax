Spree::Order.class_eval do
  def promotions_total
    (adjustments.eligible - adjustments.tax - adjustments.shipping).map(&:amount).sum
  end
end

