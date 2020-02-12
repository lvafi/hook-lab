class ProductSerializer < ActiveModel::Serializer
  attributes(*(Product.attribute_names - ['user_id']).map { |attr| attr.to_sym })
  # There is a lot going on in line 2.
  # First, `Product.attribute_names` is a method that returns an array of product
  # attributes as strings (an array of strings):
  #
  #     all_product_attrs_as_strings = Product.attribute_names
  #
  # Next, the `user_id` attribute is removed from that array since it will not
  # be sent back in the response:
  #
  #     selected_attrs_as_strings = all_product_attrs_as_strings - ['user_id']
  #
  # Next, that array of strings is mapped over, converting those strings into
  # symbols, return an array with attribute names as symbols:
  #
  #     selected_attrs_as_sym = selected_attrs_as_strings.map { |attr| attr.to_sym }
  #
  # The `*` character is used like the JavaScript `...` spread operator.
  # This will spread out the array into a comma separated list of parameters
  # that are passed through as inputs to the attributes method:
  #
  #     attributes(*selected_attrs_as_sym)
  #
  # Another (shorter) way which makes use of some special ruby syntax for
  # passing a block as input to a method, of writing line 2 above is line 28 below:
  #
  #     attributes(*(Product.attribute_names - ['user_id']).map(&:to_sym))
  #
  # The `&:to_sym` says for each element in the array that is being mapped over,
  # i.e. for each attribute, invoke the `to_sym` method on it and return the result
  # 
  belongs_to :user, key: :seller
  class UserSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email
  end

  has_many :reviews
  class ReviewSerializer < ActiveModel::Serializer
      attributes :id, :body, :rating
  end
end
