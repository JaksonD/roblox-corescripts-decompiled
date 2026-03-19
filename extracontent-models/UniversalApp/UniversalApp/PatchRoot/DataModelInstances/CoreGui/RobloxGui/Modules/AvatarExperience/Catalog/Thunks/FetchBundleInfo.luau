local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetInfoFromBundleItemAction);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleTryOnFailure);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleInfoFromCatalogItemAction);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v16) --[[ Line: 28 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.FetchBundleInfoKey .. tostring(v16);
end;
local function _(v18, v19) --[[ Line: 32 ]] --[[ Name: checkAssetExists ]]
    local v20 = v18.AvatarExperience.Common.AssetInfos[v19];
    if v20 and v20.receivedFromBundleItemData then
        return true;
    else
        return false;
    end;
end;
local function v31(v22, v23, v24) --[[ Line: 42 ]] --[[ Name: processSuccessfulResult ]]
    -- upvalues: v6 (copy), v7 (copy), v10 (copy)
    if v24.bundledItems then
        local v25 = v22:getState();
        local v26 = {};
        for _, v28 in v24.bundledItems do
            local v29 = tostring(v28.id);
            if v28.type == v6.ItemType.Asset then
                local v30 = v25.AvatarExperience.Common.AssetInfos[v29];
                if not (v30 and v30.receivedFromBundleItemData and true or false) then
                    table.insert(v26, v28);
                end;
            end;
        end;
        if #v26 > 0 then
            v22:dispatch(v7(v26));
        end;
    end;
    v22:dispatch(v10(v23, v24));
end;
return function(v32) --[[ Line: 62 ]]
    -- upvalues: v4 (copy), v3 (copy), l_PerformFetch_0 (copy), v5 (copy), v9 (copy), v31 (copy), v13 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v12 (copy), v8 (copy)
    v4.isType(v32, "string", "FetchBundleInfo thunk expects bundleId to be a string");
    return function(v33, v34) --[[ Line: 65 ]]
        -- upvalues: v32 (copy), v3 (ref), l_PerformFetch_0 (ref), v5 (ref), v9 (ref), v31 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), v8 (ref)
        local l_avatarEditorService_0 = v34.avatarEditorService;
        local v36 = v33:getState().AvatarExperience.Common.BundleInfos[tostring(v32)];
        if v36 ~= nil and v36.receivedCatalogData then
            return v3.resolve("We already have the bundle");
        else
            local l_Single_0 = l_PerformFetch_0.Single;
            local l_v32_0 = v32;
            return l_Single_0(v5.FetchBundleInfoKey .. tostring(l_v32_0), function(v39) --[[ Line: 73 ]]
                -- upvalues: v3 (ref), l_avatarEditorService_0 (copy), v32 (ref), v9 (ref), v31 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), v8 (ref)
                return v3.new(function(v40, v41) --[[ Line: 74 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v32 (ref), v9 (ref), v31 (ref), v39 (copy), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), v8 (ref)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 75 ]]
                        -- upvalues: l_avatarEditorService_0 (ref), v32 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            return l_avatarEditorService_0:GetItemDetailsAsync(v32, Enum.AvatarItemType.Bundle);
                        else
                            return l_avatarEditorService_0:GetItemDetails(v32, Enum.AvatarItemType.Bundle);
                        end;
                    end);
                    if l_status_0 then
                        l_result_0 = v9.tableToCamelCaseKeys(l_result_0);
                        v31(v39, v32, l_result_0);
                        v40(l_result_0);
                        return;
                    else
                        if v13() then
                            l_reportAvatarEventCounterNoAnalyticsArgument_0(v12.Counter.AvatarEditorServiceErrors.FetchBundleInfo);
                        end;
                        v39:dispatch(v8(v32));
                        v41(l_result_0);
                        return;
                    end;
                end);
            end)(v33);
        end;
    end;
end;