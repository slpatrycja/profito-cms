const withPrefix = (prefix, routes) => routes.map((route) => {
  route.path = prefix + route.path;
  return route;
});

export default withPrefix;
