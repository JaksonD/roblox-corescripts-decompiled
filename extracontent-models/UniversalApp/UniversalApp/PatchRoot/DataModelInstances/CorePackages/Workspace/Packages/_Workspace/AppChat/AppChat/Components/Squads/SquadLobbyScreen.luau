local AppChat = script:FindFirstAncestor("AppChat")
local EnumScreens = require(AppChat.EnumScreens)
local AppChatParent = AppChat.Parent
local SharedFlags = require(AppChatParent.SharedFlags)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local SquadLobby = require(AppChatParent.Squads).SquadLobby
local SquadAddFriendsIconButton = require(script.Parent.SquadAddFriendsIconButton)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local v10 = React.PureComponent:extend("SquadLobbyScreen")
local ChatPlacementContext = require(AppChat.Contexts.ChatPlacementContext)
local withChatPlacementContext = ChatPlacementContext.withChatPlacementContext
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local t1 = {
	EnumScreens.SquadLobby,
	EnumScreens.SquadInviteFriends,
	EnumScreens.SquadVoiceReportAbuse
}

if FFlagEnablePartyVoiceChangersInLua then
	table.insert(t1, EnumScreens.SquadVoiceChangers)
end

local function v18(p1) -- line: 34
	-- upvalues: React (copy), SquadAddFriendsIconButton (copy)
	local navigation = p1.navigation

	return {
		renderRight = function() --[[ renderRight ]] -- line: 38
			-- upvalues: React (copy), SquadAddFriendsIconButton (copy), navigation (copy)
			return React.createElement(SquadAddFriendsIconButton, {
				navigation = navigation
			})
		end
	}
end

function v10.init(p2) -- line: 46
	-- upvalues: FFlagAppChatTopBarConfigDriven (copy), GetTopBarStore (copy), EnumScreens (copy), FFlagEnableAppChatFocusableFixes (copy), RoactNavigation (copy), FFlagEnablePartyVoiceChangersInLua (copy), t1 (copy)
	local navigation = p2.props.navigation

	if FFlagAppChatTopBarConfigDriven() then
		GetTopBarStore(false).setScreenTopBar(EnumScreens.SquadLobby, {
			backButtonEnabled = true
		})
	end

	if FFlagEnableAppChatFocusableFixes then
		p2.state = {
			isFocused = navigation.isFocused()
		}
		p2.willFocusSubscription = navigation.addListener(RoactNavigation.Events.WillFocus, function() -- line: 58
			-- upvalues: p2 (copy)
			p2:setState({
				isFocused = true
			})
		end)
		p2.didBlurSubscription = navigation.addListener(RoactNavigation.Events.DidBlur, function() -- line: 61
			-- upvalues: p2 (copy)
			p2:setState({
				isFocused = false
			})
		end)
	end

	p2.hasNavigatedAwayFromSquad = false

	function p2.navigateToHomePage(_) -- line: 68
		-- upvalues: p2 (copy), EnumScreens (copy)
		local v32 = p2.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreens.Home]

		if v32 then
			v32()
		end
	end
	function p2.openViewProfile(s1: string) -- line: 78
		-- upvalues: p2 (copy), EnumScreens (copy)
		local v34 = p2.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreens.ViewUserProfile]

		if v34 then
			v34(s1, {})
		end
	end
	function p2.openSquadVoiceAbuseReport(p4) -- line: 86
		-- upvalues: p2 (copy), EnumScreens (copy)
		p2.props.navigation.navigate(EnumScreens.SquadVoiceReportAbuse, {
			reportData = p4
		})
	end

	if FFlagEnablePartyVoiceChangersInLua then
		function p2.openSquadVoiceChangers() -- line: 91
			-- upvalues: p2 (copy), EnumScreens (copy)
			p2.props.navigation.navigate(EnumScreens.SquadVoiceChangers)
		end
	end

	function p2.navigateToSquadInviteFriends(p5) -- line: 96
		-- upvalues: p2 (copy), EnumScreens (copy)
		p2.props.navigation.navigate(EnumScreens.SquadInviteFriends, {
			conversationId = p5
		})
	end
	function p2.navigateAwayFromSquad() -- line: 100
		-- upvalues: p2 (copy), t1 (copy)
		if p2.hasNavigatedAwayFromSquad then
			return
		end

		local v37 = p2.props.navigation._dangerouslyGetParent()

		if v37 then
			local state = v37.state

			if state then
				local key = nil

				for i = state.index, 1, -1 do
					local v41 = state.routes[i]

					if not table.find(t1, v41.routeName) then
						if key then
							p2.hasNavigatedAwayFromSquad = true
							p2.props.navigation.goBack(key)
						end

						return
					end

					key = v41.key
				end
			end
		end
	end
end
function v10.willUnmount(p6) -- line: 128
	-- upvalues: FFlagEnableAppChatFocusableFixes (copy)
	if FFlagEnableAppChatFocusableFixes then
		if p6.willFocusSubscription then
			p6.willFocusSubscription:remove()
		end

		if p6.didBlurSubscription then
			p6.didBlurSubscription:remove()
		end
	end
end
function v10.render(p7) -- line: 139
	-- upvalues: withChatPlacementContext (copy), FFlagEnableAppChatFocusableFixes (copy), React (copy), SquadLobby (copy), FFlagEnablePartyVoiceChangersInLua (copy), ChatPlacementContext (copy)
	return withChatPlacementContext(function(p8) -- line: 140
		-- upvalues: FFlagEnableAppChatFocusableFixes (copy), p7 (copy), React (copy), SquadLobby (copy), FFlagEnablePartyVoiceChangersInLua (copy), ChatPlacementContext (copy)
		if not if not FFlagEnableAppChatFocusableFixes then p7.props.navigation.isFocused() else p7.state.isFocused then
			return nil
		end

		return React.createElement(SquadLobby, {
			navigateToHomePage = p7.navigateToHomePage,
			openViewProfile = p7.openViewProfile,
			openSquadVoiceAbuseReport = p7.openSquadVoiceAbuseReport,
			navigateAwayFromSquad = p7.navigateAwayFromSquad,
			navigateToSquadInviteFriends = p7.navigateToSquadInviteFriends,
			openSquadVoiceChangers = if not FFlagEnablePartyVoiceChangersInLua then nil else p7.openSquadVoiceChangers,
			isInExperience = ChatPlacementContext.isPlacementInExperience(p8.chatPlacement),
			isWideMode = p7.props.isWideMode
		})
	end)
end

local v19 = React.PureComponent:extend("WideSquadLobbyScreen")

v19.navigationOptions = v18

function v19.init(_) -- line: 166
end
function v19.render(p10) -- line: 168
	-- upvalues: React (copy), v10 (copy), Cryo (copy)
	return React.createElement(v10, Cryo.Dictionary.union(p10.props, {
		isWideMode = true
	}))
end

local v20 = React.PureComponent:extend("CompactSquadLobbyScreen")

v20.navigationOptions = v18

function v20.init(_) -- line: 174
end
function v20.render(p12) -- line: 175
	-- upvalues: React (copy), v10 (copy), Cryo (copy)
	return React.createElement(v10, Cryo.Dictionary.union(p12.props, {
		isWideMode = false
	}))
end

return {
	WideSquadLobbyScreen = v19,
	CompactSquadLobbyScreen = v20
}
