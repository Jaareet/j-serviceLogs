if (GetResourceState('es_extended'):match('start')) then
    local ESX = exports.es_extended.getSharedObject()
    local JOB_LOGS = {
        ['police'] = {
            webhook = 'https://discord.com/api/webhooks/...', -- Here your webhook link
            color = 16711680,
            title = 'Fichajes de la policía',
            message = 'El usuario %s ha fichado su %s', -- Recomended message format.
        },
        ['ambulance'] = {
            webhook = 'https://discord.com/api/webhooks/...', -- Here your webhook link
            color = 16711680,
            title = 'Fichajes de los EMS',
            message = 'El usuario %s ha fichado su %s', -- Recomended message format.
        },
        -- You can add more jobs here
        --[[
            ['jobName'] = {
                webhook = 'Here your webhook link',
                color = Color_Code,
                title = 'Example title',
                message = 'El usuario %s ha fichado su %s' -- Recomended message format.
            },
        ]]
    }
    local ARGS_OPTIONS = {
        ['entrada'] = true,
        ['salida'] = true,
    }
    RegisterCommand('fichar', function(source, args, raw)
        local src = tonumber(source)
        local xPlayer = ESX.GetPlayerFromId(src)
        if (JOB_LOGS[xPlayer.getJob().name]) then
            local jobLogs = JOB_LOGS[xPlayer.getJob().name]
            if (args[1] ~= nil) then
                if (ARGS_OPTIONS[args[1]]) then
                    local message = jobLogs.message:format(GetPlayerName(xPlayer.source), args[1])
                    PerformHttpRequest(jobLogs.webhook, function(err, text, headers) end, 'POST', json.encode({
                        username = xPlayer.getName(),
                        embeds = {
                            {
                                color = jobLogs.color,
                                title = jobLogs.title,
                                description = message
                            }
                        }
                    }), { ['Content-Type'] = 'application/json' })
                    xPlayer.showNotification('Has fichado tu ' .. args[1], 'success')
                else
                    xPlayer.showNotification('Argumento no válido', 'error')
                end
            else
                xPlayer.showNotification('Debes de enviar un argumento', 'error')
            end
        else
            xPlayer.showNotification('No hay fichajes para tu trabajo', 'error')
        end
    end)
    TriggerClientEvent('chat:addSuggestion', -1, '/fichar', 'Fichar tu entrada o salida', {
        {
            name = 'opcion',
            help = '[entrada] - [salida]'
        }
    })
    print('^2[j-serviceLogs]^7 Script cargado correctamente.')
else
    print('^1[ERROR]^7 Debes de tener el es_extended starteado.')
end