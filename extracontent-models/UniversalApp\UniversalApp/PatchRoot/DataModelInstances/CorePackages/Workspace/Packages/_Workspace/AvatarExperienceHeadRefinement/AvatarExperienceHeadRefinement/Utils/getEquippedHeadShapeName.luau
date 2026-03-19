local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getEquippedAssetIdsByAssetTypeId);
local _ = require(l_script_FirstAncestor_0.Enums.HeadShape);
local v4 = require(l_script_FirstAncestor_0.Enums.HeadShapePropertiesByAssetId);
local l_FFlagDynamicHeadsMigration_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagDynamicHeadsMigration;
local l_Constants_0 = require(l_Parent_0.AvatarExperienceCommon).Constants;
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: getEquippedHeadShapeName ]]
    -- upvalues: v2 (copy), v4 (copy), l_FFlagDynamicHeadsMigration_0 (copy), l_Constants_0 (copy)
    local v9 = v2(v7, v8)[1];
    if v9 then
        return (v4[tostring(v9)] or {
            name = nil
        }).name;
    else
        if l_FFlagDynamicHeadsMigration_0 and v7 then
            local l_DynamicHead_0 = l_Constants_0.ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead;
            if l_DynamicHead_0 then
                local v11 = v7[l_DynamicHead_0];
                if v11 then
                    for _, v13 in v11 do
                        if v13 and v13.headShape then
                            return v13.headShape;
                        end;
                    end;
                end;
            end;
        end;
        return nil;
    end;
end;