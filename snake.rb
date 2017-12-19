# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class HomebrewHbrew < Formula
  desc "A simple snake game written in pure Java"
  homepage "http://pages.iu.edu/~hasahmed/snake/"
  url "https://github.com/hasahmed/homebrew-hbrew/releases/download/2.0.0/simplesnake.tar.gz"
  sha256 "9886f049310dbcd6516b3bda081a082b7c86880251972f32a6b190bd3384257b"
  def install
    mv "Simple Snake.app", "/Applications"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test homebrew-hbrew`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
