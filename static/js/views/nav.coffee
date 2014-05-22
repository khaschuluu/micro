define [
    'backbone'
    'jade!templates/nav'
], (Backbone, template) ->
    Backbone.View.extend
        id: "mcr_nav"
        className: "container"
        template: _.template template()
        render: ->
            i = @
            i.$el.html template
            i
