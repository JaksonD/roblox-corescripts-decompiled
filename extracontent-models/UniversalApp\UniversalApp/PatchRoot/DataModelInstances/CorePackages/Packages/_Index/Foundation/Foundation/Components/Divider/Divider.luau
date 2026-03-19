local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Enums.DividerVariant);
local v4 = require(l_script_FirstAncestor_0.Enums.Orientation);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(script.Parent.useDividerVariants);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v11 = {
    variant = v3.Default, 
    orientation = v4.Horizontal, 
    testId = "--foundation-divider"
};
return v2.memo(v2.forwardRef(function(v12, v13) --[[ Line: 29 ]] --[[ Name: Divider ]]
    -- upvalues: v10 (copy), v11 (copy), v8 (copy), v7 (copy), v3 (copy), v4 (copy), v2 (copy), v6 (copy), v9 (copy)
    local v14 = v10(v12, v11);
    local v15 = v8();
    local v16 = v7(v15, v14.variant, v14.orientation);
    local v17 = false;
    if v14.variant == v3.Heavy then
        v17 = v14.orientation ~= v4.Vertical;
    end;
    return v2.createElement(v6, v9(v14, {
        tag = v16.container.tag, 
        ref = v13
    }), {
        DividerStroke = v2.createElement(v6, {
            Size = v16.stroke.Size, 
            backgroundStyle = v16.stroke.backgroundStyle
        }), 
        DividerLine = if v17 then v2.createElement(v6, {
            tag = v16.line.tag, 
            Position = v16.line.position, 
            backgroundStyle = v16.line.backgroundStyle
        }) else nil
    });
end));