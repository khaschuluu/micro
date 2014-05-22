define [
    'backbone'
    'jade!templates/outer_container'
], (Backbone, template) ->
    Backbone.View.extend
        id: "mcr_main"
        className: "container"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            i
