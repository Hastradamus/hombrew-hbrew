class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.3.tar.gz"
  sha256 "36c94acd19bf8bcfb0301e9fd9459f61a36b6213679dbe6bd103fc6816aff3b8"
  depends_on :java
  def install
      system "ruby", "build.rb", "compile", "jar"
    mv "*.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
