local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization

require(AppChat.types)

local RoduxPresence = require(AppChat.Http.RoduxPresence)
local PresenceType = RoduxPresence.Enums.PresenceType
local t1 = {
	[PresenceType.InGame] = "Active",
	[PresenceType.Online] = "Active",
	[PresenceType.InStudio] = "Active",
	[PresenceType.Offline] = "None",
	[PresenceType.Invisible] = "None"
}
local t2 = {
	[PresenceType.InGame] = "ingameStatusLabel",
	[PresenceType.Online] = "onlinePresenceText",
	[PresenceType.InStudio] = "studioStatusLabel",
	[PresenceType.Offline] = "offlinePresenceText",
	[PresenceType.Invisible] = "offlinePresenceText"
}
local t3 = {
	offlinePresenceText = "Common.Presence.Label.Offline",
	onlinePresenceText = "Common.Presence.Label.Online",
	studioStatusLabel = "Common.Presence.Label.RobloxStudio",
	ingameStatusLabel = "Common.Presence.Label.InExperience"
}

return function(s1: string) --[[ useFoundationPresence ]] -- line: 43
	-- upvalues: useLocalization (copy), t3 (copy), React (copy), useSelector (copy), RoduxPresence (copy), PresenceType (copy), t2 (copy), t1 (copy)
	local v12 = useLocalization(t3)
	local v13, v14 = React.useBinding(v12.offlinePresenceText)
	local v15, v16 = React.useState("None")
	local v17 = useSelector(function(p1) -- line: 49
		-- upvalues: s1 (copy), RoduxPresence (copy)
		if not s1 or s1 == "" then
			return nil
		end

		return RoduxPresence.Selectors.getUserPresenceByUserId(p1, s1)
	end)

	React.useEffect(function() -- line: 56
		-- upvalues: v12 (copy), PresenceType (copy), v17 (copy), t2 (copy), t1 (copy), v16 (copy), v14 (copy)
		local offlinePresenceText = v12.offlinePresenceText
		local Offline = PresenceType.Offline

		if v17 then
			Offline = v17.userPresenceType

			local lastLocation = v17.lastLocation

			offlinePresenceText = v12[t2[Offline]]

			if Offline == PresenceType.InGame and lastLocation and lastLocation ~= "" then
				offlinePresenceText = lastLocation
			end
		end

		local v22 = t1

		v16(v22[Offline] or "None")
		v14(offlinePresenceText)
	end, {
		v17,
		v12
	})

	return React.useMemo(function() -- line: 76
		-- upvalues: v15 (copy), v13 (copy)
		return {
			presence = v15,
			presenceText = v13
		}
	end, {
		v15,
		v13
	})
end
