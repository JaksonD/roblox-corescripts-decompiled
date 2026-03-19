local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.View);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
return function(v5) --[[ Line: 9 ]] --[[ Name: BaseMenuDivider ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = v4();
    return v2.createElement(v3, {
        LayoutOrder = v5.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v6.Stroke.Standard), 
        tag = "row flex-x-fill", 
        testId = "--foundation-menu-divider-item"
    }, v2.createElement(v3, {
        tag = "size-0-full grow", 
        backgroundStyle = v6.Color.Stroke.Default
    }));
end;