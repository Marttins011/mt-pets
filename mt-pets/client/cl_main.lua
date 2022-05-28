local QBCore = nil 
local QBCore = exports['qb-core']:GetCoreObject()

-- code
local isLoggedIn = false
local animalSpawned = false
local companion = nil
local spawnDistanceRadius = 1.0

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
	animalSpawned = false
    companion = nil
end)

AddEventHandler('onClientResourceStart', function ()
	animalSpawned = false
    companion = nil
end)

RegisterNetEvent('mt-pets:client:ToggleCompanion')
AddEventHandler('mt-pets:client:ToggleCompanion', function(model)
    if companion == nil or #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(companion)) < 2.0 then
        TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 0, true)
        local progressBarMessage = "Picking Up Companion.."
        if not animalSpawned then
            progressBarMessage = "Placing Companion.."
        end
        QBCore.Functions.Progressbar("toggle_companion", progressBarMessage, 2000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            if not animalSpawned then
                -- spawn animal
                spawnAnimal(model)
                animalSpawned = true
            else
                --delete animal
                deleteAnimal()
                animalSpawned = false
            end
            ClearPedTasks(PlayerPedId())
        end, function() -- Cancel
            ClearPedTasks(PlayerPedId())
        end)
    else
        QBCore.Functions.Notify("Companion is too far..", "error")
    end
end)    

function spawnAnimal(modelName)
    print("spawn companion")
    local hash = GetHashKey(modelName)

    local coords = GetEntityCoords(PlayerPedId())
    local spawnX = math.random(-spawnDistanceRadius,spawnDistanceRadius)
	local spawnY = math.random(-spawnDistanceRadius,spawnDistanceRadius)
	local spawnLoc = vector3(coords.x + spawnX, coords.y + spawnY, coords.z -1.0)
    
	RequestModel(modelName)
	while not HasModelLoaded(modelName) do
		Citizen.Wait(10)				
	end

	companion = CreatePed(28, hash, spawnLoc, true, true, true)
    QBCore.Functions.Notify('[E] - Pet Actions Menu', 'primary', 7500)
    SetModelAsNoLongerNeeded(modelName)
    Citizen.CreateThread(function()
        while companion ~= nil do
            Citizen.Wait(3)
            if IsControlJustPressed(0,38) then
                TriggerEvent('mt-pets:client:MenuAcoesPets')
            end
        end
    end)
end

function deleteAnimal()
    DeleteEntity(companion)
    companion = nil
    print("despawn companion")
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('mt-pets:client:MenuAcoesPets', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pet Actions",
            isMenuHeader = true,
        },
        {
            header = "❌​",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "🐕‍🦺 Call Pet",
            txt = "",
            params = {
                event = "mt-pets:client:ChamarPet",
            }
        },
        {
            header = "🐕‍🦺 Sit Pet",
            txt = "",
            params = {
                event = "mt-pets:client:SentarPet",
            }
        },
        {
            header = "🐕‍🦺 Up Pet",
            txt = "",
            params = {
                event = "mt-pets:client:LevantarPet",
            }
        },
        {
            header = "🐕‍🦺 Sleep Donw Pet",
            txt = "",
            params = {
                event = "mt-pets:client:DeitarPet",
            }
        },
    })
end)

RegisterNetEvent('mt-pets:client:ChamarPet', function()
    ChamarPet()
end)

RegisterNetEvent('mt-pets:client:SentarPet', function()
    SentarPet()
end)

RegisterNetEvent('mt-pets:client:DeitarPet', function()
    DeitarPet()
end)


RegisterNetEvent('mt-pets:client:LevantarPet', function()
    LevantarPet()
end)

function SentarPet()
    local animDict = "amb@lo_res_idles@"
    local animName = "creatures_world_pug_sitting_lo_res_base" 

    TriggerEvent('animations:client:EmoteCommandStart', {"point"})
    Wait(500)
    TaskPlayAnim(companion, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0) 
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end

function DeitarPet()
    local animDict = "amb@lo_res_idles@"
    local animName = "creatures_world_cat_ground_sleep_lo_res_base" 

    TriggerEvent('animations:client:EmoteCommandStart', {"point"})
    Wait(500)
    TaskPlayAnim(companion, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0) 
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end

function ChamarPet()
    TriggerEvent('animations:client:EmoteCommandStart', {"whistle2"})
    TaskGoToEntity(companion, PlayerPedId(), -1, 1.0, 10.0, 1073741824.0, 0)
    SetPedKeepTask(companion, true)
end

function LevantarPet()
    TriggerEvent('animations:client:EmoteCommandStart', {"point"})
    Wait(500)
    ClearPedTasks(companion)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end

RegisterNetEvent('mt-pets:client:MenuLoja', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pet shop",
            isMenuHeader = true,
        },
        {
            header = "❌​",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "🐕‍🦺 Buy Pets",
            txt = "",
            params = {
                event = "mt-pets:client:MenuPets",
            }
        },
        {
            header = "🐕‍🦺 Buy Pet Acessories",
            txt = "",
            params = {
                event = "mt-pets:client:MenuAcessorios",
            }
        },
        {
            header = "🐕‍🦺 Buy Pet Foods",
            txt = "",
            params = {
                event = "mt-pets:client:MenuComidas",
            }
        },
    })
