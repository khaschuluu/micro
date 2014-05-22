define [
    'backbone'
    'jade!templates/products_item'
], (Backbone, template) ->
    Backbone.View.extend
        template: _.template template()
        events:
            'click *': 'click'
        render: ->
            i = @
            i.$el.html i.template i.model.attributes
            i
        click: ->
            i = @
        delete: ->
            i = @
            if confirm("Are you sure to delete '" + i.model.get("name") + "'?")
                i.model.destroy
                    success: ->
                        i.remove()
