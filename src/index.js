var riot = require('riot');
require('riot-router');

require('./tags/home.tag');
require('./tags/not-found.tag');

var DefaultRoute = riot.router.DefaultRoute; 
var NotFoundRoute = riot.router.NotFoundRoute; 

riot.router.routes([
    new DefaultRoute({tag: 'home'}),
    new NotFoundRoute({tag: 'not-found'})
]);


riot.mount('*');
riot.router.start();