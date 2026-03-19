local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = game:GetService("ScriptContext");
local v4 = require(script.Parent.ProfilerUtil);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v6 = require(l_Components_0.DropDown);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v8 = require(l_Actions_0.SetScriptProfilerState);
local v9 = require(script.Parent.Parent.Parent.Constants);
local v10 = v9.GeneralFormatting.MainRowPadding * 2;
local l_SmallFrameHeight_0 = v9.UtilityBarFormatting.SmallFrameHeight;
local l_MainWindowHeader_0 = v9.Font.MainWindowHeader;
local l_MainWindow_0 = v9.Font.MainWindow;
local l_ButtonTextSize_0 = v9.MicroProfilerFormatting.ButtonTextSize;
local l_Text_0 = v9.Color.Text;
local _ = v9.Color.UnselectedGray;
local l_UnselectedGray_1 = v9.Color.UnselectedGray;
local l_SelectedBlue_0 = v9.Color.SelectedBlue;
local l_UnselectedGray_2 = v9.Color.UnselectedGray;
local l_ButtonWidth_0 = v9.MicroProfilerFormatting.ButtonWidth;
local l_DropDownArrowHeight_0 = v9.GeneralFormatting.DropDownArrowHeight;
local v22 = l_DropDownArrowHeight_0 / 2;
local l_DownArrow_0 = v9.Image.DownArrow;
local v24 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false);
local _ = function(v25, v26) --[[ Line: 43 ]] --[[ Name: makeFormattedStringTable ]]
    local v27 = table.create(#v25);
    for _, v29 in v25 do
        table.insert(v27, v26(v29));
    end;
    return v27;
end;
local function v32(v31) --[[ Line: 53 ]] --[[ Name: formatTimeSelection ]]
    -- upvalues: v4 (copy)
    if v31 == 0 then
        return "Off";
    else
        return v4.formatTimer(v31);
    end;
end;
local v33 = {
    "Callgraph", 
    "Functions"
};
local v34 = {
    0, 
    1, 
    60, 
    300, 
    600
};
local v35 = table.create(#v34);
for _, v37 in v34 do
    table.insert(v35, v32(v37));
end;
local l_v35_0 = v35;
v35 = {
    1000, 
    10000
};
local l_formatFrequency_0 = v4.formatFrequency;
local v40 = table.create(#v35);
for _, v42 in v35 do
    table.insert(v40, l_formatFrequency_0(v42));
end;
local l_v40_0 = v40;
l_formatFrequency_0 = {
    0, 
    60, 
    300, 
    600
};
local v44 = table.create(#l_formatFrequency_0);
for _, v46 in l_formatFrequency_0 do
    table.insert(v44, v32(v46));
end;
v40 = v44;
v44 = v1.PureComponent:extend("MobileSettingsView");
v44.init = function(_) --[[ Line: 74 ]] --[[ Name: init ]]

end;
v44.didMount = function(_) --[[ Line: 76 ]] --[[ Name: didMount ]]

end;
v44.didUpdate = function(_) --[[ Line: 78 ]] --[[ Name: didUpdate ]]

end;
v44.GetState = function(v50, v51) --[[ Line: 80 ]] --[[ Name: GetState ]]
    return (if v50.props.isClientView then v50.props.client else v50.props.server)[v51];
end;
v44.UpdateState = function(v52, v53, v54) --[[ Line: 86 ]] --[[ Name: UpdateState ]]
    local v55 = if v52.props.isClientView then v52.props.client else v52.props.server;
    local v56 = table.clone(v55);
    v56[v53] = v54;
    v52.props.dispatchSetScriptProfilerState(v52.props.isClientView, v56);
end;
v44.renderToggle = function(_, v58, v59, v60) --[[ Line: 95 ]] --[[ Name: renderToggle ]]
    -- upvalues: v1 (copy), l_SmallFrameHeight_0 (copy), l_ButtonWidth_0 (copy), l_MainWindowHeader_0 (copy), l_ButtonTextSize_0 (copy), v9 (copy), l_UnselectedGray_2 (copy), l_UnselectedGray_1 (copy), l_SelectedBlue_0 (copy)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2
    }, {
        Label = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v58, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v9.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_2, 
            BackgroundTransparency = 1
        }), 
        ToggleButton = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0 * 2, 0, l_SmallFrameHeight_0), 
            Position = UDim2.new(0.9, -l_ButtonWidth_0 * 2, 0, 0), 
            BackgroundTransparency = 1
        }, {
            OffButton = v1.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Text = "Off", 
                Font = l_MainWindowHeader_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v9.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = v59 and l_UnselectedGray_1 or l_SelectedBlue_0, 
                [v1.Event.Activated] = function() --[[ Line: 129 ]]
                    -- upvalues: v60 (copy)
                    v60(false);
                end
            }), 
            OnButton = v1.createElement("TextButton", {
                Size = UDim2.new(0.5, 0, 1, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Text = "On", 
                Font = l_MainWindowHeader_0, 
                TextSize = l_ButtonTextSize_0, 
                TextColor3 = v9.Color.Text, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                BackgroundColor3 = v59 and l_SelectedBlue_0 or l_UnselectedGray_1, 
                [v1.Event.Activated] = function() --[[ Line: 145 ]]
                    -- upvalues: v60 (copy)
                    v60(true);
                end
            })
        })
    });
end;
v44.renderStateToggle = function(v61, v62, v63, _) --[[ Line: 153 ]] --[[ Name: renderStateToggle ]]
    return v61:renderToggle(v62, v61:GetState(v63), function(v65) --[[ Line: 156 ]]
        -- upvalues: v61 (copy), v63 (copy)
        v61:UpdateState(v63, v65);
    end);
