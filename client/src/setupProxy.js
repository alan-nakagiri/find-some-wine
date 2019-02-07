const proxy = require('http-proxy-middleware')
// import proxy from 'http-proxy-middleware'

module.exports = function (app) {
  app.use(proxy('/api', { target: 'http://localhost:3001/' }));
};

// export default (app) => {
//   app.use(proxy('/api', { target: 'http://localhost:3001/' }));
// }