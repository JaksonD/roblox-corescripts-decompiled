local Squads = script:FindFirstAncestor("Squads")
local SquadsParent = Squads.Parent
local getStandardSizeAvatarHeadShotRbxthumb = require(SquadsParent.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local useLocalUserId = require(SquadsParent.RobloxAppHooks).useLocalUserId
local Cryo = require(SquadsParent.Cryo)
local UserProfiles = require(SquadsParent.UserProfiles)
local HorizontalFacepileGroup = require(Squads.Common.HorizontalFacepileGroup)
local dependencies = require(Squads.dependencies)
local FFlagIntroduceTopBannerPartyStates = require(Squads.Flags.FFlagIntroduceTopBannerPartyStates)

require(Squads.Enums.SquadActivityEnum)

local dependencyArray = dependencies.Hooks.dependencyArray
local Foundation = dependencies.Foundation
local React = dependencies.React
local SharedFlags = dependencies.SharedFlags
local SquadCoordinationUIChangesExperimentation = dependencies.SocialExperiments.SquadCoordinationUIChangesExperimentation
local SquadsCore = dependencies.SquadsCore
local useLocalization = dependencies.Hooks.useLocalization
local Constants = SquadsCore.Common.Constants
local SquadExternalContractContext = SquadsCore.SquadExternalContractProvider.SquadExternalContractContext
local useCurrentSquadParentChannelId = SquadsCore.Hooks.useCurrentSquadParentChannelId
local useTokens = Foundation.Hooks.useTokens
local View = Foundation.View
local FFlagDebugAppChatEnableDomLocators = SharedFlags.FFlagDebugAppChatEnableDomLocators
local GetFFlagEnableCrossExpVoice = SharedFlags.GetFFlagEnableCrossExpVoice
local useLastActiveParticipant = nil

if GetFFlagEnableCrossExpVoice() then
	useLastActiveParticipant = require(SquadsParent.CrossExperienceVoice).Hooks.useLastActiveParticipant
end

local FFlagRemoveDependencyArrayAntipattern = dependencies.SharedFlags.FFlagRemoveDependencyArrayAntipattern

function SquadTopBanner(t1: {[any]: any}) -- line: 56
	-- upvalues: React (copy), SquadCoordinationUIChangesExperimentation (copy), FFlagIntroduceTopBannerPartyStates (copy), GetFFlagEnableCrossExpVoice (copy), useLastActiveParticipant (ref), useTokens (copy), useCurrentSquadParentChannelId (copy), SquadExternalContractContext (copy), useLocalUserId (copy), Constants (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), UserProfiles (copy), useLocalization (copy), Cryo (copy), getStandardSizeAvatarHeadShotRbxthumb (copy), Foundation (copy), FFlagDebugAppChatEnableDomLocators (copy), View (copy), HorizontalFacepileGroup (copy)
	React.useEffect(function() -- line: 57
		-- upvalues: SquadCoordinationUIChangesExperimentation (copy)
		if SquadCoordinationUIChangesExperimentation.isLogExposureEnabled then
			SquadCoordinationUIChangesExperimentation.logExposure()
		end
	end, {})

	local v27 = if not FFlagIntroduceTopBannerPartyStates or not GetFFlagEnableCrossExpVoice() then nil else useLastActiveParticipant()
	local v28 = v27 and v27.userId or nil
	local v29 = useTokens()
	local v30 = if not FFlagIntroduceTopBannerPartyStates then useCurrentSquadParentChannelId() else nil
	local v31 = if not FFlagIntroduceTopBannerPartyStates then React.useContext(SquadExternalContractContext) else nil
	local v32 = if not FFlagIntroduceTopBannerPartyStates then v31.useParentChannelTitleSelector(v30 or "") or "" else ""
	local v33 = useLocalUserId()
	local u34 = nil
	local v35 = React.useMemo(function() -- line: 85
		-- upvalues: t1 (copy), Constants (copy), v33 (copy)
		if t1.parentChannelType == Constants.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and t1.parentChannelParticipants then
			for _, v in ipairs(t1.parentChannelParticipants) do
				if v ~= v33 then
					return v
				end
			end
		end

		return ""
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(t1.parentChannelParticipants, t1.parentChannelType, v33) else {
		t1.parentChannelParticipants,
		t1.parentChannelType,
		v33
	})
	local v36 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = v35 ~= "" and { v35 } or {},
		query = UserProfiles.Queries.userProfilesCombinedNameByUserIds
	})

	if v36.data then
		u34 = UserProfiles.Selectors.getCombinedNameFromId(v36.data, v35 or "") or ""
	end

	local u37 = not t1.parentChannelType or t1.parentChannelType == Constants.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and (v35 ~= "" and not u34)
	local v38 = nil
	local v39 = nil

	if FFlagIntroduceTopBannerPartyStates then
		local v40 = useLocalization({
			waitingForOthers = "Feature.Squads.Label.WaitingForOthers",
			numberInTheParty = "Feature.Squads.Label.PartyCountStatus",
			loading = "Feature.Squads.Label.Loading",
			waitingForCombinedName = "Feature.Squads.Label.WaitingForCombinedName"
		})

		v38 = React.useMemo(function() -- line: 131
			-- upvalues: u37 (ref), v40 (copy), t1 (copy), Constants (copy), u34 (ref)
			if u37 then
				return v40.loading
			end

			if t1.parentChannelType == Constants.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and u34 and #t1.squadMemberList < 2 then
				return v40.waitingForCombinedName:gsub("{(.-)}", {
					combinedName = u34
				})
			end

			if t1.parentChannelType == Constants.CONVERSATION_CHANNEL_GROUP_TYPE and #t1.squadMemberList < 2 then
				return v40.waitingForOthers
			end

			return v40.numberInTheParty:gsub("{(.-)}", {
				partyCount = tostring(#t1.squadMemberList)
			})
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(u37, v40, u34, t1.parentChannelType, t1.squadMemberList) else {
			u37,
			v40,
			u34,
			t1.parentChannelType,
			t1.squadMemberList
		})

		local v41 = React.useCallback(function() -- line: 171
			-- upvalues: v33 (copy), t1 (copy)
			local t2 = {}

			if v33 == "-1" or not t1.squadMemberList then
				return t2
			end

			for _, v in ipairs(t1.squadMemberList) do
				if tostring(v) ~= v33 then
					table.insert(t2, (tostring(v)))
				end
			end

			table.insert(t2, v33)

			return t2
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(t1.squadMemberList) else { t1.squadMemberList })

		v39 = React.useMemo(function() -- line: 193
			-- upvalues: v41 (copy), Cryo (copy), getStandardSizeAvatarHeadShotRbxthumb (copy)
			local v47 = v41()

			return Cryo.List.map(v47, function(p1) -- line: 196
				-- upvalues: getStandardSizeAvatarHeadShotRbxthumb (copy)
				return getStandardSizeAvatarHeadShotRbxthumb(p1)
			end)
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v41) else { v41 })
	end

	return React.createElement(Foundation.View, {
		Size = UDim2.new(1, 0, 1, 0),
		backgroundStyle = v29.Color.None,
		testId = if not FFlagDebugAppChatEnableDomLocators then nil else Constants.SQUAD_TOP_BANNER_TEST_ID,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, v29.Gap.Small),
			VerticalAlignment = Enum.VerticalAlignment.Center
		}
	}, {
		Icon = if FFlagIntroduceTopBannerPartyStates then nil else React.createElement("Frame", {
			Size = UDim2.fromOffset(20, 20),
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, { React.createElement(Foundation.Icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = 28,
			name = "three-people",
			style = v29.Color.Extended.Gray.Gray_100
		}) }),
		HorizontalFacepileGroup = if not FFlagIntroduceTopBannerPartyStates then nil else React.createElement(View, {
			tag = "auto-xy",
			BackgroundTransparency = 1,
			LayoutOrder = 1
		}, { React.createElement(HorizontalFacepileGroup, {
			avatarSize = v29.Size.Size_600,
			images = v39
		}) }),
		Title = React.createElement(Foundation.Text, {
			AutomaticSize = Enum.AutomaticSize.XY,
			textStyle = v29.Color.Extended.Gray.Gray_100,
			fontStyle = v29.Typography.TitleMedium,
			backgroundStyle = v29.Color.None,
			LayoutOrder = 2,
			Text = if not FFlagIntroduceTopBannerPartyStates then v32 else v38,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}, {
			UIFlexItem = React.createElement("UIFlexItem", {
				FlexMode = Enum.UIFlexMode.Fill
			})
		}),
		Avatar = if FFlagIntroduceTopBannerPartyStates or not v28 then nil else React.createElement(Foundation.Image, {
			LayoutOrder = 3,
			Size = UDim2.fromOffset(24, 24),
			backgroundStyle = v29.Color.Extended.Gray.Gray_700,
			cornerRadius = UDim.new(0, v29.Radius.Circle),
			Image = getStandardSizeAvatarHeadShotRbxthumb((tostring(v28)))
		})
	})
end

return React.memo(SquadTopBanner)