end;
v44.renderDropDown = function(v66, v67, v68, v69, v70, v71, v72) --[[ Line: 161 ]] --[[ Name: renderDropDown ]]
    -- upvalues: v1 (copy), l_ButtonWidth_0 (copy), l_SmallFrameHeight_0 (copy), l_ButtonTextSize_0 (copy), l_Text_0 (copy), l_MainWindow_0 (copy), v9 (copy), l_DownArrow_0 (copy), l_DropDownArrowHeight_0 (copy), v22 (copy), v6 (copy), l_MainWindowHeader_0 (copy), l_UnselectedGray_2 (copy)
    local v73 = nil;
    v73 = if v72 then v1.createElement("TextButton", {
        Position = UDim2.new(0.9, -l_ButtonWidth_0, 0, 0), 
        Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0), 
        Text = v69[v71], 
        TextSize = l_ButtonTextSize_0, 
        TextColor3 = l_Text_0, 
        Font = l_MainWindow_0, 
        AutoButtonColor = true, 
        BackgroundColor3 = v9.Color.InactiveBox, 
        BackgroundTransparency = 0
    }, {
        arrow = v1.createElement("ImageLabel", {
            Image = l_DownArrow_0, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, l_DropDownArrowHeight_0, 0, l_DropDownArrowHeight_0), 
            Position = UDim2.new(1, -l_DropDownArrowHeight_0 - v22, 0.5, -v22)
        })
    }) else v1.createElement("Frame", {
        Position = UDim2.new(0.9, -l_ButtonWidth_0, 0, 0), 
        Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0)
    }, {
        Selection = v1.createElement(v6, {
            buttonSize = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
            dropDownList = v69, 
            selectedIndex = v71, 
            onSelection = function(v74) --[[ Line: 193 ]] --[[ Name: onSelection ]]
                -- upvalues: v66 (copy), v68 (copy), v70 (copy)
                local l_v66_State_0 = v66:GetState(v68);
                if typeof(l_v66_State_0) == "boolean" then
                    l_v66_State_0 = v74 == 2;
                elseif typeof(l_v66_State_0) == "number" then
                    l_v66_State_0 = v70[v74];
                end;
                v66:UpdateState(v68, l_v66_State_0);
            end
        })
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_SmallFrameHeight_0), 
        BackgroundTransparency = 1
    }, {
        Label = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_ButtonWidth_0, 0, l_SmallFrameHeight_0), 
            Position = UDim2.new(0.1, 0, 0, 0), 
            Text = v67, 
            Font = l_MainWindowHeader_0, 
            TextSize = l_ButtonTextSize_0, 
            TextColor3 = v9.Color.Text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundColor3 = l_UnselectedGray_2, 
            BackgroundTransparency = 1
        }), 
        DropDown = v73
    });
end;
v44.render = function(v76) --[[ Line: 229 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v9 (copy), v10 (copy), v24 (copy), l_v35_0 (copy), v34 (copy), l_v40_0 (copy), v35 (copy), v4 (copy), v40 (copy), l_formatFrequency_0 (copy), v33 (copy)
    local l_v76_State_0 = v76:GetState("isProfiling");
    return v1.createElement("ScrollingFrame", {
        Size = v76.props.size, 
        BackgroundColor3 = v9.Color.BaseGray, 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, v10), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Percentages = v76:renderToggle("Percentages", v76.props.usePercentages, function(v78) --[[ Line: 245 ]]
            -- upvalues: v76 (copy)
            v76.props.dispatchSetScriptProfilerUsePercentages(v78);
        end), 
        LiveToggle = v76:renderStateToggle("Live Update", "liveUpdate"), 
        PluginsToggle = if not v24 then nil else v76:renderStateToggle("Show Plugins", "showPlugins"), 
        GCToggle = v76:renderStateToggle("GC Overhead", "showGc"), 
        AverageDropDown = v76:renderDropDown("Average", "average", l_v35_0, v34, table.find(v34, v76:GetState("average")) or 1), 
        FrequencyDropDown = v76:renderDropDown("Frequency", "frequency", l_v40_0, v35, table.find(v35, v76:GetState("frequency")) or 1, l_v76_State_0), 
        TimerDropDown = v76:renderDropDown("Timer" .. if l_v76_State_0 then ": " .. v4.formatTimer(v76:GetState("timedProfilingCountdown")) else "", "timedProfilingDuration", v40, l_formatFrequency_0, table.find(l_formatFrequency_0, v76:GetState("timedProfilingDuration")) or 1, l_v76_State_0), 
        ViewDropDown = v76:renderDropDown("View", "isFunctionsView", v33, nil, v76:GetState("isFunctionsView") and 2 or 1)
    });
end;
return v2.UNSTABLE_connect2(function(v79, _) --[[ Line: 296 ]] --[[ Name: mapStateToProps ]]
    return {
        usePercentages = v79.ScriptProfiler.usePercentages, 
        isClientView = v79.ScriptProfiler.isClientView, 
        client = v79.ScriptProfiler.client, 
        server = v79.ScriptProfiler.server
    };
end, function(v81) --[[ Line: 305 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy)
    return {
        dispatchSetScriptProfilerState = function(v82, v83) --[[ Line: 307 ]] --[[ Name: dispatchSetScriptProfilerState ]]
            -- upvalues: v81 (copy), v8 (ref)
            if v82 then
                v81(v8(v82, nil, v83, nil));
                return;
            else
                v81(v8(v82, nil, nil, v83));
                return;
            end;
        end, 
        dispatchSetScriptProfilerUsePercentages = function(v84) --[[ Line: 315 ]] --[[ Name: dispatchSetScriptProfilerUsePercentages ]]
            -- upvalues: v81 (copy), v8 (ref)
            v81(v8(nil, v84));
        end
    };
end)(v44);