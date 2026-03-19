local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
return function(v4) --[[ Line: 14 ]] --[[ Name: checkCharacterDataHasTryOnItems ]]
    -- upvalues: v2 (copy)
    local v5 = v4.tryOn.OutfitTryOn and v4.tryOn.OutfitTryOn.TryOnItems or {};
    return v2.fieldCount(v5) > 0;
end;