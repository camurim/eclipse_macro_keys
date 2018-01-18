dev = lmc_get_devices()
for key,value in pairs(dev) do
  print(key..':')
  for key2,value2 in pairs(value) do print('  '..key2..' = '..value2) end
end
