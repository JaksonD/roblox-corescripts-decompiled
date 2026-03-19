local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v2 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v3 = require(l_Modules_0.LuaApp.Components.GenericWebPageWrapper);
local v4 = require(l_Modules_0.LuaApp.Thunks.UpdateLocalPlayerInfo);
local v5 = require(l_Modules_0.Common.Roact);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v8 = require(l_CorePackages_0.Packages.React);
local v9 = require(l_Modules_0.LuaApp.Components.SettingsNativeWrapper);
local v10 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper);
return function(v11) --[[ Line: 20 ]] --[[ Name: AccountInfoPage ]]
    -- upvalues: l_useDispatch_0 (copy), v1 (copy), v2 (copy), v8 (copy), v4 (copy), v10 (copy), v5 (copy), v9 (copy), v3 (copy)
    local v12 = l_useDispatch_0();
    local v13 = v1(v2);
    v8.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v12 (copy), v4 (ref), v13 (copy)
        return function() --[[ Line: 24 ]]
            -- upvalues: v12 (ref), v4 (ref), v13 (ref)
            v12(v4(v13));
        end;
    end, {});
    if v10() then
        return v5.createElement(v9, {
            url = v11.url, 
            titleKey = v11.titleKey, 
            windowCloseCallback = v11 and v11.onClose or nil, 
            isVisible = v11.isVisible, 
            displayOrder = v11.displayOrder
        });
    else
        return v5.createElement(v3, {
            isVisible = v11.isVisible, 
            DisplayOrder = v11.displayOrder, 
            url = v11.url, 
            title = v11.title, 
            titleKey = v11.titleKey
        });
    end;
end;