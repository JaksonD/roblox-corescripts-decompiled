local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy)
    return v1.List.map(v3, function(v4) --[[ Line: 8 ]]
        -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
        return l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v4)));
    end);
end;