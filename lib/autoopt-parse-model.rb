#url = 'http://www.autoopt.ru/auto/catalog/moto/zongshen/zongshen_zs50qt-4/'
#url = 'http://www.autoopt.ru/map.php'
url = 'http://www.autoopt.ru/auto/catalog/moto/jianshe/js400-atv-2/64/'
#grep_pattern = 'zongshen/zongshen_zs50qt-4'
# grep_pattern = 'auto/catalog'
grep_pattern = '/inc/additional_info'
encode_to = 'UTF-8'
regex = /href="(?<href>[\S]+)".*>(?<title>.*)<\/a/

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

res = res.split('> <')
p res
res = res.map do |line|
  t_res = regex.match(line)
  if t_res
    {href: t_res[:href], title: t_res[:title]}
  else
    nil
  end
end
res = res.compact

puts res

puts "query: #{query}"
