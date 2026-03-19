local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialStopwatch);
local v3 = require(l_Parent_0.App.CapturesPolicy);
local v4 = require(l_Parent_0.Enums.CapturesToastType);
local v5 = require(l_Parent_0.Analytics.EventNames);
local v6 = require(l_Parent_0.Thunks.RetrieveCaptures);
local v7 = require(l_Parent_0.Actions.ToastTriggered);
local v8 = require(l_Parent_0.Enums.TriggerSourceType);
local _ = require(l_Parent_0.Types);
local v10 = require(l_Parent_0.Utils.getCaptureObject);
local v11 = require(l_Parent_0.Utils.waitForFlashOverlay);
local v12 = require(l_Parent_0.Flags.FFlagCreateMomentsToast);
local v13 = require(l_Parent_0.Flags.FFlagEnableUpdatedCaptureControls);
local v14 = require(l_Parent_0.Enums.CaptureType);
local v15 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v16, _, v18) --[[ Line: 27 ]] --[[ Name: makeCaptureSavedHandler ]]
    -- upvalues: v15 (copy), v14 (copy), v8 (copy), v13 (copy), v2 (copy), v5 (copy), v6 (copy), v11 (copy), v3 (copy), v10 (copy), v12 (copy), v7 (copy), v4 (copy)
    return function(v19, v20) --[[ Line: 28 ]] --[[ Name: captureSavedHandler ]]
        -- upvalues: v15 (ref), v14 (ref), v8 (ref), v13 (ref), v2 (ref), v18 (copy), v5 (ref), v16 (copy), v6 (ref), v11 (ref), v3 (ref), v10 (ref), v12 (ref), v7 (ref), v4 (ref)
        local v21 = if v15 then v19.CaptureType == Enum.CaptureType.Video else v19.type == v14.Video;
        if v20 == v8.UserSave and (not v13 or not v21) then
            local v22 = v2.Stopwatch.stop(v2.Events.CaptureTaken);
            v18(v5.CapturesEntrypointLatency, {
                statValue = if v22 then v22.timeElapsed else nil
            });
        end;
        v16:dispatch(v6());
        v11(v16);
        if v20 == v8.PromptedShare then
            return;
        else
            local v23 = v3.PolicyImplementation.read();
            local v24 = if v23 then v3.Mapper(v23).enableShareCaptureCTA() else false;
            local v25 = false;
            local v26 = v10(v19);
            if v12 then
                local v27 = false;
                if v26 ~= nil then
                    v27 = v21 and v26.TimeLength >= 6 or not v21;
                end;
                v25 = v27;
            end;
            if v25 then
                v16:dispatch(v7(v4.CaptureTakenWithMomentsCTA, {
                    captureInfo = v26
                }));
            elseif v24 then
                v16:dispatch(v7(v4.CaptureTaken, {
                    captureInfo = v19
                }));
            else
                v16:dispatch(v7(v4.ViewCapture));
            end;
            if v21 then
                v18(v5.CapturesVideoShareToastViewed);
            end;
            v18(v5.CapturesShareToastViewed);
            return;
        end;
    end;
end;