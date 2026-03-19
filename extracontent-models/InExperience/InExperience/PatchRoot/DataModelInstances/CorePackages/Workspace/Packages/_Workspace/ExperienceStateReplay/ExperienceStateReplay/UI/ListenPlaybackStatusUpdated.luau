local l_ExperienceStateRecordingService_0 = game:GetService("ExperienceStateRecordingService");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.SecondsToTimeStr);
return {
    setupListener = function(v3) --[[ Line: 9 ]] --[[ Name: setupListener ]]
        -- upvalues: l_ExperienceStateRecordingService_0 (copy), v2 (copy)
        l_ExperienceStateRecordingService_0.PlaybackStatusUpdated:Connect(function(v4, _) --[[ Line: 10 ]]
            -- upvalues: v3 (copy), v2 (ref)
            v3.ScrubberPlayProgress.Size = UDim2.new(v4, 0, 1, 0);
            v3.CurrentTimeLabel.Text = v2.convertSecondsToTimeStr(v4 * v3.loadedLengthSeconds + v3.replayToLoadedStartSeconds);
        end);
    end
};