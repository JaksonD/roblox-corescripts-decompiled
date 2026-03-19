local l_Parent_0 = script:FindFirstAncestor("AvatarExperiencePhotobooth").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.PhotoboothContext);
return function() --[[ Line: 12 ]] --[[ Name: usePhotoboothContext ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (v1.useContext(v2));
end;