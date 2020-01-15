# # frozen_string_literal: true

# AlgoliaSearch.configuration = { application_id: Figaro.env.ALGOLIA_APP_ID, api_key: Figaro.env.ALGOLIA_ADMIN_API_KEY }
# unless Rails.env.test?
#   index = Algolia::Index.new "Product_#{Rails.env}"
#   index.set_settings({ paginationLimitedTo: 20_000 },
#                      searchableAttributes: %w[
#                        shop
#                        collection
#                        title
#                        price
#                      ])

#   index = Algolia::Index.new "Product_by_shop_#{Rails.env}"
#   index.set_settings({ paginationLimitedTo: 20_000 },
#                      searchableAttributes: %w[
#                        shop
#                        collection
#                        title
#                        price
#                      ])
# end
