cask "neovim-nightly" do
  version :latest
  sha256 :no_check

  on_intel do
    arch = "x86_64"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-#{arch}/bin/nvim"
  end

  on_arm do
    arch = "arm64"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-#{arch}.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-#{arch}/bin/nvim"
  end

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  conflicts_with formula: "neovim"

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end
