url = 'http://www.autoopt.ru/auto/catalog/moto/zongshen/zongshen_zs50qt-4/'
grep_pattern = 'zongshen/zongshen_zs50qt-4'
encode_to = 'UTF-8'
regex = /href="(?<href>.*)".+".+">(?<title>.*)<\/a>/

commands = [
  "curl '#{url}'",
  "enca -cx #{encode_to}",
  "grep '#{grep_pattern}'",
  "tr '\n' ' '",
  "tr '\t' ' '",
  "tr -s ' '"
]

#res = %x( curl '#{url}' | enca -cx #{encode_to} | grep '#{grep_pattern}' | tr '\n' ' ' )
query  = commands.join(' | ')
res = `#{query}`
res = res.split('> <').map do |line|
  t_res = regex.match(line)
  if t_res
    {href: t_res[:href], title: t_res[:title]}
  else
    nil
  end
end
res = res.compact

puts res

#puts "query: #{query}"
