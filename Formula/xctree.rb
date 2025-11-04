class Xctree < Formula
  desc "Extract iOS Simulator accessibility trees from command line"
  homepage "https://github.com/ldomaradzki/xctree"
  head "https://github.com/ldomaradzki/xctree.git", branch: "main"

  # For local development/testing, use head installation:
  # brew install --HEAD homebrew-xctree/Formula/xctree.rb

  # When ready for first release (v0.1.0):
  # 1. Tag the repo: git tag -a v0.1.0 -m "Initial release"
  # 2. Push tag: git push origin v0.1.0
  # 3. Create tarball: git archive --format=tar.gz --prefix=xctree-0.1.0/ v0.1.0 > xctree-0.1.0.tar.gz
  # 4. Calculate SHA256: shasum -a 256 xctree-0.1.0.tar.gz
  # 5. Upload to GitHub releases
  # 6. Uncomment and update these lines:
  # url "https://github.com/ldomaradzki/xctree/archive/refs/tags/v0.1.0.tar.gz"
  # sha256 "REPLACE_WITH_ACTUAL_SHA256"
  # version "0.1.0"

  depends_on xcode: ["14.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xctree"
  end

  test do
    # Test basic help command works
    assert_match "xctree - iOS Simulator Accessibility Tree Inspector", shell_output("#{bin}/xctree --help")

    # Test invalid option produces error
    assert_match "Unknown option", shell_output("#{bin}/xctree --invalid 2>&1", 1)
  end
end
