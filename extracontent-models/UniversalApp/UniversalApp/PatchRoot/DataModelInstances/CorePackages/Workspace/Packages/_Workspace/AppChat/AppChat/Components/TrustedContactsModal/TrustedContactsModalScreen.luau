local Parent = script:FindFirstAncestor("AppChat").Parent
local React = require(Parent.React)
local Cryo = require(Parent.Cryo)
local TrustedContacts = require(Parent.TrustedContacts)
local AppTabBarRodux = require(Parent.AppTabBarRodux)
local RoactUtils = require(Parent.RoactUtils)
local SetTabBarVisibleFromChat = AppTabBarRodux.Thunks.SetTabBarVisibleFromChat
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local TrustedFriendsModalEntry = TrustedContacts.TrustedFriendsModalEntry

return function(t1: {[any]: any}) --[[ TrustedContactsModalScreen ]] -- line: 37
	-- upvalues: useDispatch (copy), React (copy), SetTabBarVisibleFromChat (copy), TrustedFriendsModalEntry (copy), Cryo (copy)
	local navigation = t1.navigation
	local v12 = navigation.getParam("props")
	local v13 = useDispatch()
	local v14 = React.useCallback(function() -- line: 42
		-- upvalues: navigation (copy)
		navigation.pop()
	end, { navigation })

	React.useEffect(function() -- line: 46
		-- upvalues: v13 (copy), SetTabBarVisibleFromChat (copy)
		v13(SetTabBarVisibleFromChat(false))

		return function() -- line: 48
			-- upvalues: v13 (copy), SetTabBarVisibleFromChat (copy)
			v13(SetTabBarVisibleFromChat(true))
		end
	end, { v13 })

	return React.createElement(TrustedFriendsModalEntry, Cryo.Dictionary.join(v12, {
		onClosed = v14
	}))
end
