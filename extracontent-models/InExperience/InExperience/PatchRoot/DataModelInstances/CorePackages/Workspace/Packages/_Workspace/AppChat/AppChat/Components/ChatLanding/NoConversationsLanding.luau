local Parent = script:FindFirstAncestor("AppChat").Parent
local React = require(Parent.React)
local useLocalization = require(Parent.Localization).Hooks.useLocalization
local Foundation = require(Parent.Foundation)
local GetFFlagIsSquadEnabled = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local t1 = {
	friends = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		copy = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.MakeConnectionsToChat" or (not FFlagConnectionsToFriendsRename and "Feature.Chat.Message.MakeConnectionsToParty" or "Feature.Chat.Message.MakeFriendsToParty"),
		cta = not FFlagConnectionsToFriendsRename and "Feature.SettingsHub.Label.NoConnectionsScreen" or "Feature.SettingsHub.Label.NoFriendsScreen"
	},
	regional = {
		icon = "icons/status/oof_xlarge",
		copy = not GetFFlagIsSquadEnabled() and "Feature.Chat.Message.ChatUnavailableRegion" or "Feature.Chat.Message.PartyUnavailableRegion",
		cta = nil
	},
	privacy = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		copy = if not GetFFlagIsSquadEnabled() then not FFlagConnectionsToFriendsRename and "Feature.Chat.Message.EnableChat" or "Feature.Chat.Message.EnableChat.FriendsRename" else not FFlagConnectionsToFriendsRename and "Feature.Chat.Message.EnableParty" or "Feature.Chat.Message.EnableParty.FriendsRename",
		cta = "Feature.Chat.Label.PrivacySettings"
	},
	thirdParty = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		copy = "Feature.Chat.Message.ChatIsDisabledByPrivacySetting",
		cta = nil
	},
	fallback = {
		icon = "icons/status/oof_xlarge",
		copy = "CommonUI.Messages.Response.PageError",
		cta = nil
	}
}

return function(t2: {[any]: any}) --[[ NoConversationsLanding ]] -- line: 87
	-- upvalues: t1 (copy), useLocalization (copy), React (copy), Foundation (copy)
	local v10 = if not t2.chatEnabled then if t2.globalRulesEnabled then if t2.privacySettingsEnabled then t2.thirdPartyPrivacySettingsEnabled and "fallback" or "thirdParty" else "privacy" else "regional" else "friends"
	local v11 = t1[v10]
	local v12 = v11.cta ~= nil

	if v10 == "friends" and not t2.canNavigateToAddFriends then
		v12 = false
	elseif v10 == "privacy" and not t2.canNavigateToPrivacySettings then
		v12 = false
	end

	local v13 = useLocalization({
		callToAction = v11.cta or "Feature.Chat.Label.PrivacySettings",
		copy = v11.copy
	})

	React.useEffect(function() -- line: 102
		-- upvalues: t2 (copy), v10 (copy)
		if t2.fireRenderEvent then
			t2.fireRenderEvent(v10)
		end
	end, {
		t2.fireRenderEvent,
		v10
	})

	return React.createElement(Foundation.Empty, {
		icon = {
			name = v11.icon,
			size = "XLarge"
		},
		text = v13.copy,
		button = if not v12 then nil else {
			text = v13.callToAction,
			icon = "icons/navigation/externallink_medium",
			onActivated = function() --[[ onActivated ]] -- line: 118
				-- upvalues: t2 (copy), v10 (copy)
				t2.onCallToAction(v10)
			end
		}
	})
end
