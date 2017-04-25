class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.4.tar.gz"
  sha256 "1c076d18e2b44d15b1537e849fa0b3c599638ec35f19a6bb7ac0b480e992be8d"
  def install
    puts #{prefix}
    system "ruby", "build.rb", "osec"
    system "ruby", "build.rb" "extractjre"
    mv "*.jar", "#{prefix}/"
    mv "*.jre", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
