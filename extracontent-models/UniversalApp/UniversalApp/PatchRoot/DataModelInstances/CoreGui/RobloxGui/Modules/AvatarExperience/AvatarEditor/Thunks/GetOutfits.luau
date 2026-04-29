local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Promise = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local GetOutfit = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetOutfit)
local BatchGetOutfits = require(Modules.AvatarExperience.Common.Thunks.BatchGetOutfits)
local SetOwnedItemIdsBySubtype = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype)
local SetOutfitOrAsset = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset)
local SetPageFinished = require(Modules.AvatarExperience.AvatarEditor.Actions.SetPageFinished)
local Constants = require(Modules.AvatarExperience.AvatarEditor.Constants)
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local reportAvatarEventCounterNoAnalyticsArgument = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local Constants3 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLogging = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local AXCombineGetOutfitDispatchesIXP = require(Modules.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP)

require(Modules.LuaApp.Types.RoduxTypes)
require(Modules.AvatarExperience.Common.AvatarExperienceState)

local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = AvatarExperienceFlags.FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlags.FFlagAXInventoryDurablesSupport
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlags.FFlagAXEnableExpiredUserLookCheckout

local function v25(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) -- line: 41
	-- upvalues: Utils (copy), AXCombineGetOutfitDispatchesIXP (copy), IxpUtils (copy), GetOutfit (copy), FFlagAXInventoryDurablesSupport (copy), Constants (copy), SetPageFinished (copy), BatchGetOutfits (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), SetOutfitOrAsset (copy), SetOwnedItemIdsBySubtype (copy)
	local CurrentPage = p4:GetCurrentPage()
	local t1 = {}
	local t2 = {}

	for _, v45 in (Utils.tableToCamelCaseKeys(CurrentPage)) do
		local str = tostring(v45.id)

		t1[#t1 + 1] = str

		local v47 = p3:getState()

		if p10 or v47.AvatarExperience.AvatarEditor.OutfitInfos[str] == nil then
			if not p10 and AXCombineGetOutfitDispatchesIXP.isEnabled() and IxpUtils.readTestVariable(AXCombineGetOutfitDispatchesIXP.EnabledForUser) then
				table.insert(t2, str)
			else
				p3:dispatch(GetOutfit(str, nil, nil, if not FFlagAXInventoryDurablesSupport then nil else p9, p10))
			end
		end
	end

	local ReachedLastPage = nil

	if p4.IsFinished then
		ReachedLastPage = Constants.ReachedLastPage
		p3:dispatch(SetPageFinished(p7 or p1, p4.IsFinished))
	end

	p5:storePageObject(p1 .. "." .. tostring(p2) .. tostring(p8), p4)

	if AXCombineGetOutfitDispatchesIXP.isEnabled() and IxpUtils.readTestVariable(AXCombineGetOutfitDispatchesIXP.EnabledForUser) then
		p3:dispatch(BatchGetOutfits(t2, if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else p9))
	end

	p3:dispatch(SetOutfitOrAsset(t1, Constants.OutfitOrAsset.Outfit))
	p3:dispatch(SetOwnedItemIdsBySubtype(p1, t1))
	p6(ReachedLastPage)
end
local function advancePage(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21) -- line: 112
	-- upvalues: v25 (copy), Logging (copy)
	local ok, result = pcall(function() -- line: 125
		-- upvalues: p15 (copy)
		p15:AdvanceToNextPageAsync()
	end)

	if ok then
		v25(p11, p17, p12, p15, p16, p13, p18, p19, p20, p21)

		return
	end

	Logging.warn("GetOutfits failure: " .. result)
	p14(result)
end
local function fetchInitialPage(p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32) -- line: 148
	-- upvalues: v25 (copy), Logging (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLogging (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), Constants3 (copy)
	local ok, result = pcall(function() -- line: 161
		-- upvalues: p28 (copy), p27 (copy), p30 (copy)
		if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
			return p28:GetOutfitsAsync(p27, p30)
		end

		return p28:GetOutfits(p27, p30)
	end)

	if ok then
		v25(p22, p27, p23, result, p26, p24, p29, p30, p31, p32)

		return
	end

	Logging.warn("GetOutfits failure: " .. result)

	if GetFFlagEnableAvatarEditorServiceAPIErrorLogging() then
		reportAvatarEventCounterNoAnalyticsArgument(Constants3.Counter.AvatarEditorServiceErrors.GetOutfits)
	end

	p25(result)
end

return function(p33, p34, p35, p36, p37, p38, p39) -- line: 193
	-- upvalues: ArgCheck (copy), PerformFetch (copy), Constants2 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), Promise (copy), Constants (copy), advancePage (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), fetchInitialPage (copy)
	ArgCheck.isTypeOrNil(p34, "boolean", "GetOutfits thunk expects onlyEditableOutfits to be a boolean or nil")
	ArgCheck.isTypeOrNil(p36, "string", "GetOutfits thunk expects outfitType to be a string or nil")
	ArgCheck.isTypeOrNil(p38, "boolean", "GetOutfits thunk expects forceInitialPage to be a boolean or nil")
	ArgCheck.isTypeOrNil(p39, "boolean", "GetOutfits thunk expects forceRefresh to be a boolean or nil")

	local v82 = p35 or p33

	return function(p40, p41) -- line: 209
		-- upvalues: PerformFetch (copy), Constants2 (copy), v82 (copy), p34 (copy), p36 (copy), p33 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), p38 (copy), Promise (copy), Constants (copy), advancePage (copy), p35 (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), p37 (copy), p39 (copy), fetchInitialPage (copy)
		local pageObjectManager = p41.pageObjectManager
		local avatarEditorService = p41.avatarEditorService

		return PerformFetch.Single(Constants2.OutfitsKey .. v82, function(p42) -- line: 212
			-- upvalues: p34 (copy), p36 (copy), Constants2 (copy), p33 (copy), FFlagAXEnableExpiredUserLookCheckout (copy), p38 (copy), pageObjectManager (copy), Promise (copy), Constants (copy), advancePage (copy), p35 (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), p37 (copy), p39 (copy), fetchInitialPage (copy), avatarEditorService (copy)
			local u88 = if p34 ~= nil then if not p34 then Enum.OutfitSource.Purchased else Enum.OutfitSource.Created else Enum.OutfitSource.All
			local All = Enum.OutfitType.All

			if p36 == Constants2.OutfitTypes.Avatar then
				All = Enum.OutfitType.Avatar
			elseif p36 == Constants2.OutfitTypes.DynamicHead then
				All = Enum.OutfitType.DynamicHead
			elseif p36 == Constants2.OutfitTypes.Makeup then
				All = Enum.OutfitType.All
			end

			local v90 = p33
			local v91 = u88
			local v92 = All
			local v93 = v90 .. "." .. tostring(v91) .. tostring(v92)
			local v94 = if not FFlagAXEnableExpiredUserLookCheckout or not p38 then pageObjectManager:getPageObject(v93) else nil

			if v94 and v94.IsFinished then
				return Promise.resolve(Constants.ReachedLastPage)
			end

			return Promise.new(function(p43, p44) -- line: 244
				-- upvalues: v94 (copy), advancePage (copy), p33 (copy), p42 (copy), pageObjectManager (copy), u88 (ref), p35 (copy), All (ref), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), p37 (copy), p39 (copy), fetchInitialPage (copy), avatarEditorService (copy)
				if v94 ~= nil then
					advancePage(p33, p42, p43, p44, v94, pageObjectManager, u88, p35, All, if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else p37, p39)

					return
				end

				fetchInitialPage(p33, p42, p43, p44, pageObjectManager, u88, avatarEditorService, p35, All, if not FFlagAXModeratedItemsFlow and not FFlagAXEnableModeratedItemsFlowForDurables then nil else p37, p39)
			end)
		end)(p40)
	end
end
