local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v4 = require(script.Parent.useUndoRedoBarViewModel);
local v5 = require(l_script_FirstAncestor_0.Components.IconOnlyMenu);
local v6 = require(l_script_FirstAncestor_0.BaseControlBarContainer);
local l_FFlagAXResetAvatarButton_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXResetAvatarButton;
return v2.memo(function(v8) --[[ Line: 19 ]] --[[ Name: UndoRedoBarContainer ]]
    -- upvalues: v4 (copy), l_FFlagAXResetAvatarButton_0 (copy), v2 (copy), v6 (copy), v5 (copy)
    local v9 = v4();
    if l_FFlagAXResetAvatarButton_0 then
        return (v2.createElement(v6, {
            config = v9.items, 
            onActiveMenuItemChanged = function() --[[ Line: 24 ]] --[[ Name: onActiveMenuItemChanged ]]

            end, 
            LayoutOrder = v8.LayoutOrder
        }));
    else
        return (v2.createElement(v5, {
            items = v9.items, 
            direction = if v8.direction then v8.direction else "horizontal", 
            LayoutOrder = v8.LayoutOrder
        }));
    end;
end);