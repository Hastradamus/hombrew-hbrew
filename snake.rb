class Snake < Formula
  desc "simple snake game. Written in pure java"
  homepage "http://silo.cs.indiana.edu:32903/snake/snakehome.html"
  url "http://silo.cs.indiana.edu:32903/snake/snake-1.0.3.tar.gz"
  sha256 "b25ec2013cb03ecebb0d6b4380b4e2ca2a55477e8ce9c7e0c4bcb3a4083d91e7"
  depends_on :java
  def install
      system("ruby build.rb compile jar")
    mv "snake.jar", "#{prefix}/"
    bin.install "snake"
  end
  test do
    system "java", "-jar", "#{prefix}/snake.jar", "--version"
  end
end
