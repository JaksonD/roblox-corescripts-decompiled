local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = v7.FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v10 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v9.State.Selectors.selectAvatarPreviewColors else require(l_Modules_0.AvatarExperience.Common.Selectors.selectAvatarPreviewColors);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorButton);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v14 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v16 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_withStyle_0 = v16.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = v16.App.SelectionImage.withSelectionCursorProvider;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_CursorKind_0 = v16.App.SelectionImage.CursorKind;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local l_GridMetrics_0 = v16.App.Grid.GridMetrics;
local l_RadioButtonList_0 = v16.App.InputButton.RadioButtonList;
local l_DefaultMetricsGridView_0 = v16.App.Grid.DefaultMetricsGridView;
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorsSliderFrame);
local v27 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyColorViewSetting);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetBodyPartRangeIds);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedBodyPartIndex);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectRangeIdForSelectedBodyParts);
local v31 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v32 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixColorAdjustmentGamepadSupport);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXAdaptiveScrollingFixForward_0 = v7.FFlagAXAdaptiveScrollingFixForward;
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v36 = v3.PureComponent:extend("BodyColorsFrame");
local l_ShimmerColorCardsToDisplay_0 = v12.ShimmerColorCardsToDisplay;
local v38 = table.create(l_ShimmerColorCardsToDisplay_0, {});
local v39 = {
    minimumItemsPerRow = 5, 
    minimumItemWidth = 60
};
v36.validateProps = v2.strictInterface({
    Size = v2.UDim2, 
    NextSelectionUp = v2.optional(v2.table), 
    viewSetting = v2.string, 
    rangeIdForSelectedBodyParts = v2.optional(v2.string), 
    defaultBodyColorRanges = v2.table, 
    bodyColor3s = v2.table, 
    bodyPartRangeIds = v2.table, 
    selectedBodyPartIndex = v2.number, 
    setViewSetting = v2.callback, 
    setBodyPartRangeIds = v2.callback, 
    setSelectedBodyPartIndex = v2.callback, 
    adaptiveScrolling = v2.optional(v2.any), 
    onContentScroll = if v35() then v2.optional(v2.any) else nil, 
    LayoutOrder = v2.optional(v2.number), 
    PaddingBottom = v2.optional(v2.UDim), 
    PaddingTop = v2.optional(v2.UDim), 
    PaddingLeft = v2.optional(v2.UDim), 
    PaddingRight = v2.optional(v2.UDim), 
    ref = if v32 then v2.optional(v2.table) else nil
});
v36.init = function(v40) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v11 (copy), v12 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v40:setState({
        bodyColorsFrameHeight = 0, 
        bodyPartsListHeight = 0
    });
    v40.renderItem = function(v41) --[[ Line: 105 ]]
        -- upvalues: v3 (ref), v11 (ref), v40 (copy)
        if v41.rangeId then
            return v3.createElement(v11, {
                rangeId = v41.rangeId
            });
        else
            return v40:getShimmerPanel();
        end;
    end;
    v40.onScroll = function(v42) --[[ Line: 115 ]]
        -- upvalues: v40 (copy)
        if v40.props.adaptiveScrolling then
            v40.props.adaptiveScrolling.onCanvasPositionChanged(v42);
        end;
        if v40.props.onContentScroll then
            v40.props.onContentScroll(v42);
        end;
    end;
    local v43, v44 = v3.createBinding(UDim2.new(0, 0, 1, 0));
    v40.canvasSizeBinding = v43;
    v40.updateCanvasSizeBinding = v44;
    v43, v44 = v3.createBinding(0);
    v40.bodyPartsListHeightBinding = v43;
    v40.updateBodyPartsListHeightBinding = v44;
    v43, v44 = v3.createBinding(0);
    v40.bodyColorsFrameHeightBinding = v43;
    v40.updateBodyColorsFrameHeightBinding = v44;
    v40.onUIListLayoutContentSizeChanged = function(v45) --[[ Line: 128 ]]
        -- upvalues: v12 (ref), v40 (copy)
        local v46 = v12.SkinColorGridPadding * 2;
        local v47 = v45.AbsoluteContentSize.Y + v46;
        v40.updateCanvasSizeBinding(UDim2.new(0, 0, 0, v47));
    end;
    v40.onBodyPartsListAbsoluteSizeChanged = function(v48) --[[ Line: 134 ]]
        -- upvalues: v40 (copy)
        v40.updateBodyPartsListHeightBinding(v48.AbsoluteSize.Y);
    end;
    v40.onBodyColorsFrameAbsoluteSizeChanged = function(v49) --[[ Line: 138 ]]
        -- upvalues: v40 (copy)
        v40.updateBodyColorsFrameHeightBinding(v49.AbsoluteSize.Y);
    end;
    v40.toggleViewButtonRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createRef();
    v40.bodyColorButtonsRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createRef();
    v40.bodyPartButtonsRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createRef();
    v40.sliderRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v3.createRef();
    v40:setSelectedBodyPartIndex(1);
end;
v36.setSelectedBodyPartIndex = function(v50, v51) --[[ Line: 151 ]] --[[ Name: setSelectedBodyPartIndex ]]
    v50.props.setSelectedBodyPartIndex(v51);
end;
v36.getShimmerPanel = function(_) --[[ Line: 155 ]] --[[ Name: getShimmerPanel ]]
    -- upvalues: v3 (copy), l_Skeleton_0 (copy)
    return v3.createElement(l_Skeleton_0, {
        Size = UDim2.new(1, 0, 1, 0)
    });
end;
v36.getItems = function(v53) --[[ Line: 161 ]] --[[ Name: getItems ]]
    -- upvalues: v38 (copy)
    local l_defaultBodyColorRanges_0 = v53.props.defaultBodyColorRanges;
    return l_defaultBodyColorRanges_0 and #l_defaultBodyColorRanges_0 > 0 and l_defaultBodyColorRanges_0 or v38;
end;
v36.getBodyPartsListHeight = function(v55) --[[ Line: 167 ]] --[[ Name: getBodyPartsListHeight ]]
    -- upvalues: v12 (copy)
    if v55.props.viewSetting == v12.ColorPickerViewSettings.AdvancedView then
        return v55.state.bodyPartsListHeight;
    else
        return 0;
    end;
end;
v36.getGridAndSidebarFrameSize = function(v56) --[[ Line: 175 ]] --[[ Name: getGridAndSidebarFrameSize ]]
    -- upvalues: v3 (copy), v12 (copy), v15 (copy)
    if v56:shouldRenderSliderBar() then
        return v3.joinBindings({
            v56.canvasSizeBinding, 
            v56.bodyPartsListHeightBinding, 
            v56.bodyColorsFrameHeightBinding
        }):map(function(v57) --[[ Line: 181 ]]
            -- upvalues: v56 (copy), v12 (ref), v15 (ref)
            local l_Offset_0 = v57[1].Y.Offset;
            local v59 = v57[2];
            local v60 = v57[3];
            if v56.props.viewSetting ~= v12.ColorPickerViewSettings.AdvancedView then
                v59 = 0;
            end;
            local v61 = v15.getBodyColorsSliderFrameHeight(v12.BodyColorsSliderFrameHeight, l_Offset_0, v60, v59);
            return UDim2.new(1, 0, 1, -v61);
        end);
    else
        return v56.props.Size;
    end;
end;
v36.renderBodyColorButtons = function(v62, v63, v64) --[[ Line: 203 ]] --[[ Name: renderBodyColorButtons ]]
    -- upvalues: v3 (copy), l_DefaultMetricsGridView_0 (copy), v14 (copy), v13 (copy), l_GridMetrics_0 (copy), v39 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    return v3.createElement(l_DefaultMetricsGridView_0, {
        renderItem = v62.renderItem, 
        getItemHeight = v14.GridItemHeightGetter(v13.ItemTileType.BodyColorButton), 
        getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v39), 
        itemPadding = Vector2.new(10, 10), 
        items = v63, 
        maxHeight = 1e999, 
        defaultChildIndex = 1, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v62.toggleViewButtonRef, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v62.props.NextSelectionUp, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v64, 
        [v3.Ref] = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v62.bodyColorButtonsRef
    });
end;
v36.renderToggleButton = function(v65, v66, v67, v68, v69) --[[ Line: 219 ]] --[[ Name: renderToggleButton ]]
    -- upvalues: v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy)
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "TextButton" or l_Focusable_0.TextButton, {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Size = UDim2.new(0, 100, 0, 30), 
        Text = v66, 
        Font = v67.Font.Header2.Font, 
        AutomaticSize = Enum.AutomaticSize.X, 
        TextSize = v67.Font.BaseSize * v67.Font.Header2.RelativeSize, 
        TextColor3 = v67.Theme.TextEmphasis.Color, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v65.bodyColorButtonsRef, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v65.sliderRef, 
        SelectionImageObject = v68(l_CursorKind_0.RoundedRect), 
        [v3.Ref] = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v65.toggleViewButtonRef, 
        [v3.Event.Activated] = v69
    });
end;
v36.renderUIListLayout = function(v70) --[[ Line: 240 ]] --[[ Name: renderUIListLayout ]]
    -- upvalues: v3 (copy)
    return v3.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, 20), 
        [v3.Change.AbsoluteContentSize] = v70.onUIListLayoutContentSizeChanged
    });
end;
v36.renderUIPadding = function(v71) --[[ Line: 250 ]] --[[ Name: renderUIPadding ]]
    -- upvalues: v3 (copy), v12 (copy)
    return v3.createElement("UIPadding", {
        PaddingTop = if v71.props.PaddingTop then v71.props.PaddingTop else UDim.new(0, v12.SkinColorGridPadding), 
        PaddingBottom = if v71.props.PaddingBottom then v71.props.PaddingBottom else UDim.new(0, v12.SkinColorGridPadding), 
        PaddingLeft = if v71.props.PaddingLeft then v71.props.PaddingLeft else UDim.new(0, v12.SkinColorGridPadding), 
        PaddingRight = if v71.props.PaddingRight then v71.props.PaddingRight else UDim.new(0, v12.SkinColorGridPadding)
    });
end;
v36.renderBodyPartsList = function(v72, v73) --[[ Line: 267 ]] --[[ Name: renderBodyPartsList ]]
    -- upvalues: v12 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_RadioButtonList_0 (copy)
    local v74 = {};
    for v75 = 1, #v12.BodyPartButtonData do
        table.insert(v74, {
            label = v73["bodyPart" .. v75]
        });
    end;
    local l_selectedBodyPartIndex_0 = v72.props.selectedBodyPartIndex;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromOffset(150, 0), 
        BackgroundTransparency = 1, 
        [v3.Change.AbsoluteSize] = v72.onBodyPartsListAbsoluteSizeChanged
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = if v72.props.PaddingTop then v72.props.PaddingTop else UDim.new(0, v12.SkinColorGridPadding), 
            PaddingBottom = if v72.props.PaddingBottom then v72.props.PaddingBottom else UDim.new(0, v12.SkinColorGridPadding)
        }), 
        BodyPartRadioButtons = v3.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_RadioButtonList_0 else l_Focusable_0[l_RadioButtonList_0], {
            radioButtons = v74, 
            onActivated = function(v77) --[[ Line: 293 ]] --[[ Name: onActivated ]]
                -- upvalues: v72 (copy)
                v72:setSelectedBodyPartIndex(v77);
            end, 
            initialValue = l_selectedBodyPartIndex_0, 
            elementSize = UDim2.new(1, -10, 0, 25), 
            automaticSize = true, 
            padding = UDim.new(0, 10), 
            NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72.bodyColorButtonsRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72.props.NextSelectionUp, 
            [v3.Ref] = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72.bodyPartButtonsRef
        })
    });
end;
v36.renderStandardView = function(v78) --[[ Line: 311 ]] --[[ Name: renderStandardView ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), l_withLocalization_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v35 (copy), v12 (copy)
    local v79 = v78.props.adaptiveScrolling or {};
    return l_withStyle_0(function(v80) --[[ Line: 313 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), l_withLocalization_0 (ref), v78 (copy), v3 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_Focusable_0 (ref), v79 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v35 (ref), v12 (ref)
        return l_withSelectionCursorProvider_0(function(v81) --[[ Line: 314 ]]
            -- upvalues: l_withLocalization_0 (ref), v78 (ref), v3 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_Focusable_0 (ref), v79 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v35 (ref), v80 (copy), v12 (ref)
            return l_withLocalization_0({
                buttonText = "Feature.Avatar.Label.BodyColorAdvancedView"
            })(function(v82) --[[ Line: 317 ]]
                -- upvalues: v78 (ref), v3 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_Focusable_0 (ref), v79 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v35 (ref), v80 (ref), v81 (copy), v12 (ref)
                local v83 = v78:getItems();
                local l_setViewSetting_0 = v78.props.setViewSetting;
                return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "ScrollingFrame" or l_Focusable_0.ScrollingFrame, {
                    BackgroundTransparency = 1, 
                    CanvasSize = v78.canvasSizeBinding, 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    Size = v78:getGridAndSidebarFrameSize(), 
                    NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.props.NextSelectionUp, 
                    defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v78.bodyColorButtonsRef, 
                    ScrollingEnabled = if v79.scrollingEnabledBinding then v79.scrollingEnabledBinding:map(function(v85) --[[ Line: 333 ]]
                        return v85;
                    end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v79.scrollingEnabled, 
                    Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                    [v3.Change.CanvasPosition] = if v35() then v78.onScroll else v79.onCanvasPositionChanged
                }, {
                    UIListLayout = v78:renderUIListLayout(), 
                    UIPadding = v78:renderUIPadding(), 
                    BodyColorButtons = v78:renderBodyColorButtons(v83), 
                    AdvancedViewButton = v78:renderToggleButton(v82.buttonText, v80, v81, function() --[[ Line: 352 ]]
                        -- upvalues: l_setViewSetting_0 (copy), v12 (ref)
                        l_setViewSetting_0(v12.ColorPickerViewSettings.AdvancedView);
                    end)
                });
            end);
        end);
    end);
end;
v36.renderAdvancedView = function(v86) --[[ Line: 367 ]] --[[ Name: renderAdvancedView ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), v12 (copy), l_withLocalization_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v35 (copy)
    local v87 = v86.props.adaptiveScrolling or {};
    return l_withStyle_0(function(v88) --[[ Line: 369 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v12 (ref), l_withLocalization_0 (ref), v86 (copy), v3 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_Focusable_0 (ref), v87 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v35 (ref)
        return l_withSelectionCursorProvider_0(function(v89) --[[ Line: 370 ]]
            -- upvalues: v12 (ref), l_withLocalization_0 (ref), v86 (ref), v3 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_Focusable_0 (ref), v87 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v35 (ref), v88 (copy)
            local v90 = {
                standardButtonText = "Feature.Avatar.Label.BodyColorStandardView"
            };
            for v91, _ in v12.BodyPartButtonData do
                v90["bodyPart" .. v91] = v12.BodyPartButtonData[v91].textKey;
            end;
            return l_withLocalization_0(v90)(function(v93) --[[ Line: 377 ]]
                -- upvalues: v86 (ref), v3 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_Focusable_0 (ref), v87 (ref), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v35 (ref), v88 (ref), v89 (copy), v12 (ref)
                local v94 = v86:getItems();
                local v95 = v86:getGridAndSidebarFrameSize();
                local l_setViewSetting_1 = v86.props.setViewSetting;
                return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "ScrollingFrame" or l_Focusable_0.ScrollingFrame, {
                    BackgroundTransparency = 1, 
                    Size = v95, 
                    CanvasSize = v86.canvasSizeBinding, 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    Position = UDim2.fromScale(0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v86.bodyColorButtonsRef, 
                    Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
                    ScrollingEnabled = if v87.scrollingEnabledBinding then v87.scrollingEnabledBinding:map(function(v97) --[[ Line: 395 ]]
                        return v97;
                    end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v87.scrollingEnabled, 
                    [v3.Change.CanvasPosition] = if v35() then v86.onScroll else v87.onCanvasPositionChanged
                }, {
                    BodyPartsList = v86:renderBodyPartsList(v93), 
                    BodyColorsGrid = v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 150, 0, 0), 
                        Size = UDim2.new(1, -150, 1, 0), 
                        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v86.bodyColorButtonsRef
                    }, {
                        UIPadding = v86:renderUIPadding(), 
                        UIListLayout = v86:renderUIListLayout(), 
                        BodyColorButtons = v86:renderBodyColorButtons(v94, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v86.bodyPartButtonsRef), 
                        StandardViewButton = v86:renderToggleButton(v93.standardButtonText, v88, v89, function() --[[ Line: 428 ]]
                            -- upvalues: v86 (ref), l_setViewSetting_1 (copy), v12 (ref)
                            v86:setSelectedBodyPartIndex(1);
                            l_setViewSetting_1(v12.ColorPickerViewSettings.StandardView);
                        end)
                    })
                });
            end);
        end);
    end);
end;
v36.shouldRenderSliderBar = function(v98) --[[ Line: 442 ]] --[[ Name: shouldRenderSliderBar ]]
    if not v98.props.rangeIdForSelectedBodyParts then
        return false;
    else
        return true;
    end;
end;
v36.render = function(v99) --[[ Line: 451 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v32 (copy), v26 (copy)
    local v100 = nil;
    v100 = if v99.props.viewSetting == v12.ColorPickerViewSettings.AdvancedView then v99:renderAdvancedView() else v99:renderStandardView();
    local v101 = v99:shouldRenderSliderBar();
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        [v3.Ref] = if v32 then v99.props.ref else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v99.props.Size, 
        Position = UDim2.fromOffset(0, 0), 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99.bodyColorButtonsRef, 
        Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
        [v3.Change.AbsoluteSize] = v99.onBodyColorsFrameAbsoluteSizeChanged, 
        LayoutOrder = v99.props.LayoutOrder
    }, {
        BodyColorsView = v100, 
        BodyColorsSliderFrame = if v101 then v3.createElement(v26, {
            sliderRef = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99.sliderRef, 
            NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v99.toggleViewButtonRef, 
            gridAndSidebarFrameSizeBinding = v99:getGridAndSidebarFrameSize(), 
            rangeIdForSelectedBodyParts = v99.props.rangeIdForSelectedBodyParts, 
            defaultBodyColorRanges = v99.props.defaultBodyColorRanges
        }) else nil
    });
end;
v36.didMount = function(v102) --[[ Line: 487 ]] --[[ Name: didMount ]]
    -- upvalues: v15 (copy)
    local l_bodyColor3s_0 = v102.props.bodyColor3s;
    local l_bodyPartRangeIds_0 = v102.props.bodyPartRangeIds;
    local v105 = {};
    local v106 = false;
    for v107, v108 in l_bodyColor3s_0 do
        if l_bodyPartRangeIds_0[v107] == nil then
            v106 = true;
            local v109, _ = v15.findRangeAndSliderValueForColor3(v108, v102.props.defaultBodyColorRanges);
            v105[v107] = v109;
        else
            v105[v107] = l_bodyPartRangeIds_0[v107];
        end;
    end;
    if v106 then
        v102.props.setBodyPartRangeIds(v105);
    end;
end;
return (v31((v4.connect(function(v111, _) --[[ Line: 509 ]]
    -- upvalues: v30 (copy), v10 (copy)
    local l_DefaultBodyColorRanges_0 = v111.AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
    local l_BodyPartRangeIds_0 = v111.AvatarExperience.AvatarEditor.Character.BodyPartRangeIds;
    local l_selectedBodyPartIndex_1 = v111.AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex;
    local v116 = v30(v111);
    return {
        viewSetting = v111.AvatarExperience.AvatarEditor.BodyColorPickerSettings.viewSetting, 
        rangeIdForSelectedBodyParts = v116, 
        defaultBodyColorRanges = l_DefaultBodyColorRanges_0, 
        bodyColor3s = v10(v111), 
        bodyPartRangeIds = l_BodyPartRangeIds_0, 
        selectedBodyPartIndex = l_selectedBodyPartIndex_1
    };
end, function(v117) --[[ Line: 525 ]]
    -- upvalues: v27 (copy), v28 (copy), v29 (copy)
    return {
        setViewSetting = function(v118) --[[ Line: 527 ]] --[[ Name: setViewSetting ]]
            -- upvalues: v117 (copy), v27 (ref)
            v117(v27(v118));
        end, 
        setBodyPartRangeIds = function(v119) --[[ Line: 530 ]] --[[ Name: setBodyPartRangeIds ]]
            -- upvalues: v117 (copy), v28 (ref)
            v117(v28(v119));
        end, 
        setSelectedBodyPartIndex = function(v120) --[[ Line: 533 ]] --[[ Name: setSelectedBodyPartIndex ]]
            -- upvalues: v117 (copy), v29 (ref)
            v117(v29(v120));
        end
    };
end)(v36))));