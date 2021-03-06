class Product < ActiveRecord::Base
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}
  has_many :reviews, dependent: :destroy #might not be needed

  has_attached_file :image, styles: {medium: "150x150", thumb: "100x100"}, default_url: "/images/:styles/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def formatted_price
   price_in_dollars = price_in_cents.to_f / 100
   format("%.2f", price_in_dollars)
 end

end
