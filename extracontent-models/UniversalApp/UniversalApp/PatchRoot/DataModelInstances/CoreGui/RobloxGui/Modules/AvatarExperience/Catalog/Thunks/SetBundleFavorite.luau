local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetBundleFavorite);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v9 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v13) --[[ Line: 24 ]] --[[ Name: keyMapper ]]
    -- upvalues: v4 (copy)
    return v4.SetFavoriteBundleKey .. v13;
end;
return function(v15, v16) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v4 (copy), v2 (copy), v7 (copy), v10 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v9 (copy), v6 (copy)
    v3.isType(v15, "string", "SetBundleFavorite thunk expects assetId");
    v3.isType(v16, "boolean", "SetBundleFavorite thunk expects isFavorited");
    return function(v17, v18) --[[ Line: 32 ]]
        -- upvalues: l_PerformFetch_0 (ref), v15 (copy), v4 (ref), v2 (ref), v16 (copy), v7 (ref), v10 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v9 (ref), v6 (ref)
        local l_avatarEditorService_0 = v18.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v15_0 = v15;
        return l_Single_0(v4.SetFavoriteBundleKey .. l_v15_0, function(v22) --[[ Line: 34 ]]
            -- upvalues: v2 (ref), l_avatarEditorService_0 (copy), v15 (ref), v16 (ref), v7 (ref), v10 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v9 (ref), v6 (ref)
            return v2.new(function(v23, v24) --[[ Line: 35 ]]
                -- upvalues: l_avatarEditorService_0 (ref), v15 (ref), v16 (ref), v22 (copy), v7 (ref), v10 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v9 (ref), v6 (ref)
                local v25 = l_avatarEditorService_0:NoPromptSetFavorite(v15, Enum.AvatarItemType.Bundle, v16);
                while not v25 do
                    l_avatarEditorService_0.PromptSetFavoriteCompleted:Wait();
                    v25 = l_avatarEditorService_0:NoPromptSetFavorite(v15, Enum.AvatarItemType.Bundle, v16);
                end;
                if l_avatarEditorService_0.PromptSetFavoriteCompleted:Wait() == Enum.AvatarPromptResult.Success then
                    v22:dispatch(v7(v15, v16));
                    v23();
                    return;
                else
                    if v10() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v9.Counter.AvatarEditorServiceErrors.SetBundleFavorite);
                    end;
                    v22:dispatch(v6({
                        HttpError = Enum.HttpError.OK
                    }));
                    v24();
                    return;
                end;
            end);
        end)(v17);
    end;
end;