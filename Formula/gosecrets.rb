class Gosecrets < Formula
  desc "Encrypted credentials management CLI tool"
  homepage "https://github.com/bilustek/gosecrets"
  url "https://github.com/bilustek/gosecrets/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "2f74ad9525cde1b1981a80ba808e3fbb945faeb1603ab45e7910fd142bbf47f5"
  license "MIT"

  bottle do
    root_url "https://github.com/bilustek/homebrew-tap/releases/download/gosecrets-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "037bfc3a3e44ff448859ee9ad603336b46ea859c85a66c90d4a999440ffd45a1"
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
