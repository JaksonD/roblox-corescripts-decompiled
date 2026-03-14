local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.BaseMenu);
local v4 = require(l_script_FirstAncestor_0.Components.Popover);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v7 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v10 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v11 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v12 = require(l_script_FirstAncestor_0.Enums.Radius);
local v13 = {
    size = v9.Medium, 
    side = v11.Bottom, 
    align = v10.Start, 
    testId = "--foundation-menu"
};
return v2.memo(v2.forwardRef(function(v14, v15) --[[ Line: 64 ]] --[[ Name: Menu ]]
    -- upvalues: v8 (copy), v13 (copy), v6 (copy), v2 (copy), v4 (copy), v7 (copy), v12 (copy), v3 (copy)
    local v16 = v8(v14, v13);
    local v17 = v6();
    local l_Standard_0 = v17.Stroke.Standard;
    return v2.createElement(v4.Root, {
        isOpen = v16.isOpen, 
        testId = v16.testId
    }, {
        Anchor = v2.createElement(v4.Anchor, v7(v16, {
            anchorRef = v16.anchorRef
        }), if v16.anchorRef then nil else v16.children), 
        Content = v2.createElement(v4.Content, {
            side = {
                position = v16.side, 
                offset = l_Standard_0 + v17.Padding.Small
            }, 
            align = v16.align, 
            hasArrow = false, 
            onPressedOutside = v16.onPressedOutside, 
            backgroundStyle = v17.Color.Surface.Surface_100, 
            radius = v12.Medium, 
            ref = v15, 
            selection = v16.selection, 
            selectionGroup = v16.selectionGroup
        }, v2.createElement(v2.Fragment, nil, {
            Menu = v2.createElement(v3.Root, {
                items = v16.items, 
                size = v16.size, 
                width = v16.width, 
                onActivated = v16.onActivated, 
                radius = v12.Medium
            })
        }))
    });
end));