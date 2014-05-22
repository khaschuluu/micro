define [
    'backbone'
    'cs!views/products'
    'jade!templates/main'
], (Backbone, ListView, template) ->
    Backbone.View.extend
        className: "col-md-9"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            list_view = new ListView
            i.$el.append list_view.render().el
            i
