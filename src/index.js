var riot = require('riot');
require('riot-router');

require('./tags/index.tag');
require('./tags/not-found.tag');

require('./tags/messages.tag');
require('./tags/createUser.tag');

var DefaultRoute = riot.router.DefaultRoute; 
var NotFoundRoute = riot.router.NotFoundRoute; 
var Route = riot.router.Route;

riot.router.routes([
    new DefaultRoute({tag: 'my-index'}),
    new NotFoundRoute({tag: 'not-found'}),
    new Route({path:'/messages', tag: 'my-messages'}),
    new Route({path:'/createUser', tag: 'my-createuser'})
]);

riot.mount('*');
riot.router.start();