module PaginationHelpers
  extend ActiveSupport::Concern
  extend Grape::API::Helpers

  included do
    include Pagy::Backend
  end

  params :pagination do |opts = {}|
    opts.reverse_merge!(
      per_page: Pagy::DEFAULT[:items] || 5
    )

    optional :page,
             type: Integer,
             default: 1,
             desc: 'Page offset to fetch.'

    optional :per_page,
             type: Integer,
             default: opts[:per_page],
             desc: 'Number of results to return per page.'
  end

  def apply_pagination(collection)
    method = collection.is_a?(Array) ? :pagy_array : :pagy
    pagy, records = send(method, collection, { offset: params[:page], items: params[:per_page] })

    headers = pagy_headers_hash(pagy)

    meta = {
      page: {
        'current-page' => headers['Current-Page'],
        'per-page'     => headers['Page-Items'],
        'total-pages'  => headers['Total-Pages'],
        'total-count'  => headers['Total-Count']
      },
      links: {
        first: headers['Link']['first'],
        last: headers['Link']['last']
      }
    }

    [records, { meta: meta }]
  end
end
