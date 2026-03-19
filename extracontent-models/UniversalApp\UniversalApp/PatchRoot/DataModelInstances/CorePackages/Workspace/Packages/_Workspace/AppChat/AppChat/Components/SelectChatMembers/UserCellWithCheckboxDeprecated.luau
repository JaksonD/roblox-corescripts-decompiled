local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_script_FirstAncestor_0.Components.Cells.UserCell);
local v4 = require(script.Parent.Checkbox);
return function(v5) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    return v2.createElement(v3, {
        style = v5.style, 
        user = v5.user, 
        subTitleText = v5.subTitleText, 
        secondaryTitleText = v5.secondaryTitleText, 
        isCheckboxActivated = v5.isCheckboxActivated, 
        onActivated = v5.onActivated, 
        childWidth = 64
    }, {
        checkbox = v2.createElement(v4, {
            activated = v5.isCheckboxActivated
        })
    });
end;