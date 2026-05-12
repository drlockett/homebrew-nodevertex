class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.3"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/nvcli/latest/nv-darwin-arm64"
      sha256 "d73037e34934ff9fb7a267725744e8fad57170b2439acbca9bc2676483411ddd"
    else
      url "https://nodevertex.com/downloads/nvcli/latest/nv-darwin-x64"
      sha256 "914707794d8201b873acbd32b10f129eac122b0f49ab1948a3e31f30aee92c58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/nvcli/latest/nv-linux-arm64"
      sha256 "bae5dd4414188775bc9f692716da5b20f60a2bb04d71ebdacef6308b20c9a665"
    else
      url "https://nodevertex.com/downloads/nvcli/latest/nv-linux-x64"
      sha256 "0599fdd610bd98d053ec3c042b8f5e2e51b5dcb9b1503b1209e4e0e3c15f6ec5"
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
