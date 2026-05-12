class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.10"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-darwin-arm64"
      sha256 "7d268c45179bc2f6435b2b14bc21652218b27e3660c023e5fd94c7c55bb94587"
    else
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-darwin-x64"
      sha256 "0377f68784adcc2d0ef57c261b7e3eb6ff173c6b180e80e7aa8a21354a84f38e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-linux-arm64"
      sha256 "eb9c5a91d44ea91df23e683ac66e11e2830492c5e89c3cbf316b2d2177ca3126"
    else
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.10/nv-linux-x64"
      sha256 "2ac4e0069b92751675e7b03083ff8ca7f18e9010bb14e60b493bc1f1470717f4"
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
