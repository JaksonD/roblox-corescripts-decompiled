local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.AppPage);
local l_useSetDrawerVisible_0 = require(l_CorePackages_0.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible;
local v8 = require(l_Modules_0.LuaApp.Components.More.MoreLogOut);
return function(v9) --[[ Line: 16 ]] --[[ Name: FlyoutLogoutButton ]]
    -- upvalues: l_useSetDrawerVisible_0 (copy), v1 (copy), v8 (copy), v6 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    local v10 = l_useSetDrawerVisible_0();
    local v11 = v1.useCallback(function() --[[ Line: 18 ]]
        -- upvalues: v10 (copy)
        v10(false);
    end, {});
    return v1.createElement(v8, {
        item = {
            badgeCount = 0, 
            context = {
                page = v6.LogoutConfirmation
            }, 
            itemType = "LogOut", 
            textKey = "Application.Logout.Action.Logout"
        }, 
        willActivate = v11, 
        layoutOrder = v9.layoutOrder, 
        foundationButtonType = l_ButtonVariant_0.Standard, 
        foundationButtonSize = l_ButtonSize_0.Large
    });
end;