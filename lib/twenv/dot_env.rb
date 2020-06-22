module TWEnv::DotEnv
  extend self

  def read_dot_file(path)
    return [] unless File.exist? path
    File.read(path).each_line.map do |line|
      next unless line =~ /^[\w]+=[\w]+/
      line.split(/=/, 2)
    end.compact
  end

  def set_env(vars)
    vars.each do |(key, value)|
      ENV[key] = value.strip
    end
  end
end