local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Promise = require(CorePackages.Packages.Promise)
local SetOutfitInfo = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo)
local OutfitInfo = require(Modules.AvatarExperience.AvatarEditor.Models.OutfitInfo)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local SetAssetInfoFromOutfitDetails = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails)
local ReceivedBundleInfoForTryOn = require(Modules.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn)
local UpdateSortOrderDueToLCBundleLoaded = require(Modules.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded)

require(Modules.LuaApp.Types.RoduxTypes)
require(Modules.AvatarExperience.Common.AvatarExperienceState)

local SetOutfitOrAsset = require(Modules.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset)
local Constants2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local mutedError = require(Modules.LuaApp.mutedError)
local reportAvatarEventCounterNoAnalyticsArgument = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument
local Constants3 = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagEnableAvatarEditorServiceAPIErrorLogging = require(Modules.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging)
local v20 = game:DefineFastFlag("AXSilenceGetOutfitMutedError", false)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXEnableModeratedItemsFlowForDurables = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables
local FFlagAXEnableExpiredUserLookCheckout = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableExpiredUserLookCheckout
local WebApi = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)

return function(s1: string, n1: number?, s2: string?, p1, b1: boolean?) -- line: 60
	-- upvalues: ArgCheck (copy), PerformFetch (copy), Constants (copy), FFlagAXEnableExpiredUserLookCheckout (copy), Promise (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), WebApi (copy), Utils (copy), OutfitInfo (copy), SetAssetInfoFromOutfitDetails (copy), SetOutfitInfo (copy), SetOutfitOrAsset (copy), Constants2 (copy), ReceivedBundleInfoForTryOn (copy), UpdateSortOrderDueToLCBundleLoaded (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLogging (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), Constants3 (copy), Logging (copy), v20 (copy), mutedError (copy)
	ArgCheck.isType(s1, "string", "GetOutfit thunk expects outfitId to be a string")
	ArgCheck.isTypeOrNil(b1, "boolean", "GetOutfit thunk expects forceRefresh to be a boolean or nil")

	return function(p2, p3) -- line: 69
		-- upvalues: PerformFetch (copy), s1 (copy), Constants (copy), FFlagAXEnableExpiredUserLookCheckout (copy), b1 (copy), Promise (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), p1 (copy), WebApi (copy), Utils (copy), OutfitInfo (copy), n1 (copy), SetAssetInfoFromOutfitDetails (copy), SetOutfitInfo (copy), SetOutfitOrAsset (copy), Constants2 (copy), s2 (copy), ReceivedBundleInfoForTryOn (copy), UpdateSortOrderDueToLCBundleLoaded (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLogging (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), Constants3 (copy), Logging (copy), v20 (copy), mutedError (copy)
		local avatarEditorService = p3.avatarEditorService
		local Single = PerformFetch.Single
		local v38 = s1

		return Single(Constants.OutfitInfoKey .. tostring(v38), function(p4) -- line: 71
			-- upvalues: FFlagAXEnableExpiredUserLookCheckout (copy), b1 (copy), s1 (copy), Promise (copy), FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), p1 (copy), avatarEditorService (copy), WebApi (copy), Utils (copy), OutfitInfo (copy), n1 (copy), SetAssetInfoFromOutfitDetails (copy), SetOutfitInfo (copy), SetOutfitOrAsset (copy), Constants2 (copy), s2 (copy), ReceivedBundleInfoForTryOn (copy), UpdateSortOrderDueToLCBundleLoaded (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLogging (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), Constants3 (copy), Logging (copy), v20 (copy), mutedError (copy)
			local v40 = p4:getState()

			if (not FFlagAXEnableExpiredUserLookCheckout or not b1) and v40.AvatarExperience.AvatarEditor.OutfitInfos[s1] then
				return Promise.resolve()
			end

			return Promise.new(function(p5, p6) -- line: 81
				-- upvalues: FFlagAXModeratedItemsFlow (copy), FFlagAXEnableModeratedItemsFlowForDurables (copy), p1 (copy), avatarEditorService (copy), s1 (copy), WebApi (copy), Utils (copy), OutfitInfo (copy), n1 (copy), v40 (copy), p4 (copy), SetAssetInfoFromOutfitDetails (copy), SetOutfitInfo (copy), SetOutfitOrAsset (copy), Constants2 (copy), s2 (copy), ReceivedBundleInfoForTryOn (copy), UpdateSortOrderDueToLCBundleLoaded (copy), GetFFlagEnableAvatarEditorServiceAPIErrorLogging (copy), reportAvatarEventCounterNoAnalyticsArgument (copy), Constants3 (copy), Logging (copy), v20 (copy), mutedError (copy)
				local v43 = FFlagAXModeratedItemsFlow or FFlagAXEnableModeratedItemsFlowForDurables
				local ok, result = pcall(function() -- line: 84
					-- upvalues: v43 (copy), p1 (copy), avatarEditorService (copy), s1 (copy), WebApi (copy), p6 (copy)
					if not v43 or not p1 then
						if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
							return avatarEditorService:GetOutfitDetailsAsync(tonumber(s1) or 0)
						end

						return avatarEditorService:GetOutfitDetails(tonumber(s1) or 0)
					end

					local v59, v60 = WebApi.GetOutfit(p1, s1, {
						checkAssetAvailability = true
					}):await()

					if not v59 then
						return p6(`AvatarEditorWebApi failure in GetOutfit: { tostring(v60) }`)
					end

					return v60[1]
				end)

				if ok then
					local v46 = Utils.tableToCamelCaseKeys(result)

					if v46 then
						if not v43 or not p1 then
							v46.bodyColor3s = {}

							if v46.bodyColors then
								for v47, v48 in v46.bodyColors do
									v46.bodyColor3s[v47 .. "3"] = v48:ToHex()
								end

								v46.bodyColors = nil
							end
						end

						local t1 = {}
						local assets = v46.assets
						local t2 = {}
						local v52 = OutfitInfo.fromWebApi(s1, n1, v46)

						if assets then
							for _, v54 in assets do
								local str = tostring(v54.assetType.id)
								local str2 = tostring(v54.id)

								t1[str] = t1[str] or {}
								table.insert(t1[str], str2)

								local v57 = v40.AvatarExperience.Common.AssetInfos[str2]

								if not v57 or (not v57.receivedFromOutfitDetails or v57.outfitModerationStatus == Enum.ModerationStatus.NotReviewed) then
									t2[#t2 + 1] = v54
								end
							end
						end

						if #t2 > 0 then
							p4:dispatch(SetAssetInfoFromOutfitDetails(t2, v52.moderationStatus))
						end

						p4:dispatch(SetOutfitInfo(v52))

						local OutfitOrAsset = v40.AvatarExperience.AvatarEditor.Character.OutfitOrAsset

						if OutfitOrAsset and not OutfitOrAsset[s1] then
							p4:dispatch(SetOutfitOrAsset({ (tostring(s1)) }, Constants2.OutfitOrAsset.Outfit))
						end

						if s2 then
							p4:dispatch(ReceivedBundleInfoForTryOn(s2, (tostring(s1))))
							p4:dispatch(UpdateSortOrderDueToLCBundleLoaded(s2))
						end
					end

					p5(result)

					return
				end

				if GetFFlagEnableAvatarEditorServiceAPIErrorLogging() then
					reportAvatarEventCounterNoAnalyticsArgument(Constants3.Counter.AvatarEditorServiceErrors.GetOutfitDetails)
				end

				Logging.warn("AvatarEditorService failure in GetOutfitDetails for id " .. s1)

				if not v20 then
					mutedError(`[AvatarExperience] Error fetching outfit details for ID { s1 }. Reason: { tostring(result) }`)
				end

				p6(`AvatarEditorService failure in GetOutfitDetails for outfit ID { s1 }: { tostring(result) }`)
			end)
		end)(p2)
	end
end
