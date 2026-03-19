local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local v3 = require(l_Parent_0.AvatarExperienceCommon);
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
local l_ItemTypeEnum_0 = v3.Enums.ItemTypeEnum;
local v6 = require(l_script_FirstAncestor_0.Utils.getSubstateToTrackForChanges);
local v7 = require(l_script_FirstAncestor_0.Utils.assetOrderRelativelyEqual);
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local l_Constants_0 = v3.Constants;
return function(v10, v11) --[[ Line: 16 ]] --[[ Name: shouldInsertNewHistoryEntry ]]
    -- upvalues: v6 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v2 (copy), v7 (copy), l_Constants_0 (copy), l_ItemTypeEnum_0 (copy)
    local v12 = v6(v10, l_FFlagAXCustomizeMakeupSupport_0 and true or nil);
    local v13 = v6(v11, l_FFlagAXCustomizeMakeupSupport_0 and true or nil);
    if v2.deepEqual(v12, v13) and (not l_FFlagAXCustomizeMakeupSupport_0 or v7(v10, v11, l_Constants_0.LAYERED_ASSET_TYPES) and v7(v10, v11, l_Constants_0.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE)) then
        return false;
    else
        local v14 = true;
        local v15 = v13.OutfitTryOn.TryOnItems or {};
        for _, v17 in v15 do
            if v17.itemType == l_ItemTypeEnum_0.Bundle and v2.fieldCount(v17.bundleInfo or {}) == 0 then
                return false;
            end;
        end;
        return v14;
    end;
end;