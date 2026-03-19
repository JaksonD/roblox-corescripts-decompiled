local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Models.OutfitInfo);
local v4 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v6 = require(l_Modules_0.AvatarExperience.Common.Actions.OutfitInformationReceived);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v13 = game:DefineFastFlag("AXSilenceCombineGetOutfitDispatchesMutedError2", false);
local v14 = game:DefineFastInt("AXCombineGetOutfitDispatchesChunkSize", 3);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableModeratedItemsFlowForDurables;
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local function _(v18, v19) --[[ Line: 44 ]] --[[ Name: getShouldRefetchAsset ]]
    local v20 = v18.AvatarExperience.Common.AssetInfos[v19];
    if v20 and v20.receivedFromOutfitDetails then
        if v20.outfitModerationStatus == Enum.ModerationStatus.NotReviewed then
            return false;
        else
            return true;
        end;
    else
        return false;
    end;
end;
local function v43(v22, v23, v24, v25) --[[ Line: 58 ]] --[[ Name: getOutfit ]]
    -- upvalues: v2 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v17 (copy), v12 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v11 (copy), v4 (copy), v3 (copy)
    local l_avatarEditorService_0 = v23.avatarEditorService;
    local v27 = v22:getState();
    if v27.AvatarExperience.AvatarEditor.OutfitInfos[v24] then
        return v2.resolve();
    else
        return v2.new(function(v28, v29) --[[ Line: 67 ]]
            -- upvalues: l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v25 (copy), l_avatarEditorService_0 (copy), v24 (copy), v17 (ref), v12 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v11 (ref), v4 (ref), v27 (copy), v3 (ref)
            local v30 = l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 69 ]]
                -- upvalues: v30 (copy), v25 (ref), l_avatarEditorService_0 (ref), v24 (ref), v17 (ref), v29 (copy)
                if not v30 or not v25 then
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_avatarEditorService_0:GetOutfitDetailsAsync(tonumber(v24) or 0);
                    else
                        return l_avatarEditorService_0:GetOutfitDetails(tonumber(v24) or 0);
                    end;
                else
                    local v31, v32 = v17.GetOutfit(v25, v24, {
                        checkAssetAvailability = true
                    }):await();
                    if not v31 then
                        v29((("AvatarEditorWebApi failure in GetOutfit: %*"):format((tostring(v32)))));
                    end;
                    return v32[1];
                end;
            end);
            if not l_status_0 then
                if v12() then
                    l_reportAvatarEventCounterNoAnalyticsArgument_0(v11.Counter.AvatarEditorServiceErrors.GetOutfitDetails);
                end;
                return v29((("AvatarEditorService failure in GetOutfitDetails: %*"):format((tostring(l_result_0)))));
            else
                local v35 = v4.tableToCamelCaseKeys(l_result_0);
                if not v35 then
                    return v29("AvatarEditorService returned no data for GetOutfitDetails");
                else
                    if not v30 or not v25 then
                        v35.bodyColor3s = {};
                        if v35.bodyColors then
                            for v36, v37 in v35.bodyColors do
                                v35.bodyColor3s[("%*3"):format(v36)] = v37:ToHex();
                            end;
                            v35.bodyColors = nil;
                        end;
                    end;
                    local v38 = {};
                    if v35.assets then
                        for v39, v40 in v35.assets do
                            local v41 = v27.AvatarExperience.Common.AssetInfos[v39];
                            if not if v41 and v41.receivedFromOutfitDetails then v41.outfitModerationStatus ~= Enum.ModerationStatus.NotReviewed else false then
                                v38[#v38 + 1] = v40;
                            end;
                        end;
                    end;
                    local v42 = v3.fromWebApi(v24, nil, v35);
                    v28({
                        outfitId = v24, 
                        outfitInfo = v42, 
                        assetsToUpdate = v38, 
                        moderationStatus = v42.moderationStatus
                    });
                    return;
                end;
            end;
        end);
    end;
end;
local function _(v44, v45) --[[ Line: 143 ]] --[[ Name: failureHandler ]]
    -- upvalues: v13 (copy), v9 (copy)
    if not v13 then
        v9((("[AvatarExperience] Error fetching outfit details for ID %*. Reason: %*"):format(v44, (tostring(v45)))));
    end;
    return nil;
end;
local function v54(v47, v48) --[[ Line: 150 ]] --[[ Name: processPromises ]]
    -- upvalues: v2 (copy), v6 (copy)
    return v2.allSettled(v48):andThen(function(v49) --[[ Line: 151 ]]
        -- upvalues: v2 (ref), v48 (copy), v47 (copy), v6 (ref)
        local v50 = {};
        for v51, v52 in v49 do
            if v52 == v2.Status.Resolved then
                local v53 = v48[v51]:expect();
                if v52 == v2.Status.Resolved and v53 then
                    v50[v53.outfitId] = v53;
                end;
            end;
        end;
        if next(v50) then
            v47:dispatch(v6(v50));
        end;
    end);
end;
local function v60(v55, v56) --[[ Line: 170 ]] --[[ Name: splitTableIntoChunks ]]
    local v57 = {};
    for v58 = 1, #v55, v56 do
        local v59 = {};
        table.move(v55, v58, math.min(v58 + v56 - 1, #v55), 1, v59);
        table.insert(v57, v59);
    end;
    return v57;
end;
return function(v61, v62) --[[ Line: 180 ]]
    -- upvalues: v43 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v13 (copy), v9 (copy), v60 (copy), v14 (copy), v2 (copy), v54 (copy)
    return function(v63, v64) --[[ Line: 181 ]]
        -- upvalues: v61 (copy), v43 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v62 (copy), v13 (ref), v9 (ref), v60 (ref), v14 (ref), v2 (ref), v54 (ref)
        local v65 = {};
        for _, v67 in v61 do
            table.insert(v65, (v43(v63, v64, v67, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v62 else nil):catch(function(v68) --[[ Line: 189 ]]
                -- upvalues: v67 (copy), v13 (ref), v9 (ref)
                local l_v67_0 = v67;
                if not v13 then
                    v9((("[AvatarExperience] Error fetching outfit details for ID %*. Reason: %*"):format(l_v67_0, (tostring(v68)))));
                end;
                return nil;
            end)));
        end;
        local v70 = v60(v65, v14);
        local v71 = v2.resolve();
        for _, v73 in v70 do
            v71 = v71:andThen(function() --[[ Line: 200 ]]
                -- upvalues: v54 (ref), v63 (copy), v73 (copy)
                return v54(v63, v73);
            end);
        end;
        return v71;
    end;
end;