local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.SlotBasedEditorContext);
return function() --[[ Line: 13 ]] --[[ Name: useSlotBasedEditorContext ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (v1.useContext(v2));
end;