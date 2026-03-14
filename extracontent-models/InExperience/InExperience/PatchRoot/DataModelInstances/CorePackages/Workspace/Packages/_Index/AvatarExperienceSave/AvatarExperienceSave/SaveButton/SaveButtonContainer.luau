local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.SaveButton.useSaveButtonProps);
local v5 = require(l_script_FirstAncestor_0.SaveButton.SaveButton);
return function(v6) --[[ Line: 10 ]] --[[ Name: SaveButtonContainer ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    return v2.createElement(v5, v3.assign(v6, v4()));
end;