# BUILD STAGE
FROM elixir:1.18.0-alpine AS build

ENV MIX_ENV=prod
WORKDIR /app

RUN apk add --no-cache build-base git

COPY mix.exs mix.lock ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod

COPY . .
RUN mix deps.compile
RUN mix compile

RUN mix release

FROM elixir:1.16-alpine AS app

WORKDIR /app
COPY --from=build /app/_build/prod/rel/elixir_docker_test ./
COPY --from=build /app/priv/static ./priv/static

ENV PORT=4000
CMD ["bin/elixir_docker_test", "start"]
