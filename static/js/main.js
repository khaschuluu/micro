require({
    urlArgs: "bust=" + (new Date()).getTime(),
    paths: {
        templates: "../templates"
    },
    shim: {
        'bootstrap': ["jquery"]
    }
}, ['cs!router']);
