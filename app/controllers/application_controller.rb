# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  def filter_first(model)
    uri_split = URI(request.original_url).path.split('/')
    # can do this while nested resources are only 1 resource deep
    if uri_split.count == 6
      filter_class = uri_split[3].singularize + '_id'
      id = uri_split[4]
      filtered_class = uri_split[5]
      sql = "SELECT * FROM #{filtered_class} WHERE #{filter_class} = #{id}"
      return ActiveRecord::Base.connection.execute(sql)
    else
      return model.all
    end
  end
end
