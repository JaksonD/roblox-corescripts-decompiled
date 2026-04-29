local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local NumberLocalization = require(Parent.Localization).NumberLocalization
local LocalizationService = game:GetService("LocalizationService")

return function(n1: number?) --[[ formatNumber ]] -- line: 10
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	local v5 = string.format("%.0f", n1 or 0)

	return NumberLocalization.localize(v5, LocalizationService.RobloxLocaleId)
end
