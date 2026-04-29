local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent

require(ProfilePlatform.Components.CTARow.Types)

local Foundation = require(ProfilePlatformParent.Foundation)
local IconName = Foundation.Enums.IconName
local ButtonVariant = Foundation.Enums.ButtonVariant
local React = require(ProfilePlatformParent.React)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useEffectOnce = RoactUtils.Hooks.useEffectOnce
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local NavigateDown = require(ProfilePlatformParent.NavigationRodux).Thunks.NavigateDown
local NetworkingPresence = require(ProfilePlatform.Networking.NetworkingPresence)
local NetworkStatus = require(ProfilePlatform.Networking.myRoduxNetworking).Enum.NetworkStatus
local useProfileActions = require(ProfilePlatform.Hooks.useProfileActions)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local Enums = require(ProfilePlatform.Common.Enums)
local FFlagEnableProfilePlatformDisabledActions = require(ProfilePlatformParent.SharedFlags).FFlagEnableProfilePlatformDisabledActions
local FFlagEnableCommunityVerificationModal = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagPortEnableCommunityVerificationModal = require(ProfilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local FFlagEnableProfilePlatformDisabledReasonText = require(ProfilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local FFlagProfilePlatformAddCurrentlyPlaying = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)

local function profileMenuItemFromResolvedAction(p1, p2, p3) -- line: 39
	local v28 = p2.onActivated[p3]

	if not v28 then
		warn("profileMenuItemFromResolvedAction: action not available for profile type", p1, p3)

		return nil
	end

	return {
		id = p1,
		displayValue = {
			icon = p2.icon,
			text = p2.text
		},
		onActivated = v28,
		isDisabled = p2.isDisabled
	}
end
local function contextualMenuItemsFromJsonActions(t1: {[any]: any}?, t2: {[any]: any}, p4) -- line: 57
	-- upvalues: profileMenuItemFromResolvedAction (copy)
	local t3 = {}

	for _, v in ipairs(t1 or {}) do
		local t4 = {
			items = {}
		}

		for _, v2 in ipairs(v or {}) do
			local v38 = t2[v2]

			if v38 then
				local v39 = profileMenuItemFromResolvedAction(v2, v38, p4)

				if v39 then
					table.insert(t4.items, v39)
				end
			end
		end

		if #t4.items > 0 then
			table.insert(t3, t4)
		end
	end

	return t3
end

return function(s1: string) --[[ useMapJsonToButtonList ]] -- line: 91
	-- upvalues: useDispatch (copy), useProfileJsonComponent (copy), Enums (copy), useProfileActions (copy), useProfileWrapperContext (copy), useSelector (copy), NetworkingPresence (copy), NetworkStatus (copy), FFlagProfilePlatformAddCurrentlyPlaying (copy), React (copy), useEffectOnce (copy), contextualMenuItemsFromJsonActions (copy), FFlagEnableProfilePlatformDisabledActions (copy), FFlagEnableCommunityVerificationModal (copy), FFlagPortEnableCommunityVerificationModal (copy), IconName (copy), NavigateDown (copy), FFlagEnableProfilePlatformDisabledReasonText (copy), ButtonVariant (copy), profileMenuItemFromResolvedAction (copy)
	local v44 = useDispatch()
	local v45 = useProfileJsonComponent(Enums.Components.Actions) or {}
	local v46 = useProfileActions(Enums.ButtonSurface.Actions)
	local profileType = useProfileWrapperContext().profileType
	local v48 = useSelector(function(p5) -- line: 98
		-- upvalues: NetworkingPresence (copy), s1 (copy), NetworkStatus (copy)
		return NetworkingPresence.GetPresencesFromUserIds.getStatus(p5, s1) == NetworkStatus.NotStarted
	end)

	if FFlagProfilePlatformAddCurrentlyPlaying then
		React.useEffect(function() -- line: 103
			-- upvalues: v45 (copy), Enums (copy), v44 (copy), NetworkingPresence (copy), s1 (copy)
			if v45.buttons then
				local g58 = nil
				local v57 = nil

				for _, v56 in v45.buttons do
					if v56.type == Enums.ProfileActions.JoinExperience then
						v57 = true
						g58 = true
					end

					if g58 then
						break
					end
				end

				if not g58 then
					v57 = false
				end

				g58 = false

				if v57 then
					v44(NetworkingPresence.GetPresencesFromUserIds.API({ s1 }))
				end
			end
		end, {
			v45.buttons,
			v44,
			s1
		})
	else
		local v49 = useEffectOnce
		local v50 = false

		if v45.buttons ~= nil then
			local g53 = nil

			for _, v52 in v45.buttons do
				if v52.type == Enums.ProfileActions.JoinExperience then
					v50 = true
					g53 = true
				end

				if g53 then
					break
				end
			end

			if not g53 then
				v50 = false
			end

			g53 = false

			if v50 then
				v50 = v48
			end
		end

		v49(function() -- line: 109
			-- upvalues: v44 (copy), NetworkingPresence (copy), s1 (copy)
			v44(NetworkingPresence.GetPresencesFromUserIds.API({ s1 }))
		end, v50)
	end

	return (React.useMemo(function() -- line: 114
		-- upvalues: v45 (copy), v46 (copy), contextualMenuItemsFromJsonActions (copy), profileType (copy), FFlagEnableProfilePlatformDisabledActions (copy), FFlagEnableCommunityVerificationModal (copy), Enums (copy), FFlagPortEnableCommunityVerificationModal (copy), IconName (copy), v44 (copy), NavigateDown (copy), FFlagEnableProfilePlatformDisabledReasonText (copy), ButtonVariant (copy), profileMenuItemFromResolvedAction (copy)
		local t5 = {}

		for _, v in ipairs(v45.buttons or {}) do
			local v62 = v46[v.type]

			if not v62 then
				warn("useMapJsonToButtonList: unrecognized action type", v.type)
			else
				local v63 = table.clone(v62)
				local v64 = contextualMenuItemsFromJsonActions(v.subActions, v46, profileType)

				if FFlagEnableProfilePlatformDisabledActions and v.disabledReason then
					if FFlagEnableCommunityVerificationModal and v.type == Enums.ProfileActions.JoinCommunity and (v.disabledReason == Enums.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == Enums.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == Enums.DisabledReasons.InsufficientVerificationLevelHigh) then
						v63.icon = if not FFlagEnableCommunityVerificationModal or not FFlagPortEnableCommunityVerificationModal then nil else IconName.LockClosed
						v63.onActivated = {
							[profileType] = function() -- line: 142
								-- upvalues: v44 (copy), NavigateDown (copy), Enums (copy), v (copy)
								return v44(NavigateDown({
									name = Enums.Screens.CommunityVerificationModal,
									extraProps = {
										disabledReason = v.disabledReason
									}
								}))
							end
						}
					else
						v63.isDisabled = true
						v63.disabledReason = if not FFlagEnableProfilePlatformDisabledReasonText then nil else v.disabledReason
					end
				end

				local v65 = if #t5 ~= 0 or v63.isDisabled then ButtonVariant.Standard else v63.variant or ButtonVariant.Emphasis
				local v66 = profileMenuItemFromResolvedAction(v.type, v63, profileType)

				if v66 then
					table.insert(t5, {
						contextualMenuItems = v64,
						menuItem = v66,
						buttonStyle = v65,
						isLoading = v63.isLoading,
						disabledReason = v63.disabledReason
					})
				end
			end
		end

		local v67 = contextualMenuItemsFromJsonActions(v45.contextual, v46, profileType)

		if #v67 > 0 then
			table.insert(t5, {
				menuItem = {
					id = Enums.ProfileActions.ContextualOverflow,
					displayValue = {
						icon = IconName.ThreeDotsHorizontal
					},
					onActivated = function() --[[ onActivated ]] -- line: 187
					end
				},
				contextualMenuItems = v67,
				buttonStyle = ButtonVariant.Standard
			})
		end

		return t5
	end, {
		v45.buttons,
		v45.contextual,
		v46,
		v44,
		profileType
	}))
end
