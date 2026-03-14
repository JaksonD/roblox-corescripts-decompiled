local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
return function(v6, v7, v8, v9) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    return function(v10) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v2 (ref), v6 (copy), v7 (copy), l_FFlagHideCloseButtonEdp_0 (ref), v8 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v9 (copy)
        v10:dispatch(v3(v2.GameDetailsPlayWithFriends, {
            universeId = v6, 
            menuPosition = v7, 
            hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v8 else nil, 
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v9 else nil
        }));
    end;
end;