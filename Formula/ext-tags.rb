class ExtTags < Formula
  desc "Write and import foobar2000 external .tag files"
  homepage "https://github.com/daregod/ext-tags"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.1/ext-tags_0.12.1_darwin_arm64.tar.gz"
      sha256 "a7e660a867fe93c598464773f65f42191829ce7fce498c07e97085f6611f58c4"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.1/ext-tags_0.12.1_darwin_amd64.tar.gz"
      sha256 "11ff1e621a2f98cd058820ad95ddb918af4d2d2d7ac4757c4062d052ea93785e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.1/ext-tags_0.12.1_linux_arm64.tar.gz"
      sha256 "e02ef6c39026824f6aca014ae045fb6b901182feaecdd5a10c5bc4f8fec6e9cc"
    else
      url "https://github.com/daregod/ext-tags/releases/download/v0.12.1/ext-tags_0.12.1_linux_amd64.tar.gz"
      sha256 "e92e7e03a8e120f84524a14766ab442e95ee017230220db3b9f76492cf703a38"
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
