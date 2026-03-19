local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
local v2 = require(script.Parent.getSaveDict);
return function(v3, v4) --[[ Line: 6 ]] --[[ Name: checkHasChangesToSave ]]
    -- upvalues: v2 (copy)
    for _, v6 in (v2(v3, v4)) do
        if v6 then
            return true;
        end;
    end;
    return false;
end;