local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_CorePackages_0.Workspace.Packages.Analytics);
local v4 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
return {
    get = function(v6) --[[ Line: 14 ]] --[[ Name: get ]]
        -- upvalues: v4 (copy), v5 (copy)
        local v7 = v4.get(v6);
        return {
            avatarRefineButtonTap = function(v8, v9, v10) --[[ Line: 19 ]] --[[ Name: avatarRefineButtonTap ]]
                -- upvalues: v7 (copy)
                v7.EventStream:sendEventDeferred(v8, "avatarRefineButtonTap", {
                    category = v10, 
                    uid = v9
                });
            end, 
            avatarRefineLayersResetTap = function(v11, v12) --[[ Line: 27 ]] --[[ Name: avatarRefineLayersResetTap ]]
                -- upvalues: v7 (copy)
                v7.EventStream:sendEventDeferred(v11, "avatarRefineLayersResetTap", {
                    uid = v12
                });
            end, 
            avatarRefineLayersResetConfirm = function(v13, v14) --[[ Line: 34 ]] --[[ Name: avatarRefineLayersResetConfirm ]]
                -- upvalues: v7 (copy)
                v7.EventStream:sendEventDeferred(v13, "avatarRefineLayersResetConfirm", {
                    uid = v14
                });
            end, 
            avatarRefineGoBack = function(v15, v16) --[[ Line: 41 ]] --[[ Name: avatarRefineGoBack ]]
                -- upvalues: v5 (ref), v7 (copy)
                local v17 = "Editor";
                if v15 == v5.AnalyticsContext.AvatarShop then
                    v17 = "Catalog";
                end;
                v7.EventStream:sendEventDeferred(v15, "avatarRefineGoBack", {
                    page = v17, 
                    uid = v16
                });
            end, 
            avatarRefineAutosaved = function(v18, v19) --[[ Line: 54 ]] --[[ Name: avatarRefineAutosaved ]]
                -- upvalues: v7 (copy)
                v7.EventStream:sendEventDeferred(v18, "avatarRefineAutosaved", {
                    uid = v19
                });
            end
        };
    end
};