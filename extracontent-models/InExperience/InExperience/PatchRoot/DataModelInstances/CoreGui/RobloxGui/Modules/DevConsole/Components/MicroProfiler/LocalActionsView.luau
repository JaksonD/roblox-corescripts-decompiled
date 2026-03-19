local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v4 = require(script.Parent.Parent.BoxButton);
local v5 = require(script.Parent.Parent.Parent.Constants);
local v6 = require(script.Parent.Parent.Checkbox);
local v7 = require(script.Parent.MicroProfilerPanel);
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = v8.Component:extend("LocalActionsView");
local v10 = game:DefineFastFlag("DevConsoleMpEnableOpenDumpsFolderButton", false);
local v11 = {
    eventName = "DevConsoleMpToggleOnScreenMpCounter", 
    backends = {
        "RobloxTelemetryCounter"
    }, 
    lastUpdated = {
        2025, 
        11, 
        17
    }, 
    description = "\t\tCounter to track toggling the on-screen MicroProfiler on or off via the Developer Console.\n\t"
};
v9.init = function(v12) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: l_GameSettings_0 (copy)
    v12:setState({
        OnScreenMicroProfilerVisible = l_GameSettings_0.OnScreenProfilerEnabled
    });
    v12.onScreenMpToggledConn = l_GameSettings_0:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 33 ]]
        -- upvalues: v12 (copy), l_GameSettings_0 (ref)
        v12:setState({
            OnScreenMicroProfilerVisible = l_GameSettings_0.OnScreenProfilerEnabled
        });
    end);
end;
v9.willUnmount = function(v13) --[[ Line: 40 ]] --[[ Name: willUnmount ]]
    if v13.onScreenMpToggledConn then
        if v13.onScreenMpToggledConn.Connected then
            v13.onScreenMpToggledConn:Disconnect();
        end;
        v13.onScreenMpToggledConn = nil;
    end;
end;
v9.toggleOnScreenMicroProfiler = function(_, v15) --[[ Line: 49 ]] --[[ Name: toggleOnScreenMicroProfiler ]]
    -- upvalues: l_GameSettings_0 (copy), l_TelemetryService_0 (copy), v11 (copy)
    l_GameSettings_0.OnScreenProfilerEnabled = v15;
    l_TelemetryService_0:LogCounter(v11, {
        customFields = {
            visible = ("%*"):format(v15)
        }
    }, 1);
end;
v9.render = function(v16) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v7 (copy), v5 (copy), v6 (copy), v10 (copy), l_RunService_0 (copy), v4 (copy)
    return v8.createElement(v7, {
        Title = "Local actions", 
        LayoutOrder = v16.props.LayoutOrder, 
        Sections = {
            {
                Name = "LocalActions", 
                Rows = {
                    {
                        UIListLayout = v8.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        UIPadding = v8.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, v5.MicroProfilerFormatting.OptionTextPadding)
                        }), 
                        OptionLabel = v8.createElement("TextLabel", {
                            Size = UDim2.fromScale(0, 1), 
                            Position = UDim2.new(0, 8, 0, 0), 
                            BackgroundTransparency = 1, 
                            Text = "On-screen MicroProfiler visible", 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            Font = v5.Font.MainWindow, 
                            TextSize = v5.MicroProfilerFormatting.OptionTextSize, 
                            TextColor3 = Color3.new(1, 1, 1), 
                            LayoutOrder = 1
                        }, {
                            v8.createElement("UIFlexItem", {
                                FlexMode = Enum.UIFlexMode.Grow
                            })
                        }), 
                        CheckboxFrame = v8.createElement("Frame", {
                            Size = UDim2.fromOffset(v5.MicroProfilerFormatting.OptionRowHeight, v5.MicroProfilerFormatting.OptionRowHeight), 
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2
                        }, {
                            OnScreenMicroProfilerVisibleCheckbox = v8.createElement(v6, {
                                Name = "OnScreenMicroProfilerVisibleCheckbox", 
                                IsSelected = v16.state.OnScreenMicroProfilerVisible, 
                                Size = UDim2.fromOffset(v5.MicroProfilerFormatting.OptionCheckboxSize, v5.MicroProfilerFormatting.OptionCheckboxSize), 
                                Position = UDim2.fromOffset((v5.MicroProfilerFormatting.OptionRowHeight - v5.MicroProfilerFormatting.OptionCheckboxSize) / 2, (v5.MicroProfilerFormatting.OptionRowHeight - v5.MicroProfilerFormatting.OptionCheckboxSize) / 2), 
                                OnSelectedStateChanged = function(_, v18) --[[ Line: 115 ]] --[[ Name: OnSelectedStateChanged ]]
                                    -- upvalues: v16 (copy)
                                    v16:toggleOnScreenMicroProfiler(v18);
                                end
                            })
                        })
                    }, 
                    if not (v10 and game:GetEngineFeature("OpenLogsFolderApi")) or l_RunService_0:IsStudio() then nil else {
                        UIPadding = v8.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 2), 
                            PaddingLeft = UDim.new(0, 2), 
                            PaddingRight = UDim.new(0, 2), 
                            PaddingTop = UDim.new(0, 2)
                        }), 
                        Button = v8.createElement(v4, {
                            text = "Open dump folder", 
                            size = UDim2.fromScale(1, 1), 
                            pos = UDim2.new(0, 0, 0, 0), 
                            onClicked = function() --[[ Line: 135 ]] --[[ Name: onClicked ]]
                                game:OpenLogsFolder();
                            end
                        })
                    }
                }
            }
        }
    });
end;
return v9;