class PortfolioAnalyst < Formula
  desc "Multi-broker equity portfolio analyzer (CLI + TUI)"
  homepage "https://github.com/innerlightlabs-org/portfolio-analyst"
  version "0.5.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-macos-arm64"
      sha256 "fdf3f12093aae2d7fd4115d53b14dc78cd8266d7e919539ed39335c158ba602b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-linux-x86_64"
      sha256 "86d5830c24d518e810e755428c99b7ea6b49cb348ef634f8dc38a1cdcad4a4ab"
    end
  end

  def install
    asset = OS.mac? ? "portfolio-macos-arm64" : "portfolio-linux-x86_64"
    bin.install asset => "portfolio"
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
