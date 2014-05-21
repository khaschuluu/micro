define [
    'jquery'
    'backbone'
    'cs!views/home'
], (
    $
    Backbone
    HomeView
) ->
    AppRouter = Backbone.Router.extend
        routes:
            '(/)': 'home'
            '*action': 'e404'

    main_container = $ '#micro_main_container'

    app_router = new AppRouter
    app_router.on 'route:home', ->
        home_view = new HomeView
        main_container.html home_view.render().el
    app_router.on 'route:e404', ->
        main_container.html '404 - Page not found'

    Backbone.history.start()
