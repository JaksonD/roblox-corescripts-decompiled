local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.Parent.LineGraphHoverDisplay);
local v3 = require(script.Parent.Parent.Constants);
local l_Text_0 = v3.Color.Text;
local l_HighlightBlue_0 = v3.Color.HighlightBlue;
local l_LineWidth_0 = v3.GeneralFormatting.LineWidth;
local l_LineColor_0 = v3.GeneralFormatting.LineColor;
local l_PointWidth_0 = v3.Graph.PointWidth;
local l_PointOffset_0 = v3.Graph.PointOffset;
local l_Padding_0 = v3.Graph.Padding;
local l_Scale_0 = v3.Graph.Scale;
local l_InnerPaddingY_0 = v3.Graph.InnerPaddingY;
local l_InnerScaleY_0 = v3.Graph.InnerScaleY;
local l_TextPadding_0 = v3.Graph.TextPadding;
local v15 = v1.Component:extend("LineGraph");
v15.init = function(v16) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v16.onGraphInputChanged = function(_, v18) --[[ Line: 25 ]]
        -- upvalues: v16 (copy)
        if v18.UserInputType == Enum.UserInputType.MouseMovement and not v16.state.holdPos then
            v16:setState({
                inputPosition = v18.Position
            });
        end;
    end;
    v16.onGraphInputEnded = function(_, v20) --[[ Line: 35 ]]
        -- upvalues: v16 (copy)
        if v20.UserInputType == Enum.UserInputType.MouseMovement then
            if not v16.state.holdPos then
                v16:setState({
                    inputPosition = false
                });
                return;
            end;
        elseif v20.UserInputType == Enum.UserInputType.MouseButton1 then
            v16:setState({
                holdPos = not v16.state.holdPos
            });
        end;
    end;
    v16.graphRef = v1.createRef();
    v16.state = {
        selectedTimeStamps = {}
    };
end;
v15.didUpdate = function(v21) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    if v21.state.absGraphSize ~= v21.graphRef.current.AbsoluteSize then
        local l_AbsoluteSize_0 = v21.graphRef.current.AbsoluteSize;
        local l_AbsolutePosition_0 = v21.graphRef.current.AbsolutePosition;
        v21:setState({
            absGraphSize = l_AbsoluteSize_0, 
            absGraphPos = l_AbsolutePosition_0
        });
    end;
end;
v15.didMount = function(v24) --[[ Line: 67 ]] --[[ Name: didMount ]]
    local l_AbsoluteSize_1 = v24.graphRef.current.AbsoluteSize;
    local l_AbsolutePosition_1 = v24.graphRef.current.AbsolutePosition;
    v24:setState({
        absGraphSize = l_AbsoluteSize_1, 
        absGraphPos = l_AbsolutePosition_1
    });
