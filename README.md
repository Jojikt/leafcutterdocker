# Docker container for leafcutter

Dockerfile for [leafcutter](https://github.com/davidaknowles/leafcutter): annotation-free quantification of RNA splicing.

It's on [dockerhub](https://hub.docker.com/r/naotokubota/leafcutter) and [github](https://github.com/NaotoKubota/leafcutter).

## tags and links
- `0.2.9` [(master/Dockerfile)](https://github.com/NaotoKubota/leafcutter/blob/master/Dockerfile)

## how to build

```sh
docker pull naotokubota/leafcutter:0.2.9
```

or

```sh
git clone git@github.com:NaotoKubota/leafcutter.git
cd leafcutter
docker build --rm -t naotokubota/leafcutter:0.2.9 .
```

## running

```sh
docker run --rm -it naotokubota/leafcutter:0.2.9
```
