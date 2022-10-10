local Inventory = exports.ox_inventory

RegisterCommand('getPosVec', function (source)
  local ped = GetPlayerPed(source)
  local pos = GetEntityCoords(ped)
  local heading = GetEntityHeading(ped)
  print(string.format('pos = vec3(%s, %s, %s), heading = %s', pos.x, pos.y, pos.z, heading))
end, false)

lib.callback.register('shop:getBalance', function (source)
  local Money = Inventory:Search(source, 'money')
  
end)