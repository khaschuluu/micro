define [
    'backbone'
    'cs!models/category'
    'jade!templates/products_item'
], (Backbone, Category, template) ->
    Backbone.View.extend
        template: _.template template()
        events:
            'click *': 'click'
        render: ->
            i = @
            cat_path = []
            cat = new Category
            fetch_cat_path = (id) ->
                cat.set _id: id
                cat.fetch
                    success: (model) ->
                        cat_path.push model.get "name"
                        if model.get "_parentId"
                            fetch_cat_path model.get "_parentId"
                        else
                            i.model.set category_path: cat_path
                            i.$el.html i.template i.model.attributes
            fetch_cat_path i.model.get "_categoryId"
            i
        click: ->
            i = @
        delete: ->
            i = @
            if confirm("Are you sure to delete '" + i.model.get("name") + "'?")
                i.model.destroy
                    success: ->
                        i.remove()
