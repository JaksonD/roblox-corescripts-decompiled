local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = game:GetService("ScriptContext");
local l_ScriptProfilerService_0 = game:GetService("ScriptProfilerService");
local _ = require(script.Parent.ProfilerDataFormatV2);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v7 = require(l_Components_0.ScrollingTextBox);
local _ = script.Parent.Parent.Parent.Actions;
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v9.GeneralFormatting.MainRowPadding;
local l_MainWindowHeader_0 = v9.Font.MainWindowHeader;
local l_MainWindow_0 = v9.Font.MainWindow;
local l_ButtonTextSize_0 = v9.MicroProfilerFormatting.ButtonTextSize;
local l_UnselectedGray_0 = v9.Color.UnselectedGray;
local l_ButtonWidth_0 = v9.MicroProfilerFormatting.ButtonWidth;
local v16 = v1.PureComponent:extend("ProfilerExportView");
local function _(v17, v18, v19) --[[ Line: 31 ]] --[[ Name: generateDefaultExportName ]]
    local v20 = "";
    local v21 = v17 and "client" or "server";
    local v22 = v18 and v18.SessionStartTime;
    if v22 then
        v20 = os.date("%Y%b%d-%H%M%S-", v22 / 1000) or "";
    end;
    return "scriptprofiler-" .. v20 .. v21 .. v19;
end;
v16.init = function(_) --[[ Line: 45 ]] --[[ Name: init ]]

end;
v16.didMount = function(v25) --[[ Line: 47 ]] --[[ Name: didMount ]]
    local v26 = {};
    local l_data_0 = v25.props.client.data;
    local v28 = "";
    local v29 = l_data_0 and l_data_0.SessionStartTime;
    if v29 then
        v28 = os.date("%Y%b%d-%H%M%S-", v29 / 1000) or "";
    end;
    v26.exportFilenameClient = "scriptprofiler-" .. v28 .. "client" .. ".json";
    l_data_0 = v25.props.server.data;
    v28 = "";
    v29 = l_data_0 and l_data_0.SessionStartTime;
    if v29 then
        v28 = os.date("%Y%b%d-%H%M%S-", v29 / 1000) or "";
    end;
    v26.exportFilenameServer = "scriptprofiler-" .. v28 .. "server" .. ".json";
    v25:setState(v26);
end;
v16.didUpdate = function(_) --[[ Line: 54 ]] --[[ Name: didUpdate ]]

end;
v16.renderExportInputAndButton = function(v31, v32, v33, v34) --[[ Line: 56 ]] --[[ Name: renderExportInputAndButton ]]
    -- upvalues: v1 (copy), l_UnselectedGray_0 (copy), l_ButtonTextSize_0 (copy), l_MainWindow_0 (copy), v9 (copy), v7 (copy), l_MainWindowHeader_0 (copy), l_ScriptProfilerService_0 (copy)
    return v1.createElement("TextLabel", {
        Size = UDim2.new(0.9, 0, 0, 30), 
        Position = UDim2.new(0.05, 0, 0, 37.5), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_UnselectedGray_0, 
        Text = v34 and "" or "Complete a profiling session to export data", 
        TextSize = l_ButtonTextSize_0, 
        Font = l_MainWindow_0, 
        TextColor3 = v9.Color.Text
    }, if v34 then {
        InputField = v1.createElement(v7, {
            Text = v33, 
            TextSize = l_ButtonTextSize_0, 
            Font = l_MainWindow_0, 
            Size = UDim2.new(0.8, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            ShowNativeInput = true, 
            TextColor3 = v9.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ClearTextOnFocus = false, 
            PlaceholderText = "Filename for export", 
            TextBoxFocusLost = function(v35, _, _) --[[ Line: 86 ]] --[[ Name: TextBoxFocusLost ]]
                -- upvalues: v32 (copy), v31 (copy)
                if v32 then
                    v31:setState({
                        exportFilenameClient = v35.text
                    });
                    return;
                else
                    v31:setState({
                        exportFilenameServer = v35.text
                    });
                    return;
                end;
            end
        }), 
        ExportButton = v1.createElement("TextButton", {
            Size = UDim2.new(0.2, 0, 1, 0), 
            Position = UDim2.new(0.8, 0, 0, 0), 
            Text = "Export", 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v9.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_0, 
            [v1.Event.Activated] = function() --[[ Line: 110 ]]
                -- upvalues: l_ScriptProfilerService_0 (ref), v34 (copy), v33 (copy), v32 (copy), v31 (copy)
                local v38 = l_ScriptProfilerService_0:SaveScriptProfilingData(v34, v33);
                if v32 then
                    v31:setState({
                        clientSavePath = v38
                    });
                    return;
                else
                    v31:setState({
                        serverSavePath = v38
                    });
                    return;
                end;
            end
        })
    } else {});
end;
v16.renderExportSection = function(v39, v40, v41) --[[ Line: 129 ]] --[[ Name: renderExportSection ]]
    -- upvalues: v1 (copy), l_ButtonWidth_0 (copy), l_MainWindowHeader_0 (copy), l_ButtonTextSize_0 (copy), v9 (copy), l_UnselectedGray_0 (copy)
    local v42 = nil;
    local v43 = nil;
    local v44 = nil;
    if v40 then
        v42 = v39.state.exportFilenameClient;
        v43 = v39.props.client.serializedData;
        v44 = v39.state.clientSavePath;
    else
        v42 = v39.state.exportFilenameServer;
        v43 = v39.props.server.serializedData;
        v44 = v39.state.serverSavePath;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 90), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        Label = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v41, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v9.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_0, 
            BackgroundTransparency = 1
        }), 
        HorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 30)
        }), 
        Export = v39:renderExportInputAndButton(v40, v42, v43), 
        SavedPath = if not v44 then nil else v1.createElement("TextBox", {
            Size = UDim2.new(0.95, 0, 0, 30), 
            Position = UDim2.new(0.05, 0, 0, 75), 
            Text = "Saved to " .. v44, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v9.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_0, 
            BackgroundTransparency = 1, 
            TextEditable = false, 
            ClearTextOnFocus = false
        })
    });
end;
v16.render = function(v45) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v9 (copy), l_MainRowPadding_0 (copy)
    return v1.createElement("Frame", {
        Size = v45.props.size, 
        BackgroundColor3 = v9.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0 * 2), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Row = v45:renderExportSection(true, "Client"), 
        HorizontalLine = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_MainRowPadding_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }), 
        Row2 = v45:renderExportSection(false, "Server")
    });
end;
return v2.UNSTABLE_connect2(function(v46, _) --[[ Line: 212 ]] --[[ Name: mapStateToProps ]]
    return {
        client = v46.ScriptProfiler.client, 
        server = v46.ScriptProfiler.server
    };
end, nil)(v16);