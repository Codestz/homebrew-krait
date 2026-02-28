class Krait < Formula
  desc "Code intelligence CLI for AI agents — LSP-backed symbol search and semantic editing"
  homepage "https://github.com/Codestz/krait"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-aarch64-apple-darwin.tar.gz"
      sha256 "92269fffe9af701c7ecba109d80eb9829f529f774ff3afd2ba9522a861d9786d"
    else
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-x86_64-apple-darwin.tar.gz"
      sha256 "e25b3bd452f14ffd8a36d511eadfbb999fa171f749f4448e0e50322e2e66ef51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74a44878313ef6b0c067bdf1250f4a6a037277aed48680daa77b02d73b17e6e9"
    else
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8c77dab3844cd1bea4ff88a6d0716ae566bf506c0d4ea0f532b072c324039b8"
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
