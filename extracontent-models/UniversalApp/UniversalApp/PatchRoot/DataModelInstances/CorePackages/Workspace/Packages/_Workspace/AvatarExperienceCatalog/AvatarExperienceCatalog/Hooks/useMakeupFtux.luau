local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local AvatarExperienceCommon = require(Parent.AvatarExperienceCommon)
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)
local SafeAppStorageService = AvatarExperienceCommon.Lib.SafeAppStorageService
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlags.FFlagAXMakeupReleaseFTUX
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local v8 = game:DefineFastFlag("AXCatalogMakeupFtuxUseMemStorage", false)
local FFlagAXMakeupLayeringTooltipFTUX = AvatarExperienceFlags.FFlagAXMakeupLayeringTooltipFTUX
local FFlagAXSkipMakeupFTUX = AvatarExperienceFlags.FFlagAXSkipMakeupFTUX
local v11 = game:DefineFastInt("AXMakeupLayeringTooltipMaxSeenCount", 2)
local v12 = game:DefineFastInt("AXMakeupMax6LayersPromptMaxSeenCount", 3)
local u13 = not FFlagAXMakeupLayeringTooltipFTUX and nil

local function getStorage() -- line: 30
	-- upvalues: SafeAppStorageService (copy), v8 (copy), HttpService (copy)
	local u15 = SafeAppStorageService.getItem("AXCatalogMakeupFTUX", v8)

	if not u15 or u15 == "" then
		u15 = "{}"
	end

	local t1 = {}

	pcall(function() -- line: 37
		-- upvalues: t1 (ref), HttpService (copy), u15 (ref)
		t1 = HttpService:JSONDecode(u15)
	end)

	return t1
end

return function() --[[ useMakeupFtux ]] -- line: 53
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), getStorage (copy), HttpService (copy), SafeAppStorageService (copy), v8 (copy), FFlagAXSkipMakeupFTUX (copy), v12 (copy), FFlagAXMakeupLayeringTooltipFTUX (copy), u13 (ref), v11 (copy), FFlagAXMakeupReleaseFTUX (copy)
	local v18 = if not FFlagAXMakeupLayeringTooltipFTUX then nil else function() -- line: 90
		-- upvalues: FFlagAXSkipMakeupFTUX (copy), u13 (ref), getStorage (copy), v11 (copy)
		if FFlagAXSkipMakeupFTUX then
			return false
		end

		if u13 then
			return false
		end

		return (getStorage().makeupLayeringTooltipSeenCount or 0) < v11
	end
	local v19 = if not FFlagAXMakeupLayeringTooltipFTUX then nil else function() -- line: 106
		-- upvalues: u13 (ref), getStorage (copy), HttpService (copy), SafeAppStorageService (copy), v8 (copy)
		u13 = true

		local v26 = getStorage()

		v26.makeupLayeringTooltipSeenCount = (v26.makeupLayeringTooltipSeenCount or 0) + 1
		pcall(function() -- line: 46
			-- upvalues: HttpService (copy), v26 (copy), SafeAppStorageService (copy), v8 (copy)
			local json = HttpService:JSONEncode(v26)

			SafeAppStorageService.setItem("AXCatalogMakeupFTUX", json, v8)
			SafeAppStorageService.flush()
		end)
	end
	local v20 = if not FFlagAXMakeupReleaseFTUX then nil else function() -- line: 117
		-- upvalues: FFlagAXSkipMakeupFTUX (copy), getStorage (copy)
		if FFlagAXSkipMakeupFTUX then
			return false
		end

		return not getStorage().shownMakeupReleasePrompt
	end
	local v21 = if not FFlagAXMakeupReleaseFTUX then nil else function() -- line: 128
		-- upvalues: getStorage (copy), HttpService (copy), SafeAppStorageService (copy), v8 (copy)
		local v27 = getStorage()

		v27.shownMakeupReleasePrompt = true
		pcall(function() -- line: 46
			-- upvalues: HttpService (copy), v27 (copy), SafeAppStorageService (copy), v8 (copy)
			local json = HttpService:JSONEncode(v27)

			SafeAppStorageService.setItem("AXCatalogMakeupFTUX", json, v8)
			SafeAppStorageService.flush()
		end)
	end

	return {
		shouldShowMakeupMax6LayersPrompt = function() -- line: 66
			-- upvalues: FFlagAXSkipMakeupFTUX (copy), getStorage (copy), FFlagAXMISEnableMultiShopping (copy), v12 (copy)
			if FFlagAXSkipMakeupFTUX then
				return false
			end

			local v24 = getStorage()

			return not v24.hideMakeupMax6LayersPrompt and (not FFlagAXMISEnableMultiShopping or (v24.seenMakeupMax6LayersCount == nil or v24.seenMakeupMax6LayersCount < v12))
		end,
		hideMakeupMax6LayersPrompt = function() -- line: 82
			-- upvalues: getStorage (copy), HttpService (copy), SafeAppStorageService (copy), v8 (copy)
			local v25 = getStorage()

			v25.hideMakeupMax6LayersPrompt = true
			pcall(function() -- line: 46
				-- upvalues: HttpService (copy), v25 (copy), SafeAppStorageService (copy), v8 (copy)
				local json = HttpService:JSONEncode(v25)

				SafeAppStorageService.setItem("AXCatalogMakeupFTUX", json, v8)
				SafeAppStorageService.flush()
			end)
		end,
		shouldShowMakeupLayeringTooltip = v18,
		markMakeupLayeringTooltipSeen = v19,
		shouldShowMakeupReleasePrompt = v20,
		setShownMakeupReleasePrompt = v21,
		incrementSeenMakeupMax6LayersPrompt = function() -- line: 54
			-- upvalues: FFlagAXMISEnableMultiShopping (copy), getStorage (copy), HttpService (copy), SafeAppStorageService (copy), v8 (copy)
			if not FFlagAXMISEnableMultiShopping then
				return
			end

			local v23 = getStorage()

			v23.seenMakeupMax6LayersCount = if v23.seenMakeupMax6LayersCount ~= nil then v23.seenMakeupMax6LayersCount + 1 else 1
			pcall(function() -- line: 46
				-- upvalues: HttpService (copy), v23 (copy), SafeAppStorageService (copy), v8 (copy)
				local json = HttpService:JSONEncode(v23)

				SafeAppStorageService.setItem("AXCatalogMakeupFTUX", json, v8)
				SafeAppStorageService.flush()
			end)
		end
	}
end
