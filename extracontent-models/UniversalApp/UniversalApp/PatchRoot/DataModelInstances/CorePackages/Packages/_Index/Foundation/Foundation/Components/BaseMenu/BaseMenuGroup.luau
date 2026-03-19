local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.BaseMenuContext);
local v4 = require(script.Parent.BaseMenuDivider);
local v5 = require(script.Parent.BaseMenuTitleItem);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = {
    XSmall = "padding-xsmall", 
    Small = "padding-small", 
    Medium = "padding-small", 
    Large = "padding-small"
};
return function(v8) --[[ Line: 25 ]] --[[ Name: BaseMenuGroup ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v6 (copy), v7 (copy), v5 (copy)
    local v9 = v2.useContext(v3);
    local l_LayoutOrder_0 = v8.LayoutOrder;
    return v2.createElement(v2.Fragment, nil, {
        Divider = if l_LayoutOrder_0 ~= 1 then v2.createElement(v4, {
            LayoutOrder = l_LayoutOrder_0 * 2 - 1
        }) else nil, 
        Group = v2.createElement(v6, {
            LayoutOrder = l_LayoutOrder_0 * 2, 
            tag = ("auto-y size-full-0 col gap-xxsmall %*"):format(v7[v9.size])
        }, {
            Title = if v8.title then v2.createElement(v5, {
                text = v8.title, 
                size = v9.size
            }) else nil, 
            Items = v2.createElement(v2.Fragment, nil, v8.children)
        })
    });
end;