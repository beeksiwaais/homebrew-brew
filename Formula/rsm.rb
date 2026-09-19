class Rsm < Formula
  desc "Reference Standard M - Implementation of ANSI/MDC M X11.1-1995"
  homepage "https://gitlab.com/Reference-Standard-M/rsm"
  url "https://gitlab.com/Reference-Standard-M/rsm/-/archive/v1.83.1/rsm-v1.83.1.tar.gz"
  sha256 "8ca5c3376a38909f28cc5e64dcab7987f563ffaf767567ffd911e1c6c2399e2b" # Run: curl -sL <url> | shasum -a 256
  license "AGPL-3.0-or-later"
  
  head "https://gitlab.com/Reference-Standard-M/rsm.git", branch: "main"

  depends_on "make" => :build

  def install
    # Build the rsm executable
    system "make", "-j#{ENV.make_jobs}"
    
    # Install to Homebrew prefix
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    # Test that rsm runs and returns version info
    assert_match "Reference Standard M", shell_output("#{bin}/rsm -V 2>&1")
  end
end