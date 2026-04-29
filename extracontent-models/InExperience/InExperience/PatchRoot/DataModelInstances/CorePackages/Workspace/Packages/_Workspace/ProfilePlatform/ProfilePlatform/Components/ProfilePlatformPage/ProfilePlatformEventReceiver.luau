local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local AppNotificationService = require(ProfilePlatformParent.RoactServiceTags).AppNotificationService
local convertPresenceEnum = require(ProfilePlatform.Utils.convertPresenceEnum)
local Presence = require(ProfilePlatform.Rodux.Presence)
local PresenceType = Presence.Enums.PresenceType
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local refreshProfilePlatformUserInfo = require(ProfilePlatform.Networking.refreshProfilePlatformUserInfo)
local refreshProfilePlatformActionInfo = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local RobloxEventReceiver = require(ProfilePlatformParent.RealtimeDelivery).RobloxEventReceiver
local React = require(ProfilePlatformParent.React)
local RobloxAppHooks = require(ProfilePlatformParent.RobloxAppHooks)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local dependencyArray = RoactUtils.Hooks.dependencyArray
local useLocalUserId = RobloxAppHooks.useLocalUserId
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useRoactService = RobloxAppHooks.useRoactService
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local Enums = require(ProfilePlatform.Common.Enums)
local FFlagRemoveDependencyArrayAntipattern = require(ProfilePlatformParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern

return function() -- line: 30
	-- upvalues: useProfileWrapperContext (copy), useRoactService (copy), AppNotificationService (copy), React (copy), RobloxEventReceiver (copy), useDispatch (copy), useLocalUserId (copy), useSelector (copy), Presence (copy), PresenceType (copy), convertPresenceEnum (copy), Enums (copy), refreshProfilePlatformActionInfo (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), refreshProfilePlatformUserInfo (copy)
	local v21 = useProfileWrapperContext()
	local v22 = useRoactService(AppNotificationService)
	local v23 = React.useMemo(function() -- line: 33
		-- upvalues: RobloxEventReceiver (copy), v22 (copy)
		return RobloxEventReceiver.new(v22)
	end, { v22 })
	local v24 = useDispatch()
	local v25 = useLocalUserId()
	local profileId = v21.profileId
	local profileType = v21.profileType
	local v28 = useSelector(function(p1) -- line: 41
		-- upvalues: Presence (copy), profileId (copy), PresenceType (copy)
		return Presence.Selectors.getUserPresenceByUserId(p1, profileId) or {
			userPresenceType = PresenceType.Offline,
			lastLocation = ""
		}
	end)
	local v29 = convertPresenceEnum(v28.userPresenceType, v28.universeId)
	local v30 = React.useRef(v29)

	React.useEffect(function() -- line: 51
		-- upvalues: profileType (copy), Enums (copy), v30 (copy), v29 (copy), v24 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
		if profileType ~= Enums.ProfileTypes.User then
			return
		end

		if v30.current ~= v29 then
			if v30.current == Enums.PresenceTypes.InGame or v29 == Enums.PresenceTypes.InGame then
				v24(refreshProfilePlatformActionInfo(profileId))
			end

			v30.current = v29
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v29, v24, profileId, profileType) else {
		v29,
		v24,
		profileId,
		profileType
	})
	React.useEffect(function() -- line: 79
		-- upvalues: profileType (copy), Enums (copy), v23 (copy), profileId (copy), v24 (copy), refreshProfilePlatformUserInfo (copy)
		if profileType ~= Enums.ProfileTypes.User then
			return
		end

		local v32 = v23:observeEvent("UserProfileNotifications", function(p2) -- line: 84
			-- upvalues: profileId (copy), Enums (copy), v24 (copy), refreshProfilePlatformUserInfo (copy)
			local str = tostring(p2.VieweeUserId)
			local p2Type = p2.Type

			if str == profileId and (p2Type == Enums.NameTypes.DisplayName or p2Type == Enums.NameTypes.Alias or p2Type == Enums.NameTypes.Username) then
				v24(refreshProfilePlatformUserInfo(str))
			end
		end)

		return function() -- line: 99
			-- upvalues: v32 (copy)
			v32:disconnect()
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v23, v24, profileId, profileType) else {
		v23,
		v24,
		profileId,
		profileType
	})
	React.useEffect(function() -- line: 114
		-- upvalues: profileType (copy), Enums (copy), v23 (copy), v25 (copy), profileId (copy), v24 (copy), refreshProfilePlatformActionInfo (copy)
		if profileType ~= Enums.ProfileTypes.User then
			return
		end

		local v33 = v23:observeEvent("FriendshipNotifications", function(p3) -- line: 119
			-- upvalues: v25 (copy), profileId (copy), v24 (copy), refreshProfilePlatformActionInfo (copy)
			if ((if tostring(v25) ~= tostring(p3.EventArgs.UserId1) then tostring(p3.EventArgs.UserId1) else tostring(p3.EventArgs.UserId2))) == profileId then
				v24(refreshProfilePlatformActionInfo(profileId))
			end
		end)

		return function() -- line: 129
			-- upvalues: v33 (copy)
			v33:disconnect()
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v23, v24, profileId, v25, profileType) else {
		v23,
		v24,
		profileId,
		v25,
		profileType
	})
end
