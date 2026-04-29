local Foundation = script:FindFirstAncestor("Foundation")

require(Foundation.Enums.Device)

local Flags = require(Foundation.Utility.Flags)

require(Foundation.Enums.Theme)

local TokenProcessingUtilities = require(Foundation.Providers.Style.Tokens.TokenProcessingUtilities)
local Tokens = require(Foundation.Providers.Style.Tokens)

local function emitLeafAttributes(t1: {[any]: any}, s1: string, p1) -- line: 19
	-- upvalues: emitLeafAttributes (copy)
	if type(p1) == "table" then
		for v10, v11 in p1 do
			emitLeafAttributes(t1, s1 .. tostring(v10), v11)
		end

		return
	end

	t1[s1] = p1
end

return function(p2, p3, p4) --[[ getOverrideAttributes ]] -- line: 39
	-- upvalues: Flags (copy), Tokens (copy), TokenProcessingUtilities (copy), emitLeafAttributes (copy)
	local t2 = {}

	if not Flags.FoundationTokenOverrides then
		return t2
	end

	if not p4 or not next(p4) then
		return t2
	end

	local v16 = Tokens.getTokens(p2, p3, 1)

	for v17, v18 in p4 do
		local v19 = TokenProcessingUtilities.getTokenValue(v16, v18)

		if v19 ~= nil then
			emitLeafAttributes(t2, v17:gsub("%.", ""):gsub("_", ""), v19)
		end
	end

	return t2
end
