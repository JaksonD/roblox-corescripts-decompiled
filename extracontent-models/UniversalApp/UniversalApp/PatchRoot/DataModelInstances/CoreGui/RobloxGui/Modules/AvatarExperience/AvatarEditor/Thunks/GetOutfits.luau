local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v6 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfit);
local v8 = require(l_Modules_0.AvatarExperience.Common.Thunks.BatchGetOutfits);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOutfitOrAsset);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v15 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v19 = require(l_Modules_0.AvatarExperience.Experiments.AXCombineGetOutfitDispatchesIXP);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXEnableModeratedItemsFlowForDurables_0 = v15.FFlagAXEnableModeratedItemsFlowForDurables;
local l_FFlagAXInventoryDurablesSupport_0 = v15.FFlagAXInventoryDurablesSupport;
local function _(v25, v26, v27) --[[ Line: 36 ]]
    return v25 .. "." .. tostring(v26) .. tostring(v27);
end;
local function v45(v29, v30, v31, v32, v33, v34, v35, v36, v37) --[[ Line: 40 ]]
    -- upvalues: v14 (copy), v19 (copy), v6 (copy), v7 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v12 (copy), v11 (copy), v8 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v10 (copy), v9 (copy)
    local l_v32_CurrentPage_0 = v32:GetCurrentPage();
    l_v32_CurrentPage_0 = v14.tableToCamelCaseKeys(l_v32_CurrentPage_0);
    local v39 = {};
    local v40 = {};
    for _, v42 in l_v32_CurrentPage_0 do
        local v43 = tostring(v42.id);
        v39[#v39 + 1] = v43;
        if v31:getState().AvatarExperience.AvatarEditor.OutfitInfos[v43] == nil then
            if v19.isEnabled() and v6.readTestVariable(v19.EnabledForUser) then
                table.insert(v40, v43);
            else
                v31:dispatch(v7(v43, nil, nil, if l_FFlagAXInventoryDurablesSupport_0 then v37 else nil));
            end;
        end;
    end;
    local v44 = nil;
    if v32.IsFinished then
        v44 = v12.ReachedLastPage;
        v31:dispatch(v11(v35 or v29, v32.IsFinished));
    end;
    v33:storePageObject(v29 .. "." .. tostring(v30) .. tostring(v36), v32);
    if v19.isEnabled() and v6.readTestVariable(v19.EnabledForUser) then
        v31:dispatch(v8(v40, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v37 else nil));
    end;
    v31:dispatch(v10(v39, v12.OutfitOrAsset.Outfit));
    v31:dispatch(v9(v29, v39));
    v34(v44);
end;
local function v58(v46, v47, v48, v49, v50, v51, v52, v53, v54, v55) --[[ Line: 103 ]] --[[ Name: advancePage ]]
    -- upvalues: v45 (copy), l_Logging_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 115 ]]
        -- upvalues: v50 (copy)
        v50:AdvanceToNextPageAsync();
    end);
    if l_status_0 then
        v45(v46, v52, v47, v50, v51, v48, v53, v54, v55);
        return;
    else
        l_Logging_0.warn("GetOutfits failure: " .. l_result_0);
        v49(l_result_0);
        return;
    end;
end;
local function v71(v59, v60, v61, v62, v63, v64, v65, v66, v67, v68) --[[ Line: 137 ]] --[[ Name: fetchInitialPage ]]
    -- upvalues: v45 (copy), l_Logging_0 (copy), v18 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v17 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 149 ]]
        -- upvalues: v65 (copy), v64 (copy), v67 (copy)
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return v65:GetOutfitsAsync(v64, v67);
        else
            return v65:GetOutfits(v64, v67);
        end;
    end);
    if l_status_1 then
        v45(v59, v64, v60, l_result_1, v63, v61, v66, v67, v68);
        return;
    else
        l_Logging_0.warn("GetOutfits failure: " .. l_result_1);
        if v18() then
            l_reportAvatarEventCounterNoAnalyticsArgument_0(v17.Counter.AvatarEditorServiceErrors.GetOutfits);
        end;
        v62(l_result_1);
        return;
    end;
end;
return function(v72, v73, v74, v75, v76) --[[ Line: 180 ]]
    -- upvalues: v5 (copy), l_PerformFetch_0 (copy), v13 (copy), v3 (copy), v12 (copy), v58 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (copy), v71 (copy)
    v5.isTypeOrNil(v73, "boolean", "GetOutfits thunk expects onlyEditableOutfits to be a boolean or nil");
    v5.isTypeOrNil(v75, "string", "GetOutfits thunk expects outfitType to be a string or nil");
    local v77 = v74 or v72;
    return function(v78, v79) --[[ Line: 191 ]]
        -- upvalues: l_PerformFetch_0 (ref), v13 (ref), v77 (copy), v73 (copy), v75 (copy), v72 (copy), v3 (ref), v12 (ref), v58 (ref), v74 (copy), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v76 (copy), v71 (ref)
        local l_pageObjectManager_0 = v79.pageObjectManager;
        local l_avatarEditorService_0 = v79.avatarEditorService;
        return l_PerformFetch_0.Single(v13.OutfitsKey .. v77, function(v82) --[[ Line: 194 ]]
            -- upvalues: v73 (ref), v75 (ref), v13 (ref), l_pageObjectManager_0 (copy), v72 (ref), v3 (ref), v12 (ref), v58 (ref), v74 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v76 (ref), v71 (ref), l_avatarEditorService_0 (copy)
            local v83 = nil;
            v83 = if v73 == nil then Enum.OutfitSource.All else if v73 then Enum.OutfitSource.Created else Enum.OutfitSource.Purchased;
            local l_All_0 = Enum.OutfitType.All;
            if v75 == v13.OutfitTypes.Avatar then
                l_All_0 = Enum.OutfitType.Avatar;
            elseif v75 == v13.OutfitTypes.DynamicHead then
                l_All_0 = Enum.OutfitType.DynamicHead;
            elseif v75 == v13.OutfitTypes.Makeup then
                l_All_0 = Enum.OutfitType.All;
            end;
            local v85 = l_pageObjectManager_0:getPageObject(v72 .. "." .. tostring(v83) .. tostring(l_All_0));
            if v85 and v85.IsFinished then
                return v3.resolve(v12.ReachedLastPage);
            else
                return v3.new(function(v86, v87) --[[ Line: 219 ]]
                    -- upvalues: v85 (copy), v58 (ref), v72 (ref), v82 (copy), l_pageObjectManager_0 (ref), v83 (ref), v74 (ref), l_All_0 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), l_FFlagAXEnableModeratedItemsFlowForDurables_0 (ref), v76 (ref), v71 (ref), l_avatarEditorService_0 (ref)
                    if v85 ~= nil then
                        v58(v72, v82, v86, v87, v85, l_pageObjectManager_0, v83, v74, l_All_0, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v76 else nil);
                        return;
                    else
                        v71(v72, v82, v86, v87, l_pageObjectManager_0, v83, l_avatarEditorService_0, v74, l_All_0, if not not l_FFlagAXModeratedItemsFlow_0 or l_FFlagAXEnableModeratedItemsFlowForDurables_0 then v76 else nil);
                        return;
                    end;
                end);
            end;
        end)(v78);
    end;
end;