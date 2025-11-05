class Xctree < Formula
  desc "Swift tool to extract iOS Simulator accessibility trees from command line"
  homepage "https://github.com/ldomaradzki/xctree"
  url "https://github.com/ldomaradzki/xctree/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "332ab5c42b863d3c92f2c82d0e79ad06fb71c419d405b8feba81d35f39083027"
  license "MIT"
  head "https://github.com/ldomaradzki/xctree.git", branch: "master"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xctree"
  end

  test do
    # Test version flag
    assert_match "0.1.0", shell_output("#{bin}/xctree --version")

    # Test help flag
    assert_match "iOS Simulator accessibility tree", shell_output("#{bin}/xctree --help")
  end
end
