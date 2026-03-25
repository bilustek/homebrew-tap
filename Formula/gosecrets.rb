class Gosecrets < Formula
  desc "Encrypted credentials management CLI tool"
  homepage "https://github.com/bilustek/gosecrets"
  url "https://github.com/bilustek/gosecrets/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "2f74ad9525cde1b1981a80ba808e3fbb945faeb1603ab45e7910fd142bbf47f5"
  license "MIT"

  bottle do
    root_url "https://github.com/bilustek/homebrew-tap/releases/download/gosecrets-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "13e547fe8604b15bac5efbddc946db0e3147ab004bda30012a4d2b47d96808ec"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/gosecrets"
    generate_completions_from_executable(
      bin/"gosecrets",
      "completion",
      shells: [:bash],
    )
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gosecrets version").strip
    assert_match "_gosecrets", shell_output("#{bin}/gosecrets completion bash")
  end
end
