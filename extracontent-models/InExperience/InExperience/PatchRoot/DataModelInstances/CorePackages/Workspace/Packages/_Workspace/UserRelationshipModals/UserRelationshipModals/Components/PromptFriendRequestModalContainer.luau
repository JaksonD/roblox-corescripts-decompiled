local Players = game:GetService("Players")
local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local UserRelationshipModalsParent = UserRelationshipModals.Parent
local React = require(UserRelationshipModalsParent.React)
local Signals = require(UserRelationshipModalsParent.Signals)
local SignalsReact = require(UserRelationshipModalsParent.SignalsReact)
local useDispatch = require(UserRelationshipModalsParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(UserRelationshipModalsParent.RobloxAppHooks).useLocalUserId
local UserProfiles = require(UserRelationshipModalsParent.UserProfiles)
local FriendsNetworking = require(UserRelationshipModalsParent.FriendsNetworking)
local myFriendsNetworking = require(UserRelationshipModals.Networking.myFriendsNetworking)
local FriendshipOriginSourceType = FriendsNetworking.Enums.FriendshipOriginSourceType
local useLocalization = require(UserRelationshipModalsParent.Localization).Hooks.useLocalization
local NotificationModalsManager = require(UserRelationshipModalsParent.NotificationModalsManager)
local PromptFriendRequestModal = require(script.Parent.PromptFriendRequestModal)

function triggerToast(s1: string) -- line: 27
	-- upvalues: NotificationModalsManager (copy)
	NotificationModalsManager.SetUIBloxToast({
		toastTitle = s1,
		sequenceNumber = DateTime.now().UnixTimestamp
	})
end

local v16 = UserProfiles.Stores.UserProfileStore.get()

return function(t1: {[any]: any}) --[[ PromptFriendRequestModalContainer ]] -- line: 42
	-- upvalues: useDispatch (copy), useLocalUserId (copy), useLocalization (copy), React (copy), Signals (copy), v16 (copy), SignalsReact (copy), Players (copy), myFriendsNetworking (copy), FriendshipOriginSourceType (copy), PromptFriendRequestModal (copy)
	local v19 = useDispatch()
	local v20 = useLocalUserId()
	local v21 = useLocalization({
		friendRequestSent = "Feature.Friends.Action.FriendRequestSent",
		somethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
	})
	local v22 = React.useMemo(function() -- line: 51
		-- upvalues: Signals (copy), v16 (copy), t1 (copy)
		return Signals.createComputed(function(p1) -- line: 52
			-- upvalues: v16 (copy), t1 (copy)
			local v29 = v16.fetchNamesByUserIds({ (tostring(t1.userId)) })(p1)
			local v30 = v29 and (v29.data and v29.data[1])
			local v31 = v30 and v30.names

			return {
				combinedName = not v31 and "" or v31.getCombinedName(p1),
				username = not v31 and "" or v31.getUsername()
			}
		end)
	end, { t1.userId })
	local v23 = SignalsReact.useSignalState(v22)
	local v24 = React.useCallback(function() -- line: 66
		-- upvalues: Players (copy), t1 (copy), v21 (copy), v19 (copy), myFriendsNetworking (copy), v20 (copy), FriendshipOriginSourceType (copy)
		local PlayerByUserId = Players:GetPlayerByUserId(t1.userId)

		if Players.LocalPlayer ~= nil and PlayerByUserId ~= nil then
			local ok, _ = pcall(function() -- line: 74
				-- upvalues: Players (copy), PlayerByUserId (copy)
				Players.LocalPlayer:RequestFriendship(PlayerByUserId)
			end)

			triggerToast(if ok ~= nil then v21.somethingWentWrong else v21.friendRequestSent)
		else
			v19(myFriendsNetworking.RequestFriendshipFromUserId.API({
				currentUserId = v20,
				targetUserId = tostring(t1.userId),
				friendshipOriginSourceType = FriendshipOriginSourceType.InGame.rawValue()
			})):andThen(function() -- line: 84
				-- upvalues: v21 (copy)
				triggerToast(v21.friendRequestSent)
			end):catch(function(_) -- line: 87
				-- upvalues: v21 (copy)
				triggerToast(v21.somethingWentWrong)
			end)
		end

		t1.onClose()
	end, {
		v20,
		t1.userId,
		v19,
		t1.onClose,
		v21.friendRequestSent,
		v21.somethingWentWrong
	})

	return React.createElement(PromptFriendRequestModal, {
		userId = t1.userId,
		displayName = v23.combinedName,
		username = v23.username,
		onClose = t1.onClose,
		onSendClicked = v24,
		inputDelay = t1.inputDelay
	})
end
