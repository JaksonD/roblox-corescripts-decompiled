local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.BaseMenu);
local v4 = require(l_script_FirstAncestor_0.Components.Popover);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v7 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v8 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v9 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v10 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v11 = require(l_script_FirstAncestor_0.Enums.Radius);
local v12 = require(script.Parent.DropdownControl);
local v13 = require(script.Parent.markSelectedItem);
local v14 = {
    width = UDim.new(0, 400), 
    size = v8.Medium, 
    testId = "--foundation-dropdown"
};
local v15 = {
    position = v10.Bottom, 
    offset = 5
};
return v2.memo(v2.forwardRef(function(v16, v17) --[[ Line: 70 ]] --[[ Name: Dropdown ]]
    -- upvalues: v7 (copy), v14 (copy), v2 (copy), v13 (copy), v4 (copy), v12 (copy), v6 (copy), v9 (copy), v15 (copy), v11 (copy), v3 (copy)
    local v18 = v7(v16, v14);
    local v19, v20 = v2.useState(false);
    local v21 = v2.useRef(nil);
    local v22, v23 = v2.useBinding(v18.width);
    local v24, v25 = v13(v18.items, v18.value);
    local v27 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v20 (copy)
        v20(function(v26) --[[ Line: 80 ]]
            return not v26;
        end);
    end, {});
    local v28 = v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v20 (copy)
        v20(false);
    end, {});
    local v30 = v2.useCallback(function(v29) --[[ Line: 89 ]]
        -- upvalues: v20 (copy), v18 (copy)
        v20(false);
        v18.onItemChanged(v29);
    end, {
        v18.onItemChanged
    });
    v18.onAbsoluteSizeChanged = v2.useCallback(function(v31) --[[ Line: 94 ]]
        -- upvalues: v16 (copy), v23 (copy)
        if v16.onAbsoluteSizeChanged then
            v16.onAbsoluteSizeChanged(v31);
        end;
        v23(UDim.new(0, v31.AbsoluteSize.X));
    end, {
        v23, 
        v16.onAbsoluteSizeChanged
    });
    return v2.createElement(v4.Root, {
        isOpen = v19, 
        ref = v17
    }, {
        DropdownControl = v2.createElement(v12, v6(v18, {
            onActivated = v27, 
            hasError = v18.hasError, 
            isDisabled = v18.isDisabled, 
            item = v25, 
            placeholder = v18.placeholder, 
            isMenuOpen = v19, 
            width = v18.width, 
            size = v18.size, 
            label = v18.label, 
            hint = v18.hint, 
            inputRef = v21
        })), 
        Anchor = v2.createElement(v4.Anchor, {
            anchorRef = v21
        }), 
        Menu = v2.createElement(v4.Content, {
            hasArrow = false, 
            align = v9.End, 
            side = v15, 
            onPressedOutside = v28, 
            radius = v11.Medium, 
            selection = v18.selection, 
            selectionGroup = v18.selectionGroup
        }, v2.createElement(v3.Root, {
            size = v18.size, 
            couldGrow = true, 
            width = v22, 
            items = v24, 
            maxHeight = v18.maxHeight, 
            onActivated = v30, 
            radius = v11.Medium, 
            testId = ("%*--menu"):format(v18.testId)
        }))
    });
end));