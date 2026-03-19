local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_Focusable_0 = v3.Focusable;
local l_RoactFitComponents_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useSlotItemCardBreakpoints_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor).Hooks.useSlotItemCardBreakpoints;
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyTypeRadar);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodySizeRadar);
local v16 = if v13 then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.HeadSlider) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.HeadSlider_DEPRECATED);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarTypeSwitch);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v20 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateScalesPageComponentsForAutofocus;
local v22 = game:DefineFastFlag("AXFixScalesPagesBottomPaddingForVR", false);
local function v24(v23) --[[ Line: 38 ]] --[[ Name: selectAvatarType ]]
    return v23.AvatarExperience.AvatarEditor.Character.AvatarType;
end;
return v2.memo(v2.forwardRef(function(v25, v26) --[[ Line: 54 ]] --[[ Name: ScalesPage ]]
    -- upvalues: l_useTokens_0 (copy), v20 (copy), v22 (copy), l_useIsSpatial_0 (copy), l_useSlotItemCardBreakpoints_0 (copy), v2 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v24 (copy), v19 (copy), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (copy), l_Focusable_0 (copy), l_FitFrameVertical_0 (copy), v14 (copy), v15 (copy), l_RoactFitComponents_0 (copy), v16 (copy), v17 (copy)
    local v27 = l_useTokens_0();
    local v28 = v20();
    local v29 = nil;
    local v30 = nil;
    if v22 then
        v29 = l_useIsSpatial_0();
        v30 = l_useSlotItemCardBreakpoints_0();
    end;
    local v31, v32 = v2.useBinding(UDim2.new(0, 0, 1, 0));
    local v33 = v2.useRef(nil);
    local v34 = v2.useRef(nil);
    local v35 = v2.useRef(nil);
    local v36 = v2.useRef(nil);
    local v37 = l_useLocalization_0({
        headSize = "Feature.Avatar.Label.HeadSize", 
        r6R15 = "Feature.Avatar.Label.R6R15"
    });
    local v38 = l_useSelector_0(v24) == v19.AvatarType.R6;
    local l_Size_250_0 = v27.Size.Size_250;
    local l_TitleLarge_0 = v27.Typography.TitleLarge;
    local v41 = not v28 or not v28.scrollingEnabledBinding or v28.scrollingEnabledBinding;
    local v49 = if v22 then v2.useCallback(function(v42) --[[ Line: 88 ]]
        -- upvalues: v29 (ref), v30 (ref), l_Size_250_0 (copy), v32 (copy)
        local v43 = if v29 then v30.slotCardTotalHeight else 0;
        local v44 = l_Size_250_0 * 2;
        local v45 = v42.AbsoluteContentSize.Y + v44 + v43;
        v32(UDim2.new(0, 0, 0, v45));
    end, {
        v32, 
        l_Size_250_0, 
        v29, 
        v30
    }) else v2.useCallback(function(v46) --[[ Line: 102 ]]
        -- upvalues: l_Size_250_0 (copy), v32 (copy)
        local v47 = l_Size_250_0 * 2;
        local v48 = v46.AbsoluteContentSize.Y + v47;
        v32(UDim2.new(0, 0, 0, v48));
    end, {
        v32, 
        l_Size_250_0
    });
    return v2.createElement(l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 and "ScrollingFrame" or l_Focusable_0.ScrollingFrame, {
        CanvasSize = v31, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ScrollBarThickness = 0, 
        ElasticBehavior = Enum.ElasticBehavior.Always, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        ScrollingEnabled = if v25.enableNavigation then v41 else false, 
        defaultChild = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else if v38 then v36 else v33, 
        NextSelectionLeft = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v25.NextSelectionLeft, 
        NextSelectionRight = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v25.NextSelectionRight, 
        NextSelectionUp = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v25.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v25.NextSelectionDown, 
        ref = v26, 
        [v2.Change.CanvasPosition] = function(v50) --[[ Line: 108 ]] --[[ Name: onScrollingFrameCanvasPositionChanged ]]
            -- upvalues: v25 (copy), v28 (copy)
            if v25.onCanvasPositionChanged then
                v25.onCanvasPositionChanged(v50);
            end;
            if v28 and v28.onCanvasPositionChanged then
                v28.onCanvasPositionChanged(v50);
            end;
        end
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Size_250_0 * 2), 
            PaddingLeft = UDim.new(0, v27.Size.Size_600), 
            PaddingRight = UDim.new(0, v27.Size.Size_600)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, l_Size_250_0), 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            [v2.Change.AbsoluteContentSize] = v49
        }), 
        BodyWrappers = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v2.createElement(l_FitFrameVertical_0, {
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SelectionGroup = true, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            BodyTypeWrapper = v2.createElement(v14, {
                lockNavigationCallback = v25.lockNavigationCallback, 
                unlockNavigationCallback = v25.unlockNavigationCallback, 
                enableNavigation = v25.enableNavigation, 
                layoutOrder = 1, 
                isDisabled = v38, 
                ref = v33
            }), 
            BodySizeWrapper = v2.createElement(v15, {
                lockNavigationCallback = v25.lockNavigationCallback, 
                unlockNavigationCallback = v25.unlockNavigationCallback, 
                enableNavigation = v25.enableNavigation, 
                layoutOrder = 2, 
                isDisabled = v38, 
                ref = v34
            })
        }) else nil, 
        BodyTypeWrapper = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v2.createElement(l_Focusable_0[v14], {
            lockNavigationCallback = v25.lockNavigationCallback, 
            unlockNavigationCallback = v25.unlockNavigationCallback, 
            enableNavigation = v25.enableNavigation, 
            layoutOrder = 1, 
            isDisabled = v38, 
            ref = v33, 
            NextSelectionDown = v34
        }), 
        BodySizeWrapper = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v2.createElement(l_Focusable_0[v15], {
            lockNavigationCallback = v25.lockNavigationCallback, 
            unlockNavigationCallback = v25.unlockNavigationCallback, 
            enableNavigation = v25.enableNavigation, 
            layoutOrder = 2, 
            isDisabled = v38, 
            ref = v34, 
            NextSelectionUp = v33, 
            NextSelectionDown = v35
        }), 
        HeadSizeWrapper = v2.createElement(l_FitFrameVertical_0, {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, v27.Size.Size_300), 
            margin = l_RoactFitComponents_0.Rect.quad(0, 0, v27.Size.Size_600, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            HeadSizeLabel = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, l_TitleLarge_0.FontSize), 
                BackgroundTransparency = 1, 
                Text = v37.headSize, 
                TextSize = l_TitleLarge_0.FontSize, 
                TextColor3 = v27.Semantic.Color.Text.Default.Color3, 
                TextTransparency = v27.Semantic.Color.Text.Default.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                Font = l_TitleLarge_0.Font
            }), 
            HeadSize = v2.createElement(if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v16 else l_Focusable_0[v16], {
                LayoutOrder = 2, 
                lockNavigationCallback = v25.lockNavigationCallback, 
                unlockNavigationCallback = v25.unlockNavigationCallback, 
                isDisabled = v38, 
                ref = v35, 
                NextSelectionUp = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v34, 
                NextSelectionDown = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else v36
            })
        }), 
        R6R15Wrapper = v2.createElement(l_FitFrameVertical_0, {
            width = UDim.new(1, 0), 
            contentPadding = UDim.new(0, v27.Size.Size_300), 
            margin = l_RoactFitComponents_0.Rect.quad(0, 0, v27.Size.Size_600, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            BackgroundTransparency = 1, 
            LayoutOrder = 4
        }, {
            R6R15Label = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, l_TitleLarge_0.FontSize), 
                BackgroundTransparency = 1, 
                Text = v37.r6R15, 
                TextSize = l_TitleLarge_0.FontSize, 
                TextColor3 = v27.Semantic.Color.Text.Default.Color3, 
                TextTransparency = v27.Semantic.Color.Text.Default.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                LayoutOrder = 1, 
                Font = l_TitleLarge_0.Font
            }), 
            AvatarTypeSwitch = v2.createElement(if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v17 else l_Focusable_0[v17], {
                LayoutOrder = 2, 
                ref = v36, 
                NextSelectionUp = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then nil else not v38 and v35 or nil
            })
        })
    });
end));