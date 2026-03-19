local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagAXCustomizeMakeupSupport_0 = v2.FFlagAXCustomizeMakeupSupport;
return function(v5) --[[ Line: 11 ]] --[[ Name: isMakeupAssetType ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), v3 (copy)
    if not l_FFlagAXCustomizeMakeupSupport_0 then
        return false;
    else
        return v3.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v5] ~= nil;
    end;
end;