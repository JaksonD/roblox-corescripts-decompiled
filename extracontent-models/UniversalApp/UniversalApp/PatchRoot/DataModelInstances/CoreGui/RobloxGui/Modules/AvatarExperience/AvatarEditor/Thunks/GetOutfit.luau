local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(l_CorePackages_0.Packages.Promise);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitInfo);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Models.OutfitInfo);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromOutfitDetails);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.ReceivedBundleInfoForTryOn);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.UpdateSortOrderDueToLCBundleLoaded);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v17 = require(l_Modules_0.LuaApp.mutedError);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v19 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v21 = game:DefineFastFlag("AXSilenceGetOutfitMutedError", false);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local v24 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local function _(v25) --[[ Line: 40 ]] --[[ Name: keyMapper ]]
    -- upvalues: v8 (copy)
    return v8.OutfitInfoKey .. tostring(v25);
end;
local function _(v27, v28) --[[ Line: 44 ]] --[[ Name: checkAssetExists ]]
    local v29 = v27.AvatarExperience.Common.AssetInfos[v28];
    if v29 and v29.receivedFromOutfitDetails then
        if v29.outfitModerationStatus == Enum.ModerationStatus.NotReviewed then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return function(v31, v32, v33, v34) --[[ Line: 58 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v8 (copy), v5 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v24 (copy), v9 (copy), v7 (copy), v10 (copy), v6 (copy), v15 (copy), v16 (copy), v11 (copy), v12 (copy), v20 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v19 (copy), l_Logging_0 (copy), v21 (copy), v17 (copy)
    v3.isType(v31, "string", "GetOutfit thunk expects outfitId to be a string");
    return function(v35, v36) --[[ Line: 60 ]]
        -- upvalues: l_PerformFetch_0 (ref), v31 (copy), v8 (ref), v5 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v34 (copy), v24 (ref), v9 (ref), v7 (ref), v32 (copy), v10 (ref), v6 (ref), v15 (ref), v16 (ref), v33 (copy), v11 (ref), v12 (ref), v20 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v19 (ref), l_Logging_0 (ref), v21 (ref), v17 (ref)
        local l_avatarEditorService_0 = v36.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v31_0 = v31;
        return l_Single_0(v8.OutfitInfoKey .. tostring(l_v31_0), function(v40) --[[ Line: 62 ]]
            -- upvalues: v31 (ref), v5 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v34 (ref), l_avatarEditorService_0 (copy), v24 (ref), v9 (ref), v7 (ref), v32 (ref), v10 (ref), v6 (ref), v15 (ref), v16 (ref), v33 (ref), v11 (ref), v12 (ref), v20 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v19 (ref), l_Logging_0 (ref), v21 (ref), v17 (ref)
            local v41 = v40:getState();
            if v41.AvatarExperience.AvatarEditor.OutfitInfos[v31] then
                return v5.resolve();
            else
                return v5.new(function(v42, v43) --[[ Line: 67 ]]
                    -- upvalues: l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v34 (ref), l_avatarEditorService_0 (ref), v31 (ref), v24 (ref), v9 (ref), v7 (ref), v32 (ref), v41 (copy), v40 (copy), v10 (ref), v6 (ref), v15 (ref), v16 (ref), v33 (ref), v11 (ref), v12 (ref), v20 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v19 (ref), l_Logging_0 (ref), v21 (ref), v17 (ref)
                    local v44 = l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
                        -- upvalues: v44 (copy), v34 (ref), l_avatarEditorService_0 (ref), v31 (ref), v24 (ref), v43 (copy)
                        if not v44 or not v34 then
                            if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                                return l_avatarEditorService_0:GetOutfitDetailsAsync(tonumber(v31) or 0);
                            else
                                return l_avatarEditorService_0:GetOutfitDetails(tonumber(v31) or 0);
                            end;
                        else
                            local v45, v46 = v24.GetOutfit(v34, v31, {
                                checkAssetAvailability = true
                            }):await();
                            if not v45 then
                                return v43((("AvatarEditorWebApi failure in GetOutfit: %*"):format((tostring(v46)))));
                            else
                                return v46[1];
                            end;
                        end;
                    end);
                    if l_status_0 then
                        local v49 = v9.tableToCamelCaseKeys(l_result_0);
                        if v49 then
                            if not v44 or not v34 then
                                v49.bodyColor3s = {};
                                if v49.bodyColors then
                                    for v50, v51 in v49.bodyColors do
                                        v49.bodyColor3s[v50 .. "3"] = v51:ToHex();
                                    end;
                                    v49.bodyColors = nil;
                                end;
                            end;
                            local v52 = {};
                            local l_assets_0 = v49.assets;
                            local v54 = {};
                            local v55 = v7.fromWebApi(v31, v32, v49);
                            if l_assets_0 then
                                for _, v57 in l_assets_0 do
                                    local v58 = tostring(v57.assetType.id);
                                    local v59 = tostring(v57.id);
                                    v52[v58] = v52[v58] or {};
                                    table.insert(v52[v58], v59);
                                    local v60 = v41.AvatarExperience.Common.AssetInfos[v59];
                                    if not if v60 and v60.receivedFromOutfitDetails then v60.outfitModerationStatus ~= Enum.ModerationStatus.NotReviewed else false then
                                        v54[#v54 + 1] = v57;
                                    end;
                                end;
                            end;
                            if #v54 > 0 then
                                v40:dispatch(v10(v54, v55.moderationStatus));
                            end;
                            v40:dispatch(v6(v55));
                            local l_OutfitOrAsset_0 = v41.AvatarExperience.AvatarEditor.Character.OutfitOrAsset;
                            if l_OutfitOrAsset_0 and not l_OutfitOrAsset_0[v31] then
                                v40:dispatch(v15({
                                    (tostring(v31))
                                }, v16.OutfitOrAsset.Outfit));
                            end;
                            if v33 then
                                v40:dispatch(v11(v33, (tostring(v31))));
                                v40:dispatch(v12(v33));
                            end;
                        end;
                        v42(l_result_0);
                        return;
                    else
                        if v20() then
                            l_reportAvatarEventCounterNoAnalyticsArgument_0(v19.Counter.AvatarEditorServiceErrors.GetOutfitDetails);
                        end;
                        l_Logging_0.warn("AvatarEditorService failure in GetOutfitDetails for id " .. v31);
                        if not v21 then
                            v17((("[AvatarExperience] Error fetching outfit details for ID %*. Reason: %*"):format(v31, (tostring(l_result_0)))));
                        end;
                        v43((("AvatarEditorService failure in GetOutfitDetails for outfit ID %*: %*"):format(v31, (tostring(l_result_0)))));
                        return;
                    end;
                end);
            end;
        end)(v35);
    end;
end;