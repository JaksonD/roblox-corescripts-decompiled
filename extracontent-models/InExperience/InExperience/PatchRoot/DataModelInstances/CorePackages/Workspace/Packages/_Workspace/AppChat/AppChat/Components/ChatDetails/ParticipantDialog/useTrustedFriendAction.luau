local Parent = script:FindFirstAncestor("AppChat").Parent
local React = require(Parent.React)
local useLocalization = require(Parent.Localization).Hooks.useLocalization
local getTrustedFriendAction = require(script.Parent.getTrustedFriendAction)

return function(s1: string) --[[ useTrustedFriendAction ]] -- line: 23
	-- upvalues: React (copy), useLocalization (copy), getTrustedFriendAction (copy)
	local v6, v7 = React.useState(nil)
	local v8, v9 = React.useState(0)
	local v10 = useLocalization({
		addTrustedFriendText = "Feature.Friends.TrustedFriend.Label.AddTrustedFriend",
		acceptTrustedFriendText = "Feature.Friends.TrustedFriend.AcceptTrustedRequest",
		removeTrustedFriendText = "Feature.Friends.TrustedFriend.Action.RemoveTrustedFriend",
		removeTrustedFriendToastText = "Feature.Friends.TrustedFriend.Toast.TrustedFriendRemoved"
	})
	local v11 = React.useCallback(function() -- line: 35
		-- upvalues: v9 (copy)
		v9(function(p1) -- line: 36
			return p1 + 1
		end)
	end, {})

	React.useEffect(function() -- line: 41
		-- upvalues: s1 (copy), v7 (copy), getTrustedFriendAction (copy)
		if s1 == "" then
			v7(nil)

			return
		end

		local u14 = true

		v7(nil)
		getTrustedFriendAction(s1):andThen(function(p2) -- line: 54
			-- upvalues: u14 (ref), v7 (copy)
			if u14 then
				v7(p2)
			end
		end):catch(function() -- line: 59
			-- upvalues: u14 (ref), v7 (copy)
			if u14 then
				v7(nil)
			end
		end)

		return function() -- line: 65
			-- upvalues: u14 (ref)
			u14 = false
		end
	end, {
		s1,
		v8
	})

	local v12 = if v6 == nil then nil else v6.actionType
	local v13 = if v12 ~= "RemoveTrustedConnection" then if v12 ~= "AddIncomingTrustedConnection" then if v12 ~= "AddTrustedConnection" then nil else v10.addTrustedFriendText else v10.acceptTrustedFriendText else v10.removeTrustedFriendText

	return {
		action = v6,
		actionText = v13,
		toastText = v10.removeTrustedFriendToastText,
		refetch = v11
	}
end
