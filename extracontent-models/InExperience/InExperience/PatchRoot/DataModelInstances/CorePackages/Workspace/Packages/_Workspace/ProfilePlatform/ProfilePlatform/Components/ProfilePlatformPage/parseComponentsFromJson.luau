local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local Cryo = require(ProfilePlatformParent.Cryo)
local React = require(ProfilePlatformParent.React)
local UserProfileHeader = require(ProfilePlatform.Components.UserProfileHeader)
local About = require(ProfilePlatform.Components.About)
local ContactDescription = require(ProfilePlatform.Components.ContactDescription)
local ProfileActionBar = require(ProfilePlatform.Components.ProfileActionBar)
local CommunityProfileHeader = require(ProfilePlatform.Components.CommunityProfileHeader)
local CoverPhoto = require(ProfilePlatform.Components.CoverPhoto)
local CurrentlyWearing = require(ProfilePlatform.Components.CurrentlyWearing)
local Store = require(ProfilePlatform.Components.Store)
local ViewFullProfile = require(ProfilePlatform.Components.ViewFullProfile)
local Inventory = require(ProfilePlatform.Components.Inventory)
local FavoriteExperiences = require(ProfilePlatform.Components.FavoriteExperiences)
local ContactProfileHeader = require(ProfilePlatform.Components.ContactProfileHeader)
local Experiences = require(ProfilePlatform.Components.Experiences)
local ExperiencesWideCarousel = require(ProfilePlatform.Components.ExperiencesWideCarousel)
local SocialLinks = require(ProfilePlatform.Components.SocialLinks)
local Videos = require(ProfilePlatform.Components.Videos)
local CommunityLocked = require(ProfilePlatform.Components.CommunityLocked)
local Events = require(ProfilePlatform.Components.Events)
local ProfileCompletion = require(ProfilePlatform.Components.ProfileCompletion)
local CurrentlyPlaying = require(ProfilePlatform.Components.CurrentlyPlaying)
local CTARow = require(ProfilePlatform.Components.CTARow)
local Constants = require(ProfilePlatformParent.ProfilePlatform.Common.Constants)
local Enums = require(ProfilePlatformParent.ProfilePlatform.Common.Enums)
local getPeekViewOpenHeightByProfileType = require(ProfilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local FFlagProfilePlatformEnableFavoriteExperiences = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableFavoriteExperiences)
local FFlagProfilePlatformEnableStore = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagProfilePlatformEnableCommunityProfilePage = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCommunityProfilePage)
local FFlagProfilePlatformEnableInventory = require(ProfilePlatformParent.SharedFlags).FFlagProfilePlatformEnableInventory
local FFlagAddSocialLinksToCommunityProfile = require(ProfilePlatformParent.SharedFlags).FFlagAddSocialLinksToCommunityProfile
local FFlagAddVideoToCommunityProfile = require(ProfilePlatformParent.SharedFlags).FFlagAddVideoToCommunityProfile
local FFlagProfilePlatformEnableCoverPhoto = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableCoverPhoto)
local FFlagAddCommunityLockedToCommunityProfile = require(ProfilePlatformParent.SharedFlags).FFlagAddCommunityLockedToCommunityProfile
local FFlagExperiencesOnProfile = require(ProfilePlatformParent.SharedFlags).FFlagExperiencesOnProfile
local FFlagEnableProfileCompletion = require(ProfilePlatformParent.SharedFlags).FFlagEnableProfileCompletion
local FFlagProfilePlatformEnableLazyLoadingComponents = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local FFlagAddEventsToCommunityProfile = require(ProfilePlatform.Flags.FFlagAddEventsToCommunityProfile)
local FFlagProfilePlatformAddCurrentlyPlaying = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagAboutBeforeActionClient = require(ProfilePlatform.Flags.FFlagAboutBeforeActionClient)
local FFlagProfilePlatformCTAsRefactor = require(ProfilePlatform.Flags.FFlagProfilePlatformCTAsRefactor)

local function orderWithAboutBeforeActions(t1: {[any]: any}) -- line: 53
	-- upvalues: FFlagAboutBeforeActionClient (copy), Enums (copy), FFlagProfilePlatformAddCurrentlyPlaying (copy), Cryo (copy)
	if not FFlagAboutBeforeActionClient then
		return t1
	end

	local v49 = nil
	local v50 = nil
	local v51 = nil

	for i, v in ipairs(t1) do
		if v == Enums.Components.About then
			v49 = i
		elseif v == Enums.Components.Actions then
			v50 = i
		elseif FFlagProfilePlatformAddCurrentlyPlaying and v == Enums.Components.CurrentlyPlaying then
			v51 = i
		end
	end

	if v49 == nil or v50 == nil or v49 < v50 then
		return t1
	end

	local v54 = Cryo.List.join({}, t1)

	if FFlagProfilePlatformAddCurrentlyPlaying and v51 then
		local v55 = v54[v49]
		local v56 = v54[v51]
		local v57 = v54[v50]

		v54[v51] = v55
		v54[v50] = v56
		v54[v49] = v57

		return v54
	end

	local v58 = v54[v50]
	local v59 = v54[v49]

	v54[v49] = v58
	v54[v50] = v59

	return v54
