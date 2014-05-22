define ['backbone', 'cs!models/product'], (Backbone, Model) ->
    Backbone.Collection.extend
        model: Model
        url: '/api/products/'
