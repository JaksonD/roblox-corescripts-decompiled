local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local EngineFeature = game:GetEngineFeature("UseTeleportedPlacesBackHistory2")
local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local Cryo = require(Parent.Cryo)
local Signals = require(Parent.Signals)
local Flags = require(script.Parent.Flags)
local FFlagUseLocalTraversalHistory = Flags.FFlagUseLocalTraversalHistory
local FFlagUseTeleportTraversalHistory = Flags.FFlagUseTeleportTraversalHistory
local t1 = {}

t1.__index = t1

function t1.new(s1: string?) -- line: 51
	-- upvalues: Signals (copy), t1 (copy), MemStorageService (copy), HttpService (copy)
	local t2 = {
		_connections = {},
		_historyKey = "",
		_history = {}
	}
	local v17, v18 = Signals.createSignal({})

	t2._historySignal = v17
	t2._setHistorySignal = v18

	if s1 == nil or s1 == "" then
		return (setmetatable(t2, t1))
	end

	local function initLocalHistory() -- line: 62
		-- upvalues: t2 (copy), s1 (copy), MemStorageService (copy), HttpService (copy)
		t2._historyKey = "TraversalHistory" .. s1

		local Item = MemStorageService:GetItem(t2._historyKey)

		if Item and Item ~= "" then
			local data = HttpService:JSONDecode(Item)

			if typeof(data) == "table" then
				t2._history = data
			end
		end

		table.insert(t2._history, 1, {
			universeId = tostring(game.GameId),
			placeId = tostring(game.PlaceId)
		})
		MemStorageService:SetItem(t2._historyKey, HttpService:JSONEncode(t2._history))
		t2._setHistorySignal(t2._history)
	end

	table.insert(t2._connections, game.Loaded:Connect(function() -- line: 82
		-- upvalues: initLocalHistory (copy)
		initLocalHistory()
	end))

	return (setmetatable(t2, t1))
end
function t1.addHistoryEntry(t3: {[any]: any}, t4: {[any]: any}) -- line: 90
	table.insert(t3._history, 1, t4)
	t3._setHistorySignal(t3._history)
end
function t1.addHistoryEntries(t5: {[any]: any}, t6: {[any]: any}) -- line: 95
	-- upvalues: Cryo (copy)
	t5._history = Cryo.List.join(t6, t5._history)
	t5._setHistorySignal(t5._history)
end
function t1.getHistory(t7: {[any]: any}, n1: number?) -- line: 112
	local _history = t7._history

	if n1 == nil then
		return _history
	end

	local t8 = {}

	for i = 1, n1 do
		table.insert(t8, _history[i])
	end

	return t8
end
function t1.getUniverseHistorySignal(t9: {[any]: any}, n2: number?) -- line: 115
	-- upvalues: Signals (copy)
	return Signals.createComputed(function(p1) -- line: 116
		-- upvalues: t9 (copy), n2 (copy)
		local v55 = t9._historySignal(p1)
		local v56 = n2

		if v56 == nil then
		else
			local t10 = {}

			for i = 1, v56 do
				table.insert(t10, v55[i])
			end

			v55 = t10
		end

		local t11 = {}

		for _, v61 in v55 do
			table.insert(t11, v61.universeId)
		end

		return t11
	end)
end
function t1.getUniverseHistory(t12: {[any]: any}, n3: number?) -- line: 127
	-- upvalues: FFlagUseTeleportTraversalHistory (copy), EngineFeature (copy), TeleportService (copy), Cryo (copy)
	local t13 = {}

	if FFlagUseTeleportTraversalHistory and EngineFeature then
		local v38 = TeleportService:TeleportedUniversesBackHistory()
		local v39 = Cryo.List.map(v38, tostring)

		if n3 == nil then
			return v39
		end

		local t14 = {}

		for i = 1, n3 do
			table.insert(t14, v39[i])
		end

		return t14
	end

	local _history = t12._history

	if n3 == nil then
	else
		local t15 = {}

		for i = 1, n3 do
			table.insert(t15, _history[i])
		end

		_history = t15
	end

	for _, v46 in _history do
		table.insert(t13, v46.universeId)
	end

	return t13
end
function t1.writeHistory(p2) -- line: 143
	-- upvalues: MemStorageService (copy), HttpService (copy)
	MemStorageService:SetItem(p2._historyKey, HttpService:JSONEncode(p2._history))
end
function t1.disconnect(p3) -- line: 147
	for _, v50 in p3._connections do
		v50:Disconnect()
	end

	p3._connections = {}
end

if FFlagUseLocalTraversalHistory or FFlagUseTeleportTraversalHistory then
	local new = t1.new
	local v14 = Players.LocalPlayer and Players.LocalPlayer.UserId or nil

	t1.default = new(if v14 ~= nil and not (v14 <= 0) then tostring(v14) else "Local")

	return t1
end

t1.default = t1.new("")

return t1
