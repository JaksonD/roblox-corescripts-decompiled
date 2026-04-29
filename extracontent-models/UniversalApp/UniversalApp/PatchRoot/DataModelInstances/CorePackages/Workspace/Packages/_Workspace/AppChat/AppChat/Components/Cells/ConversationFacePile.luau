local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Logger = require(AppChatParent.Loggers).Logger
local React = require(AppChatParent.React)
local useLocalUserId = require(AppChatParent.RobloxAppHooks).useLocalUserId
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local Foundation = require(AppChatParent.Foundation)
local FFlagEnableBlackbirdCheck = require(AppChatParent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(AppChatParent.UserProfiles).Hooks.useIsRobloxSubscriber
local UserTile = require(AppChatParent.UserTile).UserTile
local LayoutMode = require(AppChatParent.UserTile).LayoutMode
local RoduxPresence = require(AppChat.Http.RoduxPresence)
local v13 = Logger:new(script.Name)
local useFoundationPresence = require(AppChat.Hooks.useFoundationPresence)
local FFlagAppChatEnableGroupAvatarPresence = require(AppChatParent.SharedFlags).FFlagAppChatEnableGroupAvatarPresence
local PresenceType = RoduxPresence.Enums.PresenceType
local UserPresence = Foundation.Enums.UserPresence

return function(t1: {[any]: any}) --[[ ConversationFacePile ]] -- line: 37
	-- upvalues: v13 (copy), useLocalUserId (copy), React (copy), useSelector (copy), useFoundationPresence (copy), UserPresence (copy), FFlagAppChatEnableGroupAvatarPresence (copy), PresenceType (copy), FFlagEnableBlackbirdCheck (copy), useIsRobloxSubscriber (copy), UserTile (copy), LayoutMode (copy)
	if not t1.conversationId or t1.conversationId == "" then
		v13:warning("conversationId cannot be nil nor an empty string")

		return nil
	end

	local v19 = useLocalUserId()
	local v20 = React.useCallback(function(p1) -- line: 45
		-- upvalues: t1 (copy)
		if p1 and (p1.ChatAppReducer and p1.ChatAppReducer.Conversations) then
			return p1.ChatAppReducer.Conversations[t1.conversationId]
		end

		return nil
	end, { t1.conversationId })
	local v21 = useSelector(v20)
	local v22 = useSelector(function(p2) -- line: 53
		if p2 and (p2.ChatAppReducer and p2.ChatAppReducer.Presence) then
			return p2.ChatAppReducer.Presence.byUserId
		end

		return nil
	end)
	local v23 = if not v21 or not v21.participants then {} else v21.participants
	local t2 = {}

	if #v23 == 1 then
		table.insert(t2, v19)
	else
		local n1 = 1

		while #{} < 2 and n1 <= #v23 do
			local v26 = v23[n1]

			if v26 ~= v19 then
				table.insert(t2, v26)
			end

			n1 += 1
		end
	end

	local v27 = t2[1] or v19
	local v28 = useFoundationPresence(v27)
	local None = UserPresence.None

	if #t2 >= 2 and FFlagAppChatEnableGroupAvatarPresence then
		local v30 = false
		local v31 = false

		for _, v in ipairs(t2) do
			if v22 and v22[v] then
				local userPresenceType = v22[v].userPresenceType

				if userPresenceType == PresenceType.InGame or userPresenceType == PresenceType.InStudio then
					v30 = true
				elseif userPresenceType == PresenceType.Online then
					v31 = true
				end
			end
		end

		if v30 then
			None = UserPresence.InExperience
		elseif v31 then
			None = UserPresence.Active
		end
	else
		None = v28.presence
	end

	local v35 = nil

	if FFlagEnableBlackbirdCheck and #v23 == 2 then
		for _, v37 in v23 do
			local v38 = if type(v37) ~= "table" then tostring(v37) else tostring(v37.id)

			if v38 ~= tostring(v19) then
				v35 = v38

				break
			end
		end
	end

	local v39 = useIsRobloxSubscriber(v35)

	return React.createElement(UserTile, {
		userId = v27,
		facePileSecondUserId = t2[2] or nil,
		layoutMode = LayoutMode.wide,
		title = t1.titleText,
		subtitle = t1.subtitleText,
		titleStyle = t1.titleStyle,
		subtitleStyle = t1.subtitleStyle,
		userPresenceType = None,
		onActivated = t1.onActivated,
		selectable = t1.selectable,
		customTextTruncation = Enum.TextTruncate.SplitWord,
		trustedConnectionIndicatorEnabled = t1.trustedConnectionIndicatorEnabled,
		isRobloxSubscriber = if not FFlagEnableBlackbirdCheck then nil else v39
	})
end
