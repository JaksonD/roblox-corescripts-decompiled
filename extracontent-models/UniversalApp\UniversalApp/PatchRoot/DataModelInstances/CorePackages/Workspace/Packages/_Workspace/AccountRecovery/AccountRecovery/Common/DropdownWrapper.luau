local l_Parent_0 = script:FindFirstAncestor("AccountRecovery").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Dropdown_0 = v2.Dropdown;
return function(v5) --[[ Line: 18 ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_Dropdown_0 (copy)
    local v6 = v5.initialWidth or UDim.new(0, 300);
    local v7, v8 = v1.useState(v6);
    v5.dropdownProps.width = v7;
    return v1.createElement(l_View_0, {
        tag = "size-full", 
        onAbsoluteSizeChanged = function(v9) --[[ Line: 24 ]] --[[ Name: onAbsoluteSizeChanged ]]
            -- upvalues: v8 (copy)
            v8(UDim.new(0, v9.AbsoluteSize.X));
        end
    }, {
        Dropdown = v1.createElement(l_Dropdown_0.Root, v5.dropdownProps)
    });
end;