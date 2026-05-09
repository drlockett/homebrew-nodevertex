class Nv < Formula
  desc "Node Vertex CLI - turn values, files, apps, and workflows into vertices"
  homepage "https://nodevertex.com"
  version "0.1.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.0/nv_darwin_arm64.tar.gz"
      sha256 "b619e0545fea36f76229e0622e3d00d879bbc73a7103339820fad2226500d29a"
    else
      url "https://github.com/drlockett/nvcli/releases/download/v0.1.0/nv_darwin_amd64.tar.gz"
      sha256 "dee607a9e023f8217ac58b96ee6c215555eff6ce7810e10b65d972414da06d63"
    end
  end

  on_linux do
    url "https://github.com/drlockett/nvcli/releases/download/v0.1.0/nv_linux_amd64.tar.gz"
    sha256 "72efcc11288f66e4033451bd4476232f9ad7de44432c9434551a01da6ccb854b"
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
