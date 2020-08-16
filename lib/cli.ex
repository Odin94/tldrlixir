defmodule Tldrlixir.CLI do
  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
    |> IO.puts()
  end

  defp parse_args(args) do
    {opts, text, _} =
      args
      |> OptionParser.parse(switches: [reverse: :boolean])

    {opts, List.to_string(text)}
  end

  defp response({opts, text}) do
    if opts[:reverse], do: String.reverse(text), else: text
  end
end
