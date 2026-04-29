local AppChat = script:FindFirstAncestor("AppChat")
local HttpService = game:GetService("HttpService")
local AppChatParent = AppChat.Parent
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local RoactUtils = require(AppChatParent.RoactUtils)
local ToastNotification = require(AppChatParent.ToastNotification)
local default = require(AppChatParent.ToastNotificationsProtocol).ToastNotificationProtocol.default
local NotificationGroups = ToastNotification.NotificationGroups
local useIsChatEnabled = require(AppChat.Hooks.useIsChatEnabled)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local dependencyArray = RoactUtils.Hooks.dependencyArray
local LifecycleEvents = ToastNotification.LifecycleEvents
local NotificationTypeEnum = ToastNotification.ToastNotificationTypeModule.NotificationTypeEnum
local ShowNotificationSnoozeMenuSignal = ToastNotification.Signals.ShowNotificationSnoozeMenuSignal
local DismissNotificationSnoozeMenuSignal = ToastNotification.Signals.DismissNotificationSnoozeMenuSignal
local UniversalAppPolicy = require(AppChatParent.UniversalAppPolicy)
local GetFFlagAppChatInExpToastSnoozeMenuDismissFix = require(AppChatParent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	hideAllChatToasts = false,
	isAppChatVisible = false,
	isInExperience = false,
	navigateToChat = function() --[[ navigateToChat ]] -- line: 41
	end
}

return function(t2: {[any]: any}) -- line: 44
	-- upvalues: Cryo (copy), t1 (copy), useLocalization (copy), GetFFlagIsSquadEnabled (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), UniversalAppPolicy (copy), useIsChatEnabled (copy), React (copy), LifecycleEvents (copy), NotificationTypeEnum (copy), HttpService (copy), default (copy), ShowNotificationSnoozeMenuSignal (copy), NotificationGroups (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), DismissNotificationSnoozeMenuSignal (copy)
	local v23 = Cryo.Dictionary.join(t1, t2)
	local v24 = useLocalization({
		snoozeDescription = "Feature.Chat.Description.SnoozeDescription",
		snoozeTitle = not GetFFlagIsSquadEnabled() and "Feature.Chat.Label.SnoozeChatNotifications" or "Feature.Chat.Label.SnoozePartyNotifications"
	})
	local n1 = 0
	local v26 = if not GetFFlagAppChatInExpToastSnoozeMenuDismissFix() then v23.hideAllChatToasts else v23.isAppChatVisible
	local v27 = UniversalAppPolicy.getAppFeaturePolicies().getCanSeeChatTab()
	local v28 = useIsChatEnabled()
	local u29 = v26 or not v28

	React.useEffect(function() -- line: 65
		-- upvalues: LifecycleEvents (copy), NotificationTypeEnum (copy), HttpService (copy), default (copy), v23 (copy), ShowNotificationSnoozeMenuSignal (copy), v24 (copy), NotificationGroups (copy)
		local v30 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.ChatNewMessage, function(p1) -- line: 69
			-- upvalues: HttpService (copy), default (copy), v23 (copy), ShowNotificationSnoozeMenuSignal (copy), v24 (copy), NotificationGroups (copy)
			if p1 and (p1.userActionType == "click" and p1.notificationData and p1.visualItem and p1.visualItem.eventName == "ChatMessageBody" and p1.visualItem.actionEventParams) then
				local data = HttpService:JSONDecode(p1.visualItem.actionEventParams)

				default:dismissNotification(p1.notificationData.id)
				v23.navigateToChat(data.conversationId)
			end

			if p1 and p1.userActionType == "click" and p1.notificationData and p1.visualItem and p1.visualItem.eventName == "ChatMessageSnoozeSingleMetaAction" then
				ShowNotificationSnoozeMenuSignal:fire({
					context = "Toast",
					description = v24.snoozeDescription,
					notificationType = NotificationGroups.ChatMessageGroup,
					title = v24.snoozeTitle
				})
			end
		end)

		return function() -- line: 101
			-- upvalues: v30 (copy)
			v30()
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v23.navigateToChat, v24) else {
		v23.navigateToChat,
		v24
	})
	React.useEffect(function() -- line: 110
		-- upvalues: default (copy), NotificationTypeEnum (copy), u29 (ref), v27 (copy), n1 (ref)
		local v31 = default:listenToDisplayNotification(function(p2) -- line: 112
			-- upvalues: NotificationTypeEnum (copy), u29 (ref), v27 (copy), default (copy), n1 (ref)
			if p2.notificationType == NotificationTypeEnum.ChatNewMessage then
				if u29 or not v27 then
					default:dismissNotification(p2.notificationId)

					return
				end

				n1 += 1
			end
		end)

		return function() -- line: 123
			-- upvalues: v31 (copy)
			v31:Disconnect()
		end
	end, {
		u29,
		v27
	})

	if GetFFlagAppChatInExpToastSnoozeMenuDismissFix() then
		React.useEffect(function() -- line: 129
			-- upvalues: v23 (copy), DismissNotificationSnoozeMenuSignal (copy)
			if not v23.isAppChatVisible and DismissNotificationSnoozeMenuSignal then
				DismissNotificationSnoozeMenuSignal:fire()
			end
		end, { v23.isAppChatVisible })
	end
end