end)

RegisterNetEvent('mt-pets:client:MenuPets', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pet shop - Pets",
            isMenuHeader = true,
        },
        {
            header = "​🔙​",
            txt = "",
            params = {
                event = "mt-pets:client:MenuLoja",
            }
        },
        {
            header = "🐕‍🦺 Shepherd",
            txt = "500$",
            params = {
                event = "mt-pets:client:ComprarPastor",
            }
        },
        {
            header = "🐈​ Cat",
            txt = "100$",
            params = {
                event = "mt-pets:client:ComprarGato",
            }
        },
        {
            header = "🐕‍🦺 Husky",
            txt = "1000$",
            params = {
                event = "mt-pets:client:ComprarHusky",
            }
        },
        {
            header = "🐓​ Chicken",
            txt = "50$",
            params = {
                event = "mt-pets:client:ComprarGalo",
            }
        },
        {
            header = "🐕‍🦺 Pug",
            txt = "1000$",
            params = {
                event = "mt-pets:client:ComprarPug",
            }
        },
        {
            header = "🐇​ Rabbit",
            txt = "50$",
            params = {
                event = "mt-pets:client:ComprarCoelho",
            }
        },
        {
            header = "🐕‍🦺 Poodle",
            txt = "1000$",
            params = {
                event = "mt-pets:client:ComprarPoodle",
            }
        },
        {
            header = "🐕‍🦺 Westy",
            txt = "500$",
            params = {
                event = "mt-pets:client:ComprarWesty",
            }
        },
        {
            header = "🐕‍🦺 Retriever",
            txt = "500$",
            params = {
                event = "mt-pets:client:ComprarRetriever",
            }
        },
        {
            header = "🐕‍🦺 Rottweiler",
            txt = "500$",
            params = {
                event = "mt-pets:client:ComprarRottweiler",
            }
        },
        {
            header = "🦁​ Lion",
            txt = "1000$",
            params = {
                event = "mt-pets:client:ComprarLeao",
            }
        },
        {
            header = "🐁 Rat",
            txt = "50$",
            params = {
                event = "mt-pets:client:ComprarRato",
            }
        },
    })
end)

RegisterNetEvent('mt-pets:client:MenuAcessorios', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pet shop - Acessories",
            isMenuHeader = true,
        },
        {
            header = "​🔙​",
            txt = "",
            params = {
                event = "mt-pets:client:MenuLoja",
            }
        },
        {
            header = "⚾​ Ball",
            txt = "50$",
            params = {
                event = "mt-pets:client:ComprarBola",
            }
        },
    })
end)

RegisterNetEvent('mt-pets:client:MenuComidas', function()
    exports['qb-menu']:openMenu({
        {
            header = "Pet shop - Foods",
            isMenuHeader = true,
        },
        {
            header = "​🔙​",
            txt = "",
            params = {
                event = "mt-pets:client:MenuLoja",
            }
        },
        {
            header = "🥫​ Pet feed",
            txt = "50$",
            params = {
                event = "mt-pets:client:ComprarComida",
            }
        },
        {
            header = "🚱​​ Pet Water",
            txt = "Free",
            params = {
                event = "mt-pets:client:ComprarAgua",
            }
        },
    })
end)

RegisterNetEvent('mt-pets:client:ComprarPastor', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_shepherd", 1)
        TriggerServerEvent('mt-pets:client:Pagar500Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarGato', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_cat", 1)
        TriggerServerEvent('mt-pets:client:Pagar100Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarHusky', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_husky", 1)
        TriggerServerEvent('mt-pets:client:Pagar1000Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarGalo', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_chicken", 1)
        TriggerServerEvent('mt-pets:client:Pagar50Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarPug', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_pug", 1)
        TriggerServerEvent('mt-pets:client:Pagar1000Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarCoelho', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_rabbit", 1)
        TriggerServerEvent('mt-pets:client:Pagar50Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarPoodle', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_poodle", 1)
        TriggerServerEvent('mt-pets:client:Pagar1000Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarWesty', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_westy", 1)
        TriggerServerEvent('mt-pets:client:Pagar500Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarRetriever', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_retriever", 1)
        TriggerServerEvent('mt-pets:client:Pagar500Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarLeao', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_mtlion", 1)
        TriggerServerEvent('mt-pets:client:Pagar1000Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarRato', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "pet_rat", 1)
        TriggerServerEvent('mt-pets:client:Pagar50Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarBola', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "weapon_ball", 1)
        TriggerServerEvent('mt-pets:client:Pagar50Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarComida', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'PAYING TO EMPLOYEE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "comida_animais", 1)
        TriggerServerEvent('mt-pets:client:Pagar50Paus')
    end)
end)

RegisterNetEvent('mt-pets:client:ComprarAgua', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pay_employee', 'RECIVING WATER...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('QBCore:Server:AddItem', "agua_animais", 1)
    end)
end)

RegisterNetEvent('mt-pets:client:AlimentarPet', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'FEEDING PET...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('QBCore:Server:RemoveItem', "comida_animais", 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end)
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(562.74, 2749.92, 42.88)
	SetBlipSprite(blip, 88)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, 37) -- Mudar cor aqui!
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName("Fishing Buyer")
    EndTextCommandSetBlipName(blip)
end)