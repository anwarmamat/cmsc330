sum_a = sum_b = sum_c = 0

while line = DATA.gets
  line.scan(/(\d+)\s+(\d+)\s+(\d+)/) { |a,b,c|
    sum_a += a.to_i
    sum_b += b.to_i
    sum_c += c.to_i
  }
end
printf("Total: %d %d %d\n", sum_a, sum_b, sum_c)

__END__

12 34 23
19 77 87
11 98 3
2 45 0
