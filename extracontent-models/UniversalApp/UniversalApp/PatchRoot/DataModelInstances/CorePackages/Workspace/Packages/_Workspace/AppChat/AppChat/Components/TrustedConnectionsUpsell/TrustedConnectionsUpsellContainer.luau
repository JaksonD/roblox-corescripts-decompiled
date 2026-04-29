local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local v3 = require(AppChat.Logger):new(script.Name)

require(AppChat.types)

local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local NetworkingFriends = require(AppChat.Http.NetworkingFriends)
local React = require(AppChatParent.React)
local TrustedContacts = require(AppChatParent.TrustedContacts)
local AppTabBarRodux = require(AppChatParent.AppTabBarRodux)
local ConversationOverlay = AppChatNetworking.Constants.ConversationOverlay
local useGetOneToOneFriendIdFromConversationId = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useIsAppChatVerticallyConstrained = require(AppChat.App.Hooks.useIsAppChatVerticallyConstrained)
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(AppChatParent.Navigation).useNavigation
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local SharedFlags = require(AppChatParent.SharedFlags)
local refreshConversationUnfilteredThreadsDetails = require(AppChat.Conversations.Thunks.refreshConversationUnfilteredThreadsDetails)
local Promise = require(AppChatParent.Promise)
local useIsInExperience = require(AppChat.Hooks.useIsInExperience)
local NotificationModalsManager = require(AppChatParent.NotificationModalsManager)
local SetTabBarVisibleFromChat = AppTabBarRodux.Thunks.SetTabBarVisibleFromChat
local ConversationOverlayTelemetry = require(AppChat.Components.ChatConversation.PartialModal.ConversationOverlayTelemetry)
local ModalTelemetry = require(AppChat.Components.ModalTelemetry)
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local AppTelemetryLayer = require(AppChat.Telemetry.Layers.AppTelemetryLayer)
local v25 = if not SharedFlags.FFlagTCUnifyNavigationEntry then TrustedContacts.TrustedContactsModal.Container else TrustedContacts.TrustedFriendsModalEntry
local FFlagAppChatEnableDoubleOptIn = SharedFlags.FFlagAppChatEnableDoubleOptIn
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local FFlagTCModalUpdateButtons = SharedFlags.FFlagTCModalUpdateButtons
local FFlagAppChatEnableTrustedFriendEntryPoint = require(AppChat.Flags.FFlagAppChatEnableTrustedFriendEntryPoint)
local FIntUnfilteredThreadsPvDelayMs = require(AppChat.Flags.FIntUnfilteredThreadsPvDelayMs)
local t1 = {
	[ConversationOverlay.TrustedConnectionCreated] = v25
}

local function v32(t2: {[any]: any}) -- line: 68
	return {
		shouldOverrideNavigation = true,
		onClosed = t2.onClosed,
		isVerticallyConstrained = t2.isVerticallyConstrained,
		userId = t2.userId
	}
end

local t3 = {
	[ConversationOverlay.TrustedConnectionCreated] = {
		component = v25,
		mapProps = function(p1) --[[ mapProps ]] -- line: 79
			-- upvalues: FFlagTCModalUpdateButtons (copy)
			return {
				isVerticallyConstrained = p1.isVerticallyConstrained,
				userId = p1.userId,
				onClosed = p1.onClosed,
				onAcknowledged = p1.onAcknowledged,
				onRemovedTrustedConnection = if not FFlagTCModalUpdateButtons then p1.onRemovedTrustedConnection else nil,
				shouldOverrideNavigation = true
			}
		end
	},
	[ConversationOverlay.AddTrustedConnectionU18] = {
		component = v25,
		mapProps = v32
	},
	[ConversationOverlay.TrustedConnectionRequestU18] = {
		component = v25,
		mapProps = v32
	}
}

