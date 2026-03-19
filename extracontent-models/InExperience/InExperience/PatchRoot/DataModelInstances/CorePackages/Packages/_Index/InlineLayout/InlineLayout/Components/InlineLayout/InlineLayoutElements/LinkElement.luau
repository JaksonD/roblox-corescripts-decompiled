local l_Parent_0 = script:FindFirstAncestor("Components").Parent.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineLayoutElements");
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_script_FirstAncestor_0.InlineSpanElement);
local v6 = require(l_script_FirstAncestor_0.HoverContext);
local _ = require(l_script_FirstAncestor_0.RenderableInlineElement);
local v8 = {};
HoverContextWrapper = function(v9) --[[ Line: 25 ]] --[[ Name: HoverContextWrapper ]]
    -- upvalues: v6 (copy), v2 (copy), v3 (copy), l_useTokens_0 (copy)
    local v10, v11 = v6.useHoverContext(v9.id);
    local v13 = v2.useCallback(function(v12) --[[ Line: 27 ]]
        -- upvalues: v11 (copy), v3 (ref)
        v11(v12 == v3.Enums.ControlState.Hover);
    end, {
        v11
    });
    local l_Hover_0 = l_useTokens_0().Color.State.Hover;
    return v2.createElement(v3.View, {
        tag = "size-0-0 auto-xy row", 
        LayoutOrder = v9.LayoutOrder, 
        onActivated = v9.onActivated, 
        backgroundStyle = if v10 then l_Hover_0 else nil, 
        onStateChanged = v13, 
        stateLayer = {
            affordance = v3.Enums.StateLayerAffordance.None
        }
    }, v9.children);
end;
v8.new = function(v15, v16) --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return v5.new(HoverContextWrapper, v16, v15);
end;
return v8;