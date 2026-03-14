local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.RoactGamepad);
local v6 = require(l_Parent_2.t);
local v7 = require(l_Parent_0.Button);
local v8 = require(l_Parent_0.Enum.ButtonType);
local v9 = require(l_Parent_1.Core.Text.GetTextSize);
local v10 = require(l_Parent_1.Core.Style.withStyle);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v12 = v3.PureComponent:extend("ButtonStack");
v12.validateProps = v6.strictInterface({
    buttons = v6.array(v6.strictInterface({
        buttonType = v6.optional(v8.isEnumValue), 
        props = v7.validateProps, 
        isDefaultChild = v6.optional(v6.boolean)
    })), 
    buttonHeight = v6.optional(v6.numberMin(0)), 
    forcedFillDirection = v6.optional(v6.enum(Enum.FillDirection)), 
    marginBetween = v6.optional(v6.numberMin(0)), 
    minHorizontalButtonPadding = v6.optional(v6.numberMin(0)), 
    disableRoactGamepadButtonSelection = v6.optional(v6.boolean), 
    disableGamepadRefs = v6.optional(v6.boolean), 
    NextSelectionLeft = v6.optional(v6.table), 
    NextSelectionRight = v6.optional(v6.table), 
    NextSelectionUp = v6.optional(v6.table), 
    NextSelectionDown = v6.optional(v6.table), 
    frameRef = v6.optional(v6.table), 
    isRoactGamepadEnabled = v6.optional(v6.boolean)
});
v12.defaultProps = {
    buttonHeight = 36, 
    marginBetween = 12, 
    minHorizontalButtonPadding = 8, 
    isRoactGamepadEnabled = true
};
v12.init = function(v13) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v13.buttonRefs = v5.createRefCache();
    v13.state = {
        frameWidth = 0
    };
    v13.updateFrameSize = function(v14) --[[ Line: 78 ]]
        -- upvalues: v13 (copy)
        local l_X_0 = v14.AbsoluteSize.X;
        if l_X_0 ~= v13.state.frameWidth then
            v13:setState({
                frameWidth = l_X_0
            });
        end;
    end;
end;
v12.render = function(v16) --[[ Line: 88 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v9 (copy), v8 (copy), v4 (copy), v3 (copy), v7 (copy), v5 (copy), l_FitFrameOnAxis_0 (copy)
    return v10(function(v17) --[[ Line: 89 ]]
        -- upvalues: v16 (copy), v9 (ref), v8 (ref), v4 (ref), v3 (ref), v7 (ref), v5 (ref), l_FitFrameOnAxis_0 (ref)
        local l_Font_0 = v17.Font;
        local v19 = l_Font_0.Body.RelativeSize * l_Font_0.BaseSize;
        local l_isRoactGamepadEnabled_0 = v16.props.isRoactGamepadEnabled;
        local l_buttons_0 = v16.props.buttons;
        local v22 = #l_buttons_0 > 1 and v16.props.marginBetween or 0;
        local v23 = v16.state.frameWidth / #l_buttons_0 - v22 * (#l_buttons_0 - 1) / #l_buttons_0;
        local v24 = false;
        local v25 = nil;
        local v26 = nil;
        if v16.props.forcedFillDirection then
            v24 = v16.props.forcedFillDirection == Enum.FillDirection.Vertical;
            v25 = v16.props.forcedFillDirection;
        else
            for _, v28 in ipairs(l_buttons_0) do
                if v9(v28.props.text or "", v19, l_Font_0.Body.Font, Vector2.new(v16.state.frameWidth, v16.props.buttonHeight), if v28.props.buttonTextOverride then v28.props.buttonTextOverride.RichText else false).X > v23 - 2 * v16.props.minHorizontalButtonPadding then
                    v24 = true;
                    break;
                end;
            end;
            v25 = v24 and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal;
        end;
        local v29 = v24 and UDim2.new(1, 0, 0, v16.props.buttonHeight) or UDim2.new(0, v23, 0, v16.props.buttonHeight);
        local v30 = {};
        for v31, v32 in ipairs(l_buttons_0) do
            local v33 = {
                key = tostring(v31), 
                layoutOrder = v24 and #l_buttons_0 - v31 or v31, 
                size = v29, 
                buttonType = v32.buttonType or v8.Secondary, 
                isRoactGamepadEnabled = l_isRoactGamepadEnabled_0
            };
            local v34 = v4.Dictionary.join(v33, v32.props);
            if v32.isDefaultChild then
                v26 = v31;
            end;
            if not v16.props.disableGamepadRefs and l_isRoactGamepadEnabled_0 then
                local v35 = nil;
                v35 = if v16.props.disableRoactGamepadButtonSelection then {
                    [v3.Ref] = v16.buttonRefs[v31]
                } else {
                    [v3.Ref] = v16.buttonRefs[v31], 
                    NextSelectionUp = v24 and v31 > 1 and v16.buttonRefs[v31 - 1] or nil, 
                    NextSelectionDown = v24 and v31 < #l_buttons_0 and v16.buttonRefs[v31 + 1] or nil, 
                    NextSelectionLeft = not v24 and v31 > 1 and v16.buttonRefs[v31 - 1] or nil, 
                    NextSelectionRight = not v24 and v31 < #l_buttons_0 and v16.buttonRefs[v31 + 1] or nil
                };
                v34 = v4.Dictionary.join(v34, v35);
            end;
            table.insert(v30, v3.createElement(v7, v34));
        end;
        return v3.createElement(if l_isRoactGamepadEnabled_0 then v5.Focusable[l_FitFrameOnAxis_0] else l_FitFrameOnAxis_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, v22), 
            FillDirection = v25, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            LayoutOrder = 3, 
            minimumSize = UDim2.new(1, 0, 0, v16.props.buttonHeight), 
            [v3.Ref] = v16.props.frameRef, 
            [v3.Change.AbsoluteSize] = v16.updateFrameSize, 
            NextSelectionLeft = if l_isRoactGamepadEnabled_0 then v16.props.NextSelectionLeft else nil, 
            NextSelectionRight = if l_isRoactGamepadEnabled_0 then v16.props.NextSelectionRight else nil, 
            NextSelectionUp = if l_isRoactGamepadEnabled_0 then v16.props.NextSelectionUp else nil, 
            NextSelectionDown = if l_isRoactGamepadEnabled_0 then v16.props.NextSelectionDown else nil, 
            defaultChild = if l_isRoactGamepadEnabled_0 then v26 and v16.buttonRefs[v26] or nil else nil
        }, v30);
    end);
end;
local v38 = v3.forwardRef(function(v36, v37) --[[ Line: 190 ]]
    -- upvalues: v3 (copy), v12 (copy), v4 (copy)
    return v3.createElement(v12, v4.Dictionary.join(v36, {
        frameRef = v37
    }));
end);
v38.validateProps = v12.validateProps;
return v38;