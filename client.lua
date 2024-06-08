RegisterCommand('unos', function()
    TriggerEvent('noname:callpolice')
end)

RegisterNetEvent("noname:callpolice")
AddEventHandler("noname:callpolice", function()
 if Config.Alert == 'ox' then
        lib.notify({
            title = "",
            description = msg,
            type = typenotif  
        })
    elseif Config.Alert == 'okok' then
        exports['okokNotify']:Alert("", msg, 5000, typenotif)
    elseif Config.Alert == 'quasar' then
        TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = Config.PoliceJobName,
            callLocation = vector3(0,0,0),
            callCode = Config.Dispatch.title,
            message = Config.Dispatch.text,
            flashes = false, -- you can set to true if you need call flashing sirens..
            --you can use the getSSURL export to get this url
            otherData = {
        -- optional if you dont need this you can remove it and remember remove the `,` after blip end and this block
               {
                   text = 'Red Obscure', -- text of the other data item (can add more than one)
                   icon = 'fas fa-user-secret', -- icon font awesome https://fontawesome.com/icons/
               }
             }
        })
    elseif Config.Alert == 'cd_dispatch' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', }, 
            coords = data.coords,
            title = Config.Dispatch.title,
            message = Config.Dispatch.text,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = Config.Dispatch.title,
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Alert == 'esx' then 
        ESX.ShowNotification(msg)
    end
end)