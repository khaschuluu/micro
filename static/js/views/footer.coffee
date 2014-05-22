define [
    'backbone'
    'jade!templates/footer'
], (Backbone, template) ->
    Backbone.View.extend
        className: "container"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            i
