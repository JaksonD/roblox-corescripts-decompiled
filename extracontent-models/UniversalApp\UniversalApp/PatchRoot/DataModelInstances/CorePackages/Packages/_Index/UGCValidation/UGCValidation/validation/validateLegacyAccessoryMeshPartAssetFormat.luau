local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.createLegacyAccessoryMeshPartAssetFormatSchema);
local v3 = require(l_Parent_0.validation.validateSingleInstance);
local v4 = require(l_Parent_0.validation.validateInstanceTree);
local v5 = require(l_Parent_0.validation.validateLegacyAccessoryMeshPartAssetFormatMatch);
local v6 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v7 = require(l_Parent_0.validation.validateSurfaceAppearanceTextureSize);
local v8 = require(l_Parent_0.validation.ValidateTexturePack);
local v9 = require(l_Parent_0.validation.validateSurfaceAppearanceTransparency);
local v10 = require(l_Parent_0.validation.ValidatePropertiesSensible);
local v11 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
return function(v13, v14) --[[ Line: 21 ]] --[[ Name: validateLegacyAccessoryMeshPartAssetFormat ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy), v11 (copy), v10 (copy), v6 (copy), v7 (copy), v9 (copy), v12 (copy), v8 (copy), v5 (copy)
    assert(v14.instances ~= nil, "instances required in validationContext for validateLegacyAccessoryMeshPartAssetFormat");
    local l_instances_0 = v14.instances;
    local v16 = nil;
    local v17 = nil;
    local v18, v19 = v3(l_instances_0, v14);
    v16 = v18;
    v17 = v19;
    if not v16 then
        return false, v17;
    else
        v18 = l_instances_0[1];
        local l_Attachment_0 = v13:FindFirstChild("Handle"):FindFirstChildOfClass("Attachment");
        local v21 = v2(l_Attachment_0.Name);
        local v22, v23 = v4(v21, v18, v14);
        v16 = v22;
        v17 = v23;
        if not v16 then
            return false, v17;
        else
            if v11() then
                v22, v23 = v10.validate(v18, v14);
                v16 = v22;
                v17 = v23;
                if not v16 then
                    return false, v17;
                end;
            end;
            v22, v23 = v6(v18, v14);
            v16 = v22;
            v17 = v23;
            if not v16 then
                return false, v17;
            else
                v22, v23 = v7(v18, v14);
                v16 = v22;
                v17 = v23;
                if not v16 then
                    return false, v17;
                else
                    v22, v23 = v9(v18, v14);
                    v16 = v22;
                    v17 = v23;
                    if not v16 then
                        return false, v17;
                    else
                        if v12() then
                            v22, v23 = v8.validate(v18, false, v14);
                            v16 = v22;
                            v17 = v23;
                            if not v16 then
                                return false, v17;
                            end;
                        end;
                        v22, v23 = v5(v18, v13, v14);
                        v16 = v22;
                        v17 = v23;
                        if not v16 then
                            return false, v17;
                        else
                            return true;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;