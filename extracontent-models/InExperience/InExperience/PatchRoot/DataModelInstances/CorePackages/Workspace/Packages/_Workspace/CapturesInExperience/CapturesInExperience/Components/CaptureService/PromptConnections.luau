local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_CaptureService_0 = game:GetService("CaptureService");
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_1.ReactUtils);
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEventConnection_0 = v5.useEventConnection;
local v8 = require(l_Parent_0.App.CapturesPolicy);
local v9 = require(l_Parent_0.Actions.PromptTriggered);
local v10 = require(l_Parent_0.Enums.PromptType);
local _ = require(l_Parent_0.Types);
local v12 = require(l_Parent_0.Actions.ToastTriggered);
local v13 = require(l_Parent_0.Enums.CapturesToastType);
local v14 = require(l_Parent_0.Enums.CaptureType);
local v15 = require(l_Parent_0.Flags.FFlagCapturesEnableDownloadForU13);
local v16 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return (v8.connect(function(v17) --[[ Line: 107 ]]
    return {
        enableShareCaptureCTA = v17.enableShareCaptureCTA()
    };
end)(function(v18) --[[ Line: 29 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v9 (copy), v10 (copy), l_useEventConnection_0 (copy), l_CaptureService_0 (copy), v15 (copy), v16 (copy), v14 (copy), v12 (copy), v13 (copy)
    local v19 = l_useDispatch_0();
    local v23 = v3.useCallback(function(v20, v21) --[[ Line: 32 ]]
        -- upvalues: v19 (copy), v9 (ref), v10 (ref)
        local v22 = {
            contents = v21
        };
        v19(v9(v20, v10.SaveCaptures, v22));
    end, {});
    l_useEventConnection_0(l_CaptureService_0.OpenSaveCapturesPrompt, v23);
    local v31 = v3.useCallback(function(v24, v25, v26) --[[ Line: 42 ]]
        -- upvalues: v18 (copy), v19 (copy), v9 (ref), v10 (ref), v15 (ref), l_CaptureService_0 (ref), v16 (ref), v14 (ref), v12 (ref), v13 (ref)
        local v27 = {
            content = v25, 
            launchData = v26
        };
        local v28 = nil;
        if v18.enableShareCaptureCTA then
            v19(v9(v24, v10.ShareCapture, v27));
        elseif v15 then
            v28 = l_CaptureService_0.CaptureSavedInternal:Connect(function(v29) --[[ Line: 53 ]]
                -- upvalues: v25 (copy), v16 (ref), v14 (ref), v28 (ref), l_CaptureService_0 (ref), v19 (ref), v12 (ref), v13 (ref)
                if v25.Object ~= nil then
                    if v16 then
                        if v29.CaptureTime ~= v25.Object.CaptureTime then
                            return;
                        end;
                    elseif v29.type == v14.Video and v29.videoCapture.CaptureTime ~= v25.Object.CaptureTime then
                        return;
                    end;
                end;
                local v30 = if v16 then v29 else if v29.type == v14.Video then v29.videoCapture else v29.filePath;
                if v28 then
                    v28:Disconnect();
                end;
                l_CaptureService_0:SaveCapturesToExternalStorageAsync({
                    v30
                });
                v19(v12(v13.CaptureSavedToDevice, {
                    captureInfo = v30
                }));
            end);
            l_CaptureService_0:GetCaptureFilePathAsync(v25);
        else
            l_CaptureService_0:OnSharePromptFinished(v24, false);
        end;
    end, {
        v18.enableShareCaptureCTA
    });
    l_useEventConnection_0(l_CaptureService_0.OpenShareCapturePrompt, v31);
    local v34 = v3.useCallback(function(v32, _) --[[ Line: 95 ]]
        -- upvalues: v19 (copy), v9 (ref), v10 (ref)
        v19(v9(v32, v10.CapturePermissions, {}));
    end, {});
    if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
        l_useEventConnection_0(l_CaptureService_0.OpenCapturePermissionsPrompt, v34);
    end;
    return v3.createElement(v3.Fragment, {}, {});
end));