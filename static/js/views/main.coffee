define [
    'backbone'
    'jade!templates/main'
], (Backbone, template) ->
    Backbone.View.extend
        className: "container"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            i
