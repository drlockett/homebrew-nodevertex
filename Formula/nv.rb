class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-darwin-arm64"
      sha256 "7f68ef14a97640c7549f9bf0ba9ceb0d5fbda41302fc7dbb6f19a78d7fdd5f66"
    else
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-darwin-x64"
      sha256 "fb20678c3aec914e6cfefa9c820db99508fbf0d70ce636c42774941349d3c6f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-linux-arm64"
      sha256 "d16e6a30c6347dbb6d2e973bcf2cc6fc1ecccb12fad97f84a67b56f8fc153dea"
    else
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-linux-x64"
      sha256 "e635f95d665cc2b9c0774f04953121a21f41ad586b299a3e9c13672b05b20832"
    end
  end

  def install
    bin.install cached_download => "nv"
  end

  def caveats
    <<~EOS
      Next:
        nv enroll

      Browser activation:
        nv enroll prints a code, opens https://login.nodevertex.com/activate,
        and waits until approval completes. New email identities must verify email
        before creating vertices.

      Finder/desktop sharing:
        nv install context

      If your shell cannot find nv after install, run:
        brew link nv
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nv --version")
  end
end
