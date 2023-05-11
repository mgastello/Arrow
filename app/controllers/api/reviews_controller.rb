class Api::ReviewsController < ApplicationController
    wrap_parameters include: CartItem.attribute_names + ['userId', 'productId', 'displayName']

end
