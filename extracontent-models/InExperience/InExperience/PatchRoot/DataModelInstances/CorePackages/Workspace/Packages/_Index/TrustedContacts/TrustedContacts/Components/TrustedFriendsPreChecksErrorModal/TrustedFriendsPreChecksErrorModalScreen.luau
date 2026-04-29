local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local TrustedFriendsPreChecksErrorModal = require(script.Parent.TrustedFriendsPreChecksErrorModal)

require(TrustedContacts.Common.Types)

return function(t1: {[any]: any}) --[[ TrustedFriendsPreChecksErrorModalScreen ]] -- line: 11
	-- upvalues: React (copy), TrustedFriendsPreChecksErrorModal (copy)
	return React.createElement(TrustedFriendsPreChecksErrorModal, {
		externalNavigation = t1.screenProps.externalNavigation,
		navigation = t1.navigation
	})
end
