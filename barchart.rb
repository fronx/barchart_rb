#! /usr/bin/env ruby
#
# INPUT FORMAT:
#   <graph-name>.<key> <value>
# OR:
#   <key> <value>

Row = Struct.new(:ns, :key, :value)

rows = STDIN.map do |row|
  key, value = row.split(' ')
  ns, key = key.split('.')[0], key.split('.')[1..-1].join('.')
  ns, key = nil, ns if !key
  Row.new(ns, key, value.to_i)
end

rows.group_by { |r| r.ns }.each do |ns, rows|
  max_value = rows.map(&:value).max
  max_length = [rows.map { |r| r.key.length }.max, 50].min
  value_characters = 80 - max_length
  scale = [(max_value.to_f / value_characters).ceil, 1].max

  ns && puts("# #{ns}")
  (scale > 1) && puts("# each * represents a count of %d" % scale)

  format = "%-#{max_length}s [%#{max_value.to_s.length}d] %s"
  rows.each do |row|
    puts format % [ row.key, row.value, "*" * (row.value / scale) ]
  end
  puts
end
