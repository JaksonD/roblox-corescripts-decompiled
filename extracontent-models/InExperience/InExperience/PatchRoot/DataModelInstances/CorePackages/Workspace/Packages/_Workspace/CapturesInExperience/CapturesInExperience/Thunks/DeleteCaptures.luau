local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.CaptureType);
local v3 = require(l_Parent_0.Thunks.RetrieveCaptures);
local _ = require(l_Parent_0.Types);
local v5 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
local v6 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v7) --[[ Line: 14 ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy), l_CaptureService_0 (copy), v3 (copy)
    local v8 = {};
    for _, v10 in ipairs(v7) do
        if v6 then
            table.insert(v8, v10);
        elseif v5 and v10.type == v2.Video then
            table.insert(v8, v10.videoCapture);
        elseif v10.type == v2.Screenshot then
            table.insert(v8, v10.filePath);
        end;
    end;
    return function(v11) --[[ Line: 26 ]]
        -- upvalues: l_CaptureService_0 (ref), v8 (copy), v3 (ref)
        l_CaptureService_0:DeleteCapturesAsync(v8);
        v11:dispatch(v3());
    end;
end;