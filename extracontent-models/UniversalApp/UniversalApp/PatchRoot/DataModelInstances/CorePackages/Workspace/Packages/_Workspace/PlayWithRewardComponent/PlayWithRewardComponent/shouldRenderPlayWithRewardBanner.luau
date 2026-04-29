local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("PlayWithRewardComponent").Parent

require(Parent.PlayWithRewardState)

return function(s1: string, s2: string, s3: string?, p1) --[[ shouldRenderPlayWithRewardBanner ]] -- line: 10
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	local v8 = tonumber(p1 and p1.productId or 0) or 0

	return LocalPlayer ~= nil and (s2 ~= "" and (s3 ~= nil and (s3 == s1 and (p1 ~= nil and (p1.adAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable and (p1.experimentVariantData ~= nil and v8 ~= 0))))))
end
