local l_Parent_0 = script.Parent.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v2 = require(l_Parent_0.Enums.ExternalShareSourceType);
local v3 = require(l_Parent_0.Actions.PromptDismissed);
local v4 = require(l_Parent_0.Thunks.ShareCapture);
local v5 = require(l_Parent_0.Enums.CaptureType);
local _ = require(l_Parent_0.Types);
local v7 = game:DefineFastFlag("CapturesPromptShareImageFixEnabled", false);
local v8 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v9, v10, v11) --[[ Line: 18 ]]
    -- upvalues: v3 (copy), l_CaptureService_0 (copy), v8 (copy), v7 (copy), v5 (copy), v4 (copy), v2 (copy)
    return function(v12) --[[ Line: 19 ]]
        -- upvalues: v3 (ref), v9 (copy), v11 (copy), l_CaptureService_0 (ref), v10 (copy), v8 (ref), v7 (ref), v5 (ref), v4 (ref), v2 (ref)
        v12:dispatch(v3(v9));
        if v11 then
            task.spawn(function() --[[ Line: 23 ]]
                -- upvalues: l_CaptureService_0 (ref), v10 (ref), v8 (ref), v7 (ref), v5 (ref), v12 (copy), v4 (ref), v2 (ref)
                local l_l_CaptureService_0_CaptureFilePathAsync_0 = l_CaptureService_0:GetCaptureFilePathAsync(v10.content);
                local v14 = nil;
                local l_content_0 = v10.content;
                local v16 = false;
                if l_content_0.Object ~= nil then
                    v16 = l_content_0.Object:IsA("VideoCapture");
                end;
                v14 = if v8 and (not v7 or l_content_0.Object ~= nil) then l_content_0.Object else {
                    contentId = l_content_0.Uri or "rbxtemp://0", 
                    filePath = v16 and "" or l_l_CaptureService_0_CaptureFilePathAsync_0, 
                    type = if v16 then v5.Video else v5.Screenshot, 
                    videoCapture = if v16 then l_content_0.Object else nil
                };
                v12:dispatch(v4(v14, v2.Prompt, v10.launchData));
            end);
        end;
        l_CaptureService_0:OnSharePromptFinished(v9, v11);
    end;
end;