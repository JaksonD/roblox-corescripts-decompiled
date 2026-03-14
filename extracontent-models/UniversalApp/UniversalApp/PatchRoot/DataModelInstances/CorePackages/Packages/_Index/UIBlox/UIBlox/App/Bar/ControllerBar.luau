local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_2.Cryo);
local v6 = require(l_Parent_1.Core.Style.withStyle);
local v7 = require(script.Parent.ControllerBarHint);
local v8 = require(l_Parent_1.Core.Text.GetTextSize);
local l_ControllerBarHintInternalPadding_0 = require(script.Parent.BarConstants).ControllerBarHintInternalPadding;
local l_DefaultKeyLabelSize_0 = require(l_Parent_0.Menu.MenuConstants).DefaultKeyLabelSize;
local v11 = v3.PureComponent:extend("ControllerBar");
local v12 = v4.strictInterface({
    keyCode = v4.enum(Enum.KeyCode), 
    text = v4.string
});
v11.validateProps = v4.strictInterface({
    leftHint = v12, 
    rightHints = v4.optional(v4.map(v4.number, v12))
});
v11.init = function(v13) --[[ Line: 46 ]] --[[ Name: init ]]
    v13.state = {
        controllerBarWidth = 0, 
        hintStringsConcat = nil, 
        requiredSpace = nil, 
        hintRatios = nil
    };
end;
v11.calculateHintRatios = function(v14, v15) --[[ Line: 56 ]] --[[ Name: calculateHintRatios ]]
    -- upvalues: v5 (copy), v8 (copy), l_DefaultKeyLabelSize_0 (copy), l_ControllerBarHintInternalPadding_0 (copy)
    local v16 = 84;
    local v17 = "";
    local v18 = {};
    local v19 = 0;
    local v20 = v5.List.join({
        v14
    }, v15 or {});
    for _, v22 in ipairs(v20) do
        v18[v22.text] = v8(v22.text, 17, Enum.Font.ArialBold, Vector2.new(10000, 10000)).X;
        v19 = v19 + v18[v22.text];
        v16 = v16 + l_DefaultKeyLabelSize_0 + l_ControllerBarHintInternalPadding_0;
        v17 = v17 .. v22.text;
    end;
    for v23, v24 in pairs(v18) do
        v18[v23] = v24 / v19;
    end;
    return v18, v16 + math.max(#v20 - 2, 0) * 40, v17;
end;
v11.getDerivedStateFromProps = function(v25) --[[ Line: 92 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v11 (copy)
    local v26, v27, v28 = v11.calculateHintRatios(v25.leftHint, v25.rightHints);
    return {
        hintRatios = v26, 
        requiredSpace = v27, 
        hintStringsConcat = v28
    };
end;
v11.calculateHintSize = function(v29, v30, v31) --[[ Line: 103 ]] --[[ Name: calculateHintSize ]]
    -- upvalues: v8 (copy)
    local v32 = v30 - v29.state.requiredSpace;
    local v33 = v31.Header2.RelativeSize * v31.BaseSize;
    local v34 = v31.Header2.RelativeMinSize * v31.BaseSize;
    local l_X_0 = v8(v29.state.hintStringsConcat, v34, v31.Header2.Font, Vector2.new(10000, 10000)).X;
    if l_X_0 <= v32 then
        local l_X_1 = v8(v29.state.hintStringsConcat, v33, v31.Header2.Font, Vector2.new(10000, 10000)).X;
        local v37 = (v33 - v34) / (l_X_1 - l_X_0);
        local v38 = v33 - v37 * l_X_1;
        return nil, (math.clamp(v32 * v37 + v38, v34, v33));
    else
        local v39 = {};
        for v40, v41 in pairs(v29.state.hintRatios) do
            v39[v40] = v41 * v32;
        end;
        return v39;
    end;
end;
v11.render = function(v42) --[[ Line: 142 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), v3 (copy), v7 (copy)
    return v6(function(v43) --[[ Line: 143 ]]
        -- upvalues: v42 (copy), v5 (ref), v3 (ref), v7 (ref)
        local l_Theme_0 = v43.Theme;
        local v45, v46 = v42:calculateHintSize(v42.state.controllerBarWidth, v43.Font);
        local function v50(v47, v48) --[[ Line: 148 ]] --[[ Name: makeHint ]]
            -- upvalues: v5 (ref), v46 (copy), v45 (copy), v3 (ref), v7 (ref)
            local v49 = v5.Dictionary.join(v47, {
                key = "Hint" .. tostring(v48), 
                hintTextSize = v46, 
                maxWidth = v45 and v45[v47.text] or nil
            });
            return v3.createElement(v7, v49);
        end;
        local v51 = nil;
        if v42.props.rightHints then
            v51 = v3.createFragment(v5.List.map(v42.props.rightHints, v50));
        end;
        return v3.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
            Size = UDim2.new(1, 0, 0, 72), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1), 
            [v3.Change.AbsoluteSize] = function(v52) --[[ Line: 171 ]]
                -- upvalues: v42 (ref)
                v42:setState({
                    controllerBarWidth = v52.AbsoluteSize.X
                });
            end, 
            [v3.Event.AncestryChanged] = function(v53) --[[ Line: 176 ]]
                -- upvalues: v42 (ref)
                v42:setState({
                    controllerBarWidth = v53.AbsoluteSize.X
                });
            end
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            LeftFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1)
            }, {
                v3.createElement("UIListLayout", {
                    key = "Layout", 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                v50(v42.props.leftHint, "Left")
            }), 
            RightFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(0.5, 1), 
                Position = UDim2.fromScale(1, 0), 
                AnchorPoint = Vector2.new(1, 0)
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 40)
                }), 
                RightHints = v51
            })
        });
    end);
end;
return v11;