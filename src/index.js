var riot = require('riot');
require('riot-router');
require('whatwg-fetch');

require('./tags/index.tag');
require('./tags/not-found.tag');

require('./tags/alert.tag');
require('./tags/messages.tag');
require('./tags/messages_test.tag');
require('./tags/user.tag');

var DefaultRoute = riot.router.DefaultRoute; 
var NotFoundRoute = riot.router.NotFoundRoute; 
var Route = riot.router.Route;

riot.router.routes([
    new DefaultRoute({tag: 'my-index'}),
    new NotFoundRoute({tag: 'not-found'}),
    new Route({path:'/messages', tag: 'my-messages'}),
    new Route({path:'/messages_test', tag: 'my-messages-test'}),
    new Route({path:'/user', tag: 'my-user'})
]);

riot.mount('*');
riot.router.start();