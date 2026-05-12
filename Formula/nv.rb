class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.7"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.7/nv-darwin-arm64"
      sha256 "2e4aeef34ff65df0639e5a71232b2312c2d689273b0ed3a363ac9b7d0f434c8c"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.7/nv-darwin-x64"
      sha256 "55b53d09f58972c07fc18030dad58c67d526e39fc691af7a6aedaaaf407f19e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.7/nv-linux-arm64"
      sha256 "75b033167627a40d2fe0faf4229abc57022dd92e26cdf38633998fc65a2fbac7"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.7/nv-linux-x64"
      sha256 "fa95855c2e60544392de9cd1a630800458f64bd72c386809c46297339a1dee7b"
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
