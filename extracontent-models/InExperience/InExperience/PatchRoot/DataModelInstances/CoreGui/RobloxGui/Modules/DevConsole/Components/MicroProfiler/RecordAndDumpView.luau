local l_CorePackages_0 = game:GetService("CorePackages");
local l_MicroProfilerService_0 = game:GetService("MicroProfilerService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(script.Parent.Parent.BoxButton);
local v4 = require(script.Parent.Parent.Parent.Constants);
local v5 = require(script.Parent.MicroProfilerPanel);
local v6 = require(script.Parent.Parent.NumberInput);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local l_GameSettings_0 = UserSettings().GameSettings;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v11 = require(l_Actions_0.AppendRecentDumpPath);
local v12 = require(l_Actions_0.SetRCCProfilerState);
local v13 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v14 = v7.Component:extend("RecordAndDumpView");
local v15 = {
    eventName = "DevConsoleMpRecordAndDumpCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2025, 
        11, 
        24
    }, 
    description = "\t\tCounter to track the action of using the Developer Console to record and save MicroProfiler\n\t\tdumps for either the client or server.\n\t"
};
v14.logRecordAndDumpAction = function(v16, v17) --[[ Line: 41 ]] --[[ Name: logRecordAndDumpAction ]]
    -- upvalues: l_TelemetryService_0 (copy), v15 (copy)
    l_TelemetryService_0:LogCounter(v15, {
        customFields = {
            context = v17, 
            secondsToDelay = v16.state[("%*SecondsToDelay"):format(v17)], 
            framesToRecord = v16.state[("%*FramesToRecord"):format(v17)]
        }
    }, 1);
end;
v14.numericInputRow = function(_, v19) --[[ Line: 51 ]] --[[ Name: numericInputRow ]]
    -- upvalues: v7 (copy), v4 (copy), v6 (copy)
    return {
        UIListLayout = v7.createElement("UIListLayout", {
            Padding = UDim.new(0, 8), 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UIPadding = v7.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 4), 
            PaddingLeft = UDim.new(0, v4.MicroProfilerFormatting.OptionTextPadding), 
            PaddingRight = UDim.new(0, 4), 
            PaddingTop = UDim.new(0, 4)
        }), 
        OptionLabel = v7.createElement("TextLabel", {
            Font = v4.Font.MainWindow, 
            Text = v19.Text, 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextSize = v4.MicroProfilerFormatting.OptionTextSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Position = UDim2.fromOffset(8, 0), 
            Size = UDim2.fromScale(0, 1)
        }, {
            UIFlexItem = v7.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        NumberInput = v7.createElement(v6, {
            Size = UDim2.new(0, 72, 1, 0), 
            LayoutOrder = 3, 
            OnNumberInputChanged = v19.OnNumberInputChanged, 
            Range = v19.Range, 
            DefaultValue = v19.DefaultValue, 
            IntegerOnly = v19.IntegerOnly
        }), 
        NumberLimitsHint = v7.createElement("TextLabel", {
            Font = v4.Font.Log, 
            Text = ("(%*-%*)"):format(v19.Range.Min, v19.Range.Max), 
            TextColor3 = Color3.fromRGB(255, 255, 255), 
            TextSize = 12, 
            TextTransparency = 0.5, 
            BackgroundColor3 = Color3.fromRGB(255, 255, 255), 
            BackgroundTransparency = 1, 
            BorderColor3 = Color3.fromRGB(0, 0, 0), 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, 32, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Right
        })
    };
end;
v14.recordAndDumpRows = function(v20, v21) --[[ Line: 104 ]] --[[ Name: recordAndDumpRows ]]
    -- upvalues: l_GameSettings_0 (copy), v7 (copy), v3 (copy)
    local v22 = v21.Context == "Client";
    return {
        v20:numericInputRow({
            Context = v21.Context, 
            Text = "Number of frames to record", 
            DefaultValue = if v22 then v20.state.ClientFramesToRecord else v20.state.ServerFramesToRecord, 
            Range = NumberRange.new(1, 60), 
            IntegerOnly = true, 
            OnNumberInputChanged = function(v23) --[[ Line: 114 ]] --[[ Name: OnNumberInputChanged ]]
                -- upvalues: v22 (copy), v20 (copy), l_GameSettings_0 (ref)
                if v22 then
                    v20:setState({
                        ClientFramesToRecord = v23
                    });
                    return;
                else
                    l_GameSettings_0.RCCProfilerRecordFrameRate = v23;
                    v20:setState({
                        ServerFramesToRecord = v23
                    });
                    return;
                end;
            end
        }), 
        v20:numericInputRow({
            Context = v21.Context, 
            Text = "Seconds to delay", 
            DefaultValue = if v22 then v20.state.ClientSecondsToDelay else v20.state.ServerSecondsToDelay, 
            Range = NumberRange.new(1, 4), 
            IntegerOnly = true, 
            OnNumberInputChanged = function(v24) --[[ Line: 133 ]] --[[ Name: OnNumberInputChanged ]]
                -- upvalues: v22 (copy), v20 (copy), l_GameSettings_0 (ref)
                if v22 then
                    v20:setState({
                        ClientSecondsToDelay = v24
                    });
                    return;
                else
                    l_GameSettings_0.RCCProfilerRecordTimeFrame = v24;
                    v20:setState({
                        ServerSecondsToDelay = v24
                    });
                    return;
                end;
            end
        }), 
        {
            UIPadding = v7.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 2), 
                PaddingLeft = UDim.new(0, 2), 
                PaddingRight = UDim.new(0, 2), 
                PaddingTop = UDim.new(0, 2)
            }), 
            Button = v7.createElement(v3, {
                text = if v22 then if v20.state.IsClientRecording then v21.RecordButtonText.Recording else v21.RecordButtonText.Idle else if v20.props.IsServerRecording then v21.RecordButtonText.Recording else v21.RecordButtonText.Idle, 
                size = UDim2.fromScale(1, 1), 
                pos = UDim2.new(0, 0, 0, 0), 
                onClicked = v21.OnRecordButtonClicked, 
                enabled = if v22 then not v20.state.IsClientRecording else not v20.props.IsServerRecording
            })
        }
    };
end;
v14.init = function(v25) --[[ Line: 170 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy)
    v25.state = {
        IsClientRecording = false, 
        ClientFramesToRecord = 32, 
        ClientSecondsToDelay = 1, 
        ServerFramesToRecord = l_GameSettings_0.RCCProfilerRecordFrameRate, 
        ServerSecondsToDelay = l_GameSettings_0.RCCProfilerRecordTimeFrame
    };
    v25.RecordingTasks = {
        Client = nil
    };
end;
v14.willUnmount = function(v26) --[[ Line: 187 ]] --[[ Name: willUnmount ]]
    if v26.RecordingTasks.Client and coroutine.status(v26.RecordingTasks.Client) ~= "dead" then
        task.cancel(v26.RecordingTasks.Client);
    end;
end;
v14.render = function(v27) --[[ Line: 193 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v5 (copy), l_MicroProfilerService_0 (copy), v13 (copy)
    return v7.createElement(v5, {
        Title = "Record and dump", 
        LayoutOrder = v27.props.LayoutOrder, 
        Sections = {
            {
                Name = "Client", 
                Rows = v27:recordAndDumpRows({
                    Context = "Client", 
                    RecordButtonText = {
                        Idle = "Begin client recording", 
                        Recording = "Recording client..."
                    }, 
                    OnRecordButtonClicked = function() --[[ Line: 203 ]] --[[ Name: OnRecordButtonClicked ]]
                        -- upvalues: v27 (copy), l_MicroProfilerService_0 (ref)
                        if v27.state.IsClientRecording then
                            return;
                        else
                            v27:logRecordAndDumpAction("Client");
                            v27:setState({
                                IsClientRecording = true
                            });
                            v27.RecordingTasks.Client = task.spawn(function() --[[ Line: 211 ]]
                                -- upvalues: l_MicroProfilerService_0 (ref), v27 (ref)
                                local v28 = l_MicroProfilerService_0:DumpToFileAsync(v27.state.ClientSecondsToDelay, v27.state.ClientFramesToRecord);
                                v27.props.dispatchAppendRecentDumpPath(v28);
                                v27:setState(function(_) --[[ Line: 219 ]]
                                    return {
                                        IsClientRecording = false
                                    };
                                end);
                                v27.RecordingTasks.Client = nil;
                            end);
                            return;
                        end;
                    end
                })
            }, 
            {
                Name = "Server", 
                Rows = v27:recordAndDumpRows({
                    Context = "Server", 
                    RecordButtonText = {
                        Idle = "Begin server recording", 
                        Recording = "Recording server..."
                    }, 
                    OnRecordButtonClicked = function() --[[ Line: 235 ]] --[[ Name: OnRecordButtonClicked ]]
                        -- upvalues: v27 (copy), v13 (ref)
                        if v27.props.IsServerRecording then
                            return;
                        else
                            local v30 = v13();
                            if not v30 then
                                return;
                            else
                                v27:logRecordAndDumpAction("Server");
                                v30:RequestRCCProfilerData(v27.state.ServerFramesToRecord, v27.state.ServerSecondsToDelay);
                                v27.props.dispatchSetRCCProfilerState(true);
                                return;
                            end;
                        end;
                    end
                })
            }
        }
    });
end;
return v8.connect(function(v31, _) --[[ Line: 260 ]] --[[ Name: mapStateToProps ]]
    return {
        IsServerRecording = v31.MicroProfiler.waitingForRecording
    };
end, function(v33) --[[ Line: 266 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v12 (copy)
    return {
        dispatchAppendRecentDumpPath = function(v34) --[[ Line: 268 ]] --[[ Name: dispatchAppendRecentDumpPath ]]
            -- upvalues: v33 (copy), v11 (ref)
            v33(v11(v34));
        end, 
        dispatchSetRCCProfilerState = function(v35, v36) --[[ Line: 271 ]] --[[ Name: dispatchSetRCCProfilerState ]]
            -- upvalues: v33 (copy), v12 (ref)
            v33(v12(v35, v36));
        end
    };
end)(v14);