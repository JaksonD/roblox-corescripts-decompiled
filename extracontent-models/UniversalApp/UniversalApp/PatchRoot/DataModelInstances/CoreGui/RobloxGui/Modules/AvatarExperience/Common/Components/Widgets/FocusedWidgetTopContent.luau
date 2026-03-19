local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_ImageSetButton_0 = v6.Core.ImageSet.ImageSetButton;
local l_Images_0 = v6.App.ImageSet.Images;
local l_useStyle_0 = v6.Core.Style.useStyle;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useDefaultFocusBehavior_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useDefaultFocusBehavior;
local v15 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_TooltipOrientation_0 = v6.App.Dialog.Enum.TooltipOrientation;
local l_IconButton_0 = v6.App.Button.IconButton;
local l_IconSize_0 = v6.App.ImageSet.Enum.IconSize;
local l_withTooltip_0 = v6.App.Dialog.TooltipV2.withTooltip;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearResultsListFocusedWidget);
local v22 = l_Images_0["icons/navigation/pushBack"];
local v23 = l_Images_0["icons/navigation/close"];
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local function v26(v25) --[[ Line: 35 ]] --[[ Name: mapTokens ]]
    return {
        tooltipIconPadding = v25.Global.Size_100, 
        horizontalPadding = v25.Global.Size_200, 
        widgetCloseOrBackButtonSize = v25.Global.Size_450, 
        size250 = v25.Global.Size_250, 
        size1300 = v25.Global.Size_1300
    };
end;
return function(v27) --[[ Line: 56 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v26 (copy), l_useStyle_0 (copy), l_useDefaultFocusBehavior_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_useSelector_0 (copy), v15 (copy), l_getUseSelectorDeepEquals_0 (copy), v21 (copy), l_useIsSpatial_0 (copy), l_ImageSetButton_0 (copy), v23 (copy), v22 (copy), v3 (copy), l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_IconSize_0 (copy), l_IconButton_0 (copy), l_Images_0 (copy)
    local v28 = l_useDispatch_0();
    local v29 = l_useDesignTokens_0(v26);
    local v30 = l_useStyle_0();
    local v31, v32 = l_useDefaultFocusBehavior_0();
    local v33 = if v27.focusedWidgetTitle and v27.focusedWidgetTitle ~= "" then v27.focusedWidgetTitle else nil;
    local v34 = if v27.focusedWidgetTooltip and v27.focusedWidgetTooltip ~= "" then v27.focusedWidgetTooltip else nil;
    local v35 = l_useLocalization_0({
        title = v33, 
        tooltip = v34
    });
    local l_title_0 = v35.title;
    l_title_0 = if v27.focusedWidgetLocalizedTitle and v27.focusedWidgetLocalizedTitle ~= "" then v27.focusedWidgetLocalizedTitle else v35.title;
    local l_tooltip_0 = v35.tooltip;
    if v27.focusedWidgetLocalizedTooltip and v27.focusedWidgetLocalizedTooltip ~= "" then
        l_tooltip_0 = v27.focusedWidgetLocalizedTooltip;
    end;
    local v38, v39 = v4.useState(false);
    local v40 = l_useSelector_0(v15.isAvatarExperienceRoute, l_getUseSelectorDeepEquals_0());
    v4.useEffect(function() --[[ Line: 92 ]]
        -- upvalues: v40 (copy), v39 (copy)
        if not v40 then
            v39(false);
        end;
    end, {
        v40
    });
    local l_Theme_0 = v30.Theme;
    local l_Font_0 = v30.Font;
    local v43 = v29.size250 / 2;
    local v44 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v45 = v4.useCallback(function() --[[ Line: 105 ]]
        -- upvalues: v28 (copy), v21 (ref), v27 (copy)
        v28(v21(v27.searchUuid));
        if type(v27.onClose) == "function" then
            v27.onClose();
        end;
    end, {
        v27.searchUuid, 
        v27.onClose
    });
    if not v27.active then
        return nil;
    else
        local v47 = v4.useCallback(function() --[[ Line: 116 ]]
            -- upvalues: v39 (copy)
            v39(function(v46) --[[ Line: 117 ]]
                return not v46;
            end);
        end, {});
        local v48 = l_useIsSpatial_0();
        local v49 = l_tooltip_0 and not v48;
        return v4.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v29.size1300 / 2), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Selectable = true, 
            ref = v32
        }, {
            UIPadding = v4.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v29.horizontalPadding), 
                PaddingRight = UDim.new(0, v29.horizontalPadding)
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            BackButton = v4.createElement(l_ImageSetButton_0, {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v29.widgetCloseOrBackButtonSize, 0, v29.widgetCloseOrBackButtonSize), 
                Image = if v27.showCloseIcon then v23 else v22, 
                ImageColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                Visible = true, 
                LayoutOrder = 1, 
                [v3.Event.Activated] = v45, 
                ref = v31
            }), 
            Divider = v4.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 1, 0, 16)
            }), 
            TitleFrame = if l_title_0 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                LayoutOrder = 3
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v29.tooltipIconPadding)
                }), 
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v43), 
                    PaddingLeft = UDim.new(0, v29.size250 / 4), 
                    PaddingRight = UDim.new(0, v29.horizontalPadding), 
                    PaddingBottom = UDim.new(0, v43)
                }), 
                Title = if l_title_0 then v4.createElement("TextLabel", {
                    Text = l_title_0, 
                    Font = l_Font_0.Header2.Font, 
                    TextSize = v44, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                    Size = UDim2.fromScale(0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0
                }) else nil, 
                TitleTooltip = if v49 then l_withTooltip_0({
                    bodyText = l_tooltip_0, 
                    useLargeDropShadow = true
                }, {
                    preferredOrientation = l_TooltipOrientation_0.Bottom, 
                    guiTarget = l_CoreGui_0, 
                    active = v38, 
                    DisplayOrder = 1
                }, function(v50) --[[ Line: 206 ]]
                    -- upvalues: v4 (ref), l_IconSize_0 (ref), l_IconButton_0 (ref), l_Images_0 (ref), l_Theme_0 (copy), v47 (copy)
                    return v4.createElement("Frame", {
                        Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        [v4.Change.AbsolutePosition] = v50, 
                        [v4.Change.AbsoluteSize] = v50
                    }, {
                        v4.createElement(l_IconButton_0, {
                            icon = l_Images_0["icons/actions/info_small"], 
                            iconSize = l_IconSize_0.Small, 
                            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
                            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
                            onActivated = v47
                        })
                    });
                end) else nil
            }) else nil
        });
    end;
end;