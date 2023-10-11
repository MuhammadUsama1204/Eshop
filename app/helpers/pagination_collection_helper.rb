module PaginationCollectionHelper
  def pagination_collection(collection, page_param, per_page)
    collection.paginate(page: params[page_param], per_page: per_page)
  end
end
