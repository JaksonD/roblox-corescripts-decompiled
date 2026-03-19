local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("LogService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v6 = require(l_Components_0.UtilAndTab);
local v7 = require(script.Parent.ServerProfilerInterface);
local v8 = require(script.Parent.MicroProfilerView);
local v9 = require(script.Parent.Parent.Parent.Constants);
local l_MainRowPadding_0 = v9.GeneralFormatting.MainRowPadding;
local l_ButtonWidth_0 = v9.MicroProfilerFormatting.ButtonWidth;
local l_ButtonTextSize_0 = v9.MicroProfilerFormatting.ButtonTextSize;
local _ = v9.Font.MainWindow;
local l_MainWindowHeader_0 = v9.Font.MainWindowHeader;
local l_UnselectedGray_0 = v9.Color.UnselectedGray;
local l_SelectedBlue_0 = v9.Color.SelectedBlue;
local l_UnselectedGray_1 = v9.Color.UnselectedGray;
local v18 = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording);
local v19 = game:DefineFastFlag("DevConsoleMicroProfilerNewLayout", false);
local v20 = v4.Component:extend("MainViewProfiler");
v20.init = function(v21) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy)
    v21.onUtilTabHeightChanged = function(v22) --[[ Line: 36 ]]
        -- upvalues: v21 (copy)
        v21:setState({
            utilTabHeight = v22
        });
    end;
    v21.changeProfilerState = function(v23) --[[ Line: 42 ]]
        -- upvalues: l_GameSettings_0 (ref), v21 (copy), l_RbxAnalyticsService_0 (ref)
        return function() --[[ Line: 43 ]]
            -- upvalues: l_GameSettings_0 (ref), v23 (copy), v21 (ref), l_RbxAnalyticsService_0 (ref)
            l_GameSettings_0.OnScreenProfilerEnabled = v23;
            v21:setState({
                clientProfilerEnabled = v23
            });
            l_RbxAnalyticsService_0:ReportCounter("MicroprofilerDevConsolePressed");
        end;
    end;
    v21.microProfilerChangedConnection = l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 54 ]]
        -- upvalues: v21 (copy), l_GameSettings_0 (ref)
        v21:setState({
            clientProfilerEnabled = l_GameSettings_0.OnScreenProfilerEnabled
        });
    end);
    v21.utilRef = v4.createRef();
    v21.state = {
        utilTabHeight = 0
    };
end;
v20.didMount = function(v24) --[[ Line: 67 ]] --[[ Name: didMount ]]
    v24:setState({
        utilTabHeight = v24.utilRef.current.Size.Y.Offset
    });
end;
v20.willUnmount = function(v25) --[[ Line: 75 ]] --[[ Name: willUnmount ]]
    if v25.microProfilerChangedConnection then
        v25.microProfilerChangedConnection:Disconnect();
        v25.microProfilerChangedConnection = nil;
    end;
end;
v20.didUpdate = function(v26) --[[ Line: 82 ]] --[[ Name: didUpdate ]]
    local l_Size_0 = v26.utilRef.current.Size;
    if l_Size_0.Y.Offset ~= v26.state.utilTabHeight then
        v26:setState({
            utilTabHeight = l_Size_0.Y.Offset
        });
    end;
