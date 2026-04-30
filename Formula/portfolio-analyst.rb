class PortfolioAnalyst < Formula
  desc "Multi-broker equity portfolio analyzer (CLI + TUI)"
  homepage "https://github.com/innerlightlabs-org/portfolio-analyst"
  version "0.5.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-macos-arm64.tar.gz"
      sha256 "77ecc2ccdd34a02bf5289ebb247beea032d373a4f16a896f84051abeed051312"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-linux-x86_64.tar.gz"
      sha256 "a5dedc8fbfe8253759fcc784862c506e6ed6924f525f0f79a68d3462aa180ecf"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"portfolio"
  end

  def caveats
    <<~EOS
      Quick start — pick ONE auth path, then run the monitor.

      (1) Cloud sync (recommended — uses Innerlight Labs' shared
          Schwab integration; no developer account required):

            portfolio auth                 # Clerk sign-in + Schwab link
            portfolio monitor              # live TUI, syncs in-app

      (2) Local auth (only if you have your own Schwab developer
          OAuth credentials in config.yaml):

            portfolio auth local           # local OAuth, disables cloud
            portfolio monitor              # live TUI, syncs in-app

      All commands:    portfolio --help
      Config + logs:   ~/.portfolio-analyst/
      Issues:          https://github.com/innerlightlabs-org/portfolio-analyst/issues
    EOS
  end

  test do
    assert_match "Multi-broker", shell_output("#{bin}/portfolio --help")
  end
end
