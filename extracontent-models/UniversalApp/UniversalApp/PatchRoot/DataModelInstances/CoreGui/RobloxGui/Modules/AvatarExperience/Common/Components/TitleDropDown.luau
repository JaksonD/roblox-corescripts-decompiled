local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v9 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v10 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v8.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_TextButton_0 = v6.App.Button.TextButton;
local l_Focusable_0 = v7.Focusable;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_withStyle_0 = v6.Style.withStyle;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ControlState_0 = v6.Core.Control.Enum.ControlState;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation;
local v24 = l_Images_0["icons/actions/truncationExpand"];
local v25 = {
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.ActivateTitleDropDown
};
local function v30(v26, v27) --[[ Line: 47 ]] --[[ Name: useTitleDropDownFocusNavigationBindings ]]
    -- upvalues: v9 (copy), v25 (copy), v3 (copy), l_FocusNavigationEventNameEnum_0 (copy), v10 (copy)
    local v28 = v9.useEventMap(v25, v26);
    local v29 = v3.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v10 (ref), v27 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.ActivateTitleDropDown] = {
                handler = v10.onRelease(v27)
            }
        };
    end, {
        v27
    });
    return v9.useEventHandlerMap(v29, v28);
end;
local v31 = v4.PureComponent:extend("TitleDropDown");
v31.validateProps = v5.strictInterface({
    onActivated = v5.callback, 
    Text = v5.string, 
    NextSelectionRight = v5.optional(v5.table), 
    forwardRef = v5.optional(v5.table), 
    inputBindings = v5.optional(v5.table)
});
v31.init = function(v32) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_ControlState_0 (copy)
    v32:setState({
        wrappingFrameAbsoluteSizeX = 0
    });
    v32.absoluteSizeChanged = function(v33) --[[ Line: 76 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            wrappingFrameAbsoluteSizeX = v33.AbsoluteSize.X
        });
    end;
    v32.wrappingFrameRef = v4.createRef();
    local v34, v35 = v4.createBinding(false);
    v32.useBackgroundTransparency = v34;
    v32.updateUseBackgroundTransparency = v35;
    v32.onStateChanged = function(_, v37) --[[ Line: 92 ]]
        -- upvalues: l_ControlState_0 (ref), v32 (copy)
        if v37 == l_ControlState_0.Pressed or v37 == l_ControlState_0.Hover then
            v32.updateUseBackgroundTransparency(true);
            return;
        else
            v32.updateUseBackgroundTransparency(false);
            return;
        end;
    end;
