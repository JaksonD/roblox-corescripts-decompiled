local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local l_Components_0 = script.Parent.Parent.Parent.Components;
local v4 = require(l_Components_0.BannerButton);
local v5 = require(script.Parent.Parent.Parent.Constants);
local l_MainWindow_0 = v5.DefaultFontSize.MainWindow;
local l_Log_0 = v5.Font.Log;
local l_IconHeight_0 = v5.LogFormatting.IconHeight;
local l_TextFrameHeight_0 = v5.LogFormatting.TextFrameHeight;
local l_TextFramePadding_0 = v5.LogFormatting.TextFramePadding;
local l_MaxStringSize_0 = v5.LogFormatting.MaxStringSize;
local function v12(v13, v14) --[[ Line: 23 ]] --[[ Name: countContextLines ]]
    -- upvalues: v12 (copy)
    local v15 = 0;
    for v16, v17 in v13 do
        if v16 ~= "_expanded" then
            v15 = v15 + 1;
            if type(v17) == "table" and v14 + 1 < 3 and v17._expanded then
                v15 = v15 + v12(v17, v14 + 1);
            end;
        end;
    end;
    return v15;
end;
local v18 = v2.Component:extend("LogOutput");
v18.init = function(v19, v20) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v21 = v20.initLogOutput and v20.initLogOutput();
    v19.onCanvasChange = function() --[[ Line: 41 ]]
        -- upvalues: v19 (copy)
        local l_current_0 = v19.ref.current;
        if l_current_0 then
            local l_CanvasPosition_0 = l_current_0.CanvasPosition;
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            if v19.state.canvasPos ~= l_CanvasPosition_0 or v19.state.absSize ~= l_AbsoluteSize_0 then
                local v25 = l_current_0.CanvasPosition.Y + l_current_0.AbsoluteSize.Y == l_current_0.CanvasSize.Y.Offset;
                v19:setState({
                    canvasPos = l_CanvasPosition_0, 
                    absSize = l_AbsoluteSize_0, 
                    autoScroll = v25
                });
            end;
        end;
    end;
    v19.ref = v2.createRef();
    v19.state = {
        logData = v21, 
        absSize = Vector2.new(), 
        canvasPos = Vector2.new(), 
        autoScroll = true, 
        wordWrap = true
    };
end;
v18.willUpdate = function(v26, _, _) --[[ Line: 71 ]] --[[ Name: willUpdate ]]
    v26._canvasSignal:Disconnect();
    v26._absSizeSignal:Disconnect();
end;
v18.didUpdate = function(v29) --[[ Line: 76 ]] --[[ Name: didUpdate ]]
    v29._canvasSignal = v29.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v29.onCanvasChange);
    v29._absSizeSignal = v29.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v29.onCanvasChange);
    if v29.state.autoScroll then
        local l_current_1 = v29.ref.current;
        if l_current_1 then
            l_current_1.CanvasPosition = Vector2.new(l_current_1.CanvasPosition.X, v29.ref.current.CanvasSize.Y.Offset + v29.ref.current.AbsoluteSize.Y);
        end;
    end;
end;
v18.didMount = function(v31) --[[ Line: 92 ]] --[[ Name: didMount ]]
    -- upvalues: l_TextFrameHeight_0 (copy), l_TextFramePadding_0 (copy)
    v31.logConnector = v31.props.targetSignal:Connect(function(v32) --[[ Line: 93 ]]
        -- upvalues: v31 (copy), l_TextFrameHeight_0 (ref), l_TextFramePadding_0 (ref)
        if not v31.state.autoScroll and v32:getSize() == v32:getMaxSize() then
            local l_canvasPos_0 = v31.state.canvasPos;
            local l_Y_0 = l_canvasPos_0.Y;
            local v35 = v32:back();
            if v35 then
                local l_Y_1 = v35.Dims.Y;
                local v37 = v31.state.absSize.X - l_TextFrameHeight_0;
                if v31.state.wordWrap and v37 > 0 then
                    l_Y_1 = math.ceil(v35.Dims.Y * math.ceil(v35.Dims.X / v37));
                end;
                l_Y_0 = math.max(0, l_Y_0 - l_Y_1 - l_TextFramePadding_0);
            end;
            v31:setState({
                logData = v32, 
                canvasPos = Vector2.new(l_canvasPos_0.X, l_Y_0)
            });
            return;
        else
            v31:setState({
                logData = v32
            });
            return;
        end;
    end);
    v31._canvasSignal = v31.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(v31.onCanvasChange);
    v31._absSizeSignal = v31.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(v31.onCanvasChange);
    if v31.ref.current.AbsoluteSize.Magnitude > 0 then
        v31:setState({
            absSize = v31.ref.current.AbsoluteSize
        });
    end;
