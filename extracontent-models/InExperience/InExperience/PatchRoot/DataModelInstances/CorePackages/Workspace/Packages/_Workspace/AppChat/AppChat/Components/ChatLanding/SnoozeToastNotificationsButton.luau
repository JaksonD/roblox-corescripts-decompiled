local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local ToastNotification = require(AppChatParent.ToastNotification)
local UIBlox = require(AppChatParent.UIBlox)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local NotificationSnoozedSignal = ToastNotification.Signals.NotificationSnoozedSignal
local ShowNotificationSnoozeMenuSignal = ToastNotification.Signals.ShowNotificationSnoozeMenuSignal
local default = ToastNotification.ToastNotificationSnoozeManager.default
local ToastNotificationTypeModule = ToastNotification.ToastNotificationTypeModule
local NotificationGroups = ToastNotification.NotificationGroups
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatLanding = script:FindFirstAncestor("ChatLanding")
local ChatLandingTelemetryEvents = require(ChatLanding.ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled

return function(t1: {[any]: any}) --[[ SnoozeToastNotificationsButton ]] -- line: 33
	-- upvalues: useLocalization (copy), GetFFlagIsSquadEnabled (copy), React (copy), default (copy), ToastNotificationTypeModule (copy), NotificationSnoozedSignal (copy), useTelemetry (copy), ChatLandingTelemetryLayer (copy), IconButton (copy), Images (copy), NotificationGroups (copy), ShowNotificationSnoozeMenuSignal (copy), ChatLandingTelemetryEvents (copy)
	local v20 = useLocalization({
		chat = "Feature.Chat.Heading.ChatWithConnections",
		party = "Feature.Squads.Label.Party",
		snoozeTitle = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.SnoozeChatNotifications" or "Feature.Chat.Label.SnoozePartyNotifications",
		unmuteFeedback = "Feature.Notifications.Heading.RemoveSnoozeFeedback"
	})
	local v21, v22 = React.useState(default:isSnoozedNotificationType(ToastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage))

	React.useEffect(function() -- line: 49
		-- upvalues: NotificationSnoozedSignal (copy), ToastNotificationTypeModule (copy), v22 (copy)
		local v24 = NotificationSnoozedSignal:connect(function(t2: {[any]: any}) -- line: 50
			-- upvalues: ToastNotificationTypeModule (copy), v22 (copy)
			if t2.notificationType == ToastNotificationTypeModule.NotificationTypeEnum.ChatNewMessage then
				v22(t2.actionType == ToastNotificationTypeModule.SnoozeActionEnum.Mute)
			end
		end)

		return function() -- line: 61
			-- upvalues: v24 (copy)
			v24:disconnect()
		end
	end, {})

	local v23 = useTelemetry(ChatLandingTelemetryLayer.Context)

	return React.createElement(IconButton, {
		size = t1.size,
		icon = if not v21 then Images["icons/common/snoozeNotificationsOff"] else Images["icons/common/snoozeNotificationsOn"],
		layoutOrder = t1.layoutOrder,
		onActivated = function() --[[ onActivated ]] -- line: 74
			-- upvalues: v21 (copy), v20 (copy), GetFFlagIsSquadEnabled (copy), default (copy), NotificationGroups (copy), ShowNotificationSnoozeMenuSignal (copy), v23 (copy), ChatLandingTelemetryEvents (copy)
			if v21 then
				local v25 = v20.unmuteFeedback:gsub("{title}", if not GetFFlagIsSquadEnabled() then v20.chat else v20.party)

				default:unmuteNotification({
					notificationType = NotificationGroups.ChatLandingNotificationsGroup,
					modalMessage = v25,
					context = "ChatLandingSnoozeToastNotificationsButton"
				})
			else
				ShowNotificationSnoozeMenuSignal:fire({
					context = "ChatLandingSnoozeToastNotificationsButton",
					notificationType = NotificationGroups.ChatLandingNotificationsGroup,
					title = v20.snoozeTitle
				})
			end

			v23.emit(ChatLandingTelemetryEvents.ChatLandingSnoozeBtnClicked, {
				isChatNotificationsMuted = v21
			})
		end
	})
end
