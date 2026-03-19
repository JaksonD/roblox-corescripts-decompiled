local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_script_FirstAncestor_0.Constants);
local l_FFlagAXCustomizeMakeupSupport_0 = v2.FFlagAXCustomizeMakeupSupport;
local v5 = {
    [v3.ASSET_TYPE_NAME_TO_ID_STRING.EyebrowAccessory] = true, 
    [v3.ASSET_TYPE_NAME_TO_ID_STRING.EyelashAccessory] = true
};
return function(v6) --[[ Line: 16 ]] --[[ Name: isMakeupOrEyebrowEyelashAssetType ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), v3 (copy), v5 (copy)
    if not l_FFlagAXCustomizeMakeupSupport_0 then
        return false;
    else
        local v7 = true;
        if v3.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[v6] == nil then
            v7 = v5[v6] == true;
        end;
        return v7;
    end;
end;