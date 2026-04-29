local Squads = script:FindFirstAncestor("Squads")
local SquadsParent = Squads.Parent
local AppTopBanner = require(SquadsParent.AppTopBanner)
local AppTopBannerType = AppTopBanner.Enums.AppTopBannerType
local SetAppTopBanner = AppTopBanner.Actions.SetAppTopBanner
local dependencies = require(Squads.dependencies)
local Cryo = dependencies.Cryo
local React = dependencies.React
local SharedFlags = dependencies.SharedFlags
local EventNames = dependencies.SquadsCore.Analytics.EventNames
local SquadExternalContractContext = dependencies.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext
local SquadViewFlags = dependencies.SquadsCore.SquadExternalContractProvider.SquadViewFlags
local SquadRootViewType = dependencies.SquadsCore.Enums.SquadRootViewType
local dependencyArray = dependencies.Hooks.dependencyArray
local encodeSquadMembers = dependencies.SquadsCore.Common.encodeSquadMembers
local useCurrentSquadId = dependencies.SquadsCore.Hooks.useCurrentSquadId
local useCurrentSquadMembers = dependencies.SquadsCore.Hooks.useCurrentSquadMembers
local useCurrentSquadParentChannelId = dependencies.SquadsCore.Hooks.useCurrentSquadParentChannelId
local useDispatch = dependencies.Hooks.useDispatch
local useCanAccessParty = require(SquadsParent.Squads).Hooks.useCanAccessParty
local FFlagEnableSquadTopBannerWideMode = SharedFlags.FFlagEnableSquadTopBannerWideMode
local FFlagIntroduceTopBannerPartyStates = require(Squads.Flags.FFlagIntroduceTopBannerPartyStates)
local v23 = game:DefineFastFlag("FixSquadTopBannerMemo", false)
local FFlagIsSquadEnabledAMP = SharedFlags.FFlagIsSquadEnabledAMP
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern

return function() -- line: 36
	-- upvalues: useDispatch (copy), React (copy), SquadExternalContractContext (copy), useCurrentSquadId (copy), useCurrentSquadParentChannelId (copy), FFlagIntroduceTopBannerPartyStates (copy), useCurrentSquadMembers (copy), v23 (copy), Cryo (copy), encodeSquadMembers (copy), EventNames (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), FFlagIsSquadEnabledAMP (copy), useCanAccessParty (copy), FFlagEnableSquadTopBannerWideMode (copy), SquadRootViewType (copy), SetAppTopBanner (copy), AppTopBannerType (copy), SquadViewFlags (copy)
	local v26 = useDispatch()
	local v27 = React.useContext(SquadExternalContractContext)
	local v28 = useCurrentSquadId()
	local v29 = useCurrentSquadParentChannelId()
	local v30 = if not FFlagIntroduceTopBannerPartyStates then nil else useCurrentSquadMembers()
	local u31 = if not v23 then if not FFlagIntroduceTopBannerPartyStates or not v30 then {} else Cryo.List.map(v30, function(p1) -- line: 55
		return p1.userId
	end) else React.useMemo(function() -- line: 46
		-- upvalues: FFlagIntroduceTopBannerPartyStates (copy), v30 (copy), Cryo (copy)
		if FFlagIntroduceTopBannerPartyStates and v30 then
			return (Cryo.List.map(v30, function(p2) -- line: 48
				return p2.userId
			end))
		end

		return {}
	end, { if not FFlagIntroduceTopBannerPartyStates then nil else v30 })
	local v32 = if not FFlagIntroduceTopBannerPartyStates then nil else React.useRef(os.clock())
	local v33 = React.useCallback(function() -- line: 67
		-- upvalues: v27 (copy), v29 (copy), v26 (copy), FFlagIntroduceTopBannerPartyStates (copy), encodeSquadMembers (copy), v30 (copy), EventNames (copy), v28 (copy), v32 (copy)
		if v27.navigateIntoSquadLobby and v29 then
			v26(v27.navigateIntoSquadLobby({
				conversationId = v29
			}, true))
		end

		if FFlagIntroduceTopBannerPartyStates then
			local v42 = encodeSquadMembers(v30)

			v27.fireSquadAnalytics(EventNames.SquadTopBannerClicked, {
				squadId = v28,
				parentChannelId = v29,
				squadMembers = v42,
				timePassedSinceLastStateUpdatedInSec = os.clock() - v32.current
			})
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(if not FFlagIntroduceTopBannerPartyStates then nil else v28, v29, v26, v27.navigateIntoSquadLobby, if not FFlagIntroduceTopBannerPartyStates then nil else v27.fireSquadAnalytics, if not FFlagIntroduceTopBannerPartyStates then nil else v30) else {
		if not FFlagIntroduceTopBannerPartyStates then nil else v28,
		v29,
		v26,
		v27.navigateIntoSquadLobby,
		if not FFlagIntroduceTopBannerPartyStates then nil else v27.fireSquadAnalytics,
		if not FFlagIntroduceTopBannerPartyStates then nil else v30
	})
	local v34 = v27.useGetConversationFromId(v29)
	local v35 = v34 and v34.type
	local v36 = v34 and v34.participants
	local v37 = if not FFlagIsSquadEnabledAMP then nil else useCanAccessParty()
	local v38 = v27.useSquadRootView()

	if FFlagEnableSquadTopBannerWideMode then
		local v39 = v27.useSquadTopBannerDisabled()

		React.useEffect(function() -- line: 114
			-- upvalues: v28 (copy), v39 (copy), v38 (copy), SquadRootViewType (copy), FFlagIsSquadEnabledAMP (copy), v37 (copy), FFlagIntroduceTopBannerPartyStates (copy), v32 (copy), v26 (copy), SetAppTopBanner (copy), AppTopBannerType (copy), u31 (ref), v35 (copy), v36 (copy), v33 (copy)
			local v43 = v28 and (not v39 or v38 == SquadRootViewType.None)

			if if not FFlagIsSquadEnabledAMP then v43 else v37 and v43 then
				if FFlagIntroduceTopBannerPartyStates then
					v32.current = os.clock()
				end

				v26(SetAppTopBanner(true, AppTopBannerType.ActiveSquad, if not FFlagIntroduceTopBannerPartyStates then nil else {
					squadMemberList = u31,
					parentChannelType = v35,
					parentChannelParticipants = v36
				}, v33))

				return
			end

			v26(SetAppTopBanner(false, AppTopBannerType.None, nil))
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v28, if not FFlagIntroduceTopBannerPartyStates then nil else u31, v26, v33, v35, v36, v39, v38) else {
			v28,
			if not FFlagIntroduceTopBannerPartyStates then nil else u31,
			v26,
			v33,
			v35,
			v36,
			v39,
			v38
		})
	else
		local v40 = v27.useSquadViewFlags()

		React.useEffect(function() -- line: 171
			-- upvalues: v28 (copy), v40 (copy), SquadViewFlags (copy), v38 (copy), SquadRootViewType (copy), FFlagIsSquadEnabledAMP (copy), v37 (copy), FFlagIntroduceTopBannerPartyStates (copy), v32 (copy), v26 (copy), SetAppTopBanner (copy), AppTopBannerType (copy), u31 (ref), v35 (copy), v36 (copy), v33 (copy)
			local v44 = v28 and (bit32.band(v40, SquadViewFlags.SquadLobby) == 0 or v38 == SquadRootViewType.None)

			if if not FFlagIsSquadEnabledAMP then v44 else v37 and v44 then
				if FFlagIntroduceTopBannerPartyStates then
					v32.current = os.clock()
				end

				v26(SetAppTopBanner(true, AppTopBannerType.ActiveSquad, if not FFlagIntroduceTopBannerPartyStates then nil else {
					squadMemberList = u31,
					parentChannelType = v35,
					parentChannelParticipants = v36
				}, v33))

				return
			end

			v26(SetAppTopBanner(false, AppTopBannerType.None, nil))
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v28, if not FFlagIntroduceTopBannerPartyStates then nil else u31, v26, v33, v40, v35, v36, v38) else {
			v28,
			if not FFlagIntroduceTopBannerPartyStates then nil else u31,
			v26,
			v33,
			v40,
			v35,
			v36,
			v38
		})
	end

	return nil
end
