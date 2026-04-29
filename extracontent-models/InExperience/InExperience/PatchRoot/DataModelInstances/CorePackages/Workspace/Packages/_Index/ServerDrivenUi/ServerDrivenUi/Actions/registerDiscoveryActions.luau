local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local ServerDrivenUiParent = ServerDrivenUi.Parent
local FFlagLuaAppSduiUpdateUserSettingsAction = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction
local SduiCoreSystem = require(ServerDrivenUiParent.SduiCoreSystem)
local SduiActionType = SduiCoreSystem.SduiActionType
local getSduiActionHandlerRegistry = SduiCoreSystem.getSduiActionHandlerRegistry
local FFlagSduiActionsUpdateFiresOwnTelemetry = require(ServerDrivenUiParent.SharedFlags).FFlagSduiActionsUpdateFiresOwnTelemetry
local FFlagSduiActionTelemetryHandler = require(ServerDrivenUiParent.SharedFlags).FFlagSduiActionTelemetryHandler
local FFlagLuaAppSduiBadgeDetailsComponents = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local FFlagSduiExperienceDetailsSupport = require(ServerDrivenUiParent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEventDetailsSupport = require(ServerDrivenUiParent.SharedFlags).FFlagSduiEventDetailsSupport
local FFlagLuaAppUnlockUpsellSupport = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppUnlockUpsellSupport

return function() --[[ registerDiscoveryActions ]] -- line: 25
	-- upvalues: SduiActionType (copy), ServerDrivenUi (copy), FFlagSduiActionsUpdateFiresOwnTelemetry (copy), FFlagLuaAppSduiBadgeDetailsComponents (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiActionTelemetryHandler (copy), FFlagLuaAppUnlockUpsellSupport (copy), FFlagLuaAppSduiUpdateUserSettingsAction (copy), FFlagSduiEventDetailsSupport (copy), getSduiActionHandlerRegistry (copy)
	local t1 = {
		[SduiActionType.DismissDialog] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 28
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiDismissDialogAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.Link] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 34
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiLinkAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenAbuseReport] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 40
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenAbuseReportAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenGameDetails] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 46
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenGameDetailsAction)
			end,
			firesOwnTelemetry = not not FFlagSduiActionsUpdateFiresOwnTelemetry
		},
		[SduiActionType.OpenBadgeDetails] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 52
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenBadgeDetailsAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenProfile] = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 59
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenProfileAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenJoinFriends] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 66
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenJoinFriendsAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenSeeAll] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 72
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenSeeAllAction)
			end,
			firesOwnTelemetry = not not FFlagSduiActionsUpdateFiresOwnTelemetry
		},
		[SduiActionType.OpenSocialLink] = if not FFlagSduiExperienceDetailsSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 79
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenSocialLinkAction)
			end,
			lazyTelemetryHandler = if not FFlagSduiActionTelemetryHandler then nil else function() -- line: 83
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.TelemetryHandlers.SduiLeavingRobloxTelemetryHandler)
			end,
			firesOwnTelemetry = true
		},
		[SduiActionType.OpenSongDetail] = if not FFlagSduiExperienceDetailsSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 92
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenSongDetailAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenAmpWizard] = if not FFlagLuaAppUnlockUpsellSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 100
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenAmpWizardAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenSponsoredTooltip] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 107
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenSponsoredTooltipAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenMarketplaceTryOn] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 113
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenMarketplaceTryOnAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.UpdateUserSettings] = if not FFlagLuaAppSduiUpdateUserSettingsAction then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 120
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiUpdateUserSettingsAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.PlayButtonClick] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 127
				return nil
			end,
			firesOwnTelemetry = not not FFlagSduiActionsUpdateFiresOwnTelemetry
		},
		[SduiActionType.OpenTooltip] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 133
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenTooltipAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.RemoveBadgeFromInventory] = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 140
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiRemoveBadgeFromInventoryAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.RsvpToEvent] = if not FFlagSduiEventDetailsSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 148
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiRsvpToEventAction)
			end,
			firesOwnTelemetry = false
		},
		[SduiActionType.OpenGameInvite] = if not FFlagSduiExperienceDetailsSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 156
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Actions.SduiOpenGameInviteAction)
			end,
			firesOwnTelemetry = true
		}
	}

	getSduiActionHandlerRegistry().registerActionHandlerConfigs(t1)
end
