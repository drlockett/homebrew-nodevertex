class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/nvcli/latest/nv-darwin-arm64"
      sha256 "b9cfdbcbffe89529193e26556a38e7e250945e56d74428c3b2f1e01786a32694"
    else
      url "https://nodevertex.com/downloads/nvcli/latest/nv-darwin-x64"
      sha256 "5879da43098bc52b89bcfaa3beddd184ceaa312c00c96a0099ae624d6b9ce72f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/nvcli/latest/nv-linux-arm64"
      sha256 "f19bf54e3728b10dd66fcd9ac96d4d77826a345a8d9bc7b6e67c39c249230835"
    else
      url "https://nodevertex.com/downloads/nvcli/latest/nv-linux-x64"
      sha256 "91da72b8af53a4eed6ba8f2b4359cb2ce8d0dea4f97688e3bc926ffccd46af6f"
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
