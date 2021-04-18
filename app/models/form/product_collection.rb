class Form::ProductCollection < Form::Base
  FORM_COUNT = 5
  attr_accessor :products

  def initialize(attributes = {})
    super attributes
    self.products = FORM_COUNT.times.map { Product.new() } unless self.products.present?
  end
  
  # 上でsuper attributesとしているので必要
  def products_attributes=(attributes)
    self.products = attributes.map { |_, v| Product.new(v) }
  end

  def save
    # 実際にやりたいことはこれだけ
    # self.memos.map(&:save!)

    # 複数件全て保存できた場合のみ実行したいので、transactionを使用する
    Product.transaction do
      self.products.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end