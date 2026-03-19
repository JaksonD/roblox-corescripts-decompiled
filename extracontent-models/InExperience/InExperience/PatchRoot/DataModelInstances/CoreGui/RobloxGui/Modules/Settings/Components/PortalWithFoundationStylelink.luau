local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_View_0 = v2.View;
local l_useStyleSheet_0 = v2.Hooks.useStyleSheet;
return function(v7) --[[ Line: 16 ]] --[[ Name: PortalWithFoundationStylelink ]]
    -- upvalues: l_useStyleSheet_0 (copy), v1 (copy), v3 (copy), v4 (copy), l_View_0 (copy)
    local v8 = l_useStyleSheet_0();
    local v9 = v1.Dictionary.join({
        StyleLink = v3.createElement("StyleLink", {
            StyleSheet = v8
        })
    }, v7.children);
    return v4.createPortal(v3.createElement(l_View_0, {
        tag = "auto-xy"
    }, v9), v7.parent);
end;