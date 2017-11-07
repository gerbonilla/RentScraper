# get all flats
flats = Flat.all
rent_change = {}
rents = {}
flats.each do |f|
  rents["flat#{f.id}"] = []
  f.rents.each do |r|
    rents["flat#{f.id}"] << r.rent_cents.to_i
  end
end
# puts rents.first(10)

rents.each do |key, value|
  rent_change[key] = ((value.first.to_f - value.last.to_f) / value.first.to_f) * 100 unless value.first == 0
end

puts rent_change.sort_by {|_key, value| value}.to_h.first(20)


# flat53
# -98.18181818181819
# flat89
# -29.960750109027472
# flat3305
# -27.22117202268431
# flat3801
# -20.408163265306122
# flat2211
# -19.230769230769234
# flat48
# -18.75
# flat15
# -12.5
# flat912
# -8.620689655172415
# flat3045
# -8.0
# flat1872
# -7.147962830593281
# flat1056
# -6.666666666666667
# flat3496
# -5.690680531320109
# flat1939
# -5.128205128205128
# flat2559
# -2.4691358024691357
# flat324
# -2.0
# flat2543
# -2.0
# flat3581
# -0.516
# flat3777
# -0.4083758724867174
# flat3730
# -0.07764644983176602
# flat21
# 0.0
