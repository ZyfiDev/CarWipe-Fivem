local carWipeInProgress = false
local defaultLocale = 'nl'  -- Default locale; adjust based on server settings

RegisterCommand('carwipe', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getGroup() == Config.AdminRank or xPlayer.getGroup() == 'superadmin' then
        if carWipeInProgress then
            TriggerClientEvent(Config.NotificationSystem, source, "A car wipe is already in progress.")
            return
        end

        local totalSeconds = (Config.Minutes * 60) + Config.Seconds
        if totalSeconds > 300 then
            TriggerClientEvent(Config.NotificationSystem, source, "Wipe time cannot exceed 5 minutes.")
            return
        end

        carWipeInProgress = true
        TriggerClientEvent('ZyfiDEVCarwipe:notifyAll', -1, _U(defaultLocale, 'start', Config.Minutes, Config.Seconds))

        Citizen.Wait(totalSeconds * 1000)

        for i = 10, 1, -1 do
            Citizen.Wait(1000)
            TriggerClientEvent('ZyfiDEVCarwipe:notifyAll', -1, _U(defaultLocale, 'finalCountdown', i))
        end

        TriggerClientEvent('ZyfiDEVCarwipe:notifyAll', -1, _U(defaultLocale, 'complete'))
        TriggerClientEvent('ZyfiDEVCarwipe:removeEmptyVehicles', -1)
        carWipeInProgress = false
    else
        TriggerClientEvent(Config.NotificationSystem, source, "You don't have permission to use this command.")
    end
end)
