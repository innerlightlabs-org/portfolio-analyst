class PortfolioAnalyst < Formula
  desc "Multi-broker equity portfolio analyzer (CLI + TUI)"
  homepage "https://github.com/innerlightlabs-org/portfolio-analyst"
  version "0.5.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-macos-arm64.tar.gz"
      sha256 "ac9ed36886178ed12d3781f3b3d5b52c5f4a5251944d48fcbd4351e39f1274d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/innerlightlabs-org/portfolio-analyst/releases/download/v#{version}/portfolio-linux-x86_64.tar.gz"
      sha256 "9ab098c55b508271c79d256b290581986daf7ad63c00834d9b277085765094ac"
    end
  end

  def install
    # Homebrew descends into a single top-level directory in the
    # tarball before running this method, so libexec ends up holding
    # the binary + _internal/ at the top level (no portfolio-analyst/
    # wrapper). The symlink targets libexec/portfolio directly.
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
