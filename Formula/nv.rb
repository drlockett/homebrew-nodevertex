class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.9"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.9/nv-darwin-arm64"
      sha256 "ef7e35b07b4bf76bd53d177bfa50a4941d7c327e097dbffd882e2e85706e59ea"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.9/nv-darwin-x64"
      sha256 "8744dac0f4ad38cf6cfb612df66b7091e1ac5930325dd0f7799a649353fe1e01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.9/nv-linux-arm64"
      sha256 "e3a27cb2444b82f4270993bc72f53a37a6c49b23fe896cf59c7f51144e089720"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.9/nv-linux-x64"
      sha256 "5ef6e5ea4748383da7a986f1759fca8d1dbe7c800e83d3979db62c3a21b6c7b8"
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
