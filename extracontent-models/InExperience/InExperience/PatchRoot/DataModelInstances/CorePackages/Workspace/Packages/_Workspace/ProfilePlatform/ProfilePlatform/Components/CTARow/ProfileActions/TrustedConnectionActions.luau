local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local UIBlox = require(ProfilePlatformParent.UIBlox)
local SharedFlags = require(ProfilePlatformParent.SharedFlags)
local RobloxAppEnums = require(ProfilePlatformParent.RobloxAppEnums)
local DataHydration = require(ProfilePlatformParent.DataHydration)
local SocialLuaAnalytics = require(ProfilePlatformParent.SocialLuaAnalytics)
local Images = UIBlox.App.ImageSet.Images
local AppPage = RobloxAppEnums.AppPage
local Sources = SocialLuaAnalytics.Analytics.Enums.Sources
local SetCurrentToastMessage = require(ProfilePlatformParent.ToastRodux).Actions.SetCurrentToastMessage
local NetworkingFriends = require(ProfilePlatform.Networking.NetworkingFriends)
local refreshProfilePlatformActionInfo = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local Enums = require(ProfilePlatform.Common.Enums)

require(ProfilePlatform.Components.CTARow.Types)

local EventNames = require(ProfilePlatform.Analytics.EventNames)
local ProfileTypes = Enums.ProfileTypes
local FFlagProfilePlatformAddTC = SharedFlags.FFlagProfilePlatformAddTC
local FFlagTCShareLinkSenderUI = SharedFlags.FFlagTCShareLinkSenderUI
local FFlagTCUnifyNavigationEntry = SharedFlags.FFlagTCUnifyNavigationEntry
local FFlagLegacyProfileTCIndicator = SharedFlags.FFlagLegacyProfileTCIndicator
local FFlagPendingIncomingTrustedConnection = require(ProfilePlatform.Flags.FFlagPendingIncomingTrustedConnection)
local v22 = if not FFlagLegacyProfileTCIndicator then nil else DataHydration.TrustedConnections.TrustedConnectionsStore.get()

return {
	[Enums.ProfileActions.RemoveTrustedConnection] = function(p1) -- line: 33
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), FFlagLegacyProfileTCIndicator (copy), v22 (copy), SetCurrentToastMessage (copy), Images (copy), refreshProfilePlatformActionInfo (copy), NetworkingFriends (copy)
		return {
			text = p1.localized[Enums.ProfileActions.RemoveTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 37
					-- upvalues: p1 (copy), EventNames (copy), FFlagLegacyProfileTCIndicator (copy), v22 (copy), SetCurrentToastMessage (copy), Images (copy), refreshProfilePlatformActionInfo (copy), NetworkingFriends (copy)
					p1.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonRemoveTrustedConnection, {
						buttonSurface = p1.buttonSurface
					})

					if FFlagLegacyProfileTCIndicator then
						return v22.removeTrustedConnectionRequest(p1.profileId):andThen(function() -- line: 42
							-- upvalues: p1 (copy), SetCurrentToastMessage (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
							p1.dispatch(SetCurrentToastMessage({
								toastMessage = p1.localized.trustedConnectionRemovedToast,
								toastIcon = Images["icons/actions/friends/friendRemove"],
								isLocalized = true
							}))

							return p1.dispatch(refreshProfilePlatformActionInfo(p1.profileId))
						end)
					end

					return p1.dispatch(NetworkingFriends.RemoveTC.API(p1.profileId)):andThen(function() -- line: 51
						-- upvalues: p1 (copy), SetCurrentToastMessage (copy), Images (copy), refreshProfilePlatformActionInfo (copy)
						p1.dispatch(SetCurrentToastMessage({
							toastMessage = p1.localized.trustedConnectionRemovedToast,
							toastIcon = Images["icons/actions/friends/friendRemove"],
							isLocalized = true
						}))

						return p1.dispatch(refreshProfilePlatformActionInfo(p1.profileId))
					end)
				end
			}
		}
	end,
	[Enums.ProfileActions.AddTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else function(p2) -- line: 66
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), Sources (copy), refreshProfilePlatformActionInfo (copy)
		return {
			text = p2.localized[Enums.ProfileActions.AddTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 70
					-- upvalues: p2 (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), Sources (copy), refreshProfilePlatformActionInfo (copy)
					p2.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p2.buttonSurface
					})

					if FFlagTCUnifyNavigationEntry then
						p2.navigation.push(AppPage.TrustedContactsModal, {
							props = {
								userId = p2.profileId,
								source = Sources.ProfilePlatform,
								onRequestSent = function() --[[ onRequestSent ]] -- line: 79
									-- upvalues: p2 (copy), refreshProfilePlatformActionInfo (copy)
									return p2.dispatch(refreshProfilePlatformActionInfo(p2.profileId))
								end
							}
						})

						return
					end

					p2.navigation.push(AppPage.TrustedContactsModal, {
						userId = p2.profileId,
						source = Sources.ProfilePlatform,
						onRequestSent = function() --[[ onRequestSent ]] -- line: 88
							-- upvalues: p2 (copy), refreshProfilePlatformActionInfo (copy)
							return p2.dispatch(refreshProfilePlatformActionInfo(p2.profileId))
						end
					})
				end
			}
		}
	end,
	[Enums.ProfileActions.AddTrustedConnectionViaLink] = if not FFlagTCShareLinkSenderUI then nil else function(p3) -- line: 100
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), Sources (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), refreshProfilePlatformActionInfo (copy)
		return {
			text = p3.localized[Enums.ProfileActions.AddTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 104
					-- upvalues: p3 (copy), EventNames (copy), Sources (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), refreshProfilePlatformActionInfo (copy)
					p3.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonAddTrustedConnection, {
						buttonSurface = p3.buttonSurface,
						modalVariantOverride = Sources.ShareLinkSender
					})

					if FFlagTCUnifyNavigationEntry then
						p3.navigation.push(AppPage.TrustedContactsModal, {
							props = {
								userId = p3.profileId,
								source = Sources.ProfilePlatform,
								modalVariantOverride = Sources.ShareLinkSender,
								onRequestSent = function() --[[ onRequestSent ]] -- line: 115
									-- upvalues: p3 (copy), refreshProfilePlatformActionInfo (copy)
									return p3.dispatch(refreshProfilePlatformActionInfo(p3.profileId))
								end
							}
						})

						return
					end

					p3.navigation.push(AppPage.TrustedContactsModal, {
						userId = p3.profileId,
						source = Sources.ProfilePlatform,
						modalVariantOverride = Sources.ShareLinkSender,
						onRequestSent = function() --[[ onRequestSent ]] -- line: 125
							-- upvalues: p3 (copy), refreshProfilePlatformActionInfo (copy)
							return p3.dispatch(refreshProfilePlatformActionInfo(p3.profileId))
						end
					})
				end
			}
		}
	end,
	[Enums.ProfileActions.AddIncomingTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else function(p4) -- line: 137
		-- upvalues: Enums (copy), ProfileTypes (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), refreshProfilePlatformActionInfo (copy)
		return {
			text = p4.localized[Enums.ProfileActions.AddIncomingTrustedConnection],
			onActivated = {
				[ProfileTypes.User] = function() -- line: 141
					-- upvalues: p4 (copy), EventNames (copy), FFlagTCUnifyNavigationEntry (copy), AppPage (copy), refreshProfilePlatformActionInfo (copy)
					p4.analytics.fireAnalyticsEvent(EventNames.ContextualMenuButtonAddIncomingTrustedConnection, {
						buttonSurface = p4.buttonSurface
					})

					if FFlagTCUnifyNavigationEntry then
						p4.navigation.push(AppPage.TrustedContactsModal, {
							props = {
								userId = p4.profileId,
								onRequestAccepted = function() --[[ onRequestAccepted ]] -- line: 152
									-- upvalues: p4 (copy), refreshProfilePlatformActionInfo (copy)
									return p4.dispatch(refreshProfilePlatformActionInfo(p4.profileId))
								end
							}
						})

						return
					end

					p4.navigation.push(AppPage.TrustedContactsModal, {
						userId = p4.profileId,
						onRequestAccepted = function() --[[ onRequestAccepted ]] -- line: 160
							-- upvalues: p4 (copy), refreshProfilePlatformActionInfo (copy)
							return p4.dispatch(refreshProfilePlatformActionInfo(p4.profileId))
						end
					})
				end
			}
		}
	end,
	[Enums.ProfileActions.PendingTrustedConnection] = if not FFlagProfilePlatformAddTC then nil else function(p5) -- line: 172
		-- upvalues: Enums (copy), ProfileTypes (copy)
		return {
			text = p5.localized[Enums.ProfileActions.AddTrustedConnection],
			isDisabled = true,
			onActivated = {
				[ProfileTypes.User] = function() -- line: 177
				end
			}
		}
	end,
	[Enums.ProfileActions.PendingIncomingTrustedConnection] = if not FFlagPendingIncomingTrustedConnection then nil else function(p6) -- line: 184
		-- upvalues: Enums (copy), ProfileTypes (copy)
		return {
			text = p6.localized[Enums.ProfileActions.AddIncomingTrustedConnection],
			isDisabled = true,
			onActivated = {
				[ProfileTypes.User] = function() -- line: 189
				end
			}
		}
	end
}
