class PortfolioAnalyst < Formula
  desc "Multi-broker equity portfolio analyzer (CLI + TUI)"
  homepage "https://github.com/innerlightlabs-org/portfolio-analyst"
  version "0.5.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-macos-arm64.tar.gz"
      sha256 "523ba11e98ec83ef59e79b946100b35a23dc7a066c2a1887c3d46a0065253104"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-linux-x86_64.tar.gz"
      sha256 "b0c0196cf86a2b863301bc1f0cba2694b8aae8c50b05d6724748dcb79c1160b7"
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
