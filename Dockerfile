FROM elixir:1.18.0-alpiFROM elixir:1.15.0-alpine

RUN apk add --no-cache build-base git

WORKDIR /app

COPY mix.exs ./

COPY mix.lock ./ || true

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

COPY . .

RUN mix compile

CMD ["iex", "-S", "mix"]


