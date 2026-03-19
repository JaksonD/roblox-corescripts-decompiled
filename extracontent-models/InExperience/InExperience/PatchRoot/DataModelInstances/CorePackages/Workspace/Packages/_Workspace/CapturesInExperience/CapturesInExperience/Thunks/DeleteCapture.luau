local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Thunks.RetrieveCaptures);
local v3 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v6 = require(l_Parent_0.Flags.FFlagCapturesVideoDeleteAsync);
local v7 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v8) --[[ Line: 15 ]]
    -- upvalues: v7 (copy), l_CaptureService_0 (copy), v5 (copy), v3 (copy), v6 (copy), v2 (copy)
    return function(v9) --[[ Line: 16 ]]
        -- upvalues: v7 (ref), v8 (copy), l_CaptureService_0 (ref), v5 (ref), v3 (ref), v6 (ref), v2 (ref)
        if v7 then
            l_CaptureService_0:DeleteCapturesAsync({
                v8
            });
        elseif v5 and v8.type == v3.Video then
            if v6 then
                l_CaptureService_0:DeleteVideoCaptureAsync(v8.videoCapture);
            else
                l_CaptureService_0:DeleteVideoCapture(v8.videoCapture);
            end;
        else
            l_CaptureService_0:DeleteCapture(v8.filePath);
        end;
        v9:dispatch(v2());
    end;
end;