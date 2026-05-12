class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/nvcli/latest/nv-darwin-arm64"
      sha256 "539e48a30e38e1aeee099c97d24137b0d62211f94bf49215a976ecb952bf1fa6"
    else
      url "https://nodevertex.com/downloads/nvcli/latest/nv-darwin-x64"
      sha256 "5222a25e0967a6a9b05d727943a44be4f03b427fa0276803e3f4644e68873962"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/nvcli/latest/nv-linux-arm64"
      sha256 "3e8245ed9fcb65500dea72b874f881e125e824bb8395ce981c2e30f09a60318e"
    else
      url "https://nodevertex.com/downloads/nvcli/latest/nv-linux-x64"
      sha256 "a48d83bd882e502de3c102043890657b522ac8636dbd5a9831d6e733b806a22a"
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

      If your shell cannot find nv after install, run:
        brew link nv
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nv --version")
  end
end
