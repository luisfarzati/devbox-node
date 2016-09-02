## devbox-node
Node development sandbox with Docker

### About

Node.js development environment with:

* [smart transpilation suited for Node 6](https://babeljs.io/docs/plugins/preset-es2017/);
* Code linting using a set of practices mostly based on [Standard](https://github.com/feross/standard) but with [a few overrides](/eslintrc.json);
* Nodemon for easy relint/restart on changes;
* more features to come

### Build

```bash
docker build -t nodeapp .
```

### Usage

```bash
# Lints your code
docker run --rm -v <yourProjectDir>:/var/nodeapp nodeapp 

# Relints on every change
docker run --rm -v <yourProjectDir>:/var/nodeapp nodeapp autolint

# Runs the app; relints & restarts on every change
docker run --rm -v <yourProjectDir>:/var/nodeapp nodeapp autorun
```

