local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local l_useCallback_0 = v2.useCallback;
local l_createNextOrder_0 = v4.createNextOrder;
local l_useTokens_0 = v3.Hooks.useTokens;
local v8 = {
    iconSize = v3.Enums.IconSize.Medium
};
return function(v9) --[[ Line: 31 ]] --[[ Name: SubmenuButton ]]
    -- upvalues: v1 (copy), v8 (copy), l_createNextOrder_0 (copy), l_useTokens_0 (copy), l_useCallback_0 (copy), v3 (copy), v2 (copy)
    local v10 = v1.Dictionary.join(v8, v9);
    local v11 = l_createNextOrder_0();
    local v12 = l_useTokens_0();
    local v14 = l_useCallback_0(function(v13) --[[ Line: 37 ]]
        -- upvalues: v3 (ref), v10 (copy)
        if v13 == v3.Enums.ControlState.Pressed and v10.onActivated then
            v10.onActivated();
        end;
    end, {
        v10.onActivated
    });
    return v2.createElement(v3.View, {
        tag = "size-full-0 auto-y row gap-small padding-small align-y-center radius-medium", 
        onStateChanged = v14, 
        LayoutOrder = v10.LayoutOrder
    }, {
        Icon = if v10.icon then v2.createElement(v3.Icon, {
            name = v10.icon, 
            size = v10.iconSize, 
            style = v12.Color.Content.Emphasis, 
            LayoutOrder = v11()
        }) else nil, 
        Text = v2.createElement(v3.Text, {
            tag = "auto-xy content-default text-label-large", 
            Text = v10.text, 
            LayoutOrder = v11()
        })
    });
end;