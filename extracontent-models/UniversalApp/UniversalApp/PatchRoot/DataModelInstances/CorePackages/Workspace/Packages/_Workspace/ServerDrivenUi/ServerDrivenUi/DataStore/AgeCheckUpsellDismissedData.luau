local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local Signals = require(Parent.Signals)
local FFlagLuaAppDismissUnlockUpsell = require(Parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local v5, v6 = Signals.createSignal(false)

if FFlagLuaAppDismissUnlockUpsell then
	local v7 = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	local u8 = if v7 ~= nil and not (v7 <= 0) then v7 else nil

	Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() -- line: 35
		-- upvalues: Players (copy), u8 (ref), v6 (copy)
		local v11 = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		local v12 = if v11 ~= nil and not (v11 <= 0) then v11 else nil

		if v12 ~= u8 then
			u8 = v12
			v6(false)
		end
	end)
end

return {
	getIsAgeCheckUpsellDismissed = function(p1) --[[ getIsAgeCheckUpsellDismissed ]] -- line: 15
		-- upvalues: v5 (copy)
		return v5(p1)
	end,
	setAgeCheckUpsellDismissed = function() --[[ setAgeCheckUpsellDismissed ]] -- line: 19
		-- upvalues: v6 (copy)
		v6(true)
	end
}
