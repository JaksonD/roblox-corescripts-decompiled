local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local l_util_0 = l_Parent_0.util;
local _ = require(l_util_0.Types);
local v5 = require(l_util_0.TexturePackUtils);
local v6 = require(l_util_0.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePackOnRCCOnly);
local v9 = {};
local function v17(v10, v11, v12) --[[ Line: 21 ]] --[[ Name: validateTexturePackURL ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy)
    local v13 = v6.new();
    local v14 = v5.findSurfaceAppearancesMissingTexturePacks(v10, v11);
    for _, v16 in v14 do
        v13:updateReasons(false, {
            (("'%*' has a 'TexturePack' property with an invalid URL. Please fix the URL."):format((v16:GetFullName())))
        });
    end;
    if #v14 > 0 then
        v2.reportFailure(v2.ErrorType.validateTexturePack_InvalidTexturePackURL, nil, v12);
    end;
    return v13:getFinalResults();
end;
local function v28(v18, v19) --[[ Line: 41 ]] --[[ Name: validateSurfaceAppearanceTexturePackMatch ]]
    -- upvalues: v6 (copy), v5 (copy), l_UGCValidationService_0 (copy), v2 (copy)
    local v20 = v6.new();
    local v21 = false;
    local v22 = false;
    for _, v24 in v5.findSurfaceAppearancesWithTexturePacks(v18) do
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 49 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v24 (copy)
            return l_UGCValidationService_0:DoesSurfaceAppearanceMatchTexturePackAsync(v24);
        end);
        if not l_status_0 then
            local v27 = ("Failed to download TexturePack for SurfaceAppearance '%*'."):format((v24:GetFullName()));
            if v19.isServer then
                error(v27);
            end;
            v22 = true;
            v20:updateReasons(false, {
                v27
            });
        else
            v20:updateReasons(l_result_0, {
                (("The textures in SurfaceAppearance '%*' do not match those in its TexturePack. Please fix the TexturePack"):format((v24:GetFullName())))
            });
            if not v21 then
                v21 = not l_result_0;
            end;
        end;
    end;
    if v22 then
        v2.reportFailure(v2.ErrorType.validateTexturePack_FailedToDownloadTexturePack, nil, v19);
    end;
    if v21 then
        v2.reportFailure(v2.ErrorType.validateTexturePack_TexturePackMismatch, nil, v19);
    end;
    return v20:getFinalResults();
end;
v9.validate = function(v29, v30, v31) --[[ Line: 82 ]] --[[ Name: validate ]]
    -- upvalues: v7 (copy), v8 (copy), v6 (copy), v17 (copy), v28 (copy), v2 (copy)
    if not v7() then
        return true;
    else
        local v32 = nil;
        if v8() then
            v32 = v31.isServer and true or false;
        end;
        if v31.allowEditableInstances then
            return true;
        else
            local v33 = tick();
            local v34 = v6.new();
            if v8() then
                if v32 then
                    v34:updateReasons(v17(v29, v30, v31));
                end;
            else
                v34:updateReasons(v17(v29, v30, v31));
            end;
            v34:updateReasons(v28(v29, v31));
            v2.recordScriptTime(script.Name, v33, v31);
            return v34:getFinalResults();
        end;
    end;
end;
return v9;