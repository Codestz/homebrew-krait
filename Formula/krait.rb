class Krait < Formula
  desc "Code intelligence CLI for AI agents — LSP-backed symbol search and semantic editing"
  homepage "https://github.com/Codestz/krait"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-aarch64-apple-darwin.tar.gz"
      sha256 "862ba48ebd9db8e3240d90b4e3c661f647ddc301d7f556115c820c631555198e"
    else
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-x86_64-apple-darwin.tar.gz"
      sha256 "4e1b06f13b0c3ed97b269b9be90272d626abcc4ae8655f4623cdc4fd4af81ad8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62dbf486b8bb239823785a7020dc06b34ac2a4a85ff35dd9bc664dfe9f1ed28e"
    else
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddf6493f3d7d36d010f29fdfe44b1c0198d9f0ab7a3728f884b4e75d62499ddb"
    end
  end

  def install
    bin.install "krait"
  end

  def caveats
    <<~EOS
      krait auto-installs language servers on first use.
      Run  in your project to generate a workspace config.

      TypeScript: npm install -g @vtsls/language-server
      Go:         go install golang.org/x/tools/gopls@latest
      Rust:       rustup component add rust-analyzer
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/krait --version")
  end
end
