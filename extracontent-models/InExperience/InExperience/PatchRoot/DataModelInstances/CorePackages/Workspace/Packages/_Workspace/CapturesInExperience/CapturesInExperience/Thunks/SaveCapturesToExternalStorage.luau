local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.CaptureType);
local v3 = require(l_Parent_0.Enums.CapturesToastType);
local v4 = require(l_Parent_0.Actions.ToastTriggered);
local _ = require(l_Parent_0.Types);
local v6 = require(l_Parent_0.Flags.FFlagCapturesVideoBulkManagerStopGap);
local v7 = game:DefineFastFlag("CapturesVideoSupportLegacyVideos", false);
local v8 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v9 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v10) --[[ Line: 17 ]]
    -- upvalues: v9 (copy), v6 (copy), l_CaptureService_0 (copy), v8 (copy), v2 (copy), v7 (copy), v4 (copy), v3 (copy)
    local v11 = {};
    for _, v13 in ipairs(v10) do
        if v9 then
            if v6 then
                table.insert(v11, (l_CaptureService_0:PreCaptureShared(v13)));
            else
                table.insert(v11, v13);
            end;
        elseif v8 and v13.type == v2.Video then
            if v7 then
                table.insert(v11, (l_CaptureService_0:PreVideoCaptureShared(v13.videoCapture)));
            else
                table.insert(v11, v13.videoCapture);
            end;
        elseif v13.type == v2.Screenshot then
            table.insert(v11, v13.filePath);
        end;
    end;
    return function(v14) --[[ Line: 39 ]]
        -- upvalues: l_CaptureService_0 (ref), v11 (copy), v4 (ref), v3 (ref), v10 (copy)
        l_CaptureService_0:SaveCapturesToExternalStorageAsync(v11);
        v14:dispatch(v4(v3.CaptureSavedToDevice, {
            captureInfo = v10[1]
        }));
    end;
end;