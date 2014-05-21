require({
    urlArgs: "bust=" + (new Date()).getTime(),
    paths: {
        templates: "../templates"
    }
}, ['cs!router']);
