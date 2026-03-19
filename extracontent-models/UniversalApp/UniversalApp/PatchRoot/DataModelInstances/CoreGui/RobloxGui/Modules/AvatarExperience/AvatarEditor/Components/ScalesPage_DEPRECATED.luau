local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_RoactFitComponents_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_withStyle_0 = v6.Style.withStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyTypeRadar);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodySizeRadar);
local v14 = if v11 then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.HeadSlider) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.HeadSlider_DEPRECATED);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarTypeSwitch);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateScalesPageComponentsForAutofocus;
local v20 = v3.PureComponent:extend("ScalesPage");
v20.init = function(v21) --[[ Line: 40 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    local v22, v23 = v3.createBinding(UDim2.new(0, 0, 1, 0));
    v21.canvasSizeBinding = v22;
    v21.updateCanvasSizeBinding = v23;
    v21.onContentSizeChanged = function(v24) --[[ Line: 43 ]]
        -- upvalues: v21 (copy)
        local v25 = v24.AbsoluteContentSize.Y + 20;
        v21.updateCanvasSizeBinding(UDim2.new(0, 0, 0, v25));
    end;
    v21.bodyTypeRadarRef = v3.createRef();
    v21.bodySizeRadarRef = v3.createRef();
    v21.headSizeSliderRef = v3.createRef();
    v21.avatarTypeSwitchRef = v3.createRef();
end;
v20.render = function(v26) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), v17 (copy), v3 (copy), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), v12 (copy), v13 (copy), l_RoactFitComponents_0 (copy), v14 (copy), v15 (copy)
    local v27 = v26.props.adaptiveScrolling or {};
    local v29 = not v27.scrollingEnabledBinding or v27.scrollingEnabledBinding:map(function(v28) --[[ Line: 59 ]]
        return v28;
    end);
    return l_withStyle_0(function(v30) --[[ Line: 64 ]]
        -- upvalues: l_withLocalization_0 (ref), v26 (copy), v17 (ref), v3 (ref), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (ref), l_Focusable_0 (ref), v29 (copy), v27 (copy), l_FitFrameVertical_0 (ref), v12 (ref), v13 (ref), l_RoactFitComponents_0 (ref), v14 (ref), v15 (ref)
        return l_withLocalization_0({
            headSize = "Feature.Avatar.Label.HeadSize", 
            r6R15 = "Feature.Avatar.Label.R6R15"
        })(function(v31) --[[ Line: 68 ]]
            -- upvalues: v26 (ref), v17 (ref), v30 (copy), v3 (ref), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (ref), l_Focusable_0 (ref), v29 (ref), v27 (ref), l_FitFrameVertical_0 (ref), v12 (ref), v13 (ref), l_RoactFitComponents_0 (ref), v14 (ref), v15 (ref)
            local l_lockNavigationCallback_0 = v26.props.lockNavigationCallback;
            local l_unlockNavigationCallback_0 = v26.props.unlockNavigationCallback;
            local l_enableNavigation_0 = v26.props.enableNavigation;
            local v35 = v26.props.avatarType == v17.AvatarType.R6;
            local l_Font_0 = v30.Font;
            local l_Theme_0 = v30.Theme;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v39 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            local l_forwardRef_0 = v26.props.forwardRef;
            return v3.createElement(l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 and "ScrollingFrame" or l_Focusable_0.ScrollingFrame, {
                CanvasSize = v26.canvasSizeBinding, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = l_enableNavigation_0 and v29, 
                defaultChild = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else if v35 then v26.avatarTypeSwitchRef else v26.bodyTypeRadarRef, 
                NextSelectionLeft = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v26.props.NextSelectionLeft, 
                NextSelectionRight = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v26.props.NextSelectionRight, 
                NextSelectionUp = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v26.props.NextSelectionUp, 
                NextSelectionDown = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v26.props.NextSelectionDown, 
                [v3.Ref] = l_forwardRef_0, 
                [v3.Change.CanvasPosition] = v27.onCanvasPositionChanged
            }, {
                UIPadding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 20), 
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                UIListLayout = v3.createElement("UIListLayout", {
                    Padding = UDim.new(0, 10), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    [v3.Change.AbsoluteContentSize] = v26.onContentSizeChanged
                }), 
                BodyWrappers = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SelectionGroup = true, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    BodyTypeWrapper = v3.createElement(v12, {
                        lockNavigationCallback = v26.props.lockNavigationCallback, 
                        unlockNavigationCallback = v26.props.unlockNavigationCallback, 
                        enableNavigation = v26.props.enableNavigation, 
                        layoutOrder = 1, 
                        isDisabled = v35, 
                        [v3.Ref] = v26.bodyTypeRadarRef
                    }), 
                    BodySizeWrapper = v3.createElement(v13, {
                        lockNavigationCallback = v26.props.lockNavigationCallback, 
                        unlockNavigationCallback = v26.props.unlockNavigationCallback, 
                        enableNavigation = v26.props.enableNavigation, 
                        layoutOrder = 2, 
                        isDisabled = v35, 
                        [v3.Ref] = v26.bodySizeRadarRef
                    })
                }) else nil, 
                BodyTypeWrapper = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v3.createElement(l_Focusable_0[v12], {
                    lockNavigationCallback = v26.props.lockNavigationCallback, 
                    unlockNavigationCallback = v26.props.unlockNavigationCallback, 
                    enableNavigation = v26.props.enableNavigation, 
                    layoutOrder = 1, 
                    isDisabled = v35, 
                    [v3.Ref] = v26.bodyTypeRadarRef, 
                    NextSelectionDown = v26.bodySizeRadarRef
                }), 
                BodySizeWrapper = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v3.createElement(l_Focusable_0[v13], {
                    lockNavigationCallback = v26.props.lockNavigationCallback, 
                    unlockNavigationCallback = v26.props.unlockNavigationCallback, 
                    enableNavigation = v26.props.enableNavigation, 
                    layoutOrder = 2, 
                    isDisabled = v35, 
                    [v3.Ref] = v26.bodySizeRadarRef, 
                    NextSelectionUp = v26.bodyTypeRadarRef, 
                    NextSelectionDown = v26.headSizeSliderRef
                }), 
                HeadSizeWrapper = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 11), 
                    margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 3
                }, {
                    HeadSizeLabel = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v39), 
                        BackgroundTransparency = 1, 
                        Text = v31.headSize, 
                        TextSize = v39, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1, 
                        Font = l_Font_1
                    }), 
                    HeadSize = v3.createElement(if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v14 else l_Focusable_0[v14], {
                        LayoutOrder = 2, 
                        lockNavigationCallback = l_lockNavigationCallback_0, 
                        unlockNavigationCallback = l_unlockNavigationCallback_0, 
                        isDisabled = v35, 
                        [v3.Ref] = v26.headSizeSliderRef, 
                        NextSelectionUp = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v26.bodySizeRadarRef, 
                        NextSelectionDown = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v26.avatarTypeSwitchRef
                    })
                }), 
                R6R15Wrapper = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 11), 
                    margin = l_RoactFitComponents_0.Rect.quad(0, 0, 24, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    R6R15Label = v3.createElement("TextLabel", {
                        Size = UDim2.new(1, 0, 0, v39), 
                        BackgroundTransparency = 1, 
                        Text = v31.r6R15, 
                        TextSize = v39, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        LayoutOrder = 1, 
                        Font = l_Font_1
                    }), 
                    AvatarTypeSwitch = v3.createElement(if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v15 else l_Focusable_0[v15], {
                        LayoutOrder = 2, 
                        [v3.Ref] = v26.avatarTypeSwitchRef, 
                        NextSelectionUp = if not not l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 or v35 then nil else v26.headSizeSliderRef
                    })
                })
            });
        end);
    end);
end;
v20 = v18((v5.connect(function(v41, _) --[[ Line: 262 ]] --[[ Name: mapStateToProps ]]
    return {
        avatarType = v41.AvatarExperience.AvatarEditor.Character.AvatarType
    };
end)(v20)));
return v3.forwardRef(function(v43, v44) --[[ Line: 272 ]]
    -- upvalues: v3 (copy), v20 (ref), v2 (copy)
    return v3.createElement(v20, v2.Dictionary.join(v43, {
        forwardRef = v44
    }));
end);