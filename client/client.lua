RegisterNetEvent('ZyfiDEVCarwipe:notifyAll')
AddEventHandler('ZyfiDEVCarwipe:notifyAll', function(message)
    if Config.NotificationSystem == 'pNotify' then
        exports.pNotify:SendNotification({ text = message, type = "info", timeout = 3000 })
    else
        -- Additional notification options
        print(message)
    end
end)

RegisterNetEvent('ZyfiDEVCarwipe:removeEmptyVehicles')
AddEventHandler('ZyfiDEVCarwipe:removeEmptyVehicles', function()
    local vehicles = GetAllVehicles()
    for _, vehicle in ipairs(vehicles) do
        if not IsPedInVehicle(GetPedInVehicleSeat(vehicle, -1)) then
            DeleteEntity(vehicle)
        end
    end
end)
