class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.4.tar.gz"
  sha256 "36975993c623affd26fd4f3c107de44ac1f2177ab577a1392be83bcfc2e2f762"
  def install
    puts #{prefix}
    system "ruby", "build.rb", "osec"
    system "ruby", "extractjre"
    mv "*.jar", "#{prefix}/"
    mv "*.jre", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