end;
v18.willUnmount = function(v38) --[[ Line: 137 ]] --[[ Name: willUnmount ]]
    v38.logConnector:Disconnect();
    v38.logConnector = nil;
end;
v18.render = function(v39) --[[ Line: 142 ]] --[[ Name: render ]]
    -- upvalues: l_TextFrameHeight_0 (copy), v2 (copy), v4 (copy), l_MainWindow_0 (copy), l_Log_0 (copy), l_TextFramePadding_0 (copy), v12 (copy), v5 (copy), l_IconHeight_0 (copy), l_MaxStringSize_0 (copy), l_TextService_0 (copy)
    local l_layoutOrder_0 = v39.props.layoutOrder;
    local l_size_0 = v39.props.size;
    local l_logData_0 = v39.state.logData;
    local l_absSize_0 = v39.state.absSize;
    local l_canvasPos_1 = v39.state.canvasPos;
    local l_wordWrap_0 = v39.state.wordWrap;
    local v46 = {};
    local v47 = 1;
    local v48 = 0;
    if v39.ref.current and l_logData_0 then
        local v49 = l_absSize_0.X - l_TextFrameHeight_0;
        local v50 = -1;
        local v51 = 0;
        local function _(v52) --[[ Line: 161 ]] --[[ Name: createOnButtonPress ]]
            -- upvalues: v39 (copy)
            return function() --[[ Line: 162 ]]
                -- upvalues: v52 (copy), v39 (ref)
                v52.Expanded = not v52.Expanded;
                v39:setState({});
            end;
        end;
        local function v54(v55, v56, v57, v58, v59) --[[ Line: 168 ]] --[[ Name: addContextEntries ]]
            -- upvalues: v2 (ref), v4 (ref), l_MainWindow_0 (ref), v39 (copy), l_Log_0 (ref), v54 (copy)
            if v58 >= 3 then
                return;
            else
                local v60 = {};
                for v61 in v56 do
                    if v61 ~= "_expanded" then
                        table.insert(v60, v61);
                    end;
                end;
                table.sort(v60, function(v62, v63) --[[ Line: 176 ]]
                    return tostring(v62) < tostring(v63);
                end);
                local v64 = v58 * 20 + 20;
                for _, v66 in v60 do
                    local v67 = v56[v66];
                    v59.i = v59.i + 1;
                    local l_i_0 = v59.i;
                    local v69 = ("Ctx_%*_%*"):format(v58, (tostring(v66)));
                    if type(v67) == "table" and v58 + 1 < 3 then
                        v55[v69] = v2.createElement(v4, {
                            size = UDim2.new(1, 0, 0, l_MainWindow_0), 
                            isExpanded = v67._expanded, 
                            isExpandable = true, 
                            layoutOrder = l_i_0, 
                            hideLines = true, 
                            onButtonPress = function() --[[ Line: 194 ]] --[[ Name: onButtonPress ]]
                                -- upvalues: v67 (copy), v39 (ref)
                                v67._expanded = not v67._expanded;
                                v39:setState({});
                            end
                        }, {
                            Label = v2.createElement("TextLabel", {
                                Text = ("%*: {...}"):format((tostring(v66))), 
                                TextSize = l_MainWindow_0, 
                                Font = l_Log_0, 
                                TextColor3 = v57, 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, -(v64 + 20), 1, 0), 
                                Position = UDim2.fromOffset(v64 + 20, 0), 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        });
                        if v67._expanded then
                            v54(v55, v67, v57, v58 + 1, v59);
                        end;
                    else
                        v55[v69] = v2.createElement("TextLabel", {
                            Text = ("%*: %*"):format(tostring(v66), (tostring(v67))), 
                            TextSize = l_MainWindow_0, 
                            Font = l_Log_0, 
                            TextColor3 = v57, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, l_MainWindow_0), 
                            LayoutOrder = l_i_0, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }, {
                            Padding = v2.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, v64 + 20)
                            })
                        });
                    end;
                end;
                return;
            end;
        end;
        local v70 = l_logData_0:iterator();
        local v71 = v70:next();
        while v71 do
            local l_v71_0 = v71;
            local l_Message_0 = l_v71_0.Message;
            local l_CharCount_0 = l_v71_0.CharCount;
            local l_Y_2 = l_v71_0.Dims.Y;
            if l_wordWrap_0 and v49 > 0 then
                l_Y_2 = math.ceil(l_v71_0.Dims.Y * math.ceil(l_v71_0.Dims.X / v49));
            end;
            local v76 = 0;
            if l_v71_0.Context then
                v76 = l_MainWindow_0 + l_TextFramePadding_0;
                if l_v71_0.Expanded then
                    v76 = v76 + v12(l_v71_0.Context, 0) * (l_MainWindow_0 + l_TextFramePadding_0);
                end;
            end;
            local v77 = l_Y_2 + v76;
            v47 = v47 + 1;
            if v48 + v77 >= l_canvasPos_1.Y then
                if v51 < l_absSize_0.Y then
                    local l_Text_0 = v5.Color.Text;
                    local v79 = "";
                    if l_v71_0.Type == Enum.MessageType.MessageOutput.Value then
                        l_Text_0 = v5.Color.Text;
                    elseif l_v71_0.Type == Enum.MessageType.MessageInfo.Value then
                        l_Text_0 = v5.Color.HighlightBlue;
                        v79 = v5.Image.Info;
                    elseif l_v71_0.Type == Enum.MessageType.MessageWarning.Value then
                        l_Text_0 = v5.Color.WarningYellow;
                        v79 = v5.Image.Warning;
                    elseif l_v71_0.Type == Enum.MessageType.MessageError.Value then
                        l_Text_0 = v5.Color.ErrorRed;
                        v79 = v5.Image.Error;
                    end;
                    local v80 = {};
                    if l_v71_0.Context then
                        v80.Layout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, l_TextFramePadding_0)
                        });
                        v80.Header = v2.createElement(v4, {
                            size = UDim2.new(1, 0, 0, l_MainWindow_0), 
                            isExpanded = l_v71_0.Expanded, 
                            isExpandable = true, 
                            layoutOrder = 0, 
                            hideLines = true, 
                            onButtonPress = function() --[[ Line: 162 ]]
                                -- upvalues: l_v71_0 (copy), v39 (copy)
                                l_v71_0.Expanded = not l_v71_0.Expanded;
                                v39:setState({});
                            end
                        }, {
                            Label = v2.createElement("TextLabel", {
                                Text = "Context: {...}", 
                                TextSize = l_MainWindow_0, 
                                Font = l_Log_0, 
                                TextColor3 = l_Text_0, 
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(1, -20, 1, 0), 
                                Position = UDim2.fromOffset(20, 0), 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        });
                        if l_v71_0.Expanded then
                            local v81 = {
                                i = 0
                            };
                            v54(v80, l_v71_0.Context, l_Text_0, 0, v81);
                        end;
                    end;
                    v46[v47] = v2.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v77), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = v47
                    }, {
                        image = v2.createElement("ImageLabel", {
                            Image = v79, 
                            Size = UDim2.new(0, l_IconHeight_0, 0, l_IconHeight_0), 
                            Position = UDim2.new(0, l_IconHeight_0 / 4, 0, (l_MainWindow_0 - l_IconHeight_0) / 2), 
                            BackgroundTransparency = 1
                        }), 
                        msg = v2.createElement("TextLabel", {
                            Text = l_Message_0, 
                            TextColor3 = l_Text_0, 
                            TextSize = l_MainWindow_0, 
                            Font = l_Log_0, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = l_wordWrap_0, 
                            Size = UDim2.new(1, 0, 0, l_Y_2), 
                            Position = UDim2.new(0, l_TextFrameHeight_0, 0, 0), 
                            BackgroundTransparency = 1
                        }), 
                        context = l_v71_0.Context and v2.createElement("Frame", {
                            Size = UDim2.new(1, -l_TextFrameHeight_0, 0, v76), 
                            Position = UDim2.new(0, l_TextFrameHeight_0, 0, l_Y_2 + l_TextFramePadding_0), 
                            BackgroundTransparency = 1
                        }, v80)
                    });
                end;
                if v50 < 0 then
                    v50 = v48;
                else
                    v51 = v51 + v77 + l_TextFramePadding_0;
                end;
            end;
            v48 = v48 + v77 + l_TextFramePadding_0;
            if l_CharCount_0 < l_MaxStringSize_0 then
                v71 = v70:next();
            else
                local v82 = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", l_CharCount_0, l_MaxStringSize_0);
                v71 = {
                    Message = v82, 
                    CharCount = #v82, 
                    Type = l_v71_0.Type, 
                    Dims = l_TextService_0:GetTextSize(v82, l_MainWindow_0, l_Log_0, Vector2.new())
                };
            end;
        end;
        v46.UIListLayout = v2.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_TextFramePadding_0)
        });
        v46.WindowingPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v50), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        });
    end;
    return v2.createElement("ScrollingFrame", {
        Size = l_size_0, 
        BackgroundTransparency = 1, 
        VerticalScrollBarInset = 1, 
        ScrollBarThickness = 6, 
        CanvasSize = UDim2.new(0, 0, 0, v48), 
        CanvasPosition = l_canvasPos_1, 
        LayoutOrder = l_layoutOrder_0, 
        [v2.Ref] = v39.ref
    }, v46);
end;
return v18;