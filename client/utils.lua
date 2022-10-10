_Utils = {}

RegisterCommand('shopNUI', function()
    _Utils.EnableNUI()
end, false)

_Utils.EnableNUI = function ()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'enable'
    })
end