defmodule ExampleElixir do
  use Application

  def start(_type, _args) do
    IO.puts "Starting Cowboy on http://localhost:4000"
    Plug.Adapters.Cowboy.http(ExampleElixir.Router, [], [url: "http://localhost:4000", port: 4000, compress: true])
    ExampleElixir.Supervisor.start_link
  end
end

ExampleElixir.start([], [])