end;
v20.renderNewLayout = function(v28) --[[ Line: 91 ]] --[[ Name: renderNewLayout ]]
    -- upvalues: v4 (copy), v9 (copy), l_MainRowPadding_0 (copy), v6 (copy), v8 (copy)
    local l_size_0 = v28.props.size;
    local l_formFactor_0 = v28.props.formFactor;
    local l_tabList_0 = v28.props.tabList;
    local l_utilTabHeight_0 = v28.state.utilTabHeight;
    return v4.createElement("Frame", {
        Size = l_size_0, 
        BackgroundColor3 = v9.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    }, {
        UIListLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, l_MainRowPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        UtilAndTab = v4.createElement(v6, {
            windowWidth = l_size_0.X.Offset, 
            formFactor = l_formFactor_0, 
            tabList = l_tabList_0, 
            layoutOrder = 1, 
            refForParent = v28.utilRef, 
            onHeightChanged = v28.onUtilTabHeightChanged
        }), 
        MicroProfilerView = v4.createElement(v8, {
            Size = UDim2.new(1, 0, 1, -l_utilTabHeight_0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        })
    });
end;
v20.render = function(v33) --[[ Line: 123 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_ButtonWidth_0 (copy), v4 (copy), v9 (copy), l_MainRowPadding_0 (copy), v6 (copy), v18 (copy), l_MainWindowHeader_0 (copy), l_ButtonTextSize_0 (copy), l_UnselectedGray_1 (copy), l_UnselectedGray_0 (copy), l_SelectedBlue_0 (copy), v7 (copy)
    if v19 then
        return v33:renderNewLayout();
    else
        local l_size_1 = v33.props.size;
        local l_formFactor_1 = v33.props.formFactor;
        local l_tabList_1 = v33.props.tabList;
        local l_utilTabHeight_1 = v33.state.utilTabHeight;
        local _ = v33.state.frameRate;
        local _ = v33.state.timeFrame;
        local _ = v33.state.waitingForData;
        local l_clientProfilerEnabled_0 = v33.state.clientProfilerEnabled;
        local _ = v33.state.outputPath;
        local _ = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30);
        local _ = UDim2.new(0.6, l_ButtonWidth_0, 0, 0);
        return v4.createElement("Frame", {
            Size = l_size_1, 
            BackgroundColor3 = v9.Color.BaseGray, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, l_MainRowPadding_0), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            UtilAndTab = v4.createElement(v6, {
                windowWidth = l_size_1.X.Offset, 
                formFactor = l_formFactor_1, 
                tabList = l_tabList_1, 
                layoutOrder = 1, 
                refForParent = v33.utilRef, 
                onHeightChanged = v33.onUtilTabHeightChanged
            }), 
            MainFrame = v4.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, -l_utilTabHeight_1), 
                CanvasSize = UDim2.new(1, 0, 1, -l_utilTabHeight_1), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, l_MainRowPadding_0 * 2), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                MicroProfilerRow = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 90), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    Label = v4.createElement("TextLabel", {
                        Size = UDim2.new(0, l_ButtonWidth_0, 0, 30), 
                        Position = UDim2.new(0.1, 0, 0, 0), 
                        Text = v18 and "Client MicroProfiler" or "MicroProfiler", 
                        Font = l_MainWindowHeader_0, 
                        TextSize = l_ButtonTextSize_0, 
                        TextColor3 = v9.Color.Text, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        BackgroundColor3 = l_UnselectedGray_1, 
                        BackgroundTransparency = 1
                    }), 
                    HorizontalLine = v4.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, 1), 
                        Position = UDim2.new(0, 0, 0, 30)
                    }), 
                    ToggleButton = v4.createElement("TextLabel", {
                        Size = UDim2.new(0.8, -l_ButtonWidth_0, 0, 30), 
                        Position = UDim2.new(0.09999999999999998, l_ButtonWidth_0, 0, 37.5), 
                        BackgroundTransparency = 1
                    }, {
                        OffButton = v4.createElement("TextButton", {
                            Size = UDim2.new(0.5, 0, 1, 0), 
                            Text = "Off", 
                            Font = l_MainWindowHeader_0, 
                            TextSize = l_ButtonTextSize_0, 
                            TextColor3 = v9.Color.Text, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            BackgroundColor3 = l_clientProfilerEnabled_0 and l_UnselectedGray_0 or l_SelectedBlue_0, 
                            [v4.Event.Activated] = v33.changeProfilerState(false)
                        }), 
                        ClientButton = v4.createElement("TextButton", {
                            Size = UDim2.new(0.5, 0, 1, 0), 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            Text = v18 and "On" or "Client", 
                            Font = l_MainWindowHeader_0, 
                            TextSize = l_ButtonTextSize_0, 
                            TextColor3 = v9.Color.Text, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            BackgroundColor3 = l_clientProfilerEnabled_0 and l_SelectedBlue_0 or l_UnselectedGray_0, 
                            [v4.Event.Activated] = v33.changeProfilerState(true)
                        })
                    })
                }), 
                HorizontalLine = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_MainRowPadding_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }), 
                ServerProfiler = v4.createElement(v7, {
                    Size = UDim2.new(1, 0, 0, 135), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                })
            })
        });
    end;
end;
return v20;