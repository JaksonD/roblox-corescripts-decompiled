local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_IconSize_0 = v2.Enums.IconSize;
local v4 = require(l_Parent_0.BuilderIcons);
return function(v5) --[[ Line: 12 ]] --[[ Name: ChevronSmallDownButton ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), l_IconSize_0 (copy)
    return v1.createElement(v2.View, {
        tag = "position-center-right anchor-center-right auto-xy radius-circle bg-action-standard padding-xsmall", 
        onActivated = v5.onActivated
    }, {
        Icon = v1.createElement(v2.Icon, {
            tag = "position-center-center anchor-center-center auto-xy content-emphasis", 
            name = v4.Icon.ChevronSmallDown, 
            size = l_IconSize_0.Medium
        })
    });
end;