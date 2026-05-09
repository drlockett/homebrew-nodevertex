class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.0/nv_darwin_arm64.tar.gz"
      sha256 "c3594c5d4a842e95d484b0c45318c6d3b09c5268623ab0de24e32042999cf215"
    else
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.0/nv_darwin_amd64.tar.gz"
      sha256 "eafc0b4b978f5c5aeca7f1fb06e4e0503b21735b8600822e6431957f7bec4b25"
    end
  end

  on_linux do
    url "https://github.com/drlockett/nvcli/releases/download/v0.1.0/nv_linux_amd64.tar.gz"
    sha256 "3c1fdf174c25e8841d659e532748eac687d69e670fd19de9595365fde726f393"
  end

  def install
    bin.install "nv"
  end

  def caveats
    <<~EOS
      Next:
        nv enroll
        nv create hello --value "Every workflow starts with a vertex."
        nv app expose http://localhost:8080 --name myapp --analytics

      Turn localhost into globalhost:
        nv app expose http://localhost:8181 --name dashboard --analytics
    EOS
  end

  test do
    system "#{bin}/nv", "help"
  end
end
