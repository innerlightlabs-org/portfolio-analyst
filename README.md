# Portfolio Analyst

A desktop tool for monitoring and analyzing personal investment portfolios. Aggregates holdings across brokerage accounts, surfaces real-time signals on price, valuation, and momentum, and tracks configurable alerts and strategies against your positions and watchlists.

This repository distributes release binaries for macOS, Linux, and Windows. Download the latest from the [Releases](https://github.com/innerlightlabs-org/portfolio-analyst/releases) page — stable builds use tags like `v1.2.0`, beta builds are marked as pre-releases.

## Install via Homebrew

A Homebrew tap lives in this repo (under `Formula/`). Add the tap and install:

```bash
brew tap innerlightlabs-org/portfolio-analyst https://github.com/innerlightlabs-org/portfolio-analyst.git
brew install portfolio-analyst        # stable channel
brew install portfolio-analyst@beta   # opt-in beta channel
```

Then run `portfolio --help`. To upgrade after a new release lands, `brew update && brew upgrade portfolio-analyst`.

The formulas point at the prebuilt macOS arm64 and Linux x86_64 binaries published as release assets on this repo. Intel macs and Windows are not currently covered by the tap — download the binary from [Releases](https://github.com/innerlightlabs-org/portfolio-analyst/releases) directly for those.
