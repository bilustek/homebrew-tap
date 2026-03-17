class Gosecrets < Formula
  desc "Encrypted credentials management CLI tool"
  homepage "https://github.com/bilustek/gosecrets"
  url "https://github.com/bilustek/gosecrets/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "3e7a1d8ad0b48ca2b91ae3b6a9b8ca5d08e50fadfe28b1d431c4d0ec3a4eb579"
  license "MIT"

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
