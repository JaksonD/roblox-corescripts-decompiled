local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local TrustedFriendsAgeCheckPrologue = require(script.Parent.TrustedFriendsAgeCheckPrologue)

require(TrustedContacts.Common.Types)

return function(t1: {[any]: any}) --[[ TrustedFriendsAgeCheckPrologueScreen ]] -- line: 11
	-- upvalues: React (copy), TrustedFriendsAgeCheckPrologue (copy)
	return React.createElement(TrustedFriendsAgeCheckPrologue, {
		externalNavigation = t1.screenProps.externalNavigation,
		navigation = t1.navigation
	})
end
