local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("PlayWithRewardComponent").Parent
local t = require(Parent.t)
local v5 = game:DefineFastFlag("PlayWithRewardCoachmarkWindowResets", false)
local v6 = game:DefineFastInt("PlayWithRewardCoachmarkMaxImpressions", 3)
local v7 = game:DefineFastInt("PlayWithRewardCoachmarkWindowDays", 30)
local EngineFeature = game:GetEngineFeature("PlayWithRewardCoachmarkStorageKey")
local v9 = v7 * 86400
local v10 = t.interface({
	windowStartTime = t.number,
	impressionCount = t.number,
	isDismissed = t.boolean
})

local function readStateLookup() -- line: 63
	-- upvalues: EngineFeature (copy), AppStorageService (copy), HttpService (copy)
	if not EngineFeature then
		return nil
	end

	local ok, result = pcall(function() -- line: 68
		-- upvalues: AppStorageService (copy)
		return AppStorageService:GetItem("PlayWithRewardCoachmark")
	end)

	if not ok or type(result) ~= "string" then
		return nil
	end

	if result == "" then
		return {}
	end

	local ok2, result2 = pcall(function() -- line: 79
		-- upvalues: HttpService (copy), result (copy)
		return HttpService:JSONDecode(result)
	end)

	if not ok2 or type(result2) ~= "table" then
		return {}
	end

	return result2
end
local function writeStateLookup(t1: {[any]: any}) -- line: 89
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local ok, result = pcall(function() -- line: 90
		-- upvalues: HttpService (copy), t1 (copy)
		return HttpService:JSONEncode(t1)
	end)

	if not ok or type(result) ~= "string" then
		return false
	end

	return (pcall(function() -- line: 97
		-- upvalues: AppStorageService (copy), result (copy)
		AppStorageService:SetItem("PlayWithRewardCoachmark", result)
		AppStorageService:Flush()
	end))
end

return {
	consumeImpressionIfEligible = function(n1: number) --[[ consumeImpressionIfEligible ]] -- line: 129
		-- upvalues: v6 (copy), EngineFeature (copy), v9 (copy), v5 (copy), readStateLookup (copy), v10 (copy), writeStateLookup (copy)
		local v30 = v6

		if not EngineFeature or (v30 <= 0 or v9 <= 0) then
			return false
		end

		local timestamp = os.time()
		local t2 = {
			windowStartTime = timestamp,
			impressionCount = 1,
			isDismissed = false
		}
		local v33 = readStateLookup()

		if v33 == nil then
			return false
		end

		local str = tostring(n1)
		local v35 = v33[str]
		local v36 = if v10(v35) then v35 else {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		}

		if v36.windowStartTime == 0 then
		elseif v36.windowStartTime > 0 and timestamp - v36.windowStartTime >= v9 then
			t2 = if not v5 then nil else t2
		elseif v36.isDismissed or v30 <= v36.impressionCount then
			t2 = nil
		else
			v36.impressionCount = v36.impressionCount + 1
			t2 = v36
		end

		if t2 == nil then
			return false
		end

		v33[str] = t2

		return (writeStateLookup(v33))
	end,
	dismissCurrentWindow = function(n2: number) --[[ dismissCurrentWindow ]] -- line: 161
		-- upvalues: readStateLookup (copy), v10 (copy), writeStateLookup (copy)
		local v38 = readStateLookup()

		if v38 == nil then
			return
		end

		local str = tostring(n2)
		local v40 = v38[str]
		local v41 = if v10(v40) then v40 else {
			windowStartTime = 0,
			impressionCount = 0,
			isDismissed = false
		}

		if v41.windowStartTime == 0 or v41.isDismissed then
			v41 = nil
		else
			v41.isDismissed = true
		end

		if v41 == nil then
			return
		end

		v38[str] = v41
		writeStateLookup(v38)
	end
}
