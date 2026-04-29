local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local SharedFlags = require(TrustedContactsParent.SharedFlags)
local v5 = if not require(TrustedContactsParent.SharedFlags).FFlagTCWithAgePrecheck then require(script.Parent.TrustedContactsModalContainer) else require(script.Parent.TrustedFriendsCardPreChecksWrapper)
local FFlagTCShareLinkSenderUI = require(TrustedContactsParent.SharedFlags).FFlagTCShareLinkSenderUI
local FFlagTCShareLinkReceiverUI = require(TrustedContactsParent.SharedFlags).FFlagTCShareLinkReceiverUI
local FFlagTCUnifyNavigationEntry = require(TrustedContactsParent.SharedFlags).FFlagTCUnifyNavigationEntry
local FFlagTCModalUpdateButtons = require(TrustedContactsParent.SharedFlags).FFlagTCModalUpdateButtons

require(TrustedContacts.Common.Types)

return function(t1: {[any]: any}) -- line: 22
	-- upvalues: FFlagTCUnifyNavigationEntry (copy), FFlagTCShareLinkSenderUI (copy), FFlagTCShareLinkReceiverUI (copy), SharedFlags (copy), React (copy), v5 (copy), FFlagTCModalUpdateButtons (copy)
	local externalNavigation = nil
	local modalProps

	if FFlagTCUnifyNavigationEntry then
		modalProps = t1.screenProps.modalProps
		externalNavigation = t1.screenProps.externalNavigation
	else
		local navigation = t1.navigation

		modalProps = {
			userId = navigation.getParam("userId"),
			onRequestAccepted = navigation.getParam("onRequestAccepted"),
			onRequestSent = navigation.getParam("onRequestSent"),
			onClosed = navigation.getParam("onClosed"),
			source = navigation.getParam("source"),
			modalVariantOverride = if not FFlagTCShareLinkSenderUI and not FFlagTCShareLinkReceiverUI then nil else navigation.getParam("modalVariantOverride"),
			sentFromQrCode = if not SharedFlags.FFlagProfilePlatformTrustedConnectionsMVP then nil else navigation.getParam("sentFromQrCode"),
			tokens = if not FFlagTCShareLinkReceiverUI then nil else navigation.getParam("tokens")
		}
	end

	return React.createElement("ScreenGui", {
		Enabled = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 11
	}, { React.createElement(v5, {
		userId = modalProps.userId,
		onRequestAccepted = modalProps.onRequestAccepted,
		onRequestSent = modalProps.onRequestSent,
		source = modalProps.source,
		modalVariantOverride = modalProps.modalVariantOverride,
		sentFromQrCode = modalProps.sentFromQrCode,
		tokens = modalProps.tokens,
		isVerticallyConstrained = if not FFlagTCUnifyNavigationEntry then nil else modalProps.isVerticallyConstrained,
		onAcknowledged = if not FFlagTCUnifyNavigationEntry then nil else modalProps.onAcknowledged,
		onRemovedTrustedConnection = if not FFlagTCModalUpdateButtons then modalProps.onRemovedTrustedConnection else nil,
		onClosed = if not FFlagTCUnifyNavigationEntry then modalProps.onClosed else nil,
		externalNavigation = if not FFlagTCUnifyNavigationEntry then nil else externalNavigation
	}) })
end
