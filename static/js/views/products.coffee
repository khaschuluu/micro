define [
    'backbone'
    'cs!collections/products'
    'cs!views/products_item'
], (Backbone, Categories, ItemView) ->
    Backbone.View.extend
        initialize: (options) ->
            @.collection = new Categories
            @.filter = {}
            if options && options._categoryId
                @.filter._categoryId = options._categoryId || null
        render: ->
            i = @
            i.collection.fetch
                data: i.filter
                success: (collection) ->
                    collection.each (model) ->
                        item = new ItemView model: model
                        i.$el.append item.render().el
            i
