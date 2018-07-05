# docker-matrix-doc-web
A docker image to build and host a branch of the matrix spec


## Simple usage (build and serve master)

```
docker run --rm -p 80:80 turt2live/matrix-doc-web
```

## Build and serve a specific branch

```
docker run --rm -e SPEC_BRANCH=master -p 80:80 turt2live/matrix-doc-web
```

## Build and serve a specific branch on another repo

```
docker run --rm -e SPEC_REPO=https://github.com/turt2live/matrix-doc.git -e SPEC_BRANCH=master -p 80:80 turt2live/matrix-doc-web
```

## Build and serve a pull request

```
docker run --rm -e SPEC_FETCH=pull/1379/head:local/pr -e SPEC_BRANCH=local/pr -p 80:80 turt2live/matrix-doc-web
```
