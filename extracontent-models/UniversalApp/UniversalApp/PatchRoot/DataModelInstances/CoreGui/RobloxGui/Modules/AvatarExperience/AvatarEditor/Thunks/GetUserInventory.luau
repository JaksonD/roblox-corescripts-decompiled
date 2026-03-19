local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAssetInfoFromInventoryFetch);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v11 = require(l_CorePackages_0.Packages.Promise);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v19, v20) --[[ Line: 30 ]] --[[ Name: checkAssetExists ]]
    local v21 = v19.AvatarExperience.Common.AssetInfos[v20];
    if v21 and v21.receivedFromInventoryFetch then
        return true;
    else
        return false;
    end;
end;
local function v38(v23, v24, v25, v26, v27, v28) --[[ Line: 40 ]]
    -- upvalues: v12 (copy), v7 (copy), v6 (copy), v5 (copy), v8 (copy)
    local v29 = v24:getState();
    local l_v25_CurrentPage_0 = v25:GetCurrentPage();
    l_v25_CurrentPage_0 = v12.tableToCamelCaseKeys(l_v25_CurrentPage_0);
    local v31 = {};
    local v32 = {};
    for _, v34 in l_v25_CurrentPage_0 do
        local v35 = tostring(v34.assetId);
        v32[#v32 + 1] = v35;
        local v36 = v29.AvatarExperience.Common.AssetInfos[v35];
        if not (v36 and v36.receivedFromInventoryFetch and true or false) then
            v31[#v31 + 1] = v34;
        end;
    end;
    if #v31 > 0 then
        v24:dispatch(v7(v31));
    end;
    v24:dispatch(v6(v23, v25.IsFinished));
    v26:storePageObject(v23, v25);
    v24:dispatch(v5(v28 or v23, v32));
    local v37 = nil;
    if v25.IsFinished then
        v37 = v8.ReachedLastPage;
    end;
    v27(v37);
end;
local function v48(v39, v40, v41, v42, v43, v44, v45) --[[ Line: 72 ]] --[[ Name: advancePage ]]
    -- upvalues: v38 (copy), l_Logging_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 73 ]]
        -- upvalues: v41 (copy)
        v41:AdvanceToNextPageAsync();
    end);
    if l_status_0 then
        v38(v39, v40, v41, v42, v43, v45);
        return;
    else
        l_Logging_0.warn("GetUserInventory failure: " .. l_result_0);
        v44();
        return;
    end;
end;
local function v62(v49, v50, v51, v52, v53, v54, v55, v56) --[[ Line: 85 ]] --[[ Name: fetchInitialPage ]]
    -- upvalues: v12 (copy), v38 (copy), v16 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v15 (copy), l_Logging_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 95 ]]
        -- upvalues: v50 (copy), v12 (ref), v53 (copy)
        local v57 = {};
        for _, v59 in v50 do
            table.insert(v57, (v12.AssetTypeIdStringToEnumValue(v59)));
        end;
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            return v53:GetInventoryAsync(v57);
        else
            return v53:GetInventory(v57);
        end;
    end);
    if l_status_1 then
        v38(v49, v51, l_result_1, v52, v54, v56);
        return;
    else
        if v16() then
            l_reportAvatarEventCounterNoAnalyticsArgument_0(v15.Counter.AvatarEditorServiceErrors.GetInventory);
        end;
        l_Logging_0.warn("GetUserInventory failure: " .. l_result_1);
        v55();
        return;
    end;
end;
return function(v63, v64, v65) --[[ Line: 121 ]]
    -- upvalues: v3 (copy), v13 (copy), v11 (copy), l_PerformFetch_0 (copy), v9 (copy), v8 (copy), v62 (copy), v48 (copy)
    v3.isType(v63, "table", "GetUserInventory thunk expects categoryInfo to be a table");
    return function(v66, v67) --[[ Line: 124 ]]
        -- upvalues: v13 (ref), v63 (copy), v11 (ref), v64 (copy), l_PerformFetch_0 (ref), v9 (ref), v8 (ref), v62 (ref), v65 (copy), v48 (ref)
        local l_pageObjectManager_0 = v67.pageObjectManager;
        local l_avatarEditorService_0 = v67.avatarEditorService;
        local v70, v71 = v13.getSearchUuidAndAssetTypes(v63, v66:getState().AvatarExperience.AvatarEditor.Categories.subButton);
        if not v70 then
            return v11.resolve("No SearchUuid");
        else
            v70 = v64 or v70;
            return l_PerformFetch_0.Single(v9.UserInventoryKey .. v70, function(v72) --[[ Line: 142 ]]
                -- upvalues: l_pageObjectManager_0 (copy), v70 (ref), v11 (ref), v8 (ref), v62 (ref), v71 (copy), l_avatarEditorService_0 (copy), v65 (ref), v48 (ref)
                local v73 = l_pageObjectManager_0:getPageObject(v70);
                if v73 and v73.IsFinished then
                    return v11.resolve(v8.ReachedLastPage);
                else
                    return v11.new(function(v74, v75) --[[ Line: 149 ]]
                        -- upvalues: v73 (copy), v62 (ref), v70 (ref), v71 (ref), v72 (copy), l_pageObjectManager_0 (ref), l_avatarEditorService_0 (ref), v65 (ref), v48 (ref)
                        if v73 == nil then
                            v62(v70, v71, v72, l_pageObjectManager_0, l_avatarEditorService_0, v74, v75, v65);
                            return;
                        else
                            v48(v70, v72, v73, l_pageObjectManager_0, v74, v75, v65);
                            return;
                        end;
                    end);
                end;
            end)(v66);
        end;
    end;
end;