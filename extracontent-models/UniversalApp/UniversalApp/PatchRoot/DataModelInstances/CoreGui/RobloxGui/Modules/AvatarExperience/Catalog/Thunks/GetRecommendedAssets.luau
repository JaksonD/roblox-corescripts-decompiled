local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v3 = require(l_CorePackages_0.Packages.Promise);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetRecommendedAssetsAction);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v16) --[[ Line: 25 ]] --[[ Name: keyMapper ]]
    -- upvalues: v8 (copy)
    return v8.RecommendedItemsForAssetsKey .. tostring(v16);
end;
return function(v18, v19, v20, v21) --[[ Line: 29 ]]
    -- upvalues: v5 (copy), l_PerformFetch_0 (copy), v8 (copy), v3 (copy), v10 (copy), v9 (copy), v4 (copy), v7 (copy), v13 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v12 (copy), l_Logging_0 (copy)
    v5.isType(v18, "string", "GetRecommendedAssets thunk expects assetId to be a string");
    v5.isType(v19, "string", "GetRecommendedAssets thunk expects assetTypeId to be a string");
    v5.isType(v20, "number", "GetRecommendedAssets thunk expects numItems to be a number");
    v5.isType(v21, "boolean", "GetRecommendedAssets thunk expects details to be a boolean");
    return function(v22, v23) --[[ Line: 35 ]]
        -- upvalues: l_PerformFetch_0 (ref), v18 (copy), v8 (ref), v3 (ref), v10 (ref), v19 (copy), v20 (copy), v21 (copy), v9 (ref), v4 (ref), v7 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), l_Logging_0 (ref)
        local l_avatarEditorService_0 = v23.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v18_0 = v18;
        return l_Single_0(v8.RecommendedItemsForAssetsKey .. tostring(l_v18_0), function(v27) --[[ Line: 37 ]]
            -- upvalues: v18 (ref), v3 (ref), l_avatarEditorService_0 (copy), v10 (ref), v19 (ref), v20 (ref), v21 (ref), v9 (ref), v4 (ref), v7 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), l_Logging_0 (ref)
            local v28 = v27:getState().AvatarExperience.Common.AssetInfos[v18];
            if v28 ~= nil and v28.receivedRecommendedData then
                return v3.resolve();
            else
                return v3.new(function(v29, v30) --[[ Line: 43 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v10 (ref), v19 (ref), v18 (ref), v20 (ref), v21 (ref), v9 (ref), v4 (ref), v27 (copy), v7 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), l_Logging_0 (ref)
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 44 ]]
                        -- upvalues: l_avatarEditorService_0 (ref), v10 (ref), v19 (ref), v18 (ref), v20 (ref), v21 (ref)
                        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                            return l_avatarEditorService_0:GetRecommendedAssetsAsync(v10.AssetTypeIdStringToEnumValue(v19), v18, v20, v21);
                        else
                            return l_avatarEditorService_0:GetRecommendedAssets(v10.AssetTypeIdStringToEnumValue(v19), v18, v20, v21);
                        end;
                    end);
                    if l_status_0 then
                        l_result_0 = v10.tableToCamelCaseKeys(l_result_0);
                        local l_NumRecommendedItems_0 = v9.NumRecommendedItems;
                        local v34 = v4.List.getRange(l_result_0, 1, l_NumRecommendedItems_0);
                        v27:dispatch(v7(v18, v19, v34));
                        v29(v34);
                        return;
                    else
                        if v13() then
                            l_reportAvatarEventCounterNoAnalyticsArgument_0(v12.Counter.AvatarEditorServiceErrors.GetRecommendedAssets);
                        end;
                        l_Logging_0.warn("GetRecommendedAssets failed: " .. l_result_0);
                        v30({
                            HttpError = Enum.HttpError.OK
                        });
                        return;
                    end;
                end);
            end;
        end)(v22);
    end;
end;