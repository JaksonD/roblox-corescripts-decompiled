local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AvatarEditorStores);
local v3 = require(script.Parent.Parent.Stores.createAvatarEditorStores);
return function() --[[ Line: 12 ]] --[[ Name: useAvatarEditorStores ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v4 = v1.useContext(v2);
    if not v4 then
        warn("useAvatarEditorStores was used without an AvatarEditorStores context provider. Providing a temporary default value instead.");
        v4 = v3();
    end;
    return v4;
end;