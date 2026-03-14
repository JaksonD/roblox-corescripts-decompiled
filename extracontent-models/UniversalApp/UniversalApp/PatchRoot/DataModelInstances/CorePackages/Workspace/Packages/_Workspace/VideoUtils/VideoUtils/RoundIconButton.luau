local l_Parent_0 = script:FindFirstAncestor("VideoUtils").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Icon_0 = v2.Icon;
local l_IconSize_0 = v2.Enums.IconSize;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v7) --[[ Line: 21 ]] --[[ Name: RoundIconButton ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy)
    local v8 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        tag = "auto-xy bg-over-media-100 radius-circle padding-medium", 
        AnchorPoint = v7.AnchorPoint, 
        Position = v7.Position, 
        ZIndex = v7.ZIndex, 
        onActivated = v7.onActivated, 
        selection = if v7.Selectable ~= nil then {
            Selectable = v7.Selectable
        } else nil
    }, {
        Icon = v1.createElement(l_Icon_0, {
            name = v7.icon, 
            size = l_IconSize_0.Medium, 
            style = v8.Color.Content.Emphasis
        })
    });
end;