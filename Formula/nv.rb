class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.5"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.5/nv-darwin-arm64"
      sha256 "bda2f900d83f3a8975e48af06fc78d9d309d451103e8791b3effe127805c138c"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.5/nv-darwin-x64"
      sha256 "fbd515abc9b4dabc02055be28025bb8851b577c9ca896466cf1a455ef7d81453"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.5/nv-linux-arm64"
      sha256 "bbdf589227254b34a0d44417facddf01b331d117f896dc8c603c82a0464d8822"
    else
      url "https://nodevertex.com/downloads/r2/downloads/nvcli/0.1.5/nv-linux-x64"
      sha256 "7c1113f5c0b21e62f02af510bb2b94123311442978eddef666f15126e93c0c4b"
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
