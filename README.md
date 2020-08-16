# Tldrlixir

Check if your project is compliant with your dependencies licensing requirements, get nice reports, get immediate information on your obligations defined in licenses.

NOTE: This is not legal advice. Use at your own risk.

License data is sourced from tldrlegal.com via https://github.com/eladnava/tldrlegal

* Configure in `TODO`
* Run with `mix tldrlixir`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tldrlixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tldrlixir, "~> 0.1.0"}
  ]
end
```


## Planned Features
* Get information on used licenses and coupled obligations
* Support multiple output formats (json, csv, markdown, html)
* Optionally use actual tldrlegal.com api instead of local data
* Allow defining allowlists / blocklists for licenses and add warnings to output on violation
* Fail build when allowlist / blocklist is violated
