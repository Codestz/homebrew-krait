class Krait < Formula
  desc "Code intelligence CLI for AI agents — LSP-backed symbol search and semantic editing"
  homepage "https://github.com/Codestz/krait"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-aarch64-apple-darwin.tar.gz"
      sha256 "a54ee6e29a04a9b2c5d433ebf5222ba51e5334f4cbb1521c6f5cd4d8d2fd9cb4"
    else
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-x86_64-apple-darwin.tar.gz"
      sha256 "cc62194541f917dba9642b5fc221efa69616e318879a1251fd6bf55cb0ed2316"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60a41654adb1bbf3e4f165d835b38ffc738f1181cd4665beb200a1c08b476e58"
    else
      url "https://github.com/Codestz/krait/releases/download/v#{version}/krait-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4db2823bf8a089b6b116fcc4620aca818e5c6475e1b553770ca6a58ef9fdd340"
    end
  end

  def install
    bin.install "krait"
  end

  def caveats
    <<~EOS
      krait auto-installs language servers on first use.
      Run `krait init` in your project to generate a workspace config.

      TypeScript: npm install -g @vtsls/language-server
      Go:         go install golang.org/x/tools/gopls@latest
      Rust:       rustup component add rust-analyzer
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/krait --version")
  end
end
