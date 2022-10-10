local StorePrompt
function SetupShopPrompt()
    Citizen.CreateThread(function()
        local str = 'Open Shop'
        StorePrompt = PromptRegisterBegin()
        PromptSetControlAction(StorePrompt, 0xE8342FF2)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(StorePrompt, str)
        PromptSetEnabled(StorePrompt, false)
        PromptSetVisible(StorePrompt, false)
        PromptSetHoldMode(StorePrompt, true)
        PromptRegisterEnd(StorePrompt)
    end)
end

local promptSleep = 500
local active = false
Citizen.CreateThread(function ()
    SetupShopPrompt()
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for i = 1, #Config.Shops, 1 do
            local Shop = Config.Shops[i]
            local Pos = Shop.ped.pos
            local distance = #(pos - Pos)
            if distance < 2 then
                if not active then
                    PromptSetEnabled(StorePrompt, true)
                    PromptSetVisible(StorePrompt, true)
                    active = true
                end

                if PromptHasHoldModeCompleted(StorePrompt) then
                    _Utils.EnableNUI()
                    active = false
                end
                break
            else
                active = false
                PromptSetEnabled(StorePrompt, false)
                PromptSetVisible(StorePrompt, false)
                promptSleep = 500
            end
        end
        Wait(promptSleep)
    end
end)