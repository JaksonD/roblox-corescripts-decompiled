local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v5 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v6 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v7 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Http.WebApi);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom);
local v11 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate);
local function v22(v12, v13) --[[ Line: 19 ]] --[[ Name: parseFetchPPEConfigResult ]]
    -- upvalues: v7 (copy)
    local v14 = nil;
    local v15 = 1;
    local v16 = 0;
    local v17 = v7.ConvertThumbnailTypeToInt(v13);
    local l_avatarThumbnailCustomizations_0 = v12.avatarThumbnailCustomizations;
    if l_avatarThumbnailCustomizations_0 then
        for _, v20 in l_avatarThumbnailCustomizations_0 do
            if v20.thumbnailType == v17 then
                if v20.emoteAssetId and v20.emoteAssetId ~= 0 then
                    v14 = tostring(v20.emoteAssetId);
                end;
                if v20.camera then
                    v15 = v20.camera.distanceScale;
                    if v15 == -1 then
                        v15 = 1;
                    end;
                    v16 = v20.camera.yRotDeg;
                end;
            end;
        end;
    end;
    local v21 = v7.getSliderValueFromYRotDeg(v16);
    return v14, v7.getSliderValueFromCameraDistanceScale(v15), v21;
end;
return function(v23) --[[ Line: 52 ]]
    -- upvalues: v5 (copy), l_PerformFetch_0 (copy), v8 (copy), v22 (copy), v6 (copy), v9 (copy), v10 (copy), v11 (copy), v2 (copy), l_Logging_0 (copy)
    local l_PPEConfigFetchStatusKey_0 = v5.PPEConfigFetchStatusKey;
    return l_PerformFetch_0.Single(l_PPEConfigFetchStatusKey_0, function(v25) --[[ Line: 65 ]]
        -- upvalues: v8 (ref), v23 (copy), v22 (ref), v6 (ref), v9 (ref), v10 (ref), v11 (ref), v2 (ref), l_Logging_0 (ref)
        return v8.FetchPPEConfig(v23):andThen(function(v26) --[[ Line: 66 ]]
            -- upvalues: v22 (ref), v6 (ref), v25 (copy), v9 (ref), v10 (ref), v11 (ref), v2 (ref)
            local v27 = v26 and v26.responseBody;
            if v27 then
                local v28, v29, v30 = v22(v27, v6.Closeup);
                v25:dispatch(v9(v28));
                if v29 then
                    v25:dispatch(v10(v29));
                end;
                if v30 then
                    v25:dispatch(v11(v30));
                end;
                return v2.resolve();
            else
                return v2.reject();
            end;
        end, function(v31) --[[ Line: 88 ]]
            -- upvalues: l_Logging_0 (ref), v2 (ref)
            l_Logging_0.warn("WebApi failure in FetchPPEConfig");
            return v2.reject(v31);
        end);
    end);
end;