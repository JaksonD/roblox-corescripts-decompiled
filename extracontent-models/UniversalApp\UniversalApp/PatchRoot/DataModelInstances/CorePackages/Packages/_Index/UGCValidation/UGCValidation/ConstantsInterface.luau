local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.util.ValidationRulesUtil);
local l_flags_0 = l_Parent_0.flags;
local v4 = require(l_flags_0.getEngineUGCValidateAssetTextureLimits);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationMakeupSupport);
return {
    isBodyPart = function(v6) --[[ Line: 12 ]] --[[ Name: isBodyPart ]]
        -- upvalues: v1 (copy)
        return v1.ASSET_TYPE_INFO[v6] and v1.ASSET_TYPE_INFO[v6].isBodyPart;
    end, 
    isMakeupAsset = function(v7) --[[ Line: 16 ]] --[[ Name: isMakeupAsset ]]
        local v8 = true;
        if v7 ~= Enum.AssetType.LipMakeup then
            v8 = true;
            if v7 ~= Enum.AssetType.EyeMakeup then
                v8 = v7 == Enum.AssetType.FaceMakeup;
            end;
        end;
        return v8;
    end, 
    getBodyPartAssets = function() --[[ Line: 22 ]] --[[ Name: getBodyPartAssets ]]
        -- upvalues: v1 (copy)
        local v9 = {};
        for v10, v11 in v1.ASSET_TYPE_INFO do
            if v11.isBodyPart then
                table.insert(v9, v10);
            end;
        end;
        return v9;
    end, 
    getRigAttachmentToParent = function(v12, v13) --[[ Line: 33 ]] --[[ Name: getRigAttachmentToParent ]]
        -- upvalues: v1 (copy)
        if not v12 then
            v12 = v1.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v13];
        end;
        if v12 then
            local v14 = v1.ASSET_TYPE_INFO[v12];
            if not v14.isBodyPart then
                return "";
            else
                return v14.subParts[v13].rigAttachmentToParent.name;
            end;
        else
            return "";
        end;
    end, 
    getAttachments = function(v15, v16) --[[ Line: 48 ]] --[[ Name: getAttachments ]]
        -- upvalues: v1 (copy)
        if not v15 then
            v15 = v1.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v16];
        end;
        local v17 = nil;
        if v15 then
            local v18 = v1.ASSET_TYPE_INFO[v15];
            if not v18.isBodyPart then
                return {};
            else
                v17 = v18.subParts[v16];
            end;
        end;
        local v19 = {};
        if v17 then
            table.insert(v19, v17.rigAttachmentToParent.name);
            for v20 in v17.otherAttachments do
                table.insert(v19, v20);
            end;
        end;
        return v19;
    end, 
    getTextureLimit = function(v21, v22, v23) --[[ Line: 72 ]] --[[ Name: getTextureLimit ]]
        -- upvalues: v4 (copy), v1 (copy), v2 (copy), v5 (copy)
        if not v4() then
            return v1.MAX_TEXTURE_SIZE;
        elseif not v21 then
            return v1.MAX_TEXTURE_SIZE;
        else
            local v24 = v2:getRules().TextureRules.AssetTextureLimits[v21];
            if not v24 then
                return v1.MAX_TEXTURE_SIZE;
            elseif v22:IsA("SpecialMesh") and v23 == "TextureId" then
                return v24.ColorMapSize;
            elseif v22:IsA("MeshPart") and v23 == "TextureID" then
                return v24.ColorMapSize;
            else
                local v25 = v5() and v22:IsA("Decal");
                if v22:IsA("SurfaceAppearance") or v25 then
                    if v23 == "ColorMap" then
                        return v24.ColorMapSize;
                    elseif v23 == "MetalnessMap" then
                        return v24.MetalnessMapSize;
                    elseif v23 == "NormalMap" then
                        return v24.NormalMapSize;
                    elseif v23 == "RoughnessMap" then
                        return v24.RoughnessMapSize;
                    end;
                end;
                return v1.MAX_TEXTURE_SIZE;
            end;
        end;
    end
};