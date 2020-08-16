defmodule Mix.Tasks.Tldrlixir do

  use Mix.Task

  @shortdoc "Lists each dependencys licenses"
  @switches [
    # top_level_only: :boolean,
    # csv: :boolean
  ]

  def run(argv) do
    {opts, _argv} = OptionParser.parse!(argv, switches: @switches)

    Licensir.Scanner.scan(opts)
    |> IO.inspect()
    # |> Enum.sort_by(fn license -> license.name end)
    # |> Enum.map(&to_row/1)
    # |> render(opts)
  end


  def main(args \\ []) do
    args
    |> parse_args()
    |> response()
    |> IO.puts()

    Licensir.Scanner.scan([])
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
