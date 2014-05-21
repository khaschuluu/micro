define ['backbone', 'cs!models/category'], (Backbone, Category) ->
    Backbone.Collection.extend
        model: Category
        url: '/api/categories/'
