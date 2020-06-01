class TwEnv::WriteTweet < TwEnv::Command
  match 'write-tweet'
  description "Write a tweet"

  def process
    unless ENV['EDITOR']
      raise Pry::CommandError, "Aborting because $EDITOR was not set."
    end
    file = Tempfile.new('twenv')
    system ENV['EDITOR'], file.path
    twitter_client.update(file.read)
  ensure
    file.unlink
    file.close
  end
end
