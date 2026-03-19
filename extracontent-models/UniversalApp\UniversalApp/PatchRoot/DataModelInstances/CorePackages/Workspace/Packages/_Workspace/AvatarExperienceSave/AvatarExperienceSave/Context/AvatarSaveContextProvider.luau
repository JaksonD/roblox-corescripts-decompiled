local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSave").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AvatarSaveContext);
local v3 = require(script.Parent.useAvatarSaveContextProviderValue);
return function(v4) --[[ Line: 9 ]] --[[ Name: AvatarSaveContextProvider ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v5 = v3();
    return v1.createElement(v2.Provider, {
        value = v5
    }, v4.children);
end;