# Nico App Example

## Build

```bash
docker build . -t nico-app --target production
```

## Temp Run

```bash
docker run --rm --name -p 1415:1415 nico-app nico-app:latest
```
