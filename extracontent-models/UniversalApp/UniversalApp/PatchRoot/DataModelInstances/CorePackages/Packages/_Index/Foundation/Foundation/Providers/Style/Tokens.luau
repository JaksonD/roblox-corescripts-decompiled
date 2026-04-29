local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local RbxDesignFoundations = require(FoundationParent.RbxDesignFoundations)
local Device = require(Foundation.Enums.Device)
local Flags = require(Foundation.Utility.Flags)
local Theme = require(Foundation.Enums.Theme)
local TokenProcessingUtilities = require(script.TokenProcessingUtilities)

local function applyTokenOverrides(p1, t1: {[any]: any}) -- line: 31
	-- upvalues: Flags (copy), TokenProcessingUtilities (copy)
	if not Flags.FoundationTokenOverrides then
		return p1
	end

	for v16, v17 in t1 do
		local v18 = TokenProcessingUtilities.getTokenValue(p1, v17)

		if v18 ~= nil then
			TokenProcessingUtilities.setTokenValue(p1, v16, v18)
		end
	end

	return p1
end
local function getTokens(p2, p3, n1: number?, t2: {[any]: any}?) -- line: 46
	-- upvalues: RbxDesignFoundations (copy), Device (copy), Flags (copy), Theme (copy), applyTokenOverrides (copy)
	local Tokens = RbxDesignFoundations.Tokens
	local v24 = p3 or Device.Desktop
	local n2

	if Flags.FoundationDisableTokenScaling then
		n2 = 1
	else
		if n1 == nil then
			n1 = 1
		end

		local v26 = math.clamp(n1, 0, 1e999)

		n2 = (v24 ~= Device.Console and 1 or 1.5) * v26
	end

	local v27 = ((if p2 ~= Theme.Dark then Tokens.Light else Tokens.Dark))(n2)
	local t3 = {
		Color = v27.Color,
		Config = v27.Config,
		DarkMode = v27.DarkMode,
		Ease = v27.Ease,
		LightMode = v27.LightMode,
		Inverse = v27.Inverse,
		Semantic = v27.Semantic,
		Size = v27.Size,
		Padding = v27.Padding,
		Margin = v27.Margin,
		Gap = v27.Gap,
		Gutter = v27.Gutter,
		Radius = v27.Radius,
		Stroke = v27.Stroke,
		LineHeight = v27.LineHeight,
		FontSize = v27.FontSize,
		FontWeight = v27.FontWeight,
		Time = v27.Time,
		Typography = v27.Typography
	}

	if t2 then
		applyTokenOverrides(t3, t2)
	end

	return t3
end

local v10 = getTokens(Theme.Dark, Device.Desktop)

return {
	getTokens = getTokens,
	defaultTokens = v10
}
