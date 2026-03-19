local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v4 = require(l_Parent_0.Flags.FFlagUseRbxstorageInGallery);
return function(v5) --[[ Line: 9 ]] --[[ Name: getCaptureUploadData ]]
    -- upvalues: v4 (copy), v2 (copy), l_CaptureService_0 (copy)
    if v4 and v5.type == v2.Video then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
            -- upvalues: l_CaptureService_0 (ref), v5 (copy)
            return l_CaptureService_0:GetCaptureUploadDataAsync(v5.filePath);
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0;
        end;
    end;
end;