define [
    'backbone'
    'cs!collections/categories'
    'cs!views/cat'
], (Backbone, Categories, CatView) ->
    Backbone.View.extend
        tagName: 'ul'
        initialize: (options) ->
            @.collection = new Categories
            @.filter =
                _parentId: options._parentId || null
        render: ->
            i = @
            i.collection.fetch
                data: i.filter
                success: (collection) ->
                    collection.each (model) ->
                        item = new CatView model: model
                        i.$el.append item.render().el
            i
