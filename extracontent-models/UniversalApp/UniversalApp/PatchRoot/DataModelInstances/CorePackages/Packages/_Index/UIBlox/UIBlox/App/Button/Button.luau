local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local l_Core_0 = l_Parent_2.Core;
local v5 = require(l_Parent_3.React);
local v6 = require(l_Parent_3.Cryo);
local v7 = require(l_Parent_3.RoactGamepad);
local v8 = require(l_Parent_3.t);
local v9 = require(l_Parent_3.Foundation);
local v10 = require(l_Parent_0.FoundationButtonUtils);
local v11 = require(l_Core_0.ImageSet.Validator.validateImage);
local v12 = require(l_Core_0.Style.Validator.validateFontInfo);
local v13 = require(l_Parent_2.Core.Style.Validator.validateTypographyInfo);
local v14 = require(l_Parent_0.Enum.ButtonType);
local v15 = require(l_Core_0.Button.Enum.StandardButtonSize);
local v16 = require(l_Core_0.Button.GenericButton);
local v17 = require(l_Core_0.Control.Enum.ControlState);
local v18 = require(l_Parent_2.Utility.isReactTagProp);
local v19 = require(l_Parent_1.ImageSet.Images);
local v20 = require(l_Parent_1.SelectionImage.CursorKind);
local v21 = require(l_Parent_1.SelectionImage.withSelectionCursorProvider);
local v22 = require(l_Parent_2.App.SelectionCursor.useCursor);
local v23 = require(l_Parent_2.UIBloxConfig);
local v24 = v5.PureComponent:extend("Button");
local v25 = {
    [v14.Alert] = {
        [v17.Default] = "Alert"
    }, 
    [v14.PrimaryContextual] = {
        [v17.Default] = "ContextualPrimaryDefault", 
        [v17.Hover] = "ContextualPrimaryOnHover"
    }, 
    [v14.PrimarySystem] = {
        [v17.Default] = "SystemPrimaryDefault", 
        [v17.Hover] = "SystemPrimaryOnHover"
    }, 
    [v14.Secondary] = {
        [v17.Default] = "SecondaryDefault", 
        [v17.Hover] = "SecondaryOnHover"
    }
};
local v26 = {
    [v14.Alert] = {
        [v17.Default] = "Alert"
    }, 
    [v14.PrimaryContextual] = {
        [v17.Default] = "ContextualPrimaryContent"
    }, 
    [v14.PrimarySystem] = {
        [v17.Default] = "SystemPrimaryContent"
    }, 
    [v14.Secondary] = {
        [v17.Default] = "SecondaryContent", 
        [v17.Hover] = "SecondaryOnHover"
    }
};
local v27 = {
    [v14.Alert] = v19["component_assets/circle_17_stroke_1"], 
    [v14.PrimaryContextual] = v19["component_assets/circle_17"], 
    [v14.PrimarySystem] = v19["component_assets/circle_17"], 
    [v14.Secondary] = v19["component_assets/circle_17_stroke_1"]
};
local v28 = {
    [v14.PrimaryContextual] = v19["component_assets/bulletRight_17"], 
    [v14.PrimarySystem] = v19["component_assets/bulletRight_17"]
};
local v29 = {
    [v14.Alert] = false, 
    [v14.PrimaryContextual] = true, 
    [v14.PrimarySystem] = false, 
    [v14.Secondary] = false
};
local v30 = UDim.new(0, 8);
v24.validateProps = v8.strictInterface({
    [v5.Tag] = v18, 
    buttonType = v8.optional(v14.isEnumValue), 
    automaticSize = v8.optional(v8.EnumItem), 
    size = v8.optional(v8.UDim2), 
    standardSize = v8.optional(v15.isEnumValue), 
    maxWidth = v8.optional(v8.numberPositive), 
    fitContent = v8.optional(v8.boolean), 
    anchorPoint = v8.optional(v8.Vector2), 
    position = v8.optional(v8.UDim2), 
    layoutOrder = v8.optional(v8.number), 
    icon = v8.optional(v11), 
    text = v8.optional(v8.string), 
    inputIcon = v8.optional(v11), 
    fontStyle = v8.optional(v8.union(v8.string, v12, v13)), 
    buttonTextOverride = v8.optional(v8.table), 
    isDisabled = v8.optional(v8.boolean), 
    isLoading = v8.optional(v8.boolean), 
    isHoverBackgroundEnabled = v8.optional(v8.boolean), 
    isDelayedInput = v8.optional(v8.boolean), 
    enableInputDelayed = v8.optional(v8.boolean), 
    delayInputSeconds = v8.optional(v8.numberPositive), 
    onActivated = v8.callback, 
    onStateChanged = v8.optional(v8.callback), 
    userInteractionEnabled = v8.optional(v8.boolean), 
    feedbackType = v8.optional(v8.string), 
    Selectable = v8.optional(v8.boolean), 
    NextSelectionDown = v8.optional(v8.table), 
    NextSelectionUp = v8.optional(v8.table), 
    NextSelectionLeft = v8.optional(v8.table), 
    NextSelectionRight = v8.optional(v8.table), 
    buttonRef = v8.optional(v8.union(v8.table, v8.callback)), 
    isRoactGamepadEnabled = v8.optional(v8.boolean), 
    cursor = v8.optional(v8.any), 
    [v5.Change.AbsoluteSize] = v8.optional(v8.callback), 
    [v5.Change.AbsolutePosition] = v8.optional(v8.callback)
});
v24.defaultProps = {
    buttonType = v14.PrimarySystem, 
    isDisabled = false, 
    isLoading = false, 
    isRoactGamepadEnabled = true
};
v24.render = function(v31) --[[ Line: 169 ]] --[[ Name: render ]]
    -- upvalues: v21 (copy), v5 (copy), v7 (copy), v16 (copy), v20 (copy), v29 (copy), v27 (copy), v28 (copy), v25 (copy), v26 (copy)
    return v21(function(v32) --[[ Line: 170 ]]
        -- upvalues: v31 (copy), v5 (ref), v7 (ref), v16 (ref), v20 (ref), v29 (ref), v27 (ref), v28 (ref), v25 (ref), v26 (ref)
        local l_isRoactGamepadEnabled_0 = v31.props.isRoactGamepadEnabled;
        return v5.createElement(if l_isRoactGamepadEnabled_0 then v7.Focusable[v16] else v16, {
            [v5.Tag] = v31.props[v5.Tag], 
            Size = v31.props.size, 
            standardSize = v31.props.standardSize, 
            maxWidth = v31.props.maxWidth, 
            fitContent = v31.props.fitContent, 
            AnchorPoint = v31.props.anchorPoint, 
            Position = v31.props.position, 
            LayoutOrder = v31.props.layoutOrder, 
            SelectionImageObject = if v31.props.cursor then v31.props.cursor else v32(v20.RoundedRectNoInset), 
            icon = v31.props.icon, 
            text = v31.props.text, 
            inputIcon = v31.props.inputIcon, 
            fontStyle = v31.props.fontStyle, 
            isDisabled = v31.props.isDisabled, 
            isLoading = v31.props.isLoading, 
            isHoverBackgroundEnabled = v29[v31.props.buttonType], 
            isDelayedInput = v31.props.isDelayedInput, 
            enableInputDelayed = v31.props.enableInputDelayed, 
            delayInputSeconds = v31.props.delayInputSeconds, 
            onActivated = v31.props.onActivated, 
            onStateChanged = v31.props.onStateChanged, 
            userInteractionEnabled = v31.props.userInteractionEnabled, 
            buttonImage = v27[v31.props.buttonType], 
            delayedInputImage = v28[v31.props.buttonType], 
            buttonStateColorMap = v25[v31.props.buttonType], 
            contentStateColorMap = v26[v31.props.buttonType], 
            buttonTextOverride = v31.props.buttonTextOverride, 
            Selectable = v31.props.Selectable, 
            NextSelectionUp = v31.props.NextSelectionUp, 
            NextSelectionDown = v31.props.NextSelectionDown, 
            NextSelectionLeft = v31.props.NextSelectionLeft, 
            NextSelectionRight = v31.props.NextSelectionRight, 
            ref = v31.props.buttonRef, 
            feedbackType = v31.props.feedbackType, 
            [v5.Change.AbsoluteSize] = v31.props[v5.Change.AbsoluteSize], 
            [v5.Change.AbsolutePosition] = v31.props[v5.Change.AbsolutePosition]
        });
    end);
end;
local function v37(v34) --[[ Line: 223 ]]
    -- upvalues: v22 (copy), v30 (copy), v6 (copy), v5 (copy), v24 (copy)
    local v35 = v22(v30);
    local v36 = v6.Dictionary.join({
        cursor = v35
    }, v34);
    return v5.createElement(v24, v36);
end;
local v47 = v5.forwardRef(function(v38, v39) --[[ Line: 231 ]]
    -- upvalues: v23 (copy), v9 (copy), v6 (copy), v24 (copy), v10 (copy), v5 (copy), v7 (copy), v37 (copy)
    if v23.useFoundationButton then
        local v40 = v9.Hooks.useTokens();
        local v41 = v6.Dictionary.join(v24.defaultProps, v38);
        local l_isRoactGamepadEnabled_1 = v41.isRoactGamepadEnabled;
        local v43 = v10.getMaxWidth(v41.standardSize, v41.maxWidth);
        local v44 = v5.useRef(nil);
        local v45 = (if v23.useProvidedRefForButton then v38.buttonRef or v39 else v39) or v44;
        v5.useLayoutEffect(function() --[[ Line: 243 ]]
            -- upvalues: v43 (copy), v45 (copy)
            local v46 = nil;
            if v43 and v45 and typeof(v45) == "table" and v45.current then
                v46 = Instance.new("UISizeConstraint");
                v46.MaxSize = Vector2.new(v43, 1e999);
                v46.Parent = v45.current;
            end;
            return function() --[[ Line: 251 ]]
                -- upvalues: v46 (ref)
                if v46 then
                    v46.Parent = nil;
                    v46:Destroy();
                end;
            end;
        end, {
            v43, 
            v45
        });
        return v5.createElement(if l_isRoactGamepadEnabled_1 then v7.Focusable[v9.Button] else v9.Button, {
            variant = v10.buttonMapping[v41.buttonType], 
            size = v10.getSizeMapping(v41.standardSize, v41.size, v40), 
            width = v10.getWidth(v41.standardSize, v41.size, v41.fitContent), 
            icon = v10.findIcon(v41.icon), 
            text = v41.text, 
            isLoading = v41.isLoading, 
            isDisabled = v41.isDisabled or v41.userInteractionEnabled == false or v41.isDelayedInput and not v41.enableInputDelayed, 
            inputDelay = if v41.isDelayedInput and v41.enableInputDelayed then v41.delayInputSeconds or 3 else nil, 
            onActivated = v41.onActivated, 
            testId = v10.getTestId(v41[v5.Tag]), 
            ref = v45, 
            AnchorPoint = v41.anchorPoint, 
            Position = v41.position, 
            LayoutOrder = v41.layoutOrder, 
            Selectable = v41.Selectable, 
            NextSelectionUp = v41.NextSelectionUp, 
            NextSelectionDown = v41.NextSelectionDown, 
            NextSelectionLeft = v41.NextSelectionLeft, 
            NextSelectionRight = v41.NextSelectionRight
        });
    else
        return v5.createElement(v37, v6.Dictionary.join(v38, {
            buttonRef = if v23.useProvidedRefForButton then v38.buttonRef or v39 else v39
        }));
    end;
end);
v47.validateProps = v24.validateProps;
return v47;