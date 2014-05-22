define ['backbone'], (Backbone) ->
    Backbone.Model.extend
        idAttribute: "_id"
        urlRoot: '/api/products/'
