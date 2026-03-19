local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v6 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v7 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v8 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Constants);
local v9 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Actions.IncrementPPEVersion);
local v11 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v12 = require(l_Modules_0.LuaApp.mutedError);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v18 = {
    toastMessage = "Feature.Avatar.Message.FailedWritePPE", 
    isLocalized = false, 
    toastType = v7.InformationMessage
};
local v19 = {
    toastMessage = "Feature.Avatar.Label.PPEFinishedToast", 
    isLocalized = false, 
    toastType = v7.InformationMessage
};
return function(v20, v21, v22, v23, v24, v25) --[[ Line: 40 ]]
    -- upvalues: v3 (copy), v8 (copy), l_PerformFetch_0 (copy), v9 (copy), v2 (copy), v11 (copy), v6 (copy), v19 (copy), v10 (copy), v12 (copy), v15 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v14 (copy), v18 (copy), l_Logging_0 (copy)
    v3.isType(v21, "userdata", "WritePPEConfig thunk expects thumbnailType to be a userdata");
    v3.isTypeOrNil(v22, "string", "WritePPEConfig thunk expects emoteAssetId to be a string or nil");
    v3.isType(v23, "number", "WritePPEConfig thunk expects cameraDistanceScale to be a number");
    v3.isType(v24, "number", "WritePPEConfig thunk expects cameraYRotDeg to be a number");
    v3.isType(v25, "number", "WritePPEConfig thunk expects fieldOfViewDeg to be a number");
    local v26 = v8.PPEConfigWriteStatusKeys[v21];
    return function(v27, v28) --[[ Line: 48 ]]
        -- upvalues: l_PerformFetch_0 (ref), v26 (copy), v21 (copy), v9 (ref), v20 (copy), v23 (copy), v24 (copy), v22 (copy), v2 (ref), v11 (ref), v25 (copy), v6 (ref), v19 (ref), v10 (ref), v12 (ref), v15 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v14 (ref), v18 (ref), l_Logging_0 (ref)
        local l_avatarEditorService_0 = v28.avatarEditorService;
        return l_PerformFetch_0.Single(v26, function(v30) --[[ Line: 50 ]]
            -- upvalues: v21 (ref), v9 (ref), v20 (ref), v23 (ref), v24 (ref), v22 (ref), v2 (ref), v11 (ref), l_avatarEditorService_0 (copy), v25 (ref), v6 (ref), v19 (ref), v10 (ref), v12 (ref), v15 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v14 (ref), v18 (ref), l_Logging_0 (ref)
            if v21 == v9.Closeup then
                local l_clickFinalSave_0 = v20.clickFinalSave;
                local l_v21_0 = v21;
                local v33 = false;
                if v23 == 1 then
                    v33 = v24 == 0;
                end;
                l_clickFinalSave_0(l_v21_0, v33, v22);
            end;
            return v2.new(function(v34, _) --[[ Line: 55 ]]
                -- upvalues: v22 (ref), v11 (ref), v21 (ref), l_avatarEditorService_0 (ref), v23 (ref), v24 (ref), v25 (ref), v9 (ref), v30 (copy), v6 (ref), v19 (ref), v10 (ref), v12 (ref), v15 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v14 (ref), v18 (ref), l_Logging_0 (ref)
                local v36 = v22 and tonumber(v22) or 0;
                local v37 = v11.ConvertThumbnailTypeToEnum(v21);
                local v38 = l_avatarEditorService_0:NoPromptSaveAvatarThumbnailCustomization(v37, v36, v23, v24, v25);
                while not v38 do
                    l_avatarEditorService_0.PromptSaveAvatarThumbnailCustomizationCompleted:Wait();
                    v38 = l_avatarEditorService_0:NoPromptSaveAvatarThumbnailCustomization(v37, v36, v23, v24, v25);
                end;
                local v39, v40 = l_avatarEditorService_0.PromptSaveAvatarThumbnailCustomizationCompleted:Wait();
                if v39 == Enum.AvatarPromptResult.Success then
                    if v21 == v9.Closeup then
                        v30:dispatch(v6(v19));
                    end;
                    v30:dispatch(v10(v21));
                    v34();
                    return;
                else
                    if tostring(v40) ~= tostring(Enum.SaveAvatarThumbnailCustomizationFailure.Other) then
                        v12(string.format("Call to AvatarEditorService:NoPromptSaveAvatarThumbnailCustomization failed with error code \"%s\"", (tostring(v40))));
                    end;
                    if v15() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v14.Counter.AvatarEditorServiceErrors.NoPromptSaveAvatarThumbnailCustomization);
                    end;
                    v30:dispatch(v6(v18));
                    l_Logging_0.warn("WebApi failure in WritePPEConfig");
                    return;
                end;
            end);
        end)(v27);
    end;
end;