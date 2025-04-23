local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('newfine', function()
    local playerData = QBCore.Functions.GetPlayerData()
    local job = playerData.job.name

    local allowedJobs = {
        police = true,
        ambulance = true,
        mechanic = true,
        bennys = true,
        towtruck = true
    }

    if not allowedJobs[job] then
        lib.notify({
            type = 'error',
            description = 'You are not authorized to send fines.'
        })
        return
    end

    local input = lib.inputDialog('Issue New Fine', {
        { type = 'input', label = 'Fine Type (e.g., "Speeding")', placeholder = 'fine', required = true },
        { type = 'input', label = 'Asset (e.g., plate, property)', placeholder = 'XYZ123 / Grove St', required = true },
        { type = 'input', label = 'Amount Due ($)', placeholder = 'e.g., 250', required = true },
        { type = 'input', label = 'Player ID (e.g., 3)', placeholder = '1', required = true }
    }, {
        buttons = {
            { label = 'Submit', value = 'submit', type = 'primary' },
            { label = 'Cancel', value = 'cancel', type = 'cancel' }
        }
    })

    if not input or input == 'cancel' then
        lib.notify({ type = 'info', description = 'Fine cancelled.' })
        return
    end

    local fineType, asset, amountDue, playerId = input[1], input[2], tonumber(input[3]), tonumber(input[4])
    if not playerId then
        lib.notify({ type = 'error', description = 'Invalid Player ID.' })
        return
    end

    TriggerServerEvent('skr-karma-billing:submitFineWithId', fineType, asset, amountDue, playerId)
end, false)
