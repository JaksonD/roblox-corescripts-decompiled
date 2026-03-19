local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v5 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v6 = require(l_Modules_0.LuaApp.openExternalBrowser);
local v7 = require(l_Modules_0.LuaApp.TenFootUI.MoreComponents.MoreStatusButton);
local _ = require(script.Parent.Types);
return function(v9) --[[ Line: 16 ]] --[[ Name: LinkButtonItem ]]
    -- upvalues: v5 (copy), l_AppLinking_0 (copy), l_useLocalization_0 (copy), v2 (copy), v6 (copy), v7 (copy)
    local l_layoutOrder_0 = v9.layoutOrder;
    local l_itemData_0 = v9.itemData;
    local l_textKey_0 = l_itemData_0.textKey;
    local l_rightImage_0 = l_itemData_0.rightImage;
    local v14 = if l_itemData_0.context then l_itemData_0.context.url else nil;
    local v15 = v5(l_AppLinking_0);
    local v16 = l_useLocalization_0({
        title = l_textKey_0
    });
    local v17 = v2.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v14 (copy), v6 (ref), v15 (copy)
        if v14 then
            v6(v15, v14);
        end;
    end, {
        v14
    });
    return v2.createElement(v7, {
        layoutOrder = l_layoutOrder_0, 
        title = v16.title, 
        icon = l_rightImage_0, 
        onActivated = v17
    });
end;