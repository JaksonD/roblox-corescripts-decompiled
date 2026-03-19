local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_1.Dash);
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.RoactUtils);
local v7 = require(l_Parent_1.SocialStopwatch);
local v8 = require(l_Parent_1.UIBlox);
local l_Images_0 = v8.App.ImageSet.Images;
local l_Toast_0 = v8.App.Dialog.Toast;
local l_dependencyArray_0 = v6.Hooks.dependencyArray;
local v12 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local v16 = require(l_Parent_0.Enums.CapturesToastType);
local v17 = require(l_Parent_0.Enums.CaptureType);
local v18 = require(l_Parent_0.Actions.CarouselOpened);
local v19 = require(l_Parent_0.Constants);
local v20 = require(l_Parent_0.Analytics.EventNames);
local v21 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v22 = require(l_Parent_0.Thunks.ShareCapture);
local v23 = require(l_Parent_0.Actions.ToastVanished);
local _ = require(l_Parent_0.Types);
local v25 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local v26 = {
    captureSaved = "captureSaved", 
    captureSavedToDevice = "captureSavedToDevice", 
    capturesEnabled = "capturesEnabled", 
    openInFiles = "openInFiles", 
    shareAction = "shareAction", 
    shareCaptureDescription = "shareCaptureDescription", 
    videoCaptureFailed = "videoCaptureFailed", 
    videoCaptureInitializationCapturingAlreadyError = "videoCaptureInitializationCapturingAlreadyError", 
    videoCaptureInitializationNoDeviceSupportError = "videoCaptureInitializationNoDeviceSupportError", 
    videoCaptureInitializationNoSpaceOnDeviceError = "videoCaptureInitializationNoSpaceOnDeviceError", 
    videoCaptureInitializationOtherError = "videoCaptureInitializationOtherError", 
    videoCaptureOtherError = "videoCaptureOtherError", 
    viewAction = "viewAction"
};
local v27 = true;
if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Windows then
    v27 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
end;
local function _(v28) --[[ Line: 64 ]] --[[ Name: isVideoCapture ]]
    -- upvalues: v25 (copy), v17 (copy)
    if not v28 then
        return false;
    else
        local l_captureInfo_0 = v28.captureInfo;
        if not l_captureInfo_0 then
            return false;
        elseif v25 then
            return l_captureInfo_0.CaptureType == Enum.CaptureType.Video;
        else
            return l_captureInfo_0.type == v17.Video;
        end;
    end;
end;
local v43 = {
    [v16.CaptureSavedToDevice] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = v27 and function(v31, _, v33) --[[ Line: 85 ]]
            -- upvalues: v20 (copy), v25 (copy), v17 (copy)
            v31.fireEvent(v20.CapturesSavedToDeviceToastOpenButtonActivated);
            local v34;
            if not v33 then
                v34 = false;
            else
                local l_captureInfo_1 = v33.captureInfo;
                v34 = not not l_captureInfo_1 and if v25 then l_captureInfo_1.CaptureType == Enum.CaptureType.Video else l_captureInfo_1.type == v17.Video;
            end;
            if v34 then
                game:OpenVideosFolder();
                return;
            else
                game:OpenScreenshotsFolder();
                return;
            end;
        end or nil, 
        toastCTAKey = if v27 then v26.openInFiles else nil, 
        toastTitleKey = v26.captureSavedToDevice
    }, 
    [v16.CaptureTaken] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v36, v37, v38) --[[ Line: 99 ]] --[[ Name: onActivated ]]
            -- upvalues: v20 (copy), v25 (copy), v17 (copy), v7 (copy), v22 (copy), v21 (copy)
            v36.fireEvent(v20.CapturesShareToastButtonActivated);
            local v39;
            if not v38 then
                v39 = false;
            else
                local l_captureInfo_2 = v38.captureInfo;
                v39 = not not l_captureInfo_2 and if v25 then l_captureInfo_2.CaptureType == Enum.CaptureType.Video else l_captureInfo_2.type == v17.Video;
            end;
            if v39 then
                v36.fireEvent(v20.CapturesVideoShareToastButtonActivated);
            end;
            if v38 and v38.captureInfo then
                if not v7.Stopwatch.get(v7.Events.CaptureShared) then
                    v7.Stopwatch.start(v7.Events.CaptureShared);
                end;
                v37(v22(v38.captureInfo, v21.Toast));
            end;
        end, 
        toastCTAKey = v26.shareAction, 
        toastSubtitleKey = v26.shareCaptureDescription, 
        toastTitleKey = v26.captureSaved
    }, 
    [v16.CapturesActivated] = {
        iconImage = l_Images_0["icons/status/success"], 
        toastTitleKey = v26.capturesEnabled
    }, 
    [v16.VideoCaptureFailed] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v26.videoCaptureFailed
    }, 
    [v16.VideoCaptureInitializationCapturingAlreadyError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v26.videoCaptureInitializationCapturingAlreadyError
    }, 
    [v16.VideoCaptureInitializationNoDeviceSupportError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v26.videoCaptureInitializationNoDeviceSupportError
    }, 
    [v16.VideoCaptureInitializationNoSpaceOnDeviceError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v26.videoCaptureInitializationNoSpaceOnDeviceError
    }, 
    [v16.VideoCaptureInitializationOtherError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v26.videoCaptureInitializationOtherError
    }, 
    [v16.VideoCaptureOtherError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v26.videoCaptureOtherError
    }, 
    [v16.ViewCapture] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v41, v42) --[[ Line: 147 ]] --[[ Name: onActivated ]]
            -- upvalues: v20 (copy), v18 (copy)
            v41.fireEvent(v20.CapturesViewToastButtonActivated);
            v42(v18(1));
        end, 
        toastCTAKey = v26.viewAction, 
        toastTitleKey = v26.captureSaved
    }
};
return function(_) --[[ Line: 158 ]]
    -- upvalues: v12 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v26 (copy), l_useSelector_0 (copy), v19 (copy), v5 (copy), v16 (copy), v43 (copy), v23 (copy), v3 (copy), l_dependencyArray_0 (copy), l_Toast_0 (copy)
    local v45 = v12();
    local v46 = l_useDispatch_0();
    local v47 = l_useLocalization_0({
        [v26.captureSaved] = "Feature.Captures.Toast.CaptureSaved", 
        [v26.captureSavedToDevice] = "Feature.Captures.Toast.CaptureSavedToDevice", 
        [v26.capturesEnabled] = "Feature.Captures.Toast.CapturesEnabled", 
        [v26.openInFiles] = "Feature.Captures.Action.OpenInFiles", 
        [v26.shareAction] = "Feature.Captures.Action.Share", 
        [v26.shareCaptureDescription] = "Feature.Captures.Description.ShareCTA", 
        [v26.videoCaptureFailed] = "Feature.Captures.Toast.VideoCaptureFailed", 
        [v26.videoCaptureInitializationCapturingAlreadyError] = "Feature.Captures.Toast.VideoCaptureInitializationCapturingAlreadyError", 
        [v26.videoCaptureInitializationNoDeviceSupportError] = "Feature.Captures.Toast.VideoCaptureInitializationNoDeviceSupportError", 
        [v26.videoCaptureInitializationNoSpaceOnDeviceError] = "Feature.Captures.Toast.VideoCaptureInitializationNoSpaceOnDeviceError", 
        [v26.videoCaptureInitializationOtherError] = "Feature.Captures.Toast.VideoCaptureInitializationOtherError", 
        [v26.videoCaptureOtherError] = "Feature.Captures.Toast.VideoCaptureOtherError", 
        [v26.viewAction] = "Feature.Captures.Action.ViewCapture"
    });
    local v49 = l_useSelector_0(function(v48) --[[ Line: 178 ]]
        -- upvalues: v19 (ref)
        return v48[v19.RoduxKey].Toast.ToastType;
    end);
    local v51 = l_useSelector_0(function(v50) --[[ Line: 182 ]]
        -- upvalues: v19 (ref)
        return v50[v19.RoduxKey].Toast.ToastConfig;
    end);
    local v53 = l_useSelector_0(function(v52) --[[ Line: 186 ]]
        -- upvalues: v19 (ref)
        return v52[v19.RoduxKey].Toast.IsDismissed;
    end);
    local v55 = v5.useCallback(function(v54) --[[ Line: 190 ]]
        -- upvalues: v47 (copy)
        if v54 then
            return v47[v54];
        else
            return nil;
        end;
    end);
    local v61 = v5.useMemo(function() --[[ Line: 197 ]]
        -- upvalues: v49 (copy), v16 (ref), v43 (ref), v46 (copy), v23 (ref), v45 (copy), v51 (copy), v19 (ref), v3 (ref), v55 (copy)
        if v49 == v16.None then
            return nil;
        else
            local v56 = v43[v49];
            local l_v49_0 = v49;
            local function v58() --[[ Line: 205 ]]
                -- upvalues: l_v49_0 (copy), v49 (ref), v46 (ref), v23 (ref)
                if l_v49_0 == v49 then
                    v46(v23());
                end;
            end;
            local v59 = nil;
            if v56.onActivated then
                v59 = function() --[[ Line: 213 ]]
                    -- upvalues: v56 (copy), v45 (ref), v46 (ref), v51 (ref), l_v49_0 (copy), v49 (ref), v23 (ref)
                    v56.onActivated(v45, v46, v51);
                    if l_v49_0 == v49 then
                        v46(v23());
                    end;
                end;
            end;
            local v60 = v56.duration or v19.ToastDuration;
            return v3.join(v56, {
                buttonText = v55(v56.toastCTAKey), 
                duration = v60, 
                onActivated = v59, 
                onDismissed = v58, 
                toastCTAKey = v3.None, 
                toastSubtitle = v55(v56.toastSubtitleKey), 
                toastSubtitleKey = v3.None, 
                toastTitle = v55(v56.toastTitleKey), 
                toastTitleKey = v3.None
            });
        end;
    end, l_dependencyArray_0(v49, v51));
    if not v61 then
        return nil;
    else
        return v5.createElement(v5.Fragment, {}, {
            [v49] = v5.createElement(l_Toast_0, {
                duration = v61.duration, 
                show = not v53, 
                toastContent = v61
            })
        });
    end;
end;