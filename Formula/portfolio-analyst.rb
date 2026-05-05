class PortfolioAnalyst < Formula
  desc "Multi-broker equity portfolio analyzer (CLI + TUI)"
  homepage "https://github.com/innerlightlabs-org/portfolio-analyst"
  version "0.5.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-macos-arm64.tar.gz"
      sha256 "cb92b67fc3600899a897a7c27a9f54bce8bfd4927c2fc8cf61760cf573e770ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-linux-x86_64.tar.gz"
      sha256 "e994994d271dfe5377966feccd4e882acedd977b5305e1c3585c55bd1734f640"
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
