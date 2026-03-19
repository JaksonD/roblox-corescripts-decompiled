local l_TeleportService_0 = game:GetService("TeleportService");
local l_ExperienceStateRecordingService_0 = game:GetService("ExperienceStateRecordingService");
local v2 = {};
debugPrint = function(_) --[[ Line: 7 ]] --[[ Name: debugPrint ]]

end;
v2.SetLoadedState = function(v4, v5) --[[ Line: 13 ]] --[[ Name: SetLoadedState ]]
    debugPrint("playResult minFrameNumber " .. tostring(v5.minFrameNumber) .. " maxFrameNumber " .. tostring(v5.maxFrameNumber) .. " minEpoch " .. tostring(v5.minEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(v5.minEpoch):ToIsoDate()) .. " maxEpoch " .. tostring(v5.maxEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(v5.maxEpoch):ToIsoDate()));
    v4.minLoadedFrameNumber = v5.minFrameNumber;
    v4.maxLoadedFrameNumber = v5.maxFrameNumber;
    v4.minLoadedEpoch = v5.minEpoch;
    v4.maxLoadedEpoch = v5.maxEpoch;
    if v4.minOverallEpoch == nil then
        v4.minOverallEpoch = v4.minLoadedEpoch;
        v4.maxOverallEpoch = v4.maxLoadedEpoch;
    elseif v4.sourceType == Enum.ExperienceStateRecordingLoadSourceType.File then
        v4.minOverallEpoch = math.min(v4.minLoadedEpoch, v4.minOverallEpoch);
        v4.maxOverallEpoch = math.max(v4.maxLoadedEpoch, v4.maxOverallEpoch);
    end;
    v4.loadedLengthSeconds = (v4.maxLoadedEpoch - v4.minLoadedEpoch) / 1000;
    v4.overallLengthSeconds = (v4.maxOverallEpoch - v4.minOverallEpoch) / 1000;
    v4.replayToLoadedStartSeconds = (v4.minLoadedEpoch - v4.minOverallEpoch) / 1000;
    debugPrint("minOverallEpoch " .. tostring(v4.minOverallEpoch) .. " maxOverallEpoch " .. tostring(v4.maxOverallEpoch) .. " overallLengthSeconds " .. tostring(v4.overallLengthSeconds) .. " loadedLengthSeconds " .. tostring(v4.loadedLengthSeconds));
    local v6 = v4.loadedLengthSeconds / v4.overallLengthSeconds;
    v4.ScrubberLoadProgress.Size = UDim2.new(v6, 0, 1, 0);
    local v7 = v4.replayToLoadedStartSeconds / v4.overallLengthSeconds;
    v4.ScrubberLoadProgress.Position = UDim2.new(v7, 0, 0, 0);
    debugPrint("loadedPercent " .. tostring(v6) .. " loadedStartPercent " .. tostring(v7));
end;
v2.loadSlices = function(v8) --[[ Line: 71 ]] --[[ Name: loadSlices ]]
    -- upvalues: l_TeleportService_0 (copy), l_ExperienceStateRecordingService_0 (copy), v2 (copy)
    v8.LoadingOverlay.Visible = true;
    v8.state.Loading = true;
    v8.minLoadedFrameNumber = 0;
    v8.maxLoadedFrameNumber = 0;
    v8.minLoadedEpoch = 0;
    v8.maxLoadedEpoch = 0;
    v8.minOverallEpoch = nil;
    v8.maxOverallEpoch = nil;
    v8.nextSliceToLoad = nil;
    v8.noncontiguousSliceToLoad = nil;
    local l_l_TeleportService_0_LocalPlayerTeleportData_0 = l_TeleportService_0:GetLocalPlayerTeleportData();
    v8.recordingsToPlayback = {
        "/path/to/default/file"
    };
    v8.sourceType = Enum.ExperienceStateRecordingLoadSourceType.File;
    if l_l_TeleportService_0_LocalPlayerTeleportData_0 then
        v8.recordingsToPlayback = l_l_TeleportService_0_LocalPlayerTeleportData_0.captureURLs;
        if l_l_TeleportService_0_LocalPlayerTeleportData_0.startTime then
            v8.minOverallEpoch = l_l_TeleportService_0_LocalPlayerTeleportData_0.startTime.UnixTimestampMillis;
        end;
        if l_l_TeleportService_0_LocalPlayerTeleportData_0.endTime then
            v8.maxOverallEpoch = l_l_TeleportService_0_LocalPlayerTeleportData_0.endTime.UnixTimestampMillis;
        end;
        v8.sourceType = Enum.ExperienceStateRecordingLoadSourceType:FromValue(l_l_TeleportService_0_LocalPlayerTeleportData_0.sourceType);
        v8.placeURL = l_l_TeleportService_0_LocalPlayerTeleportData_0.placeURL;
    end;
    for v10, v11 in v8.recordingsToPlayback do
        debugPrint("Recording " .. tostring(v10) .. " " .. v11);
    end;
    task.spawn(function() --[[ Line: 107 ]]
        -- upvalues: l_ExperienceStateRecordingService_0 (ref), v8 (copy), v2 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 108 ]]
            -- upvalues: l_ExperienceStateRecordingService_0 (ref), v8 (ref), v2 (ref)
            local v12 = l_ExperienceStateRecordingService_0:LoadPlaybackAsync(v8.recordingsToPlayback[1], v8.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, v8.sourceType);
            v2.SetLoadedState(v8, v12);
            v8.nextSliceToLoad = 2;
            v8.LoadingOverlay.Visible = false;
            v8.state.Loading = false;
            v8.ControlButtons(v8.PlayButton);
            task.spawn(v2.loadSlicesAfterFirst, v8);
        end);
        if not l_status_0 then
            v8.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs";
            warn("Failed to load initial slice because " .. tostring(l_result_0));
        end;
    end);
end;
v2.loadSlicesAfterFirst = function(v15) --[[ Line: 131 ]] --[[ Name: loadSlicesAfterFirst ]]
    -- upvalues: l_ExperienceStateRecordingService_0 (copy), v2 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 132 ]]
        -- upvalues: v15 (copy), l_ExperienceStateRecordingService_0 (ref), v2 (ref)
        local v16 = 0;
        while true do
            task.wait(1);
            if v15.noncontiguousSliceToLoad ~= nil then
                local v17 = v15.recordingsToPlayback[v15.noncontiguousSliceToLoad];
                debugPrint("loading noncontiguous " .. tostring(v15.noncontiguousSliceToLoad) .. " url " .. v17);
                local v18 = l_ExperienceStateRecordingService_0:LoadPlaybackAsync(v17, nil, Enum.ExperienceStateRecordingLoadMode.NoncontiguousSlice, v15.sourceType);
                v2.SetLoadedState(v15, v18);
                local v19 = (v15.playbackSecondToFetch - v15.replayToLoadedStartSeconds) / v15.loadedLengthSeconds;
                l_ExperienceStateRecordingService_0:SetPlaybackPercentage(v19);
                v15.LoadingOverlay.Visible = false;
                v15.state.Loading = false;
                v16 = 0;
                v15.nextSliceToLoad = v15.noncontiguousSliceToLoad + 1;
                v15.noncontiguousSliceToLoad = nil;
            elseif v15.nextSliceToLoad <= #v15.recordingsToPlayback and v16 >= 4 then
                local v20 = v15.recordingsToPlayback[v15.nextSliceToLoad];
                debugPrint("loading contiguous " .. tostring(v15.nextSliceToLoad) .. " url " .. v20);
                local v21 = l_ExperienceStateRecordingService_0:LoadPlaybackAsync(v20, nil, Enum.ExperienceStateRecordingLoadMode.ContiguousSlice, v15.sourceType);
                v2.SetLoadedState(v15, v21);
                local l_v15_0 = v15;
                l_v15_0.nextSliceToLoad = l_v15_0.nextSliceToLoad + 1;
                v16 = 0;
            else
                v16 = v16 + 1;
            end;
        end;
    end);
    if not l_status_1 then
        v15.LoadingLabel.Text = "Failed To Load Later Slice, See Logs";
        warn("Failed to load later slice because " .. tostring(l_result_1));
    end;
end;
v2.loadNoncontiguousSlice = function(v25, v26) --[[ Line: 204 ]] --[[ Name: loadNoncontiguousSlice ]]
    if v25.noncontiguousSliceToLoad ~= nil then
        warn("skipping non-contiguous slice load as still waiting for last jump");
    end;
    v25.LoadingOverlay.Visible = true;
    v25.state.Loading = true;
    local v27 = v26 * v25.overallLengthSeconds;
    local v28 = math.floor(v27 / 60);
    v25.noncontiguousSliceToLoad = math.min(v28 + 1, #v25.recordingsToPlayback);
    v25.playbackSecondToFetch = v27;
    debugPrint("percentOverallLength " .. tostring(v26) .. " playbackSecondToFetch " .. tostring(v27) .. " playbackMinuteToFetch " .. tostring(v28) .. " nextSliceToLoad " .. tostring(v25.nextSliceToLoad));
end;
return v2;