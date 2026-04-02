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
local v23 = require(l_Parent_0.Thunks.StartMomentsCreationFlow);
local v24 = require(l_Parent_0.Actions.ToastVanished);
local _ = require(l_Parent_0.Types);
local v26 = require(script.Parent.ToastController);
local v27 = require(l_Parent_0.Flags.FFlagCreateMomentsToast);
local v28 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_1.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v30 = {
    captureSaved = "captureSaved", 
    captureSavedToDevice = "captureSavedToDevice", 
    capturesEnabled = "capturesEnabled", 
    createAction = "createAction", 
    discoverPostWatch = "discoverPostWatch", 
    momentsTitle = "momentsTitle", 
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
local v31 = true;
if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Windows then
    v31 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
end;
local function _(v32) --[[ Line: 75 ]] --[[ Name: isVideoCapture ]]
    -- upvalues: v28 (copy), v17 (copy)
    if not v32 then
        return false;
    else
        local l_captureInfo_0 = v32.captureInfo;
        if not l_captureInfo_0 then
            return false;
        elseif v28 then
            return l_captureInfo_0.CaptureType == Enum.CaptureType.Video;
        else
            return l_captureInfo_0.type == v17.Video;
        end;
    end;
end;
local v47 = {
    [v16.CaptureSavedToDevice] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = v31 and function(v35, _, v37) --[[ Line: 96 ]]
            -- upvalues: v20 (copy), v28 (copy), v17 (copy)
            v35.fireEvent(v20.CapturesSavedToDeviceToastOpenButtonActivated);
            local v38;
            if not v37 then
                v38 = false;
            else
                local l_captureInfo_1 = v37.captureInfo;
                v38 = not not l_captureInfo_1 and if v28 then l_captureInfo_1.CaptureType == Enum.CaptureType.Video else l_captureInfo_1.type == v17.Video;
            end;
            if v38 then
                game:OpenVideosFolder();
                return;
            else
                game:OpenScreenshotsFolder();
                return;
            end;
        end or nil, 
        toastCTAKey = if v31 then v30.openInFiles else nil, 
        toastTitleKey = v30.captureSavedToDevice
    }, 
    [v16.CaptureTaken] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v40, v41, v42) --[[ Line: 110 ]] --[[ Name: onActivated ]]
            -- upvalues: v20 (copy), v28 (copy), v17 (copy), v7 (copy), v22 (copy), v21 (copy)
            v40.fireEvent(v20.CapturesShareToastButtonActivated);
            local v43;
            if not v42 then
                v43 = false;
            else
                local l_captureInfo_2 = v42.captureInfo;
                v43 = not not l_captureInfo_2 and if v28 then l_captureInfo_2.CaptureType == Enum.CaptureType.Video else l_captureInfo_2.type == v17.Video;
            end;
            if v43 then
                v40.fireEvent(v20.CapturesVideoShareToastButtonActivated);
            end;
            if v42 and v42.captureInfo then
                if not v7.Stopwatch.get(v7.Events.CaptureShared) then
                    v7.Stopwatch.start(v7.Events.CaptureShared);
                end;
                v41(v22(v42.captureInfo, v21.Toast));
            end;
        end, 
        toastCTAKey = v30.shareAction, 
        toastSubtitleKey = v30.shareCaptureDescription, 
        toastTitleKey = v30.captureSaved
    }, 
    [v16.CapturesActivated] = {
        iconImage = l_Images_0["icons/status/success"], 
        toastTitleKey = v30.capturesEnabled
    }, 
    [v16.CaptureTakenWithMomentsCTA] = {}, 
    [v16.VideoCaptureFailed] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v30.videoCaptureFailed
    }, 
    [v16.VideoCaptureInitializationCapturingAlreadyError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v30.videoCaptureInitializationCapturingAlreadyError
    }, 
    [v16.VideoCaptureInitializationNoDeviceSupportError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v30.videoCaptureInitializationNoDeviceSupportError
    }, 
    [v16.VideoCaptureInitializationNoSpaceOnDeviceError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v30.videoCaptureInitializationNoSpaceOnDeviceError
    }, 
    [v16.VideoCaptureInitializationOtherError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v30.videoCaptureInitializationOtherError
    }, 
    [v16.VideoCaptureOtherError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v30.videoCaptureOtherError
    }, 
    [v16.ViewCapture] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v45, v46) --[[ Line: 159 ]] --[[ Name: onActivated ]]
            -- upvalues: v20 (copy), v18 (copy)
            v45.fireEvent(v20.CapturesViewToastButtonActivated);
            v46(v18(1));
        end, 
        toastCTAKey = v30.viewAction, 
        toastTitleKey = v30.captureSaved
    }
};
return function(_) --[[ Line: 170 ]]
    -- upvalues: v12 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v30 (copy), l_useSelector_0 (copy), v19 (copy), v5 (copy), v16 (copy), v47 (copy), v24 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v27 (copy), v26 (copy), v23 (copy), l_Toast_0 (copy)
    local v49 = v12();
    local v50 = l_useDispatch_0();
    local v51 = l_useLocalization_0({
        [v30.captureSaved] = "Feature.Captures.Toast.CaptureSaved", 
        [v30.captureSavedToDevice] = "Feature.Captures.Toast.CaptureSavedToDevice", 
        [v30.capturesEnabled] = "Feature.Captures.Toast.CapturesEnabled", 
        [v30.createAction] = "Feature.Captures.Action.Create", 
        [v30.discoverPostWatch] = "Feature.Captures.Description.DiscoverPostWatch", 
        [v30.momentsTitle] = "Feature.Captures.Toast.CreateMoment2", 
        [v30.openInFiles] = "Feature.Captures.Action.OpenInFiles", 
        [v30.shareAction] = "Feature.Captures.Action.Share", 
        [v30.shareCaptureDescription] = "Feature.Captures.Description.ShareCTA", 
        [v30.videoCaptureFailed] = "Feature.Captures.Toast.VideoCaptureFailed", 
        [v30.videoCaptureInitializationCapturingAlreadyError] = "Feature.Captures.Toast.VideoCaptureInitializationCapturingAlreadyError", 
        [v30.videoCaptureInitializationNoDeviceSupportError] = "Feature.Captures.Toast.VideoCaptureInitializationNoDeviceSupportError", 
        [v30.videoCaptureInitializationNoSpaceOnDeviceError] = "Feature.Captures.Toast.VideoCaptureInitializationNoSpaceOnDeviceError", 
        [v30.videoCaptureInitializationOtherError] = "Feature.Captures.Toast.VideoCaptureInitializationOtherError", 
        [v30.videoCaptureOtherError] = "Feature.Captures.Toast.VideoCaptureOtherError", 
        [v30.viewAction] = "Feature.Captures.Action.ViewCapture"
    });
    local v53 = l_useSelector_0(function(v52) --[[ Line: 193 ]]
        -- upvalues: v19 (ref)
        return v52[v19.RoduxKey].Toast.ToastType;
    end);
    local v55 = l_useSelector_0(function(v54) --[[ Line: 197 ]]
        -- upvalues: v19 (ref)
        return v54[v19.RoduxKey].Toast.ToastConfig;
    end);
    local v57 = l_useSelector_0(function(v56) --[[ Line: 201 ]]
        -- upvalues: v19 (ref)
        return v56[v19.RoduxKey].Toast.IsDismissed;
    end);
    local v59 = v5.useCallback(function(v58) --[[ Line: 205 ]]
        -- upvalues: v51 (copy)
        if v58 then
            return v51[v58];
        else
            return nil;
        end;
    end);
    local v65 = v5.useMemo(function() --[[ Line: 213 ]]
        -- upvalues: v53 (copy), v16 (ref), v47 (ref), v50 (copy), v24 (ref), v49 (copy), v55 (copy), v19 (ref), v3 (ref), v59 (copy)
        if v53 == v16.None then
            return nil;
        else
            local v60 = v47[v53];
            local l_v53_0 = v53;
            local function v62() --[[ Line: 221 ]]
                -- upvalues: l_v53_0 (copy), v53 (ref), v50 (ref), v24 (ref)
                if l_v53_0 == v53 then
                    v50(v24());
                end;
            end;
            local v63 = nil;
            if v60.onActivated then
                v63 = function() --[[ Line: 229 ]]
                    -- upvalues: v60 (copy), v49 (ref), v50 (ref), v55 (ref), l_v53_0 (copy), v53 (ref), v24 (ref)
                    v60.onActivated(v49, v50, v55);
                    if l_v53_0 == v53 then
                        v50(v24());
                    end;
                end;
            end;
            local v64 = v60.duration or v19.ToastDuration;
            return v3.join(v60, {
                buttonText = v59(v60.toastCTAKey), 
                duration = v64, 
                onActivated = v63, 
                onDismissed = v62, 
                toastCTAKey = v3.None, 
                toastSubtitle = v59(v60.toastSubtitleKey), 
                toastSubtitleKey = v3.None, 
                toastTitle = v59(v60.toastTitleKey), 
                toastTitleKey = v3.None
            });
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v53, 
        v55
    } else l_dependencyArray_0(v53, v55));
    if not v65 then
        return nil;
    elseif v27 and v53 == v16.CaptureTakenWithMomentsCTA then
        return v5.createElement(v26, {
            title = v59(v30.momentsTitle), 
            text = v59(v30.discoverPostWatch), 
            icon = "icons/brands/moments_large", 
            actionText = v59(v30.createAction), 
            onAction = function() --[[ Line: 264 ]] --[[ Name: onAction ]]
                -- upvalues: v55 (copy), v50 (copy), v23 (ref)
                if v55 and v55.captureInfo then
                    v50(v23(v55.captureInfo));
                end;
            end, 
            onDismissed = function() --[[ Line: 269 ]] --[[ Name: onDismissed ]]
                -- upvalues: v50 (copy), v24 (ref)
                v50(v24());
            end, 
            duration = v65.duration, 
            show = not v57
        });
    else
        return v5.createElement(v5.Fragment, {}, {
            [v53] = v5.createElement(l_Toast_0, {
                duration = v65.duration, 
                show = not v57, 
                toastContent = v65
            })
        });
    end;
end;