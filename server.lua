local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('skr-karma-billing:submitFineWithId', function(fineType, asset, amountDue, targetId)
    local src = source
    local sender = QBCore.Functions.GetPlayer(src)
    local recipient = QBCore.Functions.GetPlayer(tonumber(targetId))

    if not recipient then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Player ID not found.'
        })
        return
    end

    local senderJob = sender.PlayerData.job.name
    local senderId = sender.PlayerData.citizenid
    local recipientId = recipient.PlayerData.citizenid

    local status = "unpaid"

    exports.oxmysql:insert('INSERT INTO bills (type, asset, amountDue, status, sender_id, sender_job, recipient_id) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        fineType,
        asset,
        amountDue,
        status,
        senderId,
        senderJob,
        recipientId
    }, function(insertId)
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'success',
            description = 'Fine issued successfully.'
        })
    end)
end)
