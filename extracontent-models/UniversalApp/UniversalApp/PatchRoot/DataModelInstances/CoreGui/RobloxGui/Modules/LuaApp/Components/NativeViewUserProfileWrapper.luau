local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_Modules_0.LuaApp.Components.NativeViewProfileWrapper);
local v4 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v5 = v2.PureComponent:extend("NativeViewUserProfileWrapper");
v5.render = function(v6) --[[ Line: 11 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local l_isVisible_0 = v6.props.isVisible;
    local l_DisplayOrder_0 = v6.props.DisplayOrder;
    local l_userId_0 = v6.props.userId;
    local l_onClose_0 = v6.props.onClose;
    local v11 = v4.user.profile({
        userId = l_userId_0
    });
    return v2.createElement(v3, {
        isVisible = l_isVisible_0, 
        DisplayOrder = l_DisplayOrder_0, 
        url = v11, 
        onClose = l_onClose_0
    });
end;
return v5;