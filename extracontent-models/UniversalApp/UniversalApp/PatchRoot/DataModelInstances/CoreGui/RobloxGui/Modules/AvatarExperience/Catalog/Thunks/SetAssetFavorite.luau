local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_Modules_0.LuaApp.Thunks.SetNetworkingErrorToast);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetAssetFavorite);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local function _(v14) --[[ Line: 25 ]] --[[ Name: keyMapper ]]
    -- upvalues: v5 (copy)
    return v5.SetFavoriteAssetKey .. v14;
end;
return function(v16, v17) --[[ Line: 29 ]]
    -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v5 (copy), v2 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v10 (copy), v8 (copy), v11 (copy), v7 (copy)
    v3.isType(v16, "string", "SetAssetFavorite thunk expects assetId");
    v3.isType(v17, "boolean", "SetAssetFavorite thunk expects isFavorited");
    return function(v18, v19) --[[ Line: 33 ]]
        -- upvalues: l_PerformFetch_0 (ref), v16 (copy), v5 (ref), v2 (ref), v17 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v10 (ref), v8 (ref), v11 (ref), v7 (ref)
        local l_avatarEditorService_0 = v19.avatarEditorService;
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v16_0 = v16;
        return l_Single_0(v5.SetFavoriteAssetKey .. l_v16_0, function(v23) --[[ Line: 35 ]]
            -- upvalues: v2 (ref), l_avatarEditorService_0 (copy), v16 (ref), v17 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v10 (ref), v8 (ref), v11 (ref), v7 (ref)
            return v2.new(function(v24, v25) --[[ Line: 36 ]]
                -- upvalues: l_avatarEditorService_0 (ref), v16 (ref), v17 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v10 (ref), v23 (copy), v8 (ref), v11 (ref), v7 (ref)
                local v26 = l_avatarEditorService_0:NoPromptSetFavorite(v16, Enum.AvatarItemType.Asset, v17);
                while not v26 do
                    l_avatarEditorService_0.PromptSetFavoriteCompleted:Wait();
                    v26 = l_avatarEditorService_0:NoPromptSetFavorite(v16, Enum.AvatarItemType.Asset, v17);
                    l_reportAvatarEventCounterNoAnalyticsArgument_0(v10.Counter.AvatarEditorServiceErrors.NoPromptSetFavorite);
                end;
                if l_avatarEditorService_0.PromptSetFavoriteCompleted:Wait() == Enum.AvatarPromptResult.Success then
                    v23:dispatch(v8(v16, v17));
                    v24();
                    return;
                else
                    if v11() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v10.Counter.AvatarEditorServiceErrors.SetAssetFavorite);
                    end;
                    v23:dispatch(v7({
                        HttpError = Enum.HttpError.OK
                    }));
                    v25();
                    return;
                end;
            end);
        end)(v18);
    end;
end;