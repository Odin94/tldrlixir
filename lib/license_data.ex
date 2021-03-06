defmodule Tldrlixir.LicenseData do
  # Information from https://github.com/eladnava/tldrlegal
  @spec obligation_infos() :: map()
  def obligation_infos do
    %{
      "giveCredit" => %{
        title: "Give Credit",
        description:
          "You must display an acknowledgement in all advertising materials mentioning features or use of these packages."
      },
      "stateChanges" => %{
        title: "State Changes",
        description: "You must state significant changes made to these packages."
      },
      "discloseSource" => %{
        title: "Disclose Source",
        description: "You must disclose your source code when you distribute your software."
      },
      "includeOriginal" => %{
        title: "Include Original",
        description:
          "You must distribute copies of these original packages or instructions to obtain copies with your software."
      },
      "rename" => %{
        title: "Rename (If License Modified)",
        description: "You must rename these packages licenses if you change their terms."
      },
      "includeLicense" => %{
        # Only warn about this obligation in closed-source mode
        closedSourceOnly: true,
        title: "Include License",
        description:
          "You must include the license notice in all copies or substantial uses of these packages."
      },
      "includeCopyright" => %{
        # Only warn about this obligation in closed-source mode
        closedSourceOnly: true,
        title: "Include Copyright",
        description:
          "You must include the copyright notice in all copies or substantial uses of these packages."
      },
      "includeNotice" => %{
        # Only warn about this obligation in closed-source mode
        closedSourceOnly: true,
        title: "Include Notice",
        description:
          "If these packages have a 'NOTICE' file with attribution notes, you must include that NOTICE when you distribute. You may append to these NOTICE files."
      }
    }
  end

  # Information from tldrlegal.com via https://github.com/eladnava/tldrlegal
  @spec obligations_by_license() :: map()
  def obligations_by_license do
    %{
      "MIT" => [
        "includeLicense",
        "includeCopyright"
      ],
      "ISC" => [
        "includeLicense",
        "includeCopyright"
      ],
      "Apache 2.0" => [
        "stateChanges",
        "includeNotice",
        "includeLicense",
        "includeCopyright"
      ],
      "AFL 3.0" => [
        "includeOriginal",
        "discloseSource",
        "includeCopyright"
      ],
      "BSD 2 Clause" => [
        "includeLicense",
        "includeCopyright"
      ],
      "BSD 3 Clause" => [
        "includeLicense",
        "includeCopyright"
      ],
      "BSD 4 Clause" => [
        "giveCredit",
        "includeLicense",
        "includeCopyright"
      ],
      "GPL 2.0" => [
        "stateChanges",
        "includeLicense",
        "discloseSource",
        "includeOriginal",
        "includeCopyright"
      ],
      "WTFPL" => [
        "rename"
      ],
      "CC BY 4.0" => [
        "giveCredit",
        "stateChanges",
        "includeCopyright"
      ],
      "CC0" => [],
      "Public Domain" => [],
      "Unlicense" => []
    }
  end
end
