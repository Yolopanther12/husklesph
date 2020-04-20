-- This file is what controls what models are banned and the save/loading of the
-- banned models file. Models that are banned cannot be chosen as a disguise.

-- GM.BannedModels is used as a hash table where the key is the model string and the value is true.
GM.BannedModels = {}

util.AddNetworkString("ph_bannedmodels_getall")
util.AddNetworkString("ph_bannedmodels_add")
util.AddNetworkString("ph_bannedmodels_remove")

local function initBannedModels()
	if !file.Exists("husklesph/", "DATA") then
		file.CreateDir("husklesph")
	end

	if !file.Exists("husklesph/bannedmodels.txt", "DATA") then
		file.Write("husklesph/bannedmodels.txt", "\r\n")
	end

	local bannedModels = file.Read("husklesph/bannedmodels.txt", "DATA")
	for match in bannedModels:gmatch("[^\r\n]+") do
		GM.BannedModels[match] = true
	end
end
initBannedModels()


function GM:IsModelBanned(model)
	return self.BannedModels[model] == true
end

local function saveBannedModels()
	local txt = ""
	for key in pairs(GAMEMODE.BannedModels) do
		txt = txt .. key .. "\r\n"
	end

	file.Write("husklesph/bannedmodels.txt", txt)
end

net.Receive("ph_bannedmodels_getall", function(len, ply)
	print("Receive net message to sync all banned models from: " .. ply:Nick())

	net.Start("ph_bannedmodels_getall")

	for key in pairs(GAMEMODE.BannedModels) do
		net.WriteString(key)
	end

	net.WriteString("")
	net.Send(ply)
end)

net.Receive("ph_bannedmodels_add", function(len, ply)
	if !ply:IsAdmin() then return end

	local model = net.ReadString()
	if model == "" then return end
	if GAMEMODE:IsModelBanned(model) then return end

	GAMEMODE.BannedModels[model] = true
	saveBannedModels()

	net.Start("ph_bannedmodels_add")
	net.WriteString(model)
	net.Broadcast()
end)

net.Receive("ph_bannedmodels_remove", function(len, ply)
	if !ply:IsAdmin() then return end

	local model = net.ReadString()
	if model == "" then return end
	if !GAMEMODE:IsModelBanned(model) then return end

	GAMEMODE.BannedModels[model] = nil
	saveBannedModels()

	net.Start("ph_bannedmodels_remove")
	net.WriteString(model)
	net.Broadcast()
end)
