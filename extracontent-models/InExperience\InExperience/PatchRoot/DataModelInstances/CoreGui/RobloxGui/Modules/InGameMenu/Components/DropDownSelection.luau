local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v3.Roact;
local l_UIBlox_0 = v3.UIBlox;
local l_t_0 = v3.t;
local l_Parent_0 = script.Parent.Parent;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Utility.divideTransparency);
local v11 = require(script.Parent.ThemedButton);
local v12 = require(script.Parent.ThemedTextLabel);
local v13 = require(script.Parent.Divider);
local v14 = require(script.Parent.BarOnTopScrollingFrame);
local v15 = require(script.Parent.Connection.FocusHandler);
local v16 = require(l_Parent_0.Localization.withLocalization);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v18 = l_Roact_0.PureComponent:extend("DropDownSelection");
v18.validateProps = l_t_0.intersection(l_t_0.strictInterface({
    Size = l_t_0.UDim2, 
    Position = l_t_0.optional(l_t_0.UDim2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    placeHolderText = l_t_0.optional(l_t_0.string), 
    selectedIndex = l_t_0.numberMin(0), 
    selections = l_t_0.array(l_t_0.string), 
    localize = l_t_0.boolean, 
    enabled = l_t_0.boolean, 
    truncate = l_t_0.optional(l_t_0.boolean), 
    selectionChanged = l_t_0.callback, 
    canOpen = l_t_0.optional(l_t_0.boolean), 
    canCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    selectionParentName = l_t_0.optional(l_t_0.string), 
    ButtonRef = l_t_0.optional(l_t_0.table)
}), function(v19) --[[ Line: 54 ]]
    if v19.selectedIndex > #v19.selections then
        return false, "selectedIndex must not be greater than the number of selections";
    else
        return true;
    end;
end);
v18.defaultProps = {
    canOpen = true
};
v18.init = function(v20) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v20.rootRef = l_Roact_0.createRef();
    v20.firstOptionRef = l_Roact_0.createRef();
    v20.openDropDownButtonRef = v20.props.ButtonRef or l_Roact_0.createRef();
    v20.state = {
        isOpen = false, 
        dropDownItemHeight = 10, 
        absolutePositionX = 0, 
        absolutePositionY = 0, 
        screenSizeX = 0, 
        screenSizeY = 0
    };
    v20.ancestryConnection = nil;
    v20.sizeConnection = nil;
end;
v18.getDerivedStateFromProps = function(v21) --[[ Line: 86 ]] --[[ Name: getDerivedStateFromProps ]]
    if not v21.canOpen then
        return {
            isOpen = false
        };
    else
        return nil;
    end;
end;
v18.renderDropDownList = function(v22, v23, v24) --[[ Line: 95 ]] --[[ Name: renderDropDownList ]]
    -- upvalues: l_Roact_0 (copy), v11 (copy), v9 (copy), v10 (copy), l_ImageSetLabel_0 (copy), v12 (copy), v13 (copy)
    local v25 = {
        Layout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v26, v27 in ipairs(v22.props.selections) do
        local l_v27_0 = v27;
        if v22.props.localize then
            l_v27_0 = v24[v26];
        end;
        local v29 = -25;
        if v22.props.truncate and v26 == 1 then
            v29 = -48;
        end;
        do
            local l_l_v27_0_0, l_v29_0 = l_v27_0, v29;
            v25["button" .. v26] = l_Roact_0.createElement(v11, {
                Size = UDim2.new(1, 0, 0, v22.state.dropDownItemHeight - 1), 
                LayoutOrder = v26 * 2, 
                onActivated = function() --[[ Line: 119 ]] --[[ Name: onActivated ]]
                    -- upvalues: v22 (copy), v26 (copy)
                    v22:setState({
                        isOpen = false
                    });
                    v22.props.selectionChanged(v26);
                end, 
                normalThemeKey = "BackgroundUIDefault", 
                hoverThemeKey = "BackgroundOnHover", 
                ButtonRef = v26 == 1 and v22.firstOptionRef or nil, 
                imageProps = v9.Images.WhiteSquare, 
                renderChildren = function(_, v33, v34) --[[ Line: 130 ]] --[[ Name: renderChildren ]]
                    -- upvalues: v23 (copy), v10 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v9 (ref), v22 (copy), v26 (copy), v12 (ref), l_v29_0 (ref), l_l_v27_0_0 (ref)
                    local v35 = v33 and v23.Theme.IconOnHover or v23.Theme.IconDefault;
                    local l_Color_0 = v35.Color;
                    local v37 = v10(v35.Transparency, v34 and 2 or 1);
                    return {
                        SelectedIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            BackgroundTransparency = 1, 
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Size = UDim2.new(0, 15, 0, 12), 
                            Position = UDim2.new(1, -25, 0.5, 0), 
                            Image = v9.Images.SelectedCheck, 
                            ImageColor3 = l_Color_0, 
                            ImageTransparency = v37, 
                            Visible = v22.props.selectedIndex == v26
                        }), 
                        TextLabel = l_Roact_0.createElement(v12, {
                            fontKey = "Header2", 
                            themeKey = "TextEmphasis", 
                            Position = UDim2.new(0, 25, 0, 0), 
                            Size = UDim2.new(1, l_v29_0, 1, 0), 
                            Text = l_l_v27_0_0, 
                            TextTruncate = if v22.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    };
                end
            });
            if v26 < #v22.props.selections then
                v25["divider" .. v26] = l_Roact_0.createElement(v13, {
                    LayoutOrder = v26 * 2 + 1
                });
            end;
        end;
    end;
    return v25;
end;
v18.renderFocusHandler = function(v38) --[[ Line: 170 ]] --[[ Name: renderFocusHandler ]]
    -- upvalues: l_Roact_0 (copy), v15 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy)
    return v38.props.selectionParentName and l_Roact_0.createElement(v15, {
        isFocused = v38.props.canOpen and v38.state.isOpen, 
        didFocus = function() --[[ Line: 175 ]] --[[ Name: didFocus ]]
            -- upvalues: l_ContextActionService_0 (ref), v38 (copy), l_GuiService_0 (ref)
            l_ContextActionService_0:BindCoreAction("settings_dropdown_close_action", function(_, v40) --[[ Line: 176 ]]
                -- upvalues: v38 (ref)
                if v40 == Enum.UserInputState.End then
                    v38:setState({
                        isOpen = false
                    });
                    return Enum.ContextActionResult.Sink;
                else
                    return Enum.ContextActionResult.Pass;
                end;
            end, false, Enum.KeyCode.ButtonB);
            if v38.props.canCaptureFocus then
                l_GuiService_0:RemoveSelectionGroup(v38.props.selectionParentName);
                l_GuiService_0:AddSelectionParent(v38.props.selectionParentName, v38.rootRef.current);
                l_GuiService_0.SelectedCoreObject = v38.firstOptionRef.current;
            end;
        end, 
        didBlur = function() --[[ Line: 191 ]] --[[ Name: didBlur ]]
            -- upvalues: l_ContextActionService_0 (ref), l_GuiService_0 (ref), v38 (copy)
            l_ContextActionService_0:UnbindCoreAction("settings_dropdown_close_action");
            l_GuiService_0:RemoveSelectionGroup(v38.props.selectionParentName);
            if v38.props.canOpen and not v38.state.isOpen and v38.props.canCaptureFocus then
                l_GuiService_0.SelectedCoreObject = v38.openDropDownButtonRef.current;
            end;
        end
    }) or nil;
end;
v18.render = function(v41) --[[ Line: 203 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v16 (copy), v9 (copy), l_Roact_0 (copy), v11 (copy), v10 (copy), l_ImageSetLabel_0 (copy), v12 (copy), v14 (copy)
    return l_withStyle_0(function(v42) --[[ Line: 204 ]]
        -- upvalues: v16 (ref), v41 (copy), v9 (ref), l_Roact_0 (ref), v11 (ref), v10 (ref), l_ImageSetLabel_0 (ref), v12 (ref), v14 (ref)
        return v16(v41.props.localize and v41.props.selections or {})(function(v43) --[[ Line: 205 ]]
            -- upvalues: v41 (ref), v9 (ref), v42 (copy), l_Roact_0 (ref), v11 (ref), v10 (ref), l_ImageSetLabel_0 (ref), v12 (ref), v14 (ref)
            local l_placeHolderText_0 = v41.props.placeHolderText;
            if v41.props.selectedIndex > 0 then
                l_placeHolderText_0 = if v41.props.localize then v43[v41.props.selectedIndex] else v41.props.selections[v41.props.selectedIndex];
            end;
            local l_Size_0 = v9.Images.Shadow.Size;
            local v46 = math.min(#v41.props.selections, 7.5) * 44;
            local v47 = v41:renderDropDownList(v42, v43);
            return l_Roact_0.createElement("Frame", {
                Size = v41.props.Size, 
                Position = v41.props.Position, 
                LayoutOrder = v41.props.LayoutOrder, 
                BackgroundTransparency = 1, 
                [l_Roact_0.Ref] = v41.rootRef, 
                [l_Roact_0.Change.AbsoluteSize] = function(v48) --[[ Line: 227 ]]
                    -- upvalues: v41 (ref)
                    v41:setState({
                        dropDownItemHeight = v48.AbsoluteSize.Y
                    });
                end, 
                [l_Roact_0.Change.AbsolutePosition] = function(v49) --[[ Line: 233 ]]
                    -- upvalues: v41 (ref)
                    v41:setState({
                        absolutePositionX = v49.AbsolutePosition.X, 
                        absolutePositionY = v49.AbsolutePosition.Y
                    });
                end
            }, {
                OpenDropDownButton = l_Roact_0.createElement(v11, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Visible = not v41.state.isOpen, 
                    enabled = v41.props.enabled, 
                    onActivated = function() --[[ Line: 244 ]] --[[ Name: onActivated ]]
                        -- upvalues: v41 (ref)
                        v41:setState({
                            isOpen = true
                        });
                    end, 
                    normalThemeKey = "SecondaryDefault", 
                    hoverThemeKey = "SecondaryOnHover", 
                    imageProps = v9.Images.RoundedRectBorder, 
                    renderChildren = function(v50, v51, v52) --[[ Line: 252 ]] --[[ Name: renderChildren ]]
                        -- upvalues: v42 (ref), v10 (ref), l_Roact_0 (ref), l_ImageSetLabel_0 (ref), v9 (ref), v12 (ref), l_placeHolderText_0 (ref), v41 (ref)
                        local v53 = v51 and v42.Theme.IconOnHover or v42.Theme.IconDefault;
                        local l_Color_1 = v53.Color;
                        local v55 = v10(v53.Transparency, v52 and 2 or 1);
                        return {
                            ButtonIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                                BackgroundTransparency = 1, 
                                Size = UDim2.new(0, 36, 0, 36), 
                                Position = UDim2.new(1, -16, 0.5, 0), 
                                AnchorPoint = Vector2.new(1, 0.5), 
                                Image = v9.Images.ExpandArrow, 
                                ImageColor3 = l_Color_1, 
                                ImageTransparency = v55
                            }), 
                            ButtonText = l_Roact_0.createElement(v12, {
                                Text = l_placeHolderText_0, 
                                themeKey = "SecondaryContent", 
                                fontKey = "Header2", 
                                Position = UDim2.new(0, 12, 0, 0), 
                                Size = UDim2.new(1, v41.props.truncate and -48 or -12, 1, 0), 
                                TextTransparency = v50, 
                                TextTruncate = if v41.props.truncate then Enum.TextTruncate.AtEnd else Enum.TextTruncate.None, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            })
                        };
                    end, 
                    ButtonRef = v41.openDropDownButtonRef
                }), 
                CloseDropDownArea = l_Roact_0.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Text = "", 
                    Position = UDim2.new(0, -v41.state.absolutePositionX, 0, -v41.state.absolutePositionY), 
                    Size = UDim2.new(0, v41.state.screenSizeX, 0, v41.state.screenSizeY), 
                    Visible = v41.state.isOpen, 
                    Selectable = false, 
                    [l_Roact_0.Event.Activated] = function() --[[ Line: 291 ]]
                        -- upvalues: v41 (ref)
                        v41:setState({
                            isOpen = false
                        });
                    end, 
                    ZIndex = 2
                }), 
                DropDownShadow = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v9.Images.Shadow.Image, 
                    Position = UDim2.new(0, -l_Size_0, 0, -l_Size_0), 
                    Size = UDim2.new(1, l_Size_0 * 2, 0, l_Size_0 * 2 + 8 + v46), 
                    ScaleType = v9.Images.Shadow.ScaleType, 
                    SliceCenter = v9.Images.Shadow.SliceCenter, 
                    Visible = v41.state.isOpen, 
                    ZIndex = 3
                }, {
                    FocusHandler = v41:renderFocusHandler(), 
                    DropDownBackground = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v9.Images.RoundedRect.Image, 
                        ImageColor3 = v42.Theme.BackgroundUIDefault.Color, 
                        ImageTransparency = v42.Theme.BackgroundUIDefault.Transparency, 
                        ScaleType = v9.Images.RoundedRect.ScaleType, 
                        Size = UDim2.new(1, -(l_Size_0 * 2), 1, -(l_Size_0 * 2)), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        SliceCenter = v9.Images.RoundedRect.SliceCenter, 
                        SliceScale = 0.5
                    }, {
                        DropDownList = l_Roact_0.createElement(v14, {
                            Position = UDim2.new(0, 0, 0, 4), 
                            Size = UDim2.new(1, 0, 1, -8), 
                            CanvasSize = UDim2.new(1, 0, 0, #v41.props.selections * v41.state.dropDownItemHeight)
                        }, v47)
                    })
                })
            });
        end);
    end);
end;
v18.watchLayerCollector = function(v56, v57) --[[ Line: 334 ]] --[[ Name: watchLayerCollector ]]
    v56:setState({
        screenSizeX = v57.AbsoluteSize.X, 
        screenSizeY = v57.AbsoluteSize.Y
    });
    v56.sizeConnection = v57:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 340 ]]
        -- upvalues: v56 (copy), v57 (copy)
        v56:setState({
            screenSizeX = v57.AbsoluteSize.X, 
            screenSizeY = v57.AbsoluteSize.Y
        });
    end);
end;
v18.didMount = function(v58) --[[ Line: 348 ]] --[[ Name: didMount ]]
    local l_current_0 = v58.rootRef.current;
    local l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
    if l_l_current_0_FirstAncestorWhichIsA_0 == nil then
        v58.ancestryConnection = l_current_0.AncestryChanged:Connect(function() --[[ Line: 353 ]]
            -- upvalues: l_l_current_0_FirstAncestorWhichIsA_0 (ref), l_current_0 (copy), v58 (copy)
            l_l_current_0_FirstAncestorWhichIsA_0 = l_current_0:FindFirstAncestorWhichIsA("LayerCollector");
            if l_l_current_0_FirstAncestorWhichIsA_0 ~= nil then
                v58.ancestryConnection:Disconnect();
                v58.ancestryConnection = nil;
                v58:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
            end;
        end);
    else
        v58:watchLayerCollector(l_l_current_0_FirstAncestorWhichIsA_0);
    end;
end;
v18.didUpdate = function(v61, v62) --[[ Line: 366 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_Roact_0 (copy)
    if v62.ButtonRef ~= v61.props.ButtonRef then
        v61.openDropDownButtonRef = v61.props.ButtonRef or l_Roact_0.createRef();
    end;
    if v61.state.isOpen and v62.canCaptureFocus ~= v61.props.canCaptureFocus then
        v61:setState({
            isOpen = false
        });
    end;
end;
v18.willUnmount = function(v63) --[[ Line: 377 ]] --[[ Name: willUnmount ]]
    if v63.ancestryConnection then
        v63.ancestryConnection:Disconnect();
    end;
    if v63.sizeConnection then
        v63.sizeConnection:Disconnect();
    end;
end;
return v18;