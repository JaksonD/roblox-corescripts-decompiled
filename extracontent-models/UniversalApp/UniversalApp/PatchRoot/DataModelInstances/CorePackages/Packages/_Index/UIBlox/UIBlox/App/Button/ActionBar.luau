local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.React);
local v6 = require(l_Parent_3.Cryo);
local v7 = require(l_Parent_3.RoactGamepad);
local v8 = require(l_Parent_3.t);
local l_FitFrameOnAxis_0 = require(l_Parent_3.FitFrame).FitFrameOnAxis;
local v10 = require(l_Parent_0.Button);
local v11 = require(l_Parent_0.ComboButton);
local v12 = require(l_Parent_0.IconButton);
local v13 = require(l_Parent_0.TextButton);
local v14 = require(l_Parent_0.Enum.ButtonType);
local v15 = require(l_Parent_2.Core.Style.withStyle);
local v16 = require(l_Parent_1.ImageSet.Enum.IconSize);
local v17 = require(l_Parent_1.Container.getPageMargin);
local v18 = require(l_Parent_1.Style.Constants);
local v19 = require(l_Parent_2.UIBloxConfig);
local v20 = v4.PureComponent:extend("ActionBar");
v20.init = function(v21) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v4 (copy)
    v21.buttonRefs = v21.props.isRoactGamepadEnabled and v7.createRefCache() or {};
    v21.state = {
        frameWidth = 0
    };
    v21.frameRef = v21.props.frameRef or v4.createRef();
    v21.updateFrameSize = function(v22) --[[ Line: 42 ]]
        -- upvalues: v21 (copy)
        local l_X_0 = v22.AbsoluteSize.X;
        if l_X_0 ~= v21.state.frameWidth then
            v21:setState({
                frameWidth = l_X_0
            });
        end;
        if v21.props.onAbsoluteSizeChanged then
            v21.props.onAbsoluteSizeChanged(v22.AbsoluteSize);
        end;
    end;
    v21.getGamepadNextSelectionLeft = function(v24, _) --[[ Line: 55 ]]
        -- upvalues: v21 (copy)
        return v24 > 1 and v21.buttonRefs[v24 - 1] or nil;
    end;
    v21.getGamepadNextSelectionRight = function(v26, v27) --[[ Line: 59 ]]
        -- upvalues: v21 (copy)
        return v26 < v27 and v21.buttonRefs[v26 + 1] or nil;
    end;
end;
v20.validateProps = v8.strictInterface({
    button = v8.optional(v8.union(v8.strictInterface({
        props = v10.validateProps
    }), v8.strictInterface({
        props = v11.validateProps
    }))), 
    buttonOverride = v8.optional(v8.table), 
    iconSize = v8.optional(v8.number), 
    buttonHeight = v8.optional(v8.number), 
    buttonPadding = v8.optional(v8.number), 
    enableButtonAtStart = v8.optional(v8.boolean), 
    icons = v8.optional(v8.array(v8.strictInterface({
        props = v12.validateProps
    }))), 
    marginOverride = v8.optional(v8.strictInterface({
        left = v8.number, 
        right = v8.number, 
        top = v8.number, 
        bottom = v8.number
    })), 
    horizontalAlignment = v8.optional(v8.enum(Enum.HorizontalAlignment)), 
    onAbsoluteSizeChanged = v8.optional(v8.callback), 
    [v4.Children] = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionDown = v8.optional(v8.table), 
    frameRef = v8.optional(v8.table), 
    textButtons = v8.optional(v8.array(v8.strictInterface({
        props = v13.validateProps
    }))), 
    isRoactGamepadEnabled = v8.optional(v8.boolean), 
    testId = v8.optional(v8.string)
});
v20.defaultProps = {
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    iconSize = 36, 
    buttonHeight = 48, 
    buttonPadding = 12, 
    isRoactGamepadEnabled = true, 
    testId = "--uiblox-action-bar"
};
v20.render = function(v28) --[[ Line: 136 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), v17 (copy), v16 (copy), v18 (copy), v19 (copy), v6 (copy), v4 (copy), v7 (copy), v5 (copy), v12 (copy), v13 (copy), v11 (copy), v14 (copy), v10 (copy), l_FitFrameOnAxis_0 (copy)
    return v15(function(_) --[[ Line: 137 ]]
        -- upvalues: v17 (ref), v28 (copy), v16 (ref), v18 (ref), v19 (ref), v6 (ref), v4 (ref), v7 (ref), v5 (ref), v12 (ref), v13 (ref), v11 (ref), v14 (ref), v10 (ref), l_FitFrameOnAxis_0 (ref)
        local v30 = v17(v28.state.frameWidth);
        local v31 = v28.state.frameWidth - v30 * 2;
        local l_Medium_0 = v16.Medium;
        local v33 = nil;
        v33 = if v28.props.marginOverride then v28.props.marginOverride else {
            left = v30, 
            right = v30, 
            top = 0, 
            bottom = v18.Layout.ActionBar.PositionOffset
        };
        local v34 = 0;
        if v28.props.icons and #v28.props.icons then
            v34 = #v28.props.icons;
        end;
        local v35 = 0;
        if v28.props.textButtons and #v28.props.textButtons then
            v35 = #v28.props.textButtons;
        end;
        local v36 = (not (v28.props.button == nil) or v19.enableActionBarButtonOverride and v28.props.buttonOverride ~= nil) and 1 or 0;
        local v37 = false;
        if v28.props.enableButtonAtStart == true then
            v37 = v36 ~= 0;
        end;
        local v38 = v35 + v34 + v36;
        local v39 = {};
        if v34 ~= 0 then
            for v40, v41 in ipairs(v28.props.icons) do
                local v42 = v37 and v40 + v36 or v40;
                local v43 = {
                    layoutOrder = v42, 
                    iconSize = l_Medium_0
                };
                local v44 = v6.Dictionary.join(v43, v41.props);
                if not v28.props.isRoactGamepadEnabled then
                    v28.buttonRefs[v42] = v28.buttonRefs[v42] or v4.createRef();
                end;
                table.insert(v39, v4.createElement(if v28.props.isRoactGamepadEnabled then v7.Focusable.Frame else "Frame", {
                    key = "Button" .. tostring(v42), 
                    Size = UDim2.fromOffset(v28.props.iconSize, v28.props.iconSize), 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = v28.buttonRefs[v42], 
                    NextSelectionUp = nil, 
                    NextSelectionDown = nil, 
                    NextSelectionLeft = v28.getGamepadNextSelectionLeft(v42, v38), 
                    NextSelectionRight = v28.getGamepadNextSelectionRight(v42, v38), 
                    inputBindings = if v28.props.isRoactGamepadEnabled then {
                        Activated = v44.onActivated and v7.Input.onBegin(Enum.KeyCode.ButtonA, v44.onActivated) or nil
                    } else nil, 
                    [v5.Tag] = if v28.props.testId then ("data-testid=%*--icon-button"):format(v28.props.testId) else nil
                }, {
                    Icon = v4.createElement(v12, v44)
                }));
            end;
        end;
        if v35 ~= 0 then
            for v45, v46 in ipairs(v28.props.textButtons) do
                local v47 = (if v37 then v45 + v36 else v45) + v34;
                local v48 = {
                    layoutOrder = v47
                };
                local v49 = v6.Dictionary.join(v48, v46.props);
                if not v28.props.isRoactGamepadEnabled then
                    v28.buttonRefs[v47] = v28.buttonRefs[v47] or v4.createRef();
                end;
                table.insert(v39, v4.createElement(if v28.props.isRoactGamepadEnabled then v7.Focusable.Frame else "Frame", {
                    key = "Button" .. tostring(v47), 
                    Size = UDim2.fromOffset(0, v28.props.iconSize), 
                    AutomaticSize = Enum.AutomaticSize.X, 
                    BackgroundTransparency = 1, 
                    [v4.Ref] = v28.buttonRefs[v47], 
                    NextSelectionUp = nil, 
                    NextSelectionDown = nil, 
                    NextSelectionLeft = v28.getGamepadNextSelectionLeft(v47, v38), 
                    NextSelectionRight = v28.getGamepadNextSelectionRight(v47, v38), 
                    inputBindings = if v28.props.isRoactGamepadEnabled then {
                        Activated = v49.onActivated and v7.Input.onBegin(Enum.KeyCode.ButtonA, v49.onActivated) or nil
                    } else nil
                }, {
                    TextButton = v4.createElement(v13, v49)
                }));
            end;
        end;
        if v36 ~= 0 then
            local v50 = UDim2.fromOffset(v31 - v34 * (v28.props.iconSize + v28.props.buttonPadding), v28.props.buttonHeight);
            local v51 = v37 and 1 or v34 + 1;
            local v52 = nil;
            local v53 = nil;
            if not v19.enableActionBarButtonOverride or not v28.props.buttonOverride then
                v52 = v11.validateProps(v28.props.button.props);
                local v54 = {
                    layoutOrder = v51, 
                    size = v50
                };
                v53 = v6.Dictionary.join(v54, v28.props.button.props);
                if not v52 and v53.buttonType == nil then
                    v53.buttonType = if v34 == 0 then v14.PrimarySystem else v14.PrimaryContextual;
                end;
            end;
            if not v28.props.isRoactGamepadEnabled then
                v28.buttonRefs[v51] = v28.buttonRefs[v51] or v4.createRef();
            end;
            table.insert(v39, v37 and 1 or v38, v4.createElement(if v28.props.isRoactGamepadEnabled then v7.Focusable.Frame else "Frame", {
                key = "Button" .. v51, 
                Size = v50, 
                BackgroundTransparency = 1, 
                [v4.Ref] = v28.buttonRefs[v51], 
                NextSelectionUp = nil, 
                NextSelectionDown = nil, 
                NextSelectionLeft = v28.getGamepadNextSelectionLeft(v51, v38), 
                NextSelectionRight = v28.getGamepadNextSelectionRight(v51, v38), 
                inputBindings = if v28.props.isRoactGamepadEnabled then {
                    Activated = if not not v52 or v19.enableActionBarButtonOverride and v28.props.buttonOverride then nil else v7.Input.onBegin(Enum.KeyCode.ButtonA, v53.onActivated)
                } else nil, 
                [v5.Tag] = if v28.props.testId then ("data-testid=%*--primary-button"):format(v28.props.testId) else nil
            }, {
                Icon = if v19.enableActionBarButtonOverride and v28.props.buttonOverride then v28.props.buttonOverride else v4.createElement(if v52 then v11 else v10, v53)
            }));
        end;
        if v28.props[v4.Children] then
            v39 = v28.props[v4.Children];
        end;
        return v4.createElement(if v28.props.isRoactGamepadEnabled then v7.Focusable[l_FitFrameOnAxis_0] else l_FitFrameOnAxis_0, {
            BackgroundTransparency = 1, 
            minimumSize = UDim2.new(1, 0, 0, v28.props.buttonHeight), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v28.props.horizontalAlignment, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            contentPadding = UDim.new(0, 12), 
            [v4.Ref] = v28.frameRef, 
            [v4.Change.AbsoluteSize] = v28.updateFrameSize, 
            margin = v33, 
            NextSelectionLeft = v28.props.NextSelectionLeft, 
            NextSelectionRight = v28.props.NextSelectionRight, 
            NextSelectionUp = v28.props.NextSelectionUp, 
            NextSelectionDown = v28.props.NextSelectionDown
        }, v39);
    end);
end;
v20.didMount = function(v55) --[[ Line: 352 ]] --[[ Name: didMount ]]
    if v55.frameRef.current then
        v55.updateFrameSize(v55.frameRef.current);
    end;
end;
local v58 = v4.forwardRef(function(v56, v57) --[[ Line: 358 ]]
    -- upvalues: v4 (copy), v20 (copy), v6 (copy)
    return v4.createElement(v20, v6.Dictionary.join(v56, {
        frameRef = v57
    }));
end);
v58.validateProps = v20.validateProps;
return v58;