define [
    'backbone'
    'jade!templates/side'
], (Backbone, template) ->
    Backbone.View.extend
        className: "col-md-3"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            i
