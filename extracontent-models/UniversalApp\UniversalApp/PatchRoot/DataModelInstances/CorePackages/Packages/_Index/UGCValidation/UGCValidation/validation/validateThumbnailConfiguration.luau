local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v1 = game:DefineFastFlag("UGCValidationAddThumbnailFrustumCheckingv2", false);
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.Analytics);
return function(v5, v6, v7, v8, v9) --[[ Line: 14 ]] --[[ Name: validateThumbnailConfiguration ]]
    -- upvalues: v4 (copy), v1 (copy), l_UGCValidationService_0 (copy)
    local l_ThumbnailConfiguration_0 = v5:FindFirstChild("ThumbnailConfiguration");
    if l_ThumbnailConfiguration_0 then
        local l_ThumbnailCameraTarget_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraTarget");
        if l_ThumbnailCameraTarget_0.Value ~= v6 then
            v4.reportFailure(v4.ErrorType.validateThumbnailConfiguration_InvalidTarget, nil, v9);
            return false, {
                string.format("Invalid target asset for thumbnail generation. Expected it to be '%s'.", v6:GetFullName())
            };
        elseif game:GetEngineFeature("EngineUGCValidateThumbnailerMeshInFrustum") and v1 then
            local l_CFrame_0 = l_ThumbnailCameraTarget_0.Value.CFrame;
            local v13 = l_CFrame_0 * l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraValue").Value;
            if l_UGCValidationService_0:CheckEditableMeshInCameraFrustum(v7.editableMesh, v8, l_CFrame_0, v13) == false then
                v4.reportFailure(v4.ErrorType.validateThumbnailConfiguration_OutsideView, nil, v9);
                return false, {
                    string.format("Asset '%s' is positioned outside the thumbnail camera view. You need to reposition the asset at the center of the camera view and try again.", v7.fullName)
                };
            end;
        end;
    end;
    return true;
end;