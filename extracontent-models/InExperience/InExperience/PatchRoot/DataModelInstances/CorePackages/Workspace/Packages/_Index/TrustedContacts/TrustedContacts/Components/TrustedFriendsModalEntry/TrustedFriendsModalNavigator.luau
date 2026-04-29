local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local RoactNavigation = require(TrustedContactsParent.RoactNavigation)
local AppPage = require(TrustedContactsParent.RobloxAppEnums).AppPage
local FFlagTCWithAgePrecheck = require(TrustedContactsParent.SharedFlags).FFlagTCWithAgePrecheck
local t1 = {
	{
		[AppPage.TrustedFriendsUserModal] = {
			getScreen = function() --[[ getScreen ]] -- line: 17
				-- upvalues: TrustedContacts (copy)
				return require(TrustedContacts.Components.TrustedContactsModal).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	},
	{
		[AppPage.TrustedFriendsVPCPrologue] = {
			getScreen = function() --[[ getScreen ]] -- line: 29
				-- upvalues: TrustedContacts (copy)
				return require(TrustedContacts.Components.TrustedFriendsVPCPrologue).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	}
}

if FFlagTCWithAgePrecheck then
	table.insert(t1, {
		[AppPage.TrustedFriendsAgeCheckPrologue] = {
			getScreen = function() --[[ getScreen ]] -- line: 44
				-- upvalues: TrustedContacts (copy)
				return require(TrustedContacts.Components.TrustedFriendsAgeCheckPrologue).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	})
	table.insert(t1, {
		[AppPage.TrustedFriendsPreChecksErrorModal] = {
			getScreen = function() --[[ getScreen ]] -- line: 56
				-- upvalues: TrustedContacts (copy)
				return require(TrustedContacts.Components.TrustedFriendsPreChecksErrorModal).Screen
			end,
			navigationOptions = {
				renderUnderlyingPage = true,
				disableBackButton = true,
				overlayEnabled = true
			}
		}
	})
end

return (RoactNavigation.createRobloxStackNavigator(t1, {
	initialRouteName = AppPage.TrustedFriendsUserModal,
	keepVisitedScreensMounted = false,
	backBehavior = RoactNavigation.BackBehavior.History
}))