end;
v31.render = function(v38) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v39) --[[ Line: 102 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v38 (copy)
        return l_withSelectionCursorProvider_0(function(v40) --[[ Line: 103 ]]
            -- upvalues: v38 (ref), v39 (copy)
            return v38:renderWithProviders(v39, v40);
        end);
    end);
end;
v31.renderLabel = function(v41, _, _) --[[ Line: 109 ]] --[[ Name: renderLabel ]]
    -- upvalues: v4 (copy), l_TextButton_0 (copy)
    return v4.createElement(l_TextButton_0, {
        size = UDim2.fromScale(0, 1), 
        layoutOrder = 1, 
        onActivated = v41.props.onActivated, 
        text = v41.props.Text, 
        fontStyle = "Header1"
    });
end;
v31.renderButton = function(v44, v45, v46) --[[ Line: 119 ]] --[[ Name: renderButton ]]
    -- upvalues: v13 (copy), v4 (copy), l_ImageSetLabel_0 (copy), v24 (copy), l_Interactable_0 (copy), l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 (copy)
    local l_Text_0 = v44.props.Text;
    local l_TextEmphasis_0 = v45.TextEmphasis;
    local l_Header1_0 = v46.Header1;
    local v50 = 28 * l_Header1_0.RelativeSize;
    local v51 = v46.BaseSize * l_Header1_0.RelativeSize;
    local l_Color_0 = v45.BackgroundOnHover.Color;
    local l_wrappingFrameAbsoluteSizeX_0 = v44.state.wrappingFrameAbsoluteSizeX;
    local v54 = l_wrappingFrameAbsoluteSizeX_0 > 0;
    local v55 = math.max(l_wrappingFrameAbsoluteSizeX_0 - v50, 0);
    local v56, v57 = v13.getLargestPossibleOneLineTextSize(l_Text_0, v51, l_Header1_0, v55);
    if v56 == nil then
        return nil;
    else
        local v58 = UDim2.fromOffset(v56.X, v56.Y);
        local v59 = {};
        if v54 then
            v59 = {
                {
                    Padding = v4.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 8), 
                        PaddingRight = UDim.new(0, 8)
                    }), 
                    Corner = v4.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    UIListLayout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    TextLabel = v4.createElement("TextLabel", {
                        TextColor3 = l_TextEmphasis_0.Color, 
                        TextTransparency = l_TextEmphasis_0.Transparency, 
                        Font = l_Header1_0.Font, 
                        LayoutOrder = 1, 
                        TextWrapped = 1, 
                        Text = l_Text_0, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        Size = v58, 
                        TextSize = v57, 
                        BackgroundTransparency = 1
                    }), 
                    Icon = v4.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Image = v24, 
                        ImageColor3 = l_TextEmphasis_0.Color, 
                        LayoutOrder = 2, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromOffset(v50, v50)
                    })
                }
            };
        end;
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            [v4.Change.AbsoluteSize] = v44.absoluteSizeChanged, 
            [v4.Ref] = v44.wrappingFrameRef
        }, {
            Interactable = v4.createElement(l_Interactable_0, {
                onStateChanged = v44.onStateChanged, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Selectable = if l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 then nil else false, 
                [v4.Event.Activated] = v44.props.onActivated, 
                Size = UDim2.fromScale(1, 1)
            }, {
                ButtonContentFrame = v4.createElement("Frame", {
                    BackgroundColor3 = l_Color_0, 
                    BackgroundTransparency = v44.useBackgroundTransparency:map(function(v60) --[[ Line: 212 ]]
                        -- upvalues: v45 (copy)
                        if v60 then
                            return v45.BackgroundOnHover.Transparency;
                        else
                            return 1;
                        end;
                    end), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                }, v59)
            })
        });
    end;
end;
v31.didUpdate = function(v61) --[[ Line: 223 ]] --[[ Name: didUpdate ]]
    if v61.wrappingFrameRef.current then
        local _ = v61.wrappingFrameRef.current.AbsoluteSize;
    end;
end;
v31.renderWithProviders = function(v63, v64, v65) --[[ Line: 233 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v4 (copy), l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), v7 (copy)
    local l_Theme_0 = v64.Theme;
    local l_Font_0 = v64.Font;
    local l_forwardRef_0 = v63.props.forwardRef;
    return v4.createElement(l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 and "Frame" or l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        SelectionImageObject = v65(l_CursorKind_0.RoundedRectNoInset), 
        NextSelectionRight = v63.props.NextSelectionRight, 
        [v4.Ref] = l_forwardRef_0, 
        inputBindings = if l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 then nil else {
            ActivateTitleDropDown = v7.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 250 ]]
                -- upvalues: v63 (copy)
                v63.props.onActivated();
            end)
        }
    }, {
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 2), 
            PaddingRight = UDim.new(0, 8)
        }), 
        Button = v63:renderButton(l_Theme_0, l_Font_0)
    });
end;
return v4.forwardRef(function(v69, v70) --[[ Line: 265 ]]
    -- upvalues: l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 (copy), v3 (copy), v30 (copy), l_useTableWrappedCallbackRef_0 (copy), v4 (copy), v31 (copy), v2 (copy)
    local l_v70_0 = v70;
    if l_FFlagAXMigrateTitleDropDownInputBindingsToFocusNavigation_0 then
        local v72 = v3.useCallback(function() --[[ Line: 269 ]]
            -- upvalues: v69 (copy)
            v69.onActivated();
        end, {
            v69.onActivated
        });
        local v73 = v30(v70, v72);
        l_v70_0 = l_useTableWrappedCallbackRef_0(v73);
    end;
    return v4.createElement(v31, v2.Dictionary.join(v69, {
        forwardRef = l_v70_0
    }));
end);