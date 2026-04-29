local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("SignalsUtils").Parent
local Signals = require(Parent.Signals)
local v4 = setmetatable({}, {
	__mode = "v"
})
local u5 = nil

local function onHeartbeat() -- line: 25
	-- upvalues: v4 (copy), u5 (ref)
	if next(v4) == nil and u5 then
		u5:Disconnect()
		u5 = nil
	end

	if not u5 then
		return
	end

	local elapsed = os.clock()

	for v8, v9 in v4 do
		if v8 <= elapsed - v9.lastTick then
			v9.lastTick = elapsed
			v9.setter(DateTime.now().UnixTimestamp)
		end
	end
end

return function(n1: number?) --[[ createCurrentTimeSignal ]] -- line: 46
	-- upvalues: v4 (copy), Signals (copy), u5 (ref), RunService (copy), onHeartbeat (copy)
	local v11 = n1 or 30

	if not v4[v11] then
		local v12, v13 = Signals.createSignal(DateTime.now().UnixTimestamp)

		v4[v11] = {
			getter = v12,
			setter = v13,
			lastTick = os.clock()
		}

		if not u5 then
			u5 = RunService.Heartbeat:Connect(onHeartbeat)
		end
	end

	local v14 = v4[v11]

	return function(p1) -- line: 63
		-- upvalues: v14 (copy)
		return v14.getter(p1)
	end
end
