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
local v29 = {
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
local v30 = true;
if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Windows then
    v30 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
end;
local function _(v31) --[[ Line: 73 ]] --[[ Name: isVideoCapture ]]
    -- upvalues: v28 (copy), v17 (copy)
    if not v31 then
        return false;
    else
        local l_captureInfo_0 = v31.captureInfo;
        if not l_captureInfo_0 then
            return false;
        elseif v28 then
            return l_captureInfo_0.CaptureType == Enum.CaptureType.Video;
        else
            return l_captureInfo_0.type == v17.Video;
        end;
    end;
end;
local v46 = {
    [v16.CaptureSavedToDevice] = {
        iconImage = l_Images_0["icons/status/success"], 
        onActivated = v30 and function(v34, _, v36) --[[ Line: 94 ]]
            -- upvalues: v20 (copy), v28 (copy), v17 (copy)
            v34.fireEvent(v20.CapturesSavedToDeviceToastOpenButtonActivated);
            local v37;
            if not v36 then
                v37 = false;
            else
                local l_captureInfo_1 = v36.captureInfo;
                v37 = not not l_captureInfo_1 and if v28 then l_captureInfo_1.CaptureType == Enum.CaptureType.Video else l_captureInfo_1.type == v17.Video;
            end;
            if v37 then
                game:OpenVideosFolder();
                return;
            else
                game:OpenScreenshotsFolder();
                return;
            end;
        end or nil, 
        toastCTAKey = if v30 then v29.openInFiles else nil, 
        toastTitleKey = v29.captureSavedToDevice
    }, 
    [v16.CaptureTaken] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v39, v40, v41) --[[ Line: 108 ]] --[[ Name: onActivated ]]
            -- upvalues: v20 (copy), v28 (copy), v17 (copy), v7 (copy), v22 (copy), v21 (copy)
            v39.fireEvent(v20.CapturesShareToastButtonActivated);
            local v42;
            if not v41 then
                v42 = false;
            else
                local l_captureInfo_2 = v41.captureInfo;
                v42 = not not l_captureInfo_2 and if v28 then l_captureInfo_2.CaptureType == Enum.CaptureType.Video else l_captureInfo_2.type == v17.Video;
            end;
            if v42 then
                v39.fireEvent(v20.CapturesVideoShareToastButtonActivated);
            end;
            if v41 and v41.captureInfo then
                if not v7.Stopwatch.get(v7.Events.CaptureShared) then
                    v7.Stopwatch.start(v7.Events.CaptureShared);
                end;
                v40(v22(v41.captureInfo, v21.Toast));
            end;
        end, 
        toastCTAKey = v29.shareAction, 
        toastSubtitleKey = v29.shareCaptureDescription, 
        toastTitleKey = v29.captureSaved
    }, 
    [v16.CapturesActivated] = {
        iconImage = l_Images_0["icons/status/success"], 
        toastTitleKey = v29.capturesEnabled
    }, 
    [v16.CaptureTakenWithMomentsCTA] = {}, 
    [v16.VideoCaptureFailed] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v29.videoCaptureFailed
    }, 
    [v16.VideoCaptureInitializationCapturingAlreadyError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v29.videoCaptureInitializationCapturingAlreadyError
    }, 
    [v16.VideoCaptureInitializationNoDeviceSupportError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v29.videoCaptureInitializationNoDeviceSupportError
    }, 
    [v16.VideoCaptureInitializationNoSpaceOnDeviceError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v29.videoCaptureInitializationNoSpaceOnDeviceError
    }, 
    [v16.VideoCaptureInitializationOtherError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v29.videoCaptureInitializationOtherError
    }, 
    [v16.VideoCaptureOtherError] = {
        iconImage = l_Images_0["icons/status/alert"], 
        toastTitleKey = v29.videoCaptureOtherError
    }, 
    [v16.ViewCapture] = {
        iconImage = l_Images_0["icons/controls/screenshot"], 
        onActivated = function(v44, v45) --[[ Line: 157 ]] --[[ Name: onActivated ]]
            -- upvalues: v20 (copy), v18 (copy)
            v44.fireEvent(v20.CapturesViewToastButtonActivated);
            v45(v18(1));
        end, 
        toastCTAKey = v29.viewAction, 
        toastTitleKey = v29.captureSaved
    }
};
return function(_) --[[ Line: 168 ]]
    -- upvalues: v12 (copy), l_useDispatch_0 (copy), l_useLocalization_0 (copy), v29 (copy), l_useSelector_0 (copy), v19 (copy), v5 (copy), v16 (copy), v46 (copy), v24 (copy), v3 (copy), l_dependencyArray_0 (copy), v27 (copy), v26 (copy), v23 (copy), l_Toast_0 (copy)
    local v48 = v12();
    local v49 = l_useDispatch_0();
    local v50 = l_useLocalization_0({
        [v29.captureSaved] = "Feature.Captures.Toast.CaptureSaved", 
        [v29.captureSavedToDevice] = "Feature.Captures.Toast.CaptureSavedToDevice", 
        [v29.capturesEnabled] = "Feature.Captures.Toast.CapturesEnabled", 
        [v29.createAction] = "Feature.Captures.Action.Create", 
        [v29.discoverPostWatch] = "Feature.Captures.Description.DiscoverPostWatch", 
        [v29.momentsTitle] = "Feature.Captures.Toast.CreateMoment2", 
        [v29.openInFiles] = "Feature.Captures.Action.OpenInFiles", 
        [v29.shareAction] = "Feature.Captures.Action.Share", 
        [v29.shareCaptureDescription] = "Feature.Captures.Description.ShareCTA", 
        [v29.videoCaptureFailed] = "Feature.Captures.Toast.VideoCaptureFailed", 
        [v29.videoCaptureInitializationCapturingAlreadyError] = "Feature.Captures.Toast.VideoCaptureInitializationCapturingAlreadyError", 
        [v29.videoCaptureInitializationNoDeviceSupportError] = "Feature.Captures.Toast.VideoCaptureInitializationNoDeviceSupportError", 
        [v29.videoCaptureInitializationNoSpaceOnDeviceError] = "Feature.Captures.Toast.VideoCaptureInitializationNoSpaceOnDeviceError", 
        [v29.videoCaptureInitializationOtherError] = "Feature.Captures.Toast.VideoCaptureInitializationOtherError", 
        [v29.videoCaptureOtherError] = "Feature.Captures.Toast.VideoCaptureOtherError", 
        [v29.viewAction] = "Feature.Captures.Action.ViewCapture"
    });
    local v52 = l_useSelector_0(function(v51) --[[ Line: 191 ]]
        -- upvalues: v19 (ref)
        return v51[v19.RoduxKey].Toast.ToastType;
    end);
    local v54 = l_useSelector_0(function(v53) --[[ Line: 195 ]]
        -- upvalues: v19 (ref)
        return v53[v19.RoduxKey].Toast.ToastConfig;
    end);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 199 ]]
        -- upvalues: v19 (ref)
        return v55[v19.RoduxKey].Toast.IsDismissed;
    end);
    local v58 = v5.useCallback(function(v57) --[[ Line: 203 ]]
        -- upvalues: v50 (copy)
        if v57 then
            return v50[v57];
        else
            return nil;
        end;
    end);
    local v64 = v5.useMemo(function() --[[ Line: 210 ]]
        -- upvalues: v52 (copy), v16 (ref), v46 (ref), v49 (copy), v24 (ref), v48 (copy), v54 (copy), v19 (ref), v3 (ref), v58 (copy)
        if v52 == v16.None then
            return nil;
        else
            local v59 = v46[v52];
            local l_v52_0 = v52;
            local function v61() --[[ Line: 218 ]]
                -- upvalues: l_v52_0 (copy), v52 (ref), v49 (ref), v24 (ref)
                if l_v52_0 == v52 then
                    v49(v24());
                end;
            end;
            local v62 = nil;
            if v59.onActivated then
                v62 = function() --[[ Line: 226 ]]
                    -- upvalues: v59 (copy), v48 (ref), v49 (ref), v54 (ref), l_v52_0 (copy), v52 (ref), v24 (ref)
                    v59.onActivated(v48, v49, v54);
                    if l_v52_0 == v52 then
                        v49(v24());
                    end;
                end;
            end;
            local v63 = v59.duration or v19.ToastDuration;
            return v3.join(v59, {
                buttonText = v58(v59.toastCTAKey), 
                duration = v63, 
                onActivated = v62, 
                onDismissed = v61, 
                toastCTAKey = v3.None, 
                toastSubtitle = v58(v59.toastSubtitleKey), 
                toastSubtitleKey = v3.None, 
                toastTitle = v58(v59.toastTitleKey), 
                toastTitleKey = v3.None
            });
        end;
    end, l_dependencyArray_0(v52, v54));
    if not v64 then
        return nil;
    elseif v27 and v52 == v16.CaptureTakenWithMomentsCTA then
        return v5.createElement(v26, {
            title = v58(v29.momentsTitle), 
            text = v58(v29.discoverPostWatch), 
            icon = "icons/brands/moments_large", 
            actionText = v58(v29.createAction), 
            onAction = function() --[[ Line: 257 ]] --[[ Name: onAction ]]
                -- upvalues: v54 (copy), v49 (copy), v23 (ref)
                if v54 and v54.captureInfo then
                    v49(v23(v54.captureInfo));
                end;
            end, 
            onDismissed = function() --[[ Line: 262 ]] --[[ Name: onDismissed ]]
                -- upvalues: v49 (copy), v24 (ref)
                v49(v24());
            end, 
            duration = v64.duration, 
            show = not v56
        });
    else
        return v5.createElement(v5.Fragment, {}, {
            [v52] = v5.createElement(l_Toast_0, {
                duration = v64.duration, 
                show = not v56, 
                toastContent = v64
            })
        });
    end;
end;