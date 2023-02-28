def url?(url)
  !!(url =~ /\Ahttps?:\/\/\S+.com\z/)
end

p url?('http://launchschool.com') == true
p url?('https://example.com') == true
p url?('https://example.com hello') == false
p url?('   https://example.com') == false
