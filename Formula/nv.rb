class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.8"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.8/nv-darwin-arm64"
      sha256 "8ae19cd6a0e2c0a43be7355896518302390fc1da17e6b7b148d463bb640fa895"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.8/nv-darwin-x64"
      sha256 "9cd8031b1dc3ab5b77e7be3125ff6068d017c301ea5fa9ecd03713d54ea06752"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.8/nv-linux-arm64"
      sha256 "6d0aa870492ec35289645c79651595d9ff12f98156261fd253f031f81de06fb4"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.8/nv-linux-x64"
      sha256 "3a3ed78bacb07436e7c596da6ceff3dfbd4d1d27eb8fc3fbe7ffc92bba646541"
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
