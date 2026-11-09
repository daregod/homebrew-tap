class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.0/ext-tags_0.15.0_darwin_arm64.tar.gz"
      sha256 "e4daf3a2bb4d3614e0f339f90a664eba9044c582165a71f2b6843dcf0b67b955"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.0/ext-tags_0.15.0_darwin_amd64.tar.gz"
      sha256 "27fb9a42c04f53af9fb09b7c9155717d7dbc60386a4c498d6eeac1fb891cff54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.0/ext-tags_0.15.0_linux_arm64.tar.gz"
      sha256 "fe1eb332cff1bd64eb81b5b6e185a04b87c00f54ad87e6e29feb5959223cc3b4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.15.0/ext-tags_0.15.0_linux_amd64.tar.gz"
      sha256 "dc0dba9e78cc39d8d7f4ef61fd761efdc20987931c0e94597514503955daa404"
    end
  end

  def install
    binary = Dir["ext-tags_*"].first
    odie "ext-tags binary not found" if binary.nil?
    bin.install binary => "ext-tags"
  end

  test do
    assert_match "ext-tags", shell_output("#{bin}/ext-tags version")
  end
end
