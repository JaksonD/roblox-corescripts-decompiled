local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v3 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_FFlagHideCloseButtonEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagHideCloseButtonEdp;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
return function(v6, v7, v8, v9, v10, v11) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), l_FFlagHideCloseButtonEdp_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    return function(v12) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v2 (ref), v6 (copy), v7 (copy), v8 (copy), v9 (copy), l_FFlagHideCloseButtonEdp_0 (ref), v10 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v11 (copy)
        v12:dispatch(v3(v2.GameDetailMore, {
            universeId = v6, 
            menuPosition = v7, 
            onClose = v8, 
            menuAnchorPoint = v9, 
            hideCloseButton = if l_FFlagHideCloseButtonEdp_0 then v10 else nil, 
            shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v11 else nil
        }));
    end;
end;