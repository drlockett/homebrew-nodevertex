class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.6"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.6/nv-darwin-arm64"
      sha256 "4dfa4ec9af7c32007f73a2b4bde78d9f59747129a3a02e9028f81c0e3cff0731"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.6/nv-darwin-x64"
      sha256 "014a55351f0ebe271046a0994b35ed2e463946b939433aaa1b189e37f8742caf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.6/nv-linux-arm64"
      sha256 "6830133fb2904958b279cdb444a8c1c8a874b073e970678ff31bfee2de0ce3d4"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.6/nv-linux-x64"
      sha256 "9bef370dd77fd9f094a8549b49736cd16ea4cc9bb1c79a5b0444c77e62afe1cf"
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
