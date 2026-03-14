local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
return v1.memo(v1.forwardRef(function(v5, _) --[[ Line: 15 ]] --[[ Name: Scrim ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy)
    local l_Scrim_0 = l_useTokens_0().Color.Common.Scrim;
    return v1.createElement(l_View_0, {
        tag = "size-full", 
        backgroundStyle = l_Scrim_0, 
        Visible = v5 and v5.Visible, 
        ZIndex = v5 and v5.ZIndex
    });
end));