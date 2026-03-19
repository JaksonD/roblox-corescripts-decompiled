local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v1 = require(l_script_FirstAncestor_0.Utils.Constants);
local v2 = {
    new = function() --[[ Line: 17 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy)
        return {
            thumbnailType = v1.RbxAvatarThumbnailTypesFromEnum.HeadShot, 
            thumbnailSize = v1.RbxThumbnailSizes.Size150x150
        };
    end
};
v2.fromData = function(v3, v4) --[[ Line: 26 ]] --[[ Name: fromData ]]
    -- upvalues: v2 (copy)
    local v5 = v2.new();
    v5.thumbnailType = v3;
    v5.thumbnailSize = v4;
    return v5;
end;
return v2;