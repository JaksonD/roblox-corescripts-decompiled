local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Services.CaptureService);
local v2 = require(l_Parent_0.Enums.CaptureType);
local v3 = require(l_Parent_0.Enums.CapturesToastType);
local v4 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
local v6 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v7 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v8) --[[ Line: 15 ]]
    -- upvalues: v7 (copy), v1 (copy), v6 (copy), v2 (copy), v4 (copy), v3 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v7 (ref), v1 (ref), v8 (copy), v6 (ref), v2 (ref), v4 (ref), v3 (ref)
        if v7 then
            v1:SaveCapturesToExternalStorageAsync({
                v8
            });
        elseif v6 and v8.type == v2.Video then
            v1:SaveVideoCaptureToExternalStorage(v8.videoCapture);
        else
            v1:SaveCaptureToExternalStorage(v8.filePath);
        end;
        v9:dispatch(v4(v3.CaptureSavedToDevice, {
            captureInfo = v8
        }));
    end;
end;