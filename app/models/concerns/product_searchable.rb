module ProductSearchable
  extend ActiveSupport::Concern

  include AlgoliaSearch
  included do
    # algolia autocomplete model reindex
    algoliasearch per_environment: true, disable_indexing: Rails.env.test? , if: :active do

      attributesForFaceting [
        'title',
        'description',
        'price',
        'collection.title',
        'shop.name'
      ]

      add_replica 'Product_by_shop_desc', per_environment: true do
        customRanking ['desc(user)', 'desc(ranking)', 'desc(updated_at)']
      end

      add_replica 'Product_by_collection_desc', per_environment: true do
        customRanking ['desc(updated_at)']
      end

      attribute :title do
        title
      end

      attribute :description do
        description
      end

      attribute :price do
        price
      end

      attribute :original_price do
        original_price
      end

      attribute :quantity do
        quantity
      end

      attribute :collection do
        {
          id: collection_id,
          title: collection.title
        }
      end

      attribute :shop do
        {
          id: shop_id,
          name: shop.name
        }
      end

      attribute :images do
        {
          image_url: images.present? ? Rails.application.routes.url_helpers.url_for(images.first)  : ""
        }
      end


      attributesToIndex [
        'shop_id', 'collection_id'
      ]
    end
  end
end