end

local t2 = {
	[Enums.Components.UserProfileHeader] = UserProfileHeader,
	[Enums.Components.CurrentlyWearing] = CurrentlyWearing,
	[Enums.Components.Actions] = if not FFlagProfilePlatformCTAsRefactor then ProfileActionBar else CTARow,
	[Enums.Components.Experiences] = if not FFlagExperiencesOnProfile then Experiences else ExperiencesWideCarousel,
	[Enums.Components.ViewFullProfile] = ViewFullProfile,
	[Enums.Components.About] = About.About,
	[Enums.Components.FavoriteExperiences] = if not FFlagProfilePlatformEnableFavoriteExperiences then nil else FavoriteExperiences,
	[Enums.Components.Inventory] = if not FFlagProfilePlatformEnableInventory then nil else Inventory,
	[Enums.Components.Store] = if not FFlagProfilePlatformEnableStore then nil else Store,
	[Enums.Components.ProfileCompletion] = if not FFlagEnableProfileCompletion then nil else ProfileCompletion,
	[Enums.Components.CurrentlyPlaying] = if not FFlagProfilePlatformAddCurrentlyPlaying then nil else CurrentlyPlaying
}
local v46 = if not FFlagProfilePlatformEnableCommunityProfilePage then nil else {
	[Enums.Components.CoverPhoto] = if not FFlagProfilePlatformEnableCoverPhoto then nil else CoverPhoto,
	[Enums.Components.CommunityProfileHeader] = CommunityProfileHeader,
	[Enums.Components.About] = About.About,
	[Enums.Components.Actions] = if not FFlagProfilePlatformCTAsRefactor then ProfileActionBar else CTARow,
	[Enums.Components.Experiences] = Experiences,
	[Enums.Components.Store] = Store,
	[Enums.Components.SocialLinks] = if not FFlagAddSocialLinksToCommunityProfile then nil else SocialLinks,
	[Enums.Components.Videos] = if not FFlagAddVideoToCommunityProfile then nil else Videos,
	[Enums.Components.ViewFullProfile] = ViewFullProfile,
	[Enums.Components.CommunityLocked] = if not FFlagAddCommunityLockedToCommunityProfile then nil else CommunityLocked,
	[Enums.Components.Events] = if not FFlagAddEventsToCommunityProfile then nil else Events
}
local t3 = {
	[Enums.Components.ContactProfileHeader] = ContactProfileHeader,
	[Enums.Components.ContactDescription] = ContactDescription,
	[Enums.Components.Actions] = ProfileActionBar
}

return function(p1, p2, p3) -- line: 118
	-- upvalues: React (copy), Constants (copy), Cryo (copy), getPeekViewOpenHeightByProfileType (copy), Enums (copy), t2 (copy), FFlagProfilePlatformEnableCommunityProfilePage (copy), v46 (copy), t3 (copy), FFlagAboutBeforeActionClient (copy), orderWithAboutBeforeActions (copy), FFlagProfilePlatformEnableLazyLoadingComponents (copy)
	local v63 = p2 or {}
	local t4 = {
		Layout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, Constants.PAGE_PADDING)
		})
	}

	if Cryo.isEmpty(v63) then
		t4.loadingView = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, getPeekViewOpenHeightByProfileType(p3)),
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		})

		return t4
	end

	local t5 = {}

	if p3 == Enums.ProfileTypes.User then
		t5 = t2
	elseif FFlagProfilePlatformEnableCommunityProfilePage and p3 == Enums.ProfileTypes.Community then
		t5 = v46
	elseif p3 == Enums.ProfileTypes.Contact then
		t5 = t3
	end

	for v66, v67 in if not FFlagAboutBeforeActionClient or p3 ~= Enums.ProfileTypes.User then v63 else orderWithAboutBeforeActions(v63) do
		local v68 = t5[v67]

		if FFlagProfilePlatformEnableLazyLoadingComponents then
			if v68 ~= nil and p1[v67] ~= nil then
				t4[v67] = React.createElement(v68, {
					layoutOrder = v66
				})
			end
		elseif v68 ~= nil then
			t4[v67] = React.createElement(v68, {
				layoutOrder = v66
			})
		end
	end

	return t4
end
