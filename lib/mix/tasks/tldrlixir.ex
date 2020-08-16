defmodule Mix.Tasks.Tldrlixir do
  use Mix.Task

  @type name_and_license :: %{name: String.t(), license: String.t()}

  @shortdoc "Lists each dependencys licenses"
  @switches [
    # top_level_only: :boolean,
    # csv: :boolean
  ]

  @spec run([binary]) :: any
  def run(argv) do
    {opts, _argv} = OptionParser.parse!(argv, switches: @switches)

    Licensir.Scanner.scan(opts)
    |> Enum.map(&extract_name_and_license/1)
    |> Enum.map(fn %{name: name, license: license} -> {name, license, to_obligations(license)} end)
    |> add_obligation_counts()
    |> IO.inspect()
  end

  @spec extract_name_and_license(License.t()) :: name_and_license
  defp extract_name_and_license(%{name: name, license: license}),
    do: %{name: name, license: license}

  @spec to_obligations(String.t()) :: String.t()
  defp to_obligations(license_name) do
    obligations_by_license = Tldrlixir.LicenseData.obligations_by_license()

    Map.get(obligations_by_license, license_name, ["uncertain license - not sure what to do"])
  end

  @spec add_obligation_counts(any) :: %{
          names_and_licenses: list(name_and_license),
          obligations: map()
        }
  defp add_obligation_counts(names_and_licenses) do
    obligations =
      names_and_licenses
      |> Enum.flat_map(fn {_, _, obligations} -> obligations end)
      |> Enum.reduce(%{}, fn obligation, acc -> Map.update(acc, obligation, 1, &(&1 + 1)) end)

    %{names_and_licenses: names_and_licenses, obligations: obligations}
  end
end
