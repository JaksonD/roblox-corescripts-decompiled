local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local _ = require(l_script_FirstAncestor_0.SaveButton.useSaveButtonProps);
return function(v5) --[[ Line: 14 ]] --[[ Name: SaveButton ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v6 = v3.Hooks.useTokens();
    local v7 = v5.text or "Save";
    return v2.createElement(v3.Button, {
        text = v7, 
        isDisabled = v5.disabled, 
        size = v3.Enums.InputSize.Medium, 
        variant = if v5.disabled then v3.Enums.ButtonVariant.Standard else v3.Enums.ButtonVariant.Emphasis, 
        onActivated = v5.onActivated, 
        width = UDim.new(0, v6.Size.Size_2300), 
        LayoutOrder = v5.LayoutOrder
    });
end;