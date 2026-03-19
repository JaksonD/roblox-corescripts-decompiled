local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.validation.getCageMeshInfos);
local v2 = require(l_Parent_0.flags.getFStringLCCageQualityDocumentationLink);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationHyperlinksInCageQuality);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local v5 = require(l_Parent_0.validation.validateVerticesSimilarity);
local v6 = require(l_Parent_0.validation.validateLCCagingRelevancy);
local v7 = require(l_Parent_0.validation.validateRenderMeshInsideOuterCageMesh);
local v8 = require(l_Parent_0.validation.validateCageMeshDistance);
local v9 = require(l_Parent_0.validation.validateCageUVDuplicates);
local v10 = require(l_Parent_0.validation.ValidateModifiedCageArea);
local _ = require(l_Parent_0.util.Types);
return function(v12, v13, v14) --[[ Line: 18 ]] --[[ Name: validateLCCageQuality ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v7 (copy), v4 (copy), v8 (copy), v9 (copy), v10 (copy), v2 (copy), v3 (copy)
    local v15 = true;
    local v16 = {};
    local l_WrapLayer_0 = v12:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer");
    assert(l_WrapLayer_0, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer");
    local v18, v19, v20 = v1(v12, v14);
    if not v18 or v20 == nil then
        return false, v19;
    else
        local v21 = {
            v20[1], 
            v20[2]
        };
        local v22, v23 = unpack(v21);
        local v24 = false;
        local v25 = {};
        for _, v27 in v21 do
            local v28, v29 = v5(v27, v14, Vector3.new(1, 1, 1, 0), v27.fullName);
            v24 = v28;
            v25 = v29;
            if not v24 and v25 ~= nil then
                v15 = false;
                for _, v31 in v25 do
                    table.insert(v16, v31);
                end;
            end;
        end;
        local v32, v33 = v6(v22, v23, v13, l_WrapLayer_0.ReferenceOrigin.Position, l_WrapLayer_0.CageOrigin.Position, v14);
        v24 = v32;
        v25 = v33;
        if not v24 and v25 ~= nil then
            v15 = false;
            for _, v35 in v25 do
                table.insert(v16, v35);
            end;
        end;
        v32, v33 = v7(l_WrapLayer_0, v23, v13, v14);
        v24 = v32;
        v25 = v33;
        if not v24 then
            table.insert(v16, table.concat(v25, "\n"));
            v15 = false;
        end;
        if v4() then
            v32 = v14.assetTypeEnum;
            if v32 ~= Enum.AssetType.EyebrowAccessory and v32 ~= Enum.AssetType.EyelashAccessory then
                local v36;
                v33, v36 = v8(v22, v23, v13, l_WrapLayer_0.ReferenceOrigin, l_WrapLayer_0.CageOrigin, v14);
                v24 = v33;
                v25 = v36;
                if not v24 then
                    table.insert(v16, table.concat(v25, "\n"));
                    v15 = false;
                end;
            end;
        else
            v32, v33 = v8(v22, v23, v13, l_WrapLayer_0.ReferenceOrigin, l_WrapLayer_0.CageOrigin, v14);
            v24 = v32;
            v25 = v33;
            if not v24 then
                table.insert(v16, table.concat(v25, "\n"));
                v15 = false;
            end;
        end;
        v32, v33 = v9(v22, v23, v13, v14);
        v24 = v32;
        v25 = v33;
        if not v24 then
            table.insert(v16, table.concat(v25, "\n"));
            v15 = false;
        end;
        v32, v33 = v10.validate(v22, l_WrapLayer_0.ReferenceOrigin, v23, l_WrapLayer_0.CageOrigin, v13, v14);
        v24 = v32;
        v25 = v33;
        if not v24 then
            table.insert(v16, table.concat(v25, "\n"));
            v15 = false;
        end;
        if not v15 then
            if v2() ~= "" then
                v32 = nil;
                table.insert(v16, if v3() then string.format("[Caging best practices](%s)", v2()) else string.format("To better understand caging requirements, please visit %s", v2()));
            end;
            return false, v16;
        else
            return true;
        end;
    end;
end;