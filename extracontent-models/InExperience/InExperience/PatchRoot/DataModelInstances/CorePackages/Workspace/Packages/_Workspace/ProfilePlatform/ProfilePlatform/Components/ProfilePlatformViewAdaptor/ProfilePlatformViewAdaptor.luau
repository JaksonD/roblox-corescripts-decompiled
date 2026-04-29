local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local InputUi = require(ProfilePlatformParent.InputUi)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local RobloxAppHooks = require(ProfilePlatformParent.RobloxAppHooks)
local FormFactor = require(ProfilePlatformParent.FormFactor).Enums.FormFactor
local useScreenSize = RobloxAppHooks.useScreenSize
local useTopBarHeight = RobloxAppHooks.useTopBarHeight
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local ProfileTopBar = require(ProfilePlatform.Components.ProfileTopBar)
local useProfileFormFactor = require(ProfilePlatform.Hooks.useProfileFormFactor)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local useProfileScrollContext = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local useProfileCardWidth = require(ProfilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth2 = require(ProfilePlatformParent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local getPeekViewOpenHeightByProfileType = require(ProfilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local getSafeAreaSize = InputUi.getSafeAreaSize
local useProfilePeekViewHeight = require(ProfilePlatform.Hooks.useProfilePeekViewHeight)
local useShouldShowContextualInformation = require(ProfilePlatform.Hooks.useShouldShowContextualInformation)
local Constants = require(ProfilePlatform.Common.Constants)
local Presence = require(ProfilePlatform.Rodux.Presence)
local NetworkingPresence = require(ProfilePlatform.Networking.NetworkingPresence)
local convertPresenceEnum = require(ProfilePlatform.Utils.convertPresenceEnum)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useEffectOnMount = RoactUtils.Hooks.useEffectOnMount
local Enums = require(ProfilePlatform.Common.Enums)
local ProfileModalView = require(script.Parent.ProfileModalView)
local ProfileFullView = require(script.Parent.ProfileFullView)
local ProfilePlatformPage = require(ProfilePlatform.Components.ProfilePlatformPage)
local ProfilePeekView = require(script.Parent.ProfilePeekView)
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagProfilePlatformFixModalDimensions = require(ProfilePlatform.Flags.FFlagProfilePlatformFixModalDimensions)
local FFlagProfilePlatformEnableCoverPhoto = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCoverPhoto)
local FFlagProfilePlatformNewProfileHeader = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = require(ProfilePlatformParent.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon
local FFlagEnableMobileGameJoinCard = require(ProfilePlatformParent.SharedFlags).FFlagEnableMobileGameJoinCard

return function(_: {[any]: any}) -- line: 50
	-- upvalues: useProfileWrapperContext (copy), useProfileScrollContext (copy), useScreenSize (copy), useTopBarHeight (copy), FFlagEnableMobileGameJoinCard (copy), React (copy), useSelector (copy), FFlagProfilePlatformEnableCoverPhoto (copy), useProfileFormFactor (copy), Enums (copy), FormFactor (copy), ProfilePlatformPage (copy), ProfileTopBar (copy), getSafeAreaSize (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), useProfileCardWidth2 (copy), useProfileCardWidth (copy), Constants (copy), useDispatch (copy), useEffectOnMount (copy), NetworkingPresence (copy), Presence (copy), convertPresenceEnum (copy), useShouldShowContextualInformation (copy), useProfilePeekViewHeight (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), getPeekViewOpenHeightByProfileType (copy), ProfileFullView (copy), ProfileModalView (copy), ProfilePeekView (copy), FFlagProfilePlatformFixModalDimensions (copy)
	local v39 = useProfileWrapperContext()
	local v40 = useProfileScrollContext()
	local profileType = v39.profileType
	local previousView = v39.navigateTo.previousView
	local v43 = useScreenSize()
	local v44 = useTopBarHeight()
	local v45 = not not FFlagEnableMobileGameJoinCard and (v39.mountAsFullView or false)
	local v46 = React.useCallback(function() -- line: 61
		-- upvalues: previousView (copy)
		previousView(false)
	end, { previousView })
	local v47 = React.useCallback(function() -- line: 66
		-- upvalues: previousView (copy)
		previousView(true)
	end, { previousView })
	local v48 = useSelector(function(p1) -- line: 71
		return p1.GlobalGuiInset
	end)
	local v49 = if not FFlagProfilePlatformEnableCoverPhoto then useSelector(function(p2) -- line: 80
		return p2.FormFactor
	end) == FormFactor.WIDE else useProfileFormFactor().formFactor == Enums.ProfileFormFactor.Wide
	local v50 = React.useCallback(function() -- line: 87
		-- upvalues: React (copy), ProfilePlatformPage (copy)
		return React.createElement(ProfilePlatformPage, {})
	end, {})
	local v51 = React.useCallback(function() -- line: 91
		-- upvalues: React (copy), ProfileTopBar (copy), v46 (copy)
		return React.createElement(ProfileTopBar, {
			navigateBack = v46,
			transparentBackground = true,
			backgroundTransparency = nil
		})
	end, {})
	local v52 = getSafeAreaSize(v43, v48)
	local v53 = if not FFlagProfilePlatformNewProfileHeader then math.min(v52.X.Offset, Constants.MAXIMUM_CONTAINER_WIDTH) else if not FFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth(v49) else useProfileCardWidth2()
	local v54 = nil

	if FFlagProfilePlatformNewProfileHeader then
		local profileId = v39.profileId
		local v56 = useDispatch()

		useEffectOnMount(function() -- line: 111
			-- upvalues: v56 (copy), NetworkingPresence (copy), profileId (copy)
			v56(NetworkingPresence.GetPresencesFromUserIds.API({ profileId })):catch(function(_) -- line: 112
			end)
		end)

		local v57 = useSelector(function(p4) -- line: 115
			-- upvalues: Presence (copy), profileId (copy)
			return Presence.Selectors.getUserPresenceByUserId(p4, profileId) or {
				userPresenceType = Presence.Enums.PresenceType.Offline,
				lastLocation = ""
			}
		end)
		local v58 = convertPresenceEnum(v57.userPresenceType, v57.universeId)
		local v59 = useShouldShowContextualInformation(v58)

		v54 = useProfilePeekViewHeight(v53, v59)
	end

	local v60 = if not FFlagProfilePlatformNewProfileHeader or profileType ~= Enums.ProfileTypes.User then if not FFlagProfilePlatformEnableCommunityProfilePage then Constants.USER_PEEK_VIEW_OPEN_HEIGHT else getPeekViewOpenHeightByProfileType(profileType) else v54
	local v61 = if not (v60 > v52.Y.Offset - v44) then UDim.new(0, v60) else UDim.new(1, 0)

	if useProfileFormFactor().isFullView then
		return React.createElement(ProfileFullView, {
			renderContent = v50,
			navigateBack = v46
		})
	end

	if v49 then
		return React.createElement(ProfileModalView, {
			renderContent = v50,
			renderTopBar = v51,
			topBarHeight = v44,
			viewWidth = v53,
			navigateBack = v46
		})
	end

	return React.createElement(ProfilePeekView, {
		bottomDockedContainerHeight = 0,
		briefViewContentHeight = v61,
		contentSlot = v50(),
		fullViewContentHeight = UDim.new(1, 0),
		mountAsFullView = v45,
		onClosed = v47,
		onViewStateChanged = nil,
		topBarHeight = v44,
		topBarSlot = v51(),
		viewWidth = if not FFlagProfilePlatformFixModalDimensions then UDim.new(0, v53) else UDim.new(0, v52.X.Offset),
		transitionPercentCallback = function(n1: number) --[[ transitionPercentCallback ]] -- line: 176
			-- upvalues: v40 (copy)
			v40.setPeekViewOpenPercent(n1)
		end,
		profileType = if not FFlagProfilePlatformNewProfileHeader then nil else profileType
	})
end
