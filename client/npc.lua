local npcs = {}

AddEventHandler('onResourceStart', function(resourceName)
  if resourceName == GetCurrentResourceName() then
    StartNPCThread()
  end
end)

AddEventHandler('onResourceStop', function(resourceName)
  if resourceName == GetCurrentResourceName() then
    for i = 1, #npcs, 1 do
      local npc = npcs[i]
      if npc then
        DeletePed(npc)
      end
    end
  end
end)

StartNPCThread = function ()
  CreateThread(function ()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for i = 1, #Config.Shops, 1 do
          local Shop = Config.Shops[i]
          local distance = #(pos - Shop.ped.pos)
          if distance < 100 and not Shop.ped.spawned then
            local model = joaat(Shop.ped.model)
            while not HasModelLoaded(model) do
              RequestModel(model)
              Wait(0)
            end
          
            local retval, groundZ, normal = GetGroundZAndNormalFor_3dCoord(Shop.ped.pos.x, Shop.ped.pos.y, Shop.ped.pos.z)

            local npc = CreatePed(model, Shop.ped.pos.x, Shop.ped.pos.y, groundZ, Shop.ped.heading, false, true, true, true)
            Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
            FreezeEntityPosition(npc, true)
            SetEntityInvincible(npc, true)

            Shop.ped.spawned = true
            npcs[#npcs+1] = npc
          elseif distance > 100 and Shop.ped.spawned then
            if npcs[i] ~= nil then
              DeletePed(npcs[i])
              Shop.ped.spawned = false
              npcs[i] = nil
            end
          end
        end
      Wait(1000)
    end
  end)
end