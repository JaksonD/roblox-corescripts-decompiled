local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleFavorite);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v14) --[[ Line: 25 ]] --[[ Name: keyMapper ]]
    -- upvalues: v6 (copy)
    return v6.GetFavoriteBundleKey .. v14;
end;
return function(v16) --[[ Line: 29 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v6 (copy), v2 (copy), v11 (copy), v10 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v9 (copy), l_Logging_0 (copy)
    v3.isType(v16, "string", "GetBundleFavorite thunk expects bundleId");
    return function(v17, v18) --[[ Line: 32 ]]
        -- upvalues: l_PerformFetch_0 (ref), v16 (copy), v6 (ref), v2 (ref), v11 (ref), v10 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v9 (ref), l_Logging_0 (ref)
        local l_avatarEditorService_0 = v18.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v16_0 = v16;
        return l_Single_0(v6.GetFavoriteBundleKey .. l_v16_0, function(v22) --[[ Line: 34 ]]
            -- upvalues: v2 (ref), l_avatarEditorService_0 (copy), v16 (ref), v11 (ref), v10 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v9 (ref), l_Logging_0 (ref)
            return v2.new(function(v23, v24) --[[ Line: 35 ]]
                -- upvalues: l_avatarEditorService_0 (ref), v16 (ref), v22 (copy), v11 (ref), v10 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v9 (ref), l_Logging_0 (ref)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
                    -- upvalues: l_avatarEditorService_0 (ref), v16 (ref)
                    if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                        return l_avatarEditorService_0:GetFavoriteAsync(v16, Enum.AvatarItemType.Bundle);
                    else
                        return l_avatarEditorService_0:GetFavorite(v16, Enum.AvatarItemType.Bundle);
                    end;
                end);
                if l_status_0 then
                    v22:dispatch(v11(v16, l_result_0));
                    v23();
                    return;
                else
                    if v10() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v9.Counter.AvatarEditorServiceErrors.GetBundleFavorite);
                    end;
                    l_Logging_0.warn("GetBundleFavorite failure: " .. tostring(l_result_0));
                    v24();
                    return;
                end;
            end);
        end)(v17);
    end;
end;