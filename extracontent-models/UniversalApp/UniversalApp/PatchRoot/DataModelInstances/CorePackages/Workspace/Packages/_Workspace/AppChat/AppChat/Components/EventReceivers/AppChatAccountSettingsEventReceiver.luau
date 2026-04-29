local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local RealtimeDelivery = require(AppChatParent.RealtimeDelivery)
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(AppChatParent.RobloxAppEnums).LoginStatus
local fetchChatMetadata = require(AppChat.Conversations.Thunks.fetchChatMetadata)
local useIsAppLoaded = require(AppChat.Hooks.useIsAppLoaded)
local useKeybind = require(AppChat.App.Hooks.useKeybind)
local usePrevious = require(AppChatParent.RoactUtils).Hooks.usePrevious
local useIsChatEnabled = require(AppChat.Hooks.useIsChatEnabled)
local reloadAllMessages = require(AppChat.Conversations.Thunks.reloadAllMessages)
local getDeepValue2 = require(AppChat.Utils.getDeepValue2)
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local DismissedAllConversationModalsForSequence = require(AppChat.Conversations.Actions.DismissedAllConversationModalsForSequence)
local useIsAppChatVisible = require(AppChat.App.Hooks.useIsAppChatVisible)
local getFFlagDebugAppChat = require(AppChat.Flags.getFFlagDebugAppChat)
local FFlagAppChatHandleAgeChange = require(AppChat.Flags.FFlagAppChatHandleAgeChange)
local FFlagEnableAEGIS2AppChatBanner = require(AppChatParent.SharedFlags).FFlagEnableAEGIS2AppChatBanner
local FFlagEnableAEGIS2AppChatConversationBanner = require(AppChatParent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace = require(AppChatParent.SharedFlags).FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace
local v23 = game:DefineFastFlag("AppChatEnableNewChatSettings1", false)
local v24 = game:DefineFastFlag("AppChatDeprecateOldChatSettings", false)
local v25 = require(AppChat.Logger):new(script.Name)

return function(t1: {[any]: any}) --[[ AppChatAccountSettingsEventReceiver ]] -- line: 39
	-- upvalues: useDispatch (copy), useIsAppLoaded (copy), useSelector (copy), LoginStatus (copy), getFFlagDebugAppChat (copy), useKeybind (copy), v25 (copy), React (copy), fetchChatMetadata (copy), FFlagAppChatHandleAgeChange (copy), useIsChatEnabled (copy), getDeepValue2 (copy), usePrevious (copy), reloadAllMessages (copy), RealtimeDelivery (copy), v24 (copy), v23 (copy), FFlagEnableAEGIS2AppChatBanner (copy), FFlagEnableAEGIS2AppChatConversationBanner (copy), useIsAppChatVisible (copy), AppChatNetworking (copy), DismissedAllConversationModalsForSequence (copy), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy)
	local v27 = useDispatch()
	local v28 = useIsAppLoaded()
	local v29 = useSelector(function(p1) -- line: 42
		-- upvalues: LoginStatus (copy)
		return p1.AuthenticationStatus and p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
	end)

	if getFFlagDebugAppChat() then
		useKeybind({
			keyCode = Enum.KeyCode.G,
			modifierKey = Enum.ModifierKey.Ctrl
		}, function() -- line: 47
			-- upvalues: v25 (copy), v27 (copy)
			v25:debug("Ctrl + G pressed, toggling group chat enabled")
			v27({
				type = "Debug_GroupChatEnabledToggled"
			})
		end, { v27 })
	end

	local v30 = React.useCallback(function() -- line: 55
		-- upvalues: v27 (copy), fetchChatMetadata (copy), v25 (copy)
		v27(fetchChatMetadata()):andThen(function(p2) -- line: 56
			-- upvalues: v25 (copy)
			v25:info("Finished fetching chat metadata. Determined isChatEnabled as {}", p2)
		end)
	end, { v27 })

	React.useEffect(function() -- line: 61
		-- upvalues: t1 (copy), v29 (copy), v28 (copy), v25 (copy), v30 (copy)
		if (t1.isInExperience or v29) and not v28 then
			v25:info("App is not loaded, fetching chat metadata")
			v30()
		end
	end, {
		v30,
		v28,
		t1.isInExperience,
		v29
	})

	if FFlagAppChatHandleAgeChange then
		local v31 = useIsChatEnabled()
		local v32 = useSelector(function(p3) -- line: 71
			-- upvalues: getDeepValue2 (copy)
			return getDeepValue2(p3, "ChatAppReducer.ChatSettings.chatUserMessagesEnabled")
		end)
		local v33 = usePrevious(v32)

		React.useEffect(function() -- line: 76
			-- upvalues: v31 (copy), v33 (copy), v32 (copy), v25 (copy), v27 (copy), reloadAllMessages (copy)
			if v31 and (v33 ~= nil and v33 ~= v32) then
				v25:info("Chat messages eligibility changed, reloading all messages")
				v27(reloadAllMessages()):catch(function(p4) -- line: 83
					-- upvalues: v25 (copy)
					v25:warn("Failed to reload all messages after chat user messages eligibility change", p4)
				end)
			end
		end, {
			v27,
			v31,
			v33,
			v32
		})
	end

	RealtimeDelivery.useRealtimeNamespace("UserSettingsChanged", function(p5) -- line: 90
		-- upvalues: v24 (copy), v23 (copy), v25 (copy), v27 (copy), reloadAllMessages (copy), v30 (copy)
		if p5.SettingsChanged then
			local v39 = not v24 and (table.find(p5.SettingsChanged, "WhoCanChatWithMeInApp") or (table.find(p5.SettingsChanged, "WhoCanGroupChatWithMeInApp") or (table.find(p5.SettingsChanged, "WhoCanOneOnOnePartyWithMe") or table.find(p5.SettingsChanged, "WhoCanGroupPartyWithMe"))))

			if v23 then
				local v40 = table.find(p5.SettingsChanged, "WhoCanUsePartyChatWithMe")

				if v40 then
					v25:info("Received privacy setting notification, reloading all messages")
					v27(reloadAllMessages()):catch(function(p6) -- line: 103
						-- upvalues: v25 (copy)
						v25:warn("Failed to reload all messages after party setting change", p6)
					end)
				end

				v39 = v39 or (table.find(p5.SettingsChanged, "WhoCanPartyWithMe") or (table.find(p5.SettingsChanged, "WhoCanUsePartyVoiceWithMe") or v40))
			end

			if v39 then
				v25:info("Received privacy setting notification, fetching chat metadata")
				v30()
			end
		end
	end, {
		v30,
		v27
	})
	RealtimeDelivery.useRealtimeConnectionStateChanged("UserSettingsChanged", function(p7, p8) -- line: 120
		-- upvalues: v25 (copy), v30 (copy)
		if p7 == Enum.ConnectionState.Connected and p8 then
			v25:info("Reconnected to UserSettingsChanged, fetching chat metadata")
			v30()
		end
	end, { v30 })

	if FFlagEnableAEGIS2AppChatBanner or FFlagEnableAEGIS2AppChatConversationBanner then
		local v34 = useIsAppChatVisible()

		local function v35(b1: boolean) -- line: 130
			-- upvalues: FFlagEnableAEGIS2AppChatBanner (copy), v27 (copy), AppChatNetworking (copy), v25 (copy), FFlagEnableAEGIS2AppChatConversationBanner (copy), DismissedAllConversationModalsForSequence (copy)
			if FFlagEnableAEGIS2AppChatBanner then
				v27(AppChatNetworking.rodux.GetChatLandingModal.API(b1)):catch(function(p9) -- line: 132
					-- upvalues: v25 (copy)
					v25:warning("Error in GetChatLandingModal request. Error: {}", (tostring(p9)))
				end)
			end

			if FFlagEnableAEGIS2AppChatConversationBanner then
				v27(DismissedAllConversationModalsForSequence(AppChatNetworking.Constants.ModalSequence.ConversationBottomModal))
			end
		end

		RealtimeDelivery.useRealtimeNamespace(FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(_) -- line: 147
			-- upvalues: v25 (copy), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), v28 (copy), v35 (copy), t1 (copy), v30 (copy)
			v25:info("Received Realtime: {}", FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace)

			if not v28 then
				return
			end

			v35(t1.isInExperience)
			v30()
		end, {
			v30,
			v28,
			t1.isInExperience,
			v34
		})
		RealtimeDelivery.useRealtimeConnectionStateChanged(FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, function(p11, p12) -- line: 159
			-- upvalues: v25 (copy), FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace (copy), v28 (copy), v35 (copy), t1 (copy), v30 (copy)
			v25:info("Reconnected to Realtime: {}, hasMissedEvents: {}", FStringAEGIS2AppChatAgeVerifiedRealtimeNamespace, (tostring(p12)))

			if p11 ~= Enum.ConnectionState.Connected or not p12 or not v28 then
				return
			end

			v35(t1.isInExperience)
			v30()
		end, {
			v30,
			v28,
			t1.isInExperience,
			v34
		})
	end

	return nil
end
