local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local DataHydration = require(TrustedContactsParent.DataHydration)
local useNavigation = require(TrustedContactsParent.Navigation).useNavigation
local AppPage = require(TrustedContactsParent.RobloxAppEnums).AppPage
local NotificationModalsManager = require(TrustedContactsParent.NotificationModalsManager)
local default = require(TrustedContactsParent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local TrustedConnectionStatus = require(TrustedContacts.Enums).TrustedConnectionStatus
local Sources = require(TrustedContactsParent.SocialLuaAnalytics).Analytics.Enums.Sources
local Contexts = require(TrustedContactsParent.SocialLuaAnalytics).Analytics.Enums.Contexts
local useAppPolicy = require(TrustedContactsParent.UniversalAppPolicy).useAppPolicy
local UserProfiles = require(TrustedContactsParent.UserProfiles)
local useLocalization = require(TrustedContactsParent.Localization).Hooks.useLocalization
local Analytics = require(script.Parent.Parent.Parent.Analytics)
local useTCAnalytics = Analytics.useTCAnalytics
local EventNames = Analytics.EventNames
local FFlagTCShareLinkReceiverUI = require(TrustedContactsParent.SharedFlags).FFlagTCShareLinkReceiverUI
local FFlagTCUnifyNavigationEntry = require(TrustedContactsParent.SharedFlags).FFlagTCUnifyNavigationEntry
local FFlagTCVerifiedParentalControl = require(TrustedContactsParent.SharedFlags).FFlagTCVerifiedParentalControl
local FFlagTCUpdateProfileCTAButton = require(TrustedContactsParent.SharedFlags).FFlagTCUpdateProfileCTAButton
local FFlagTCModalUpdateButtons = require(TrustedContactsParent.SharedFlags).FFlagTCModalUpdateButtons
local FFlagConnectionsToFriendsRename = require(TrustedContactsParent.SharedFlags).FFlagConnectionsToFriendsRename

require(TrustedContacts.Common.Types)

local v24 = DataHydration.TrustedConnections.TrustedConnectionsStore.get()

return function(s1: string, s2: string?, s3: string, t1: {[any]: any}) --[[ useModalButtonActions ]] -- line: 56
	-- upvalues: FFlagTCVerifiedParentalControl (copy), useNavigation (copy), useAppPolicy (copy), UserProfiles (copy), useLocalization (copy), FFlagConnectionsToFriendsRename (copy), useTCAnalytics (copy), FFlagTCModalUpdateButtons (copy), React (copy), EventNames (copy), FFlagTCUpdateProfileCTAButton (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), NotificationModalsManager (copy), TrustedConnectionStatus (copy), v24 (copy), FFlagTCShareLinkReceiverUI (copy), Sources (copy), Contexts (copy), default (copy)
	local v29 = if not FFlagTCVerifiedParentalControl then nil else useNavigation()
	local v30 = useAppPolicy(function(p1) -- line: 63
		return p1.getShareSheetEnabled()
	end)
	local s4 = ""
	local v32 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = { s1 },
		query = UserProfiles.Queries.userProfilesCombinedNameByUserIds
	})

	if v32 and v32.data then
		s4 = UserProfiles.Selectors.getCombinedNameFromId(v32.data, s1) or ""
	end

	local v33 = useLocalization({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		trustedConnectionRequestSentToast = not FFlagConnectionsToFriendsRename and "Feature.Friends.TrustedConnection.Toast.TrustedConnectionRequestSent" or "Feature.Friends.TrustedFriend.Toast.TrustedFriendRequestSent",
		isATrustedConnectionNowToast = {
			not FFlagConnectionsToFriendsRename and "Feature.Friends.TrustedConnection.Toast.IsATrustedConnectionNow" or "Feature.Friends.TrustedFriend.Toast.IsATrustedFriendNow",
			name = s4
		},
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied"
	})
	local fireAnalyticsEvent = useTCAnalytics({
		friendId = s1,
		modalVariant = s3,
		source = s2
	}).fireAnalyticsEvent
	local v35 = if not FFlagTCModalUpdateButtons then React.useCallback(function() -- line: 99
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), t1 (copy)
		fireAnalyticsEvent(EventNames.TCUpsellGotItClicked)

		if t1.onAcknowledged then
			t1.onAcknowledged()
		end

		t1.closeModal()
	end, {
		t1.closeModal,
		t1.onAcknowledged,
		fireAnalyticsEvent
	}) else nil
	local v36 = if not FFlagTCModalUpdateButtons then nil else React.useCallback(function() -- line: 108
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), t1 (copy)
		fireAnalyticsEvent(EventNames.TrustedFriendsModalOkClicked)

		if t1.onAcknowledged then
			t1.onAcknowledged()
		end

		t1.closeModal()
	end, {
		t1.closeModal,
		t1.onAcknowledged,
		fireAnalyticsEvent
	})
	local v37 = if not FFlagTCModalUpdateButtons then React.useCallback(function() -- line: 119
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), t1 (copy)
		fireAnalyticsEvent(EventNames.TCUpsellRemoveTrustedConnectionClicked)

		if t1.onRemovedTrustedConnection then
			t1.onRemovedTrustedConnection()
		end

		t1.closeModal()
	end, {
		t1.closeModal,
		t1.onRemovedTrustedConnection,
		fireAnalyticsEvent
	}) else nil
	local v38 = if not FFlagTCVerifiedParentalControl then nil else React.useCallback(function() -- line: 129
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), FFlagTCUpdateProfileCTAButton (copy), t1 (copy), FFlagTCUnifyNavigationEntry (copy), v29 (copy), AppPage (copy), s1 (copy)
		fireAnalyticsEvent(EventNames.TrustedFriendsVPCPrologueOpened)

		local onRequestSent = nil

		if FFlagTCUpdateProfileCTAButton then
			if t1.onRequestSent then
				onRequestSent = t1.onRequestSent
			elseif t1.onRequestAccepted then
				onRequestSent = t1.onRequestAccepted
			end
		end

		if FFlagTCUnifyNavigationEntry then
			v29.replace(AppPage.TrustedFriendsVPCPrologue, {
				userId = s1,
				completionCallback = onRequestSent
			})

			return
		end

		t1.closeModal()
		v29.push(AppPage.TrustedFriendsVPCPrologue, {
			userId = s1,
			completionCallback = onRequestSent
		})
	end, {
		t1.closeModal,
		fireAnalyticsEvent,
		v29,
		s1,
		if not FFlagTCUpdateProfileCTAButton then nil else t1.onRequestSent,
		if not FFlagTCUpdateProfileCTAButton then nil else t1.onRequestAccepted
	})
	local v39 = React.useCallback(function() -- line: 166
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), t1 (copy), v33 (copy), NotificationModalsManager (copy)
		fireAnalyticsEvent(EventNames.TCUpsellAcceptTrustedConnectionClicked)

		if FFlagTCUnifyNavigationEntry then
			t1.showToast(v33.isATrustedConnectionNowToast)

			return
		end

		NotificationModalsManager.SetUIBloxToast({
			sequenceNumber = DateTime.now().UnixTimestamp,
			toastTitle = v33.isATrustedConnectionNowToast
		})
	end, {
		v33.isATrustedConnectionNowToast,
		fireAnalyticsEvent,
		if not FFlagTCUnifyNavigationEntry then nil else t1.showToast
	})
	local v40 = React.useCallback(function() -- line: 187
		-- upvalues: s3 (copy), TrustedConnectionStatus (copy), v24 (copy), s1 (copy), v39 (copy), t1 (copy), FFlagTCShareLinkReceiverUI (copy), Sources (copy), FFlagTCUpdateProfileCTAButton (copy), fireAnalyticsEvent (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), v33 (copy), NotificationModalsManager (copy)
		if s3 == TrustedConnectionStatus.RequestReceived then
			v24.acceptTrustedConnectionRequest(s1):andThen(function() -- line: 190
				-- upvalues: v39 (copy)
				v39()
			end):andThen(function() -- line: 193
				-- upvalues: t1 (copy)
				return t1.onRequestAccepted and t1.onRequestAccepted()
			end):andThen(function() -- line: 196
				-- upvalues: t1 (copy)
				t1.closeModal()
			end):catch(function() -- line: 199
				-- upvalues: t1 (copy)
				t1.showGenericErrorModal()
			end)

			return
		end

		if FFlagTCShareLinkReceiverUI and s3 == Sources.ShareLinkReceiver then
			v24.addTrustedFriendFromLink(s1, t1.tokens or {}):andThen(function() -- line: 204
				-- upvalues: v39 (copy)
				v39()
			end):andThen((if not FFlagTCUpdateProfileCTAButton then nil else function() -- line: 208
				-- upvalues: t1 (copy)
				return t1.onRequestAccepted and t1.onRequestAccepted()
			end)):andThen(function() -- line: 212
				-- upvalues: t1 (copy)
				t1.closeModal()
			end):catch(function() -- line: 215
				-- upvalues: t1 (copy)
				t1.showGenericErrorModal()
			end)

			return
		end

		v24.sendTrustedConnectionRequest(s1, (if not t1.sentFromQrCode then nil else "qr")):andThen(function() -- line: 223
			-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), t1 (copy), v33 (copy), NotificationModalsManager (copy)
			fireAnalyticsEvent(EventNames.TCUpsellAddTrustedConnectionClicked)

			if FFlagTCUnifyNavigationEntry then
				t1.showToast(v33.trustedConnectionRequestSentToast)

				return
			end

			NotificationModalsManager.SetUIBloxToast({
				sequenceNumber = DateTime.now().UnixTimestamp,
				toastTitle = v33.trustedConnectionRequestSentToast
			})
		end):andThen(function() -- line: 234
			-- upvalues: t1 (copy)
			return t1.onRequestSent and t1.onRequestSent()
		end):andThen(function() -- line: 237
			-- upvalues: t1 (copy)
			t1.closeModal()
		end):catch(function() -- line: 240
			-- upvalues: t1 (copy)
			t1.showGenericErrorModal()
		end)
	end, {
		t1.closeModal,
		s1,
		v33,
		t1.onRequestSent,
		t1.onRequestAccepted,
		t1.tokens,
		if not FFlagTCVerifiedParentalControl then if not t1.sentFromQrCode then nil else "qr" else nil,
		fireAnalyticsEvent,
		if not FFlagTCUnifyNavigationEntry then nil else t1.showToast
	})
	local v41 = React.useCallback(function() -- line: 262
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), t1 (copy)
		fireAnalyticsEvent(EventNames.TCUpsellCancelClicked)
		t1.closeModal()
	end, {
		t1.closeModal,
		fireAnalyticsEvent
	})
	local v42 = React.useCallback(function() -- line: 268
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), v24 (copy), s1 (copy), FFlagTCUnifyNavigationEntry (copy), t1 (copy), Contexts (copy), default (copy), v30 (copy), v33 (copy), NotificationModalsManager (copy)
		fireAnalyticsEvent(EventNames.TCUpsellAddViaLinkClicked)
		v24.createTrustedFriendLink(s1):andThen(function(p2) -- line: 271
			-- upvalues: FFlagTCUnifyNavigationEntry (copy), t1 (copy), Contexts (copy), default (copy)
			if FFlagTCUnifyNavigationEntry then
				t1.shareUrl({
					url = p2.responseBody.link,
					context = Contexts.TCUpsellModal
				})

				return
			end

			default:shareUrl({
				url = p2.responseBody.link,
				context = Contexts.TCUpsellModal
			})
		end):andThen(function() -- line: 284
			-- upvalues: t1 (copy)
			return t1.onRequestSent and t1.onRequestSent()
		end):andThen(function() -- line: 287
			-- upvalues: v30 (copy), FFlagTCUnifyNavigationEntry (copy), t1 (copy), v33 (copy), NotificationModalsManager (copy)
			if not v30 then
				if FFlagTCUnifyNavigationEntry then
					t1.showToast(v33.linkCopiedToast)
				else
					NotificationModalsManager.SetUIBloxToast({
						sequenceNumber = DateTime.now().UnixTimestamp,
						toastTitle = v33.linkCopiedToast
					})
				end
			end

			t1.closeModal()
		end):catch(function() -- line: 300
			-- upvalues: t1 (copy)
			t1.showGenericErrorModal()
			t1.closeModal()
		end)
	end, {
		t1.closeModal,
		t1.showGenericErrorModal,
		fireAnalyticsEvent,
		s1,
		v33,
		v30,
		if not FFlagTCUnifyNavigationEntry then nil else t1.shareUrl,
		if not FFlagTCUnifyNavigationEntry then nil else t1.showToast
	})
	local v43 = React.useMemo(function() -- line: 318
		-- upvalues: TrustedConnectionStatus (copy), v40 (copy), v41 (copy), FFlagTCModalUpdateButtons (copy), v36 (copy), v35 (copy), v37 (copy), Sources (copy), v42 (copy), FFlagTCShareLinkReceiverUI (copy)
		return {
			[TrustedConnectionStatus.Friends] = {
				primary = v40,
				secondary = v41
			},
			[TrustedConnectionStatus.RequestReceived] = {
				primary = v40,
				secondary = v41
			},
			[TrustedConnectionStatus.TrustedFriends] = if not FFlagTCModalUpdateButtons then {
				primary = v35,
				secondary = v37
			} else {
				primary = v36
			},
			[Sources.ShareLinkSender] = {
				primary = v42
			},
			[Sources.ShareLinkReceiver] = if not FFlagTCShareLinkReceiverUI then nil else {
				primary = v40,
				secondary = v41
			}
		}
	end, {
		v40,
		v41,
		if not FFlagTCModalUpdateButtons then v35 else nil,
		if not FFlagTCModalUpdateButtons then nil else v36,
		if not FFlagTCModalUpdateButtons then v37 else nil,
		v42,
		if not FFlagTCVerifiedParentalControl then nil else v38
	})[s3]

	if FFlagTCVerifiedParentalControl and t1.isVPCFlow and v43 then
		v43.primary = v38
	end

	return v43
end
