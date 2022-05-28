QBCore = nil 
QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("pet_shepherd", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_shepherd")
end)

QBCore.Functions.CreateUseableItem("pet_cat", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_cat_01")
end)

QBCore.Functions.CreateUseableItem("pet_husky", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_husky")
end)

QBCore.Functions.CreateUseableItem("pet_chicken", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_hen")
end)

QBCore.Functions.CreateUseableItem("pet_pug", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_pug")
end)

QBCore.Functions.CreateUseableItem("pet_rabbit", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_rabbit_01")
end)

QBCore.Functions.CreateUseableItem("pet_poodle", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_poodle")
end)

QBCore.Functions.CreateUseableItem("pet_westy", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_westy")
end)

QBCore.Functions.CreateUseableItem("pet_retriever", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_retriever")
end)

QBCore.Functions.CreateUseableItem("pet_rottweiler", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_rottweiler")
end)

QBCore.Functions.CreateUseableItem("pet_mtlion", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_mtlion")
end)

QBCore.Functions.CreateUseableItem("pet_rat", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("mt-pets:client:ToggleCompanion", src, "a_c_rat")
end)

RegisterNetEvent('mt-pets:client:Pagar500Paus', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.RemoveMoney('bank', 500)
end)

RegisterNetEvent('mt-pets:client:Pagar50Paus', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.RemoveMoney('bank', 50)
end)

RegisterNetEvent('mt-pets:client:Pagar100Paus', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.RemoveMoney('bank', 100)
end)

RegisterNetEvent('mt-pets:client:Pagar1000Paus', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	Player.Functions.RemoveMoney('bank', 1000)
end)