define [
    'jquery'
    'backbone'
    'cs!views/nav'
    'cs!views/outer_container'
    'cs!views/side'
    'cs!views/main'
    'cs!views/footer'
    'cs!views/cats'
    'bootstrap'
], ($, Backbone, NavView, OuterContainerView, SideView, MainView, FooterView, CatsView) ->
    AppRouter = Backbone.Router.extend
        routes:
            '(/)': 'home'
            '*action': 'e404'

    nav_view = new NavView
    outer_container_view = new OuterContainerView
    side_view = new SideView
    main_view = new MainView
    footer_view = new FooterView
    cats_view = new CatsView _parentId: null
    document.body.appendChild nav_view.render().el
    document.body.appendChild outer_container_view.render().el
    document.body.appendChild footer_view.render().el
    ocvr = outer_container_view.$el.find ".row"     # Outer Container View Row
    ocvr.append side_view.render().el
    ocvr.append main_view.render().el
    side_view.$el.append cats_view.render().el

    app_router = new AppRouter
    app_router.on 'route:home', ->
        false
    app_router.on 'route:e404', ->
        false

    Backbone.history.start()
