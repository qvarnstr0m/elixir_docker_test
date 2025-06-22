FROM elixir:1.18.0-alpine

RUN apk add --no-cache build-base git

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

COPY . .

CMD ["iex"]

