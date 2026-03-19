local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local v2 = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording);
local v3 = game:DefineFastFlag("DevConsoleMicroProfilerFixAutoTextClear", false);
local v4 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = script.Parent.Parent.Parent.Components;
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v9 = require(l_Actions_0.SetRCCProfilerState);
local v10 = require(script.Parent.Parent.Parent.Constants);
local _ = v10.GeneralFormatting.MainRowPadding;
local l_ButtonWidth_0 = v10.MicroProfilerFormatting.ButtonWidth;
local l_ButtonTextSize_0 = v10.MicroProfilerFormatting.ButtonTextSize;
local l_MainWindow_0 = v10.Font.MainWindow;
local l_MainWindowHeader_0 = v10.Font.MainWindowHeader;
local l_UnselectedGray_0 = v10.Color.UnselectedGray;
local l_SelectedBlue_0 = v10.Color.SelectedBlue;
local l_UnselectedGray_1 = v10.Color.UnselectedGray;
local v19 = v5.Component:extend("ServerProfilerInteraface");
v19.init = function(v20) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy), v4 (copy)
    v20.onUtilTabHeightChanged = function(v21) --[[ Line: 36 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            utilTabHeight = v21
        });
    end;
    v20.onFocusLostFrameRate = function(v22, _, _) --[[ Line: 42 ]]
        -- upvalues: l_GameSettings_0 (ref)
        l_GameSettings_0.RCCProfilerRecordFrameRate = v22.Text;
        v22.Text = l_GameSettings_0.RCCProfilerRecordFrameRate;
    end;
    v20.onFocusLostTimeFrame = function(v25, _, _) --[[ Line: 50 ]]
        -- upvalues: l_GameSettings_0 (ref)
        l_GameSettings_0.RCCProfilerRecordTimeFrame = v25.Text;
        v25.Text = l_GameSettings_0.RCCProfilerRecordTimeFrame;
    end;
    v20.requestRCCProfilerData = function(_) --[[ Line: 58 ]]
        -- upvalues: v4 (ref), l_GameSettings_0 (ref), v20 (copy)
        local v29 = v4();
        if v29 then
            v29:RequestRCCProfilerData(l_GameSettings_0.RCCProfilerRecordFrameRate, l_GameSettings_0.RCCProfilerRecordTimeFrame);
            v20.props.dispatchSetRCCProfilerState(true);
        end;
    end;
    v20.changeProfilerState = function(v30) --[[ Line: 71 ]]
        -- upvalues: l_GameSettings_0 (ref), v20 (copy)
        return function() --[[ Line: 72 ]]
            -- upvalues: l_GameSettings_0 (ref), v30 (copy), v20 (ref)
            l_GameSettings_0.OnScreenProfilerEnabled = v30;
            v20:setState({
                clientProfilerEnabled = v30
            });
        end;
    end;
    v20.state = {
        frameRate = l_GameSettings_0.RCCProfilerRecordFrameRate, 
        timeFrame = l_GameSettings_0.RCCProfilerRecordTimeFrame
    };
end;
v19.render = function(v31) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: l_ButtonWidth_0 (copy), v5 (copy), v2 (copy), l_MainWindowHeader_0 (copy), l_ButtonTextSize_0 (copy), v10 (copy), l_UnselectedGray_1 (copy), l_MainWindow_0 (copy), v3 (copy), l_UnselectedGray_0 (copy), l_SelectedBlue_0 (copy)
    local _ = v31.props.size;
    local _ = v31.props.formFactor;
    local _ = v31.props.tabList;
    local l_waitingForRecording_0 = v31.props.waitingForRecording;
    local l_lastFileOutputLocation_0 = v31.props.lastFileOutputLocation;
    local _ = v31.state.utilTabHeight;
    local l_frameRate_0 = v31.state.frameRate;
    local l_timeFrame_0 = v31.state.timeFrame;
    local _ = v31.state.clientProfilerEnabled;
    local v41 = not l_waitingForRecording_0 and #l_lastFileOutputLocation_0 > 0;
    local v42 = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30);
    local _ = UDim2.new(0.6, l_ButtonWidth_0, 0, 0);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 135), 
        BackgroundTransparency = 1, 
        LayoutOrder = 4
    }, {
        Label = v5.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v2 and "Server MicroProfiler" or "ServerProfiler", 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 1
        }), 
        HorizontalLine = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 30)
        }), 
        LabelFPS = v5.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 37.5), 
            Text = v2 and "Frames to dump" or "Frames Per Second", 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 1
        }), 
        FPSTextBox = v5.createElement("TextBox", {
            Size = v42, 
            Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 37.5), 
            Text = l_frameRate_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 0, 
            ClearTextOnFocus = not v3 or false, 
            [v5.Event.FocusLost] = v31.onFocusLostFrameRate
        }), 
        LabelTimeFrame = v5.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 67.5), 
            Text = v2 and "Seconds to delay" or "Seconds to Record", 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        }), 
        TimeFrameTextBox = v5.createElement("TextBox", {
            Size = v42, 
            Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 67.5), 
            Text = l_timeFrame_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_1, 
            BackgroundTransparency = 0, 
            ClearTextOnFocus = not v3 or false, 
            [v5.Event.FocusLost] = v31.onFocusLostTimeFrame
        }, {
            GetDumpButton = v5.createElement("TextButton", {
                Size = UDim2.new(0, l_ButtonWidth_0 * 0.7, 0, 30), 
                Position = UDim2.new(1, -l_ButtonWidth_0 * 0.7, 1, 30), 
                Text = l_waitingForRecording_0 and "Recording" or "Start Recording", 
                Font = l_MainWindow_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v10.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = l_waitingForRecording_0 and l_UnselectedGray_0 or l_SelectedBlue_0, 
                BackgroundTransparency = l_waitingForRecording_0 and 0.3 or 0, 
                AutoButtonColor = not l_waitingForRecording_0, 
                Active = not l_waitingForRecording_0, 
                [v5.Event.Activated] = v31.requestRCCProfilerData
            })
        }), 
        OutputPath = v41 and v5.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 0, 97.5), 
            Text = l_lastFileOutputLocation_0, 
            Font = l_MainWindow_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v10.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v6.UNSTABLE_connect2(function(v44, _) --[[ Line: 215 ]] --[[ Name: mapStateToProps ]]
    return {
        waitingForRecording = v44.MicroProfiler.waitingForRecording, 
        lastFileOutputLocation = v44.MicroProfiler.lastFileOutputLocation
    };
end, function(v46) --[[ Line: 222 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v9 (copy)
    return {
        dispatchSetRCCProfilerState = function(v47, v48) --[[ Line: 224 ]] --[[ Name: dispatchSetRCCProfilerState ]]
            -- upvalues: v46 (copy), v9 (ref)
            v46(v9(v47, v48));
        end
    };
end)(v19);