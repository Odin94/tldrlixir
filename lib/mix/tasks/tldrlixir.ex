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
    |> to_names_licenses_by_obligation()
    # |> to_output_string()
    |> IO.inspect()
  end

  @spec extract_name_and_license(License.t()) :: name_and_license
  defp extract_name_and_license(%{name: name, license: license}),
    do: %{name: name, license: license}

  @spec to_obligations(String.t()) :: String.t()
  defp to_obligations(license_name) do
    Tldrlixir.LicenseData.obligations_by_license()
    |> Map.get(license_name, ["uncertain license - not sure what to do"])
  end

  defp to_names_licenses_by_obligation(names_licenses_obligations) do
    # obligation => [{name, license}]
    # later: get count by counting entries for each obligation

    names_licenses_obligations
    |> Enum.flat_map(fn {name, license, obligations} ->
      obligations
      |> Enum.map(fn obligation -> {obligation, {name, license}} end)
    end)
    |> Enum.reduce(%{}, fn {obligation, name_license}, acc ->
      Map.update(acc, obligation, [name_license], &Enum.concat(&1, [name_license]))
    end)
  end

  # defp to_output_string(names_licenses_by_obligation) do
  #   summary =
  #     names_licenses_by_obligation
  #     |> Enum.map(fn {obligation, names_licenses} ->
  #       "#{obligation}: #{Enum.count(names_licenses)} packages"
  #     end)
  #     |> Enum.join("\n")

  #   details =
  #     names_licenses_by_obligation
  #     |> Enum.map(fn {obligation, names_licenses} ->
  #       names_licenses
  #       |> Enum.map()
  #     end)
  #     |> Enum.join("\n\n\n")

  #   "#{summary}\n\n\n#{details}"
  # end
end
