local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local ChatLineReportingParent = ChatLineReporting.Parent
local React = require(ChatLineReportingParent.React)
local ExpChatShared = require(ChatLineReportingParent.ExpChatShared)
local ButtonType = require(ChatLineReportingParent.UIBlox).App.Button.Enum.ButtonType
local ReportCompleteDialog = require(ChatLineReportingParent.GenericAbuseReporting).Components.ReportCompleteDialog
local LocalPlayer = game:GetService("Players").LocalPlayer
local useLocalization = require(ChatLineReportingParent.Localization).Hooks.useLocalization
local Constants = require(ChatLineReporting.Common.Constants)
local getDisplayNameFromUserId = require(ChatLineReporting.Common.getDisplayNameFromUserId)
local getPlayer = require(ChatLineReporting.Common.getPlayer)
local mutePlayer = require(ChatLineReporting.Common.mutePlayer)
local sendSystemMessage = require(ChatLineReporting.Common.sendSystemMessage)

return function(t1: {[any]: any}) --[[ ChatLineReportCompleteModal ]] -- line: 40
	-- upvalues: ExpChatShared (copy), useLocalization (copy), getPlayer (copy), getDisplayNameFromUserId (copy), ButtonType (copy), React (copy), ReportCompleteDialog (copy), LocalPlayer (copy), mutePlayer (copy), Constants (copy), sendSystemMessage (copy)
	local context = ExpChatShared.context
	local v16 = useLocalization(t1.localizationKeys)
	local u17 = nil

	if context.store then
		u17 = getPlayer(context.store:getState().Players.byUserId, t1.selectedMessage.userId)

		if u17 == nil then
			u17 = {
				displayName = getDisplayNameFromUserId(t1.selectedMessage.userId),
				userId = t1.selectedMessage.userId,
				username = ""
			}
		end
	end

	local v18 = useLocalization({
		completeMute = {
			"Feature.ReportAbuse.Action.TextMute",
			name = u17 and u17.displayName or ""
		},
		systemMuteMessage = {
			"Feature.ReportAbuse.Message.UserTextMutedSystem",
			name = u17 and u17.displayName or ""
		}
	})
	local t2 = {
		buttonType = ButtonType.PrimarySystem,
		props = {
			onActivated = function() --[[ onActivated ]] -- line: 67
				-- upvalues: t1 (copy)
				t1.onDismiss(nil, "")
			end,
			text = v16.completeClose
		}
	}

	return React.createElement(ReportCompleteDialog, {
		buttonStackInfo = {
			forceFillDirection = Enum.FillDirection.Vertical,
			buttons = if not LocalPlayer then { t2 } else {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = function() --[[ onActivated ]] -- line: 82
							-- upvalues: mutePlayer (copy), u17 (ref), LocalPlayer (copy), t1 (copy), Constants (copy), sendSystemMessage (copy), v18 (copy)
							local v20 = mutePlayer(u17, LocalPlayer, t1.selectedMessage.isUniverseChat)

							if v20 and v20.key == Constants.SuccessfulMuteKey then
								sendSystemMessage(v18.systemMuteMessage)
							end

							t1.onDismiss(v20)
						end,
						text = v18.completeMute
					}
				},
				t2
			}
		},
		localizationKeys = t1.localizationKeys,
		onDismiss = function() --[[ onDismiss ]] -- line: 98
			-- upvalues: t1 (copy)
			t1.onDismiss(nil, "")
		end
	})
end
