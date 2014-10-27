# Traitify Elixir Example

This is an example application to show a simple implementation of the Traitify API using the Elixir client.
To get started, clone the directory and run `mix deps.get`

``` bash

$ git clone https://github.com/traitify/example_elixir.git
$ cd example_elixir
$ mix deps.get

```

Next, set the environment variables for the API host and your secret key. You can obtain a secret key from
the [developer portal](http://developer.traitify.com). Once you register on the site, you will be provided
a key as well as information on the API host.

``` bash

$ export TRAITIFY_API_HOST=https://api-sandbox.traitify.com
$ export TRAITIFY_API_KEY=<your_unique_secret_key>

```

Finally, run `mix run --no-halt lib/example_elixir.ex` and navigate your browser to `http://localhost:4000`

If you have questions, please contact [support@traitify.com](mailto:support@traitify.com)