return function(t4: {[any]: any}) -- line: 113
	-- upvalues: useGetOneToOneFriendIdFromConversationId (copy), useIsAppChatVerticallyConstrained (copy), useDispatch (copy), useNavigation (copy), useLocalization (copy), FFlagConnectionsToFriendsRename (copy), FFlagAppChatEnableDoubleOptIn (copy), useIsInExperience (copy), useTelemetry (copy), AppTelemetryLayer (copy), React (copy), ConversationOverlayTelemetry (copy), t3 (copy), t1 (copy), FFlagAppChatEnableTrustedFriendEntryPoint (copy), SetTabBarVisibleFromChat (copy), Promise (copy), FIntUnfilteredThreadsPvDelayMs (copy), refreshConversationUnfilteredThreadsDetails (copy), ModalTelemetry (copy), NetworkingFriends (copy), v3 (copy), NotificationModalsManager (copy), FFlagTCModalUpdateButtons (copy)
	local v37 = useGetOneToOneFriendIdFromConversationId(t4.conversationId) or ""
	local v38 = useIsAppChatVerticallyConstrained()
	local v39 = useDispatch()
	local v40 = useNavigation()
	local v41 = useLocalization({
		toastText = not FFlagConnectionsToFriendsRename and "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRemoved" or "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved"
	})
	local modalVariant = t4.modalVariant
	local v43 = if not FFlagAppChatEnableDoubleOptIn then nil else useIsInExperience()
	local v44 = useTelemetry(AppTelemetryLayer.Context)

	React.useEffect(function() -- line: 127
		-- upvalues: v44 (copy), ConversationOverlayTelemetry (copy), modalVariant (copy)
		v44.emit(ConversationOverlayTelemetry.Events.ModalRendered, {
			modalVariant = modalVariant
		})
	end, { modalVariant })

	local v45 = if not FFlagAppChatEnableDoubleOptIn then t1[modalVariant] ~= nil else t3[modalVariant] ~= nil

	React.useEffect(function() -- line: 144
		-- upvalues: FFlagAppChatEnableTrustedFriendEntryPoint (copy), v45 (copy), v39 (copy), SetTabBarVisibleFromChat (copy)
		if not FFlagAppChatEnableTrustedFriendEntryPoint or not v45 then
			return
		end

		v39(SetTabBarVisibleFromChat(false))

		return function() -- line: 149
			-- upvalues: v39 (copy), SetTabBarVisibleFromChat (copy)
			v39(SetTabBarVisibleFromChat(true))
		end
	end, {
		v39,
		v45
	})

	local v46 = React.useCallback(function() -- line: 155
		-- upvalues: t4 (copy), FFlagAppChatEnableDoubleOptIn (copy), Promise (copy), FIntUnfilteredThreadsPvDelayMs (copy), v39 (copy), refreshConversationUnfilteredThreadsDetails (copy), v43 (copy)
		t4.dismissModal()

		if FFlagAppChatEnableDoubleOptIn then
			Promise.delay(FIntUnfilteredThreadsPvDelayMs / 1000):andThen(function() -- line: 158
				-- upvalues: v39 (copy), refreshConversationUnfilteredThreadsDetails (copy), t4 (copy), v43 (copy)
				v39(refreshConversationUnfilteredThreadsDetails(t4.conversationId, v43))
			end)
		end
	end, {
		t4.conversationId,
		modalVariant,
		v39,
		t4.dismissModal,
		v43
	})
	local v47 = React.useCallback(function() -- line: 171
		-- upvalues: v44 (copy), ConversationOverlayTelemetry (copy), modalVariant (copy), ModalTelemetry (copy), v39 (copy), NetworkingFriends (copy), v37 (copy), v3 (copy), NotificationModalsManager (copy), v41 (copy)
		v44.emit(ConversationOverlayTelemetry.Events.ModalAction, {
			modalVariant = modalVariant,
			action = ModalTelemetry.Enums.ModalActions.SecondaryCta
		})
		v39(NetworkingFriends.RemoveTC.API(v37)):andThen(function() -- line: 178
			-- upvalues: v44 (copy), ConversationOverlayTelemetry (copy), modalVariant (copy), ModalTelemetry (copy)
			v44.emit(ConversationOverlayTelemetry.Events.ModalActionResult, {
				modalVariant = modalVariant,
				action = ModalTelemetry.Enums.ModalActions.SecondaryCta,
				actionResult = ModalTelemetry.Enums.ModalActionResults.Success
			})
		end):catch(function(p2) -- line: 185
			-- upvalues: v44 (copy), ConversationOverlayTelemetry (copy), modalVariant (copy), ModalTelemetry (copy), v3 (copy), v37 (copy)
			v44.emit(ConversationOverlayTelemetry.Events.ModalActionResult, {
				modalVariant = modalVariant,
				action = ModalTelemetry.Enums.ModalActions.SecondaryCta,
				actionResult = ModalTelemetry.Enums.ModalActionResults.Failure
			})
			v3:warning(`Error removing trusted connection for user { v37 }: { tostring(p2) }`)
		end)
		NotificationModalsManager.SetUIBloxToast({
			sequenceNumber = DateTime.now().UnixTimestamp,
			toastTitle = v41.toastText
		})
	end, {
		v46,
		v40,
		v39,
		v37,
		v44,
		modalVariant
	})
	local v48 = React.useCallback(function() -- line: 198
		-- upvalues: v44 (copy), ConversationOverlayTelemetry (copy), modalVariant (copy), ModalTelemetry (copy), v46 (copy)
		v44.emit(ConversationOverlayTelemetry.Events.ModalAction, {
			modalVariant = modalVariant,
			action = ModalTelemetry.Enums.ModalActions.PrimaryCta
		})
		v46()
	end, {
		v46,
		v44,
		modalVariant
	})
	local v49 = React.useCallback(function() -- line: 205
		-- upvalues: v44 (copy), ConversationOverlayTelemetry (copy), modalVariant (copy), ModalTelemetry (copy), v46 (copy)
		v44.emit(ConversationOverlayTelemetry.Events.ModalAction, {
			modalVariant = modalVariant,
			action = ModalTelemetry.Enums.ModalActions.Dismiss
		})
		v46()
	end, {
		v46,
		v44,
		modalVariant
	})

	if FFlagAppChatEnableDoubleOptIn then
		local v50 = t3[modalVariant]

		if v50 then
			return React.createElement(v50.component, v50.mapProps({
				isVerticallyConstrained = v38,
				userId = v37,
				onClosed = v49,
				onAcknowledged = v48,
				onRemovedTrustedConnection = if not FFlagTCModalUpdateButtons then v47 else nil
			}))
		end
	else
		local v51 = t1[modalVariant]

		if v51 then
			return React.createElement(v51, {
				isVerticallyConstrained = v38,
				userId = v37,
				onClosed = v49,
				onAcknowledged = v48,
				onRemovedTrustedConnection = if not FFlagTCModalUpdateButtons then v47 else nil,
				shouldOverrideNavigation = true
			})
		end
	end

	return nil
end
