local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.pcallDeferred);
local v7 = require(l_Parent_0.util.getEditableMeshFromContext);
local function v18(v8, v9) --[[ Line: 17 ]] --[[ Name: validateReferenceCageMeshContent ]]
    -- upvalues: v7 (copy), v2 (copy), v6 (copy), l_UGCValidationService_0 (copy), v4 (copy)
    local l_ReferenceCageMeshContent_0 = v8.ReferenceCageMeshContent;
    local v11 = false;
    if l_ReferenceCageMeshContent_0.Uri ~= nil then
        v11 = l_ReferenceCageMeshContent_0.Uri ~= "";
    end;
    local v12, v13 = v7(v8, "ReferenceCageMeshContent", v9);
    if not v12 then
        local v14 = nil;
        if not v11 then
            v2.reportFailure(v2.ErrorType.validateWrapTextureTransfer_NoCage, nil, v9);
            v14 = string.format("No ReferenceCageContent provided for %s", v8:GetFullName());
        else
            v2.reportFailure(v2.ErrorType.validateWrapTextureTransfer_FailedToLoadCage, nil, v9);
            v14 = string.format("Failed to load ReferenceCageContent for %s", v8:GetFullName());
        end;
        return false, {
            v14
        };
    else
        local v15, v16 = v6(function() --[[ Line: 41 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v4 (ref), v13 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshUVValuesInReference(v4.Head, v13);
        end, v9);
        if not v15 then
            local v17 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", v8:GetFullName());
            if v9.isServer then
                error(v17);
            end;
            v2.reportFailure(v2.ErrorType.validateWrapTextureTransfer_FailedToLoadUV, nil, v9);
            return false, {
                v17
            };
        elseif not v16 then
            v2.reportFailure(v2.ErrorType.validateWrapTextureTransfer_InvalidUV, nil, v9);
            return false, {
                string.format("Found invalid UV value for cage of '%s'. You need to edit the UV map to fix this issue.", v8:GetFullName())
            };
        else
            return true;
        end;
    end;
end;
return function(v19, v20) --[[ Line: 75 ]] --[[ Name: validateWrapTextureTransfer ]]
    -- upvalues: v3 (copy), v18 (copy), v2 (copy)
    local v21 = tick();
    local l_MAKEUP_INFO_0 = v3.MAKEUP_INFO;
    local l_WrapTextureTransfer_0 = v19:FindFirstChildOfClass("WrapTextureTransfer");
    assert(l_WrapTextureTransfer_0 ~= nil, string.format("WrapTextureTransfer child not found for %s", v19.Name));
    local v24, v25 = v18(l_WrapTextureTransfer_0, v20);
    if not v24 then
        return false, v25;
    elseif not l_WrapTextureTransfer_0.UVMinBound:FuzzyEq(l_MAKEUP_INFO_0.WrapTextureTransferUVBounds.MinBound) then
        v2.reportFailure(v2.ErrorType.validateWrapTextureTransfer_InvalidMinBound, nil, v20);
        return false, {
            string.format("%s.UVMinBound [%s] does not match required UVMinBound of [%s]", l_WrapTextureTransfer_0:GetFullName(), tostring(l_WrapTextureTransfer_0.UVMinBound), (tostring(l_MAKEUP_INFO_0.WrapTextureTransferUVBounds.MinBound)))
        };
    elseif not l_WrapTextureTransfer_0.UVMaxBound:FuzzyEq(l_MAKEUP_INFO_0.WrapTextureTransferUVBounds.MaxBound) then
        v2.reportFailure(v2.ErrorType.validateWrapTextureTransfer_InvalidMaxBound, nil, v20);
        return false, {
            string.format("%s.UVMaxBound [%s] does not match required UVMaxBound of [%s]", l_WrapTextureTransfer_0:GetFullName(), tostring(l_WrapTextureTransfer_0.UVMaxBound), (tostring(l_MAKEUP_INFO_0.WrapTextureTransferUVBounds.MaxBound)))
        };
    else
        v2.recordScriptTime(script.Name, v21, v20);
        return true;
    end;
end;