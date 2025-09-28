# VSCodium/VSCode Development Environment

This repository provides a Nix shell configurations to set up a development environment with [VSCodium](https://vscodium.com/) or [Microsoft Visual Studio Code](https://code.visualstudio.com/) with a curated set of extensions.

## 🚀 Features

- Shells with a predefined list of extensions for your preferred framework
- Automatic shell initialization for codium/code
- Ability to choose VSCodium (used by default) or VSCode and to enable unfree packages when entering shell ( See [Optional](#optional) )

## 🖥️ System requirements

🐧 [Debian](https://packages.debian.org/trixie/nix-bin) and [Ubuntu](https://packages.ubuntu.com/noble/nix-bin):

```bash
sudo apt install nix-bin
```

🐧 [Arch Linux](https://archlinux.org/packages/extra/x86_64/nix/):

```bash
sudo pacman -S nix
```

🪟 Windows/macOS/Docker/ Other distros:

Follow official [installation guide](https://nix.dev/install-nix)

## 💡 Usage

1. Clone the repository :

```bash
git clone https://github.com/kozm9000/vscodium-with-extensions-nix-shell.git
cd vscodium-with-extensions-nix-shell
```

`cd` again into `angular` or `nextjs` to use a shell with a predefined list of extensions for your preferred framework or use `shell.nix` at the root of the repo to define your own

2.Enter the development shell with VSCodium:

```bash
nix-shell
```

> Note: `nix-shell` automatically detects presence of `shell.nix` file in your current working folder and uses it.
> You may also provide a path with any other name that you prefer e.g. `nix-shell /path/to/shell/with/user-defined-name.nix`

### Optional

To use VSCode instead, set the `useVsCode` flag:

```bash
nix-shell --arg useVsCode true
```

> ⚠️ Note: `useVsCode` enables unfree packages by default. To use VSCodium with ability to install unfree extensions, set `allowUnfree` flag:

```bash
nix-shell --arg allowUnfree true
```

## 🛠️ Customizing Extensions

### 🔍 Finding Extension Identifiers

To add extensions:

1. Visit [Visual Studio Marketplace](https://marketplace.visualstudio.com/)

2. Search and select desired extension

3. Find the identifier:
   
   - In the "Installation" section below the name and publisher
   - In the "More Info" section as Unique Identifier
   - In the URL parameter `?itemName=`

4. Check that extension is available by using [NixOS Search](https://search.nixos.org/packages)

### 📦 Adding Non-Nixpkgs Extensions

For extensions not available in Nixpkgs:

1. Visit [Visual Studio Marketplace](https://marketplace.visualstudio.com/)
2. Search and select desired extension
3. Go to "More Info" section and use the Unique Identifier (publisher.name) and Version
4. Add the extension to `++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [paste here]` in `shell.nix`:

In the following example Unique identifier from "More Info" is `dbaeumer.vscode-eslint`:

```nix
{
  name = "vscode-eslint";
  publisher = "dbaeumer";
  version = "3.0.19";
  sha256 = "";
}
```

> Paste more codeblocks for each extension one after another. Check `nextjs/shell.nix` for reference

5.Run `nix-shell` and update the `sha256` value from the error message when it appears
6.Run `nix-shell` again.

## 📌 Notes

- This setup requires internet access to download extensions
- Nixpkgs versions may change over time - check for updates periodically

If you want to learn Nix, check out [beginner tutorials](https://nix.dev/tutorials/first-steps).

Full reference documentation can be found in the [Nix manual](https://nix.dev/reference/nix-manual).

## License

vscodium-with-extensions-nix-shell is released under the [LGPL-2.1 license](COPYING).
Nix is released under the [LGPL-2.1 license](COPYING)

Nixpkgs is licensed under the [MIT License](LICENCE-MIT).

> [!Note]
> MIT license does not apply to the packages built by Nixpkgs.It also might not apply to patches included in Nixpkgs, which may be derivative works of the packages to which they apply. The aforementioned artifacts are all covered by the licenses of the respective packages.
