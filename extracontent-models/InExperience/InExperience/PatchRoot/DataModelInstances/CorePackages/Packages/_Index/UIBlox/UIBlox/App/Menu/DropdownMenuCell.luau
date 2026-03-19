local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Core_0.Style.withStyle);
local v10 = require(l_Parent_1.Core.Style.useStyle);
local v11 = require(l_Parent_0.SelectionImage.withSelectionCursorProvider);
local v12 = require(l_Parent_0.SelectionCursor.useCursorByType);
local v13 = require(l_Parent_0.SelectionCursor.CursorType);
local v14 = require(l_Parent_0.SelectionImage.CursorKind);
local v15 = require(l_Core_0.ImageSet.ImageSetComponent);
local v16 = require(l_Parent_0.Loading.ShimmerPanel);
local v17 = require(l_Parent_0.Constant.IconSize);
local v18 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v19 = require(l_Core_0.ImageSet.Validator.validateImage);
local v20 = require(l_Core_0.Button.getContentStyle);
local v21 = require(l_Core_0.Style.Validator.validateTypographyInfo);
local v22 = require(l_Core_0.Style.Validator.validateColorInfo);
local v23 = require(script.Parent.StyleDefaults);
local v24 = v4.PureComponent:extend("DropdownMenuCell");
local function v28(v25, v26) --[[ Line: 39 ]] --[[ Name: getColorFromMap ]]
    -- upvalues: v8 (copy)
    local v27 = v25[v26] or v25[v8.Default];
    return {
        Color = v27.Color, 
        Transparency = v27.Transparency
    };
end;
local function _(v29, v30, v31, v32, v33) --[[ Line: 47 ]] --[[ Name: getButtonStyle ]]
    -- upvalues: v8 (copy)
    local v34 = v29(v30, v31, v32);
    if v31 ~= v8.Disabled and v31 ~= v8.Pressed and v33 then
        v34.Transparency = 0.5 * v34.Transparency + 0.5;
    end;
    return v34;
end;
local function _(v36, v37, v38, v39, v40, v41) --[[ Line: 55 ]] --[[ Name: getButtonContentStyle ]]
    -- upvalues: v8 (copy)
    local v42 = v36(v37, v38, v39);
    if v38 ~= v8.Disabled and v38 ~= v8.Pressed and (v40 or not v41) then
        v42.Transparency = 0.5 * v42.Transparency + 0.5;
    end;
    return v42;
end;
v24.init = function(v44) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v44:setState({
        controlState = v8.Initialize
    });
    v44.onStateChanged = function(v45, v46) --[[ Line: 72 ]]
        -- upvalues: v44 (copy)
        v44:setState({
            controlState = v46
        });
        if v44.props.onStateChanged then
            v44.props.onStateChanged(v45, v46);
        end;
    end;
end;
local v47 = v5.union(v5.interface({
    [v8.Default] = v5.string
}), v5.interface({
    [v8.Default] = v22
}));
v24.validateProps = v5.interface({
    icon = v5.optional(v19), 
    text = v5.optional(v5.string), 
    textFont = v5.optional(v21), 
    buttonImage = v19, 
    buttonStateColorMap = v47, 
    contentStateColorMap = v47, 
    textStateColorMap = v5.optional(v47), 
    iconStateColorMap = v5.optional(v47), 
    isDisabled = v5.optional(v5.boolean), 
    isActivated = v5.optional(v5.boolean), 
    hasContent = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean), 
    onActivated = v5.callback, 
    onStateChanged = v5.optional(v5.callback), 
    userInteractionEnabled = v5.optional(v5.boolean), 
    iconSize = v5.optional(v5.number), 
    containerPadding = v5.optional(v5.strictInterface({
        left = v5.number, 
        right = v5.number
    })), 
    iconTextSpacing = v5.optional(v5.number), 
    border = v5.optional(v5.strictInterface({
        cornerRadius = v5.number, 
        size = v5.number
    })), 
    enableTokenOverride = v5.optional(v5.boolean), 
    selectionOrder = v5.optional(v5.number), 
    selectionCursor = v5.optional(v5.any)
});
v24.defaultProps = {
    isDisabled = false, 
    isLoading = false, 
    SliceCenter = Rect.new(8, 8, 9, 9), 
    iconSize = v17.Regular, 
    containerPadding = {
        left = 12, 
        right = 20
    }, 
    iconTextSpacing = 5, 
    border = {
        cornerRadius = 8, 
        size = 1
    }, 
    enableTokenOverride = false
};
v24.render = function(v48) --[[ Line: 185 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v11 (copy), v5 (copy), v14 (copy), v28 (copy), v20 (copy), v8 (copy), v4 (copy), v16 (copy), v18 (copy), v15 (copy), v6 (copy), v7 (copy)
    return v9(function(v49) --[[ Line: 186 ]]
        -- upvalues: v11 (ref), v5 (ref), v48 (copy), v14 (ref), v28 (ref), v20 (ref), v8 (ref), v4 (ref), v16 (ref), v18 (ref), v15 (ref), v6 (ref), v7 (ref)
        return v11(function(v50) --[[ Line: 187 ]]
            -- upvalues: v5 (ref), v49 (copy), v48 (ref), v14 (ref), v28 (ref), v20 (ref), v8 (ref), v4 (ref), v16 (ref), v18 (ref), v15 (ref), v6 (ref), v7 (ref)
            assert(v5.table(v49), "Style provider is missing.");
            local l_controlState_0 = v48.state.controlState;
            local l_text_0 = v48.props.text;
            local l_icon_0 = v48.props.icon;
            local l_iconSize_0 = v48.props.iconSize;
            local l_containerPadding_0 = v48.props.containerPadding;
            local l_iconTextSpacing_0 = v48.props.iconTextSpacing;
            local l_isLoading_0 = v48.props.isLoading;
            local l_isDisabled_0 = v48.props.isDisabled;
            local l_buttonStateColorMap_0 = v48.props.buttonStateColorMap;
            local l_contentStateColorMap_0 = v48.props.contentStateColorMap;
            local v61 = v48.props.textStateColorMap or l_contentStateColorMap_0;
            local v62 = v48.props.iconStateColorMap or l_contentStateColorMap_0;
            if l_isLoading_0 then
                l_isDisabled_0 = true;
            end;
            local v63 = v48.props.selectionCursor or v50 and v50(v14.RoundedRectNoInset);
            local v64 = nil;
            v64 = if v48.props.enableTokenOverride then v28 else v20;
            local l_v64_0 = v64;
            local l_v49_0 = v49;
            local l_isActivated_0 = v48.props.isActivated;
            local v68 = l_v64_0(l_buttonStateColorMap_0, l_controlState_0, l_v49_0);
            if l_controlState_0 ~= v8.Disabled and l_controlState_0 ~= v8.Pressed and l_isActivated_0 then
                v68.Transparency = 0.5 * v68.Transparency + 0.5;
            end;
            local l_v68_0 = v68;
            l_v64_0 = l_text_0;
            if l_v64_0 then
                l_v49_0 = v64;
                l_isActivated_0 = v49;
                v68 = v48.props.isActivated;
                local l_hasContent_0 = v48.props.hasContent;
                local v71 = l_v49_0(v61, l_controlState_0, l_isActivated_0);
                if l_controlState_0 ~= v8.Disabled and l_controlState_0 ~= v8.Pressed and (v68 or not l_hasContent_0) then
                    v71.Transparency = 0.5 * v71.Transparency + 0.5;
                end;
                l_v64_0 = v71;
            end;
            l_v49_0 = l_icon_0;
            if l_v49_0 then
                l_isActivated_0 = v64;
                v68 = v49;
                local l_isActivated_1 = v48.props.isActivated;
                local v73 = l_isActivated_0(v62, l_controlState_0, v68);
                if l_controlState_0 ~= v8.Disabled and l_controlState_0 ~= v8.Pressed and l_isActivated_1 then
                    v73.Transparency = 0.5 * v73.Transparency + 0.5;
                end;
                l_v49_0 = v73;
            end;
            l_isActivated_0 = v48.props.buttonImage;
            v68 = nil;
            v68 = if v48.props.enableTokenOverride then v48.props.textFont else v49.Font.Header2;
            local v74 = nil;
            v74 = if l_icon_0 ~= nil then l_iconSize_0 + l_iconTextSpacing_0 + l_containerPadding_0.right else l_containerPadding_0.right;
            local v75 = nil;
            v75 = if l_isLoading_0 then {
                isLoadingShimmer = v4.createElement(v16, {
                    Size = UDim2.fromScale(1, 1)
                })
            } else v48.props[v4.Children] or {
                TextContainer = v4.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, l_containerPadding_0.left)
                    }), 
                    Text = if l_text_0 then v4.createElement(v18, {
                        BackgroundTransparency = 1, 
                        Text = l_text_0, 
                        fontStyle = v68, 
                        colorStyle = l_v64_0, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -v74, 1, 0), 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = false
                    }) else nil
                }), 
                IconContainer = v4.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    Padding = v4.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, l_containerPadding_0.right)
                    }), 
                    Icon = l_icon_0 and v4.createElement(v15.Label, {
                        Size = UDim2.fromOffset(l_iconSize_0, l_iconSize_0), 
                        BackgroundTransparency = 1, 
                        Image = l_icon_0, 
                        ImageColor3 = l_v49_0.Color, 
                        ImageTransparency = l_v49_0.Transparency, 
                        LayoutOrder = 2
                    }) or nil
                })
            };
            local v76 = {
                isActivated = v6.None, 
                hasContent = v6.None, 
                icon = v6.None, 
                text = v6.None, 
                textFont = v6.None, 
                buttonImage = v6.None, 
                buttonStateColorMap = v6.None, 
                contentStateColorMap = v6.None, 
                textStateColorMap = v6.None, 
                iconStateColorMap = v6.None, 
                iconSize = v6.None, 
                containerPadding = v6.None, 
                iconTextSpacing = v6.None, 
                border = v6.None, 
                enableTokenOverride = v6.None, 
                onActivated = v6.None, 
                isLoading = v6.None, 
                [v4.Children] = v6.None, 
                isDisabled = l_isDisabled_0, 
                onStateChanged = v48.onStateChanged, 
                userInteractionEnabled = v48.props.userInteractionEnabled, 
                ScaleType = Enum.ScaleType.Slice, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                selectionCursor = v6.None, 
                SelectionImageObject = v63, 
                SelectionOrder = v48.props.selectionOrder, 
                [v4.Event.Activated] = v48.props.onActivated
            };
            local v77 = nil;
            local v78 = nil;
            local v79 = nil;
            if v48.props.enableTokenOverride then
                local l_size_0 = v48.props.border.size;
                v79 = UDim2.new(1, -2 * l_size_0, 1, -2 * l_size_0);
                v78 = {
                    UIStroke = v4.createElement("UIStroke", {
                        Color = l_v68_0.Color, 
                        Transparency = l_v68_0.Transparency, 
                        Thickness = l_size_0
                    }), 
                    UICorner = v4.createElement("UICorner", {
                        CornerRadius = UDim.new(0, v48.props.border.cornerRadius)
                    })
                };
                v77 = v6.Dictionary.join(v48.props, v76);
            else
                v79 = UDim2.new(1, 0, 1, 0);
                v78 = {};
                v77 = v6.Dictionary.join(v48.props, {
                    Image = l_isActivated_0, 
                    ImageColor3 = l_v68_0.Color, 
                    ImageTransparency = l_v68_0.Transparency
                }, v76);
            end;
            return v4.createElement(v7, v77, {
                ButtonContent = v4.createElement("Frame", {
                    Size = v79, 
                    BackgroundTransparency = 1
                }, v6.Dictionary.join(v78, v75))
            });
        end);
    end);
end;
return function(v81) --[[ Line: 382 ]]
    -- upvalues: v12 (copy), v13 (copy), v6 (copy), v10 (copy), v23 (copy), v4 (copy), v24 (copy)
    local l_v81_0 = v81;
    local v83 = v12(v13.RoundedRectNoInset);
    l_v81_0 = v6.Dictionary.join(l_v81_0, {
        selectionCursor = v83
    });
    if v81.enableTokenOverride then
        local v84 = v10();
        l_v81_0 = v6.Dictionary.join(v23.getDropdownMenuCellDefaultTokens(v84), v81);
    end;
    return v4.createElement(v24, l_v81_0);
end;