local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSave").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AvatarSaveContext);
return function() --[[ Line: 7 ]] --[[ Name: useAvatarSaveContext ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    assert(v3, "useAvatarSaveContext returned nil, usually this means the AvatarSaveContextProvider is not present in the tree");
    return v3;
end;