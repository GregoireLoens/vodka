defmodule Vodka do

  def main(args) do
    IO.puts "Hello world"
    Vodka.Query.send_query()
  end
end
