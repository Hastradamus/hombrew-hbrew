cask 'simple-snake' do
  version "2.0.0"
  sha256 "9886f049310dbcd6516b3bda081a082b7c86880251972f32a6b190bd3384257b"

  # https://github.com/hasahmed/ was verified as official when first introduced to the cask
  url "https://github.com/hasahmed/homebrew-hbrew/releases/download/2.0.0/simplesnake.tar.gz"
  name 'Simple Snake'
  homepage "http://pages.iu.edu/~hasahmed/snake/"
  app 'Simple Snake.app'
end