end;
v15.render = function(v27) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: l_InnerScaleY_0 (copy), v1 (copy), l_LineWidth_0 (copy), l_InnerPaddingY_0 (copy), l_HighlightBlue_0 (copy), l_PointWidth_0 (copy), l_PointOffset_0 (copy), v2 (copy), l_TextPadding_0 (copy), l_LineColor_0 (copy), l_Text_0 (copy), l_Padding_0 (copy), l_Scale_0 (copy)
    local l_size_0 = v27.props.size;
    local l_pos_0 = v27.props.pos;
    local l_graphData_0 = v27.props.graphData;
    local l_getX_0 = v27.props.getX;
    local l_getY_0 = v27.props.getY;
    local l_stringFormatX_0 = v27.props.stringFormatX;
    local l_stringFormatY_0 = v27.props.stringFormatY;
    local l_axisLabelX_0 = v27.props.axisLabelX;
    local l_axisLabelY_0 = v27.props.axisLabelY;
    local l_layoutOrder_0 = v27.props.layoutOrder;
    local l_inputPosition_0 = v27.state.inputPosition;
    local l_absGraphSize_0 = v27.state.absGraphSize;
    local l_absGraphPos_0 = v27.state.absGraphPos;
    local v41 = l_getX_0(l_graphData_0:back());
    local v42 = l_getX_0(l_graphData_0:front());
    local l_maxY_0 = v27.props.maxY;
    local l_minY_0 = v27.props.minY;
    local v45 = nil;
    local v46 = {};
    if l_absGraphSize_0 then
        local v47 = {};
        local v48 = l_graphData_0:iterator();
        local v49 = v48:next();
        while v49 do
            local v50 = l_getY_0(v49);
            local v51 = l_getX_0(v49);
            local v52 = v41 - v42;
            local v53 = v52 > 0 and (v51 - v42) / v52 or 0;
            local v54 = l_maxY_0 - l_minY_0;
            local v55 = v54 > 0 and (v50 - l_minY_0) / v54 or 1;
            table.insert(v47, {
                X = v53, 
                Y = v55, 
                data = v49
            });
            v49 = v48:next();
        end;
        for v56 = 2, #v47 do
            local v57 = v47[v56].X * l_absGraphSize_0.X;
            local v58 = v47[v56].Y * l_absGraphSize_0.Y * l_InnerScaleY_0;
            local v59 = v47[v56 - 1].X * l_absGraphSize_0.X;
            local v60 = v47[v56 - 1].Y * l_absGraphSize_0.Y * l_InnerScaleY_0;
            if v57 ~= v59 then
                local v61 = (v57 + v59) / 2;
                local v62 = (v58 + v60) / 2;
                local v63 = v57 - v59;
                local v64 = v58 - v60;
                local v65 = math.sqrt(v63 * v63 + v64 * v64);
                local v66 = math.deg((math.atan2(v64, v63)));
                table.insert(v46, v1.createElement("Frame", {
                    Size = UDim2.new(0, v65, 0, l_LineWidth_0), 
                    Position = UDim2.new(0, v61 - v65 / 2, 1 - l_InnerPaddingY_0, -v62), 
                    BackgroundColor3 = l_HighlightBlue_0, 
                    BorderSizePixel = 0, 
                    Rotation = -v66
                }));
                table.insert(v46, v1.createElement("Frame", {
                    Size = UDim2.new(0, l_PointWidth_0, 0, l_PointWidth_0), 
                    Position = UDim2.new(0, v57, 1 - l_InnerPaddingY_0, -v58 - l_PointOffset_0), 
                    BackgroundColor3 = l_HighlightBlue_0, 
                    BorderSizePixel = 0
                }));
                if l_inputPosition_0 then
                    local v67 = l_inputPosition_0.X - l_absGraphPos_0.X;
                    if v67 < v57 and v59 < v67 then
                        local v68 = l_getX_0(v47[v56].data);
                        local v69 = l_getX_0(v47[v56 - 1].data);
                        local v70 = l_getY_0(v47[v56].data);
                        local v71 = l_getY_0(v47[v56 - 1].data);
                        local v72 = (v67 - v59) / v63;
                        v45 = v60 + v64 * v72;
                        local v73 = (v68 - v69) * v72 + v69;
                        local v74 = (v70 - v71) * v72 + v71;
                        v46.HoverDetails = v1.createElement(v2, {
                            hoverLineX = v67, 
                            hoverLineY = v45, 
                            hoverValX = v73, 
                            hoverValY = v74, 
                            stringFormatX = l_stringFormatX_0, 
                            stringFormatY = l_stringFormatY_0
                        });
                    end;
                end;
            end;
        end;
        if #v47 > 0 then
            local v75 = v47[#v47].Y * l_absGraphSize_0.Y * l_InnerScaleY_0;
            local v76 = l_getY_0(v47[#v47].data);
            local v77 = not (v45 and math.abs(v75 - v45) < 10);
            local v78 = not (v45 and math.abs(v45) < 10 or math.abs(v75) < 10);
            if v77 then
                v46.LatestEntryLine = v1.createElement("Frame", {
                    Size = UDim2.new(1, l_TextPadding_0, 0, l_LineWidth_0), 
                    Position = UDim2.new(0, -l_TextPadding_0, 1 - l_InnerPaddingY_0, -v75), 
                    BackgroundColor3 = l_LineColor_0, 
                    BackgroundTransparency = 0.5, 
                    BorderSizePixel = 0
                });
                v46.LatestEntryText = v1.createElement("TextLabel", {
                    Text = l_stringFormatY_0 and l_stringFormatY_0(v76) or v76, 
                    TextColor3 = l_Text_0, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Position = UDim2.new(0, -l_TextPadding_0 - 2, 1 - l_InnerPaddingY_0, -v75), 
                    BackgroundTransparency = 1
                });
            end;
            if v78 then
                v46.AxisTextY0 = v1.createElement("TextLabel", {
                    Text = l_stringFormatY_0 and l_stringFormatY_0(l_minY_0) or l_minY_0, 
                    TextColor3 = l_Text_0, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    Position = UDim2.new(0, -l_TextPadding_0 - 2, 1 - l_InnerPaddingY_0, 0), 
                    BackgroundTransparency = 1
                });
            end;
            v46.AxisX = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_LineWidth_0), 
                Position = UDim2.new(0, 0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
            v46.AxisY = v1.createElement("Frame", {
                Size = UDim2.new(0, l_LineWidth_0, 1, 0), 
                BackgroundColor3 = l_LineColor_0, 
                BorderSizePixel = 0
            });
        end;
    end;
    local v79 = 2 * l_TextPadding_0 + 2;
    return v1.createElement("Frame", {
        Size = l_size_0, 
        Position = l_pos_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_layoutOrder_0
    }, {
        name = v1.createElement("TextLabel", {
            Text = l_axisLabelY_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Position = UDim2.new(l_Padding_0, 0, l_Padding_0, -l_TextPadding_0), 
            BackgroundTransparency = 1
        }), 
        minX = v1.createElement("TextLabel", {
            Text = l_stringFormatX_0 and l_stringFormatX_0(v42) or v42, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(l_Padding_0, 0, l_Padding_0 + l_Scale_0, v79), 
            BackgroundTransparency = 1
        }), 
        maxX = v1.createElement("TextLabel", {
            Text = l_stringFormatX_0 and l_stringFormatX_0(v41) or v41, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(l_Padding_0 + l_Scale_0, 0, l_Padding_0 + l_Scale_0, v79), 
            BackgroundTransparency = 1
        }), 
        axisLabelX = v1.createElement("TextLabel", {
            Text = l_axisLabelX_0, 
            TextColor3 = l_Text_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Position = UDim2.new(0.5, 0, l_Padding_0 + l_Scale_0, v79), 
            BackgroundTransparency = 1
        }), 
        graph = v1.createElement("Frame", {
            Position = UDim2.new(l_Padding_0, 0, l_Padding_0, 0), 
            Size = UDim2.new(l_Scale_0, 0, l_Scale_0, 0), 
            BackgroundTransparency = 1, 
            [v1.Ref] = v27.graphRef, 
            [v1.Event.InputChanged] = v27.onGraphInputChanged, 
            [v1.Event.InputEnded] = v27.onGraphInputEnded
        }, v46)
    });
end;
return v15;