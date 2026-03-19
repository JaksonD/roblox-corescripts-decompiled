local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.validation.getCageMeshInfos);
local v2 = require(l_Parent_0.flags.getFStringLCCageQualityDocumentationLink);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local v4 = require(l_Parent_0.validation.validateVerticesSimilarity);
local v5 = require(l_Parent_0.validation.validateLCCagingRelevancy);
local v6 = require(l_Parent_0.validation.validateRenderMeshInsideOuterCageMesh);
local v7 = require(l_Parent_0.validation.validateCageMeshDistance);
local v8 = require(l_Parent_0.validation.validateCageUVDuplicates);
local v9 = require(l_Parent_0.validation.ValidateModifiedCageArea);
local _ = require(l_Parent_0.util.Types);
return function(v11, v12, v13) --[[ Line: 17 ]] --[[ Name: validateLCCageQuality ]]
    -- upvalues: v1 (copy), v4 (copy), v5 (copy), v6 (copy), v3 (copy), v7 (copy), v8 (copy), v9 (copy), v2 (copy)
    local v14 = true;
    local v15 = {};
    local l_WrapLayer_0 = v11:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer");
    assert(l_WrapLayer_0, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer");
    local v17, v18, v19 = v1(v11, v13);
    if not v17 or v19 == nil then
        return false, v18;
    else
        local v20 = {
            v19[1], 
            v19[2]
        };
        local v21, v22 = unpack(v20);
        local v23 = false;
        local v24 = {};
        for _, v26 in v20 do
            local v27, v28 = v4(v26, v13, Vector3.new(1, 1, 1, 0), v26.fullName);
            v23 = v27;
            v24 = v28;
            if not v23 and v24 ~= nil then
                v14 = false;
                for _, v30 in v24 do
                    table.insert(v15, v30);
                end;
            end;
        end;
        local v31, v32 = v5(v21, v22, v12, l_WrapLayer_0.ReferenceOrigin.Position, l_WrapLayer_0.CageOrigin.Position, v13);
        v23 = v31;
        v24 = v32;
        if not v23 and v24 ~= nil then
            v14 = false;
            for _, v34 in v24 do
                table.insert(v15, v34);
            end;
        end;
        v31, v32 = v6(l_WrapLayer_0, v22, v12, v13);
        v23 = v31;
        v24 = v32;
        if not v23 then
            table.insert(v15, table.concat(v24, "\n"));
            v14 = false;
        end;
        if v3() then
            v31 = v13.assetTypeEnum;
            if v31 ~= Enum.AssetType.EyebrowAccessory and v31 ~= Enum.AssetType.EyelashAccessory then
                local v35;
                v32, v35 = v7(v21, v22, v12, l_WrapLayer_0.ReferenceOrigin, l_WrapLayer_0.CageOrigin, v13);
                v23 = v32;
                v24 = v35;
                if not v23 then
                    table.insert(v15, table.concat(v24, "\n"));
                    v14 = false;
                end;
            end;
        else
            v31, v32 = v7(v21, v22, v12, l_WrapLayer_0.ReferenceOrigin, l_WrapLayer_0.CageOrigin, v13);
            v23 = v31;
            v24 = v32;
            if not v23 then
                table.insert(v15, table.concat(v24, "\n"));
                v14 = false;
            end;
        end;
        v31, v32 = v8(v21, v22, v12, v13);
        v23 = v31;
        v24 = v32;
        if not v23 then
            table.insert(v15, table.concat(v24, "\n"));
            v14 = false;
        end;
        v31, v32 = v9.validate(v21, l_WrapLayer_0.ReferenceOrigin, v22, l_WrapLayer_0.CageOrigin, v12, v13);
        v23 = v31;
        v24 = v32;
        if not v23 then
            table.insert(v15, table.concat(v24, "\n"));
            v14 = false;
        end;
        if not v14 then
            if v2() ~= "" then
                table.insert(v15, (string.format("[Caging best practices](%s)", v2())));
            end;
            return false, v15;
        else
            return true;
        end;
    end;
end;