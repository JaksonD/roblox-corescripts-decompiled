local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetFavorite);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local function _(v14) --[[ Line: 25 ]] --[[ Name: keyMapper ]]
    -- upvalues: v6 (copy)
    return v6.GetFavoriteAssetKey .. v14;
end;
return function(v16) --[[ Line: 29 ]]
    -- upvalues: v4 (copy), l_PerformFetch_0 (copy), v6 (copy), v2 (copy), v10 (copy), v13 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v12 (copy), l_Logging_0 (copy)
    v4.isType(v16, "string", "GetAssetFavorite thunk expects assetId");
    return function(v17, v18) --[[ Line: 32 ]]
        -- upvalues: l_PerformFetch_0 (ref), v16 (copy), v6 (ref), v2 (ref), v10 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), l_Logging_0 (ref)
        local l_avatarEditorService_0 = v18.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v16_0 = v16;
        return l_Single_0(v6.GetFavoriteAssetKey .. l_v16_0, function(v22) --[[ Line: 34 ]]
            -- upvalues: v2 (ref), l_avatarEditorService_0 (copy), v16 (ref), v10 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), l_Logging_0 (ref)
            return v2.new(function(v23, v24) --[[ Line: 35 ]]
                -- upvalues: l_avatarEditorService_0 (ref), v16 (ref), v22 (copy), v10 (ref), v13 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v12 (ref), l_Logging_0 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v16 (ref)
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_avatarEditorService_0:GetFavoriteAsync(v16, Enum.AvatarItemType.Asset);
                    else
                        return l_avatarEditorService_0:GetFavorite(v16, Enum.AvatarItemType.Asset);
                    end;
                end);
                if l_status_0 then
                    v22:dispatch(v10(v16, l_result_0));
                    v23();
                    return;
                else
                    if v13() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v12.Counter.AvatarEditorServiceErrors.GetAssetFavorite);
                    end;
                    l_Logging_0.warn("GetAssetFavorite failure: " .. tostring(l_result_0));
                    v24();
                    return;
                end;
            end);
        end)(v17);
    end;
end;