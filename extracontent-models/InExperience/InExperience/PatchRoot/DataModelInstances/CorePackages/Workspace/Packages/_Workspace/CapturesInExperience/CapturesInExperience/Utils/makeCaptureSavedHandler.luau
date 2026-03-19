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
local v10 = require(l_Parent_0.Utils.waitForFlashOverlay);
local v11 = require(l_Parent_0.Flags.FFlagEnableUpdatedCaptureControls);
local v12 = require(l_Parent_0.Enums.CaptureType);
local v13 = require(l_Parent_0.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript);
return function(v14, _, v16) --[[ Line: 24 ]] --[[ Name: makeCaptureSavedHandler ]]
    -- upvalues: v13 (copy), v12 (copy), v8 (copy), v11 (copy), v2 (copy), v5 (copy), v6 (copy), v10 (copy), v3 (copy), v7 (copy), v4 (copy)
    return function(v17, v18) --[[ Line: 25 ]] --[[ Name: captureSavedHandler ]]
        -- upvalues: v13 (ref), v12 (ref), v8 (ref), v11 (ref), v2 (ref), v16 (copy), v5 (ref), v14 (copy), v6 (ref), v10 (ref), v3 (ref), v7 (ref), v4 (ref)
        local v19 = if v13 then v17.CaptureType == Enum.CaptureType.Video else v17.type == v12.Video;
        if v18 == v8.UserSave and (not v11 or not v19) then
            local v20 = v2.Stopwatch.stop(v2.Events.CaptureTaken);
            v16(v5.CapturesEntrypointLatency, {
                statValue = if v20 then v20.timeElapsed else nil
            });
        end;
        v14:dispatch(v6());
        v10(v14);
        if v18 == v8.PromptedShare then
            return;
        else
            local v21 = v3.PolicyImplementation.read();
            if if v21 then v3.Mapper(v21).enableShareCaptureCTA() else false then
                v14:dispatch(v7(v4.CaptureTaken, {
                    captureInfo = v17
                }));
            else
                v14:dispatch(v7(v4.ViewCapture));
            end;
            if v19 then
                v16(v5.CapturesVideoShareToastViewed);
            end;
            v16(v5.CapturesShareToastViewed);
            return;
        end;
    end;
end;