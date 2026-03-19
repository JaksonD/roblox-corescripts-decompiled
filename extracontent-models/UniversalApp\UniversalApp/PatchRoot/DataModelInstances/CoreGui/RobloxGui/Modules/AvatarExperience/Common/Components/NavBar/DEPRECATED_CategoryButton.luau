local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_withStyle_0 = v7.Style.withStyle;
local l_Interactable_0 = v7.Core.Control.Interactable;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.useCategoryButtonTooltip);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NewItemNotification);
local l_AXTooltip_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.AXTooltip;
local v19 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v20 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local v21 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRemoveCatalogCategoryNavKey_0 = v21.FFlagAXRemoveCatalogCategoryNavKey;
local l_FFlagAXCatalogCategoryTooltip_0 = v21.FFlagAXCatalogCategoryTooltip;
local l_FFlagAXCatalogCategoriesSDUI_0 = v21.FFlagAXCatalogCategoriesSDUI;
local l_FFlagAXMigrateCategoryTooltip_0 = v21.FFlagAXMigrateCategoryTooltip;
local v26 = require(l_Modules_0.LuaApp.Util.debounce);
local l_withTooltip_0 = v7.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v7.App.Dialog.Enum.TooltipOrientation;
local v29 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v29.Hooks.useTokens;
local l_Popover_0 = v29.Popover;
local l_PopoverSide_0 = v29.Enums.PopoverSide;
local l_PopoverAlign_0 = v29.Enums.PopoverAlign;
local l_Radius_0 = v29.Enums.Radius;
local v35 = v5.PureComponent:extend("CategoryButton");
v35.renderButtonChild = function(v36, v37, v38, v39, v40, v41) --[[ Line: 60 ]] --[[ Name: renderButtonChild ]]
    -- upvalues: l_Text_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v5 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), l_CursorKind_0 (copy), v17 (copy)
    local l_Font_0 = v38.Font;
    local l_Theme_0 = v38.Theme;
    local l_isSelected_0 = v36.props.isSelected;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v46 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v47 = l_Text_0.GetTextWidth(if l_FFlagAXCatalogCategoriesSDUI_0 and v36.props.localizedCategoryTitle then v36.props.localizedCategoryTitle else v37.title, l_Font_1, v46);
    local v48 = l_isSelected_0 and l_Theme_0.TextEmphasis.Color or l_Theme_0.TextMuted.Color;
    local v49 = l_isSelected_0 and l_Theme_0.TextEmphasis.Transparency or l_Theme_0.TextMuted.Transparency;
    local v50 = v47 + 20;
    local l_hasNewItemNotification_0 = v36.props.hasNewItemNotification;
    local l_forwardRef_0 = v36.props.forwardRef;
    local l_frameRef_0 = v36.props.frameRef;
    return v5.createElement("Frame", {
        Size = UDim2.new(0, v50, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v36.props.layoutOrder, 
        [v5.Change.AbsoluteSize] = v40, 
        [v5.Change.AbsolutePosition] = function(v54) --[[ Line: 96 ]]
            -- upvalues: v36 (copy), v41 (copy)
            if v36.delayedSetReadyToShowTooltip then
                v36.delayedSetReadyToShowTooltip();
            end;
            if v41 then
                v41(v54);
            end;
        end, 
        [v5.Ref] = l_frameRef_0
    }, {
        Button = v5.createElement(l_Focusable_0[l_Interactable_0], {
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v5.Event.Activated] = v36.onActivated, 
            [v5.Ref] = l_forwardRef_0, 
            NextSelectionLeft = v36.props.NextSelectionLeft, 
            NextSelectionRight = v36.props.NextSelectionRight, 
            NextSelectionUp = v36.props.NextSelectionUp, 
            NextSelectionDown = v36.props.NextSelectionDown, 
            SelectionImageObject = v39(l_CursorKind_0.NavHighlight)
        }, v5.createElement("TextLabel", {
            Text = if l_FFlagAXCatalogCategoriesSDUI_0 and v36.props.localizedCategoryTitle then v36.props.localizedCategoryTitle else v37.title, 
            TextSize = v46, 
            TextColor3 = v48, 
            TextTransparency = v49, 
            Font = l_Font_1, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        })), 
        NewItemNotification = l_hasNewItemNotification_0 and v5.createElement(v17, {
            isSelected = l_isSelected_0
        })
    });
end;
v35.tryDismissTooltip = function(v55) --[[ Line: 146 ]] --[[ Name: tryDismissTooltip ]]
    local l_readyToShowTooltipFromTimestamp_0 = v55.state.readyToShowTooltipFromTimestamp;
    if not l_readyToShowTooltipFromTimestamp_0 or v55.state.isTooltipDismissed then
        return;
    elseif os.difftime(os.time(), l_readyToShowTooltipFromTimestamp_0) < 3 then
        return;
    else
        if v55.props.onTooltipDismiss then
            v55.props.onTooltipDismiss();
        end;
        v55:setState({
            isTooltipDismissed = true
        });
        return;
    end;
end;
v35.renderButtonWithTooltip = function(v57, v58, v59, v60) --[[ Line: 166 ]] --[[ Name: renderButtonWithTooltip ]]
    -- upvalues: l_withTooltip_0 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), v5 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    return l_withTooltip_0({
        bodyText = v57.props.tooltipTitle, 
        useLargeDropShadow = true
    }, {
        triggerPointName = ("%*-Tooltip"):format(v57.props.categoryName), 
        preferredOrientation = l_TooltipOrientation_0.Bottom, 
        guiTarget = l_CoreGui_0, 
        DisplayOrder = 100, 
        active = not v57.props.isHidden and v57.state.readyToShowTooltipFromTimestamp and not v57.state.isTooltipDismissed
    }, function(v61) --[[ Line: 178 ]]
        -- upvalues: v5 (ref), v57 (copy), v58 (copy), v59 (copy), v60 (copy), l_ExternalEventConnection_0 (ref), l_UserInputService_0 (ref)
        return v5.createFragment({
            CategoryButton = v57:renderButtonChild(v58, v59, v60, v61, v61), 
            OnInputBegan = v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.InputBegan, 
                callback = function() --[[ Line: 189 ]] --[[ Name: callback ]]
                    -- upvalues: v57 (ref)
                    v57:tryDismissTooltip();
                end
            })
        });
    end);
end;
v35.renderWithLocalized = function(v62, v63) --[[ Line: 197 ]] --[[ Name: renderWithLocalized ]]
    -- upvalues: l_Text_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), l_withSelectionCursorProvider_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), v5 (copy), l_Popover_0 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), l_CursorKind_0 (copy), v17 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), l_Radius_0 (copy), v29 (copy), v20 (copy), l_AXTooltip_0 (copy), l_withStyle_0 (copy)
    return l_withStyle_0(function(v64) --[[ Line: 198 ]]
        -- upvalues: v62 (copy), l_Text_0 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v63 (copy), l_withSelectionCursorProvider_0 (ref), l_FFlagAXMigrateCategoryTooltip_0 (ref), v5 (ref), l_Popover_0 (ref), l_Focusable_0 (ref), l_Interactable_0 (ref), l_CursorKind_0 (ref), v17 (ref), l_PopoverAlign_0 (ref), l_PopoverSide_0 (ref), l_Radius_0 (ref), v29 (ref), v20 (ref), l_AXTooltip_0 (ref)
        local l_Font_2 = v64.Font;
        local l_Theme_1 = v64.Theme;
        local l_isSelected_1 = v62.props.isSelected;
        local l_Font_3 = l_Font_2.Header2.Font;
        local v69 = l_Font_2.BaseSize * l_Font_2.Header2.RelativeSize;
        local v70 = l_Text_0.GetTextWidth(if l_FFlagAXCatalogCategoriesSDUI_0 and v62.props.localizedCategoryTitle then v62.props.localizedCategoryTitle else v63.title, l_Font_3, v69);
        local v71 = l_isSelected_1 and l_Theme_1.TextEmphasis.Color or l_Theme_1.TextMuted.Color;
        local v72 = l_isSelected_1 and l_Theme_1.TextEmphasis.Transparency or l_Theme_1.TextMuted.Transparency;
        local v73 = v70 + 20;
        local l_hasNewItemNotification_1 = v62.props.hasNewItemNotification;
        local l_forwardRef_1 = v62.props.forwardRef;
        local l_frameRef_1 = v62.props.frameRef;
        return l_withSelectionCursorProvider_0(function(v77) --[[ Line: 223 ]]
            -- upvalues: l_FFlagAXMigrateCategoryTooltip_0 (ref), v62 (ref), v5 (ref), v73 (copy), l_frameRef_1 (copy), l_Popover_0 (ref), l_Focusable_0 (ref), l_Interactable_0 (ref), l_forwardRef_1 (copy), l_CursorKind_0 (ref), l_FFlagAXCatalogCategoriesSDUI_0 (ref), v63 (ref), v69 (copy), v71 (copy), v72 (copy), l_Font_3 (copy), l_hasNewItemNotification_1 (copy), v17 (ref), l_isSelected_1 (copy), l_PopoverAlign_0 (ref), l_PopoverSide_0 (ref), l_Radius_0 (ref), v29 (ref), v20 (ref), v64 (copy), l_AXTooltip_0 (ref)
            if not l_FFlagAXMigrateCategoryTooltip_0 and v62.props.tooltipOpen then
                return v5.createElement("Frame", {
                    Size = UDim2.new(0, v73, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v62.props.layoutOrder, 
                    [v5.Ref] = l_frameRef_1
                }, v5.createElement(l_Popover_0.Root, {
                    isOpen = true
                }, {
                    Anchor = v5.createElement(l_Popover_0.Anchor, nil, {
                        Button = v5.createElement(l_Focusable_0[l_Interactable_0], {
                            AnchorPoint = Vector2.new(0, 0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Size = UDim2.new(0, v73, 0, v62.props.navBarHeight), 
                            BackgroundTransparency = 1, 
                            [v5.Event.Activated] = v62.onActivated, 
                            ref = l_forwardRef_1, 
                            NextSelectionLeft = v62.props.NextSelectionLeft, 
                            NextSelectionRight = v62.props.NextSelectionRight, 
                            NextSelectionUp = v62.props.NextSelectionUp, 
                            NextSelectionDown = v62.props.NextSelectionDown, 
                            SelectionImageObject = v77(l_CursorKind_0.NavHighlight)
                        }, v5.createElement("TextLabel", {
                            Text = if l_FFlagAXCatalogCategoriesSDUI_0 and v62.props.localizedCategoryTitle then v62.props.localizedCategoryTitle else v63.title, 
                            TextSize = v69, 
                            TextColor3 = v71, 
                            TextTransparency = v72, 
                            Font = l_Font_3, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1
                        })), 
                        NewItemNotification = l_hasNewItemNotification_1 and v5.createElement(v17, {
                            isSelected = l_isSelected_1
                        })
                    }), 
                    Content = v5.createElement(l_Popover_0.Content, {
                        align = l_PopoverAlign_0.Center, 
                        side = l_PopoverSide_0.Top, 
                        backgroundStyle = v62.props.foundationTokens.Color.System.Contrast, 
                        radius = l_Radius_0.Medium
                    }, {
                        v5.createElement(v29.View, {
                            tag = "col gap-xsmall padding-y-small padding-x-medium auto-xy"
                        }, {
                            CategoryButtonTooltipTitle = v5.createElement(v29.Text, {
                                Text = v63.tooltipTitle, 
                                tag = "auto-xy text-title-medium content-inverse-emphasis"
                            }, {
                                TooltipOverlayButton = v5.createElement("TextButton", {
                                    Transparency = 1, 
                                    [v5.Event.Activated] = v62.props.tooltipActivated, 
                                    Size = UDim2.fromScale(1, 1)
                                })
                            })
                        })
                    })
                }));
            elseif v20.isEnabled() and v62.enableHeadCategoryCombine and v62.props.tooltipTitle and not v62.props.isSpatial then
                return v62:renderButtonWithTooltip(v63, v64, v77);
            else
                return v5.createElement("Frame", {
                    Size = UDim2.new(0, v73, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v62.props.layoutOrder, 
                    [v5.Ref] = l_frameRef_1
                }, {
                    Button = v5.createElement(l_Focusable_0[l_Interactable_0], {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        [v5.Event.Activated] = v62.onActivated, 
                        [v5.Ref] = l_forwardRef_1, 
                        NextSelectionLeft = v62.props.NextSelectionLeft, 
                        NextSelectionRight = v62.props.NextSelectionRight, 
                        NextSelectionUp = v62.props.NextSelectionUp, 
                        NextSelectionDown = v62.props.NextSelectionDown, 
                        SelectionImageObject = v77(l_CursorKind_0.NavHighlight)
                    }, {
                        AXTooltip = l_FFlagAXMigrateCategoryTooltip_0 and v5.createElement(l_AXTooltip_0, {
                            popoverSide = "Top", 
                            tooltipLocalizationKey = v62.props.categoryTooltipLocalizationKey, 
                            tooltipStorageKey = v62.props.categoryTooltipKey or "", 
                            dismissTooltipRef = v62.props.dismissTooltipRef, 
                            showTooltip = v62.props.showTooltip, 
                            localizedText = if l_FFlagAXCatalogCategoriesSDUI_0 then v62.props.categoryLocalizedTooltipBody else nil
                        }); 
                        v5.createElement("TextLabel", {
                            Text = if l_FFlagAXCatalogCategoriesSDUI_0 and v62.props.localizedCategoryTitle then v62.props.localizedCategoryTitle else v63.title, 
                            TextSize = v69, 
                            TextColor3 = v71, 
                            TextTransparency = v72, 
                            Font = l_Font_3, 
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 1
                        })
                    }), 
                    NewItemNotification = l_hasNewItemNotification_1 and v5.createElement(v17, {
                        isSelected = l_isSelected_1
                    })
                });
            end;
        end);
    end);
end;
v35.render = function(v78) --[[ Line: 363 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy)
    return l_withLocalization_0({
        title = if l_FFlagAXCatalogCategoriesSDUI_0 and v78.props.localizedCategoryTitle then nil else v78.props.categoryTitle, 
        tooltipTitle = v78.props.tooltipText
    })(function(v79) --[[ Line: 369 ]]
        -- upvalues: v78 (copy)
        return v78:renderWithLocalized(v79);
    end);
end;
v35.init = function(v80) --[[ Line: 374 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy), v19 (copy), v26 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy)
    if v20.isEnabled() then
        v80.enableHeadCategoryCombine = v19.readTestVariable(v20.EnableHeadCategoryCombination);
        v80.state = {
            readyToShowTooltipFromTimestamp = nil, 
            isTooltipDismissed = false
        };
        v80.delayedSetReadyToShowTooltip = v26(function() --[[ Line: 385 ]]
            -- upvalues: v80 (copy)
            if v80.state.readyToShowTooltipFromTimestamp then
                return;
            else
                v80:setState({
                    readyToShowTooltipFromTimestamp = os.time()
                });
                return;
            end;
        end, 0.5);
    end;
    v80.onActivated = function() --[[ Line: 394 ]]
        -- upvalues: l_FFlagAXMigrateCategoryTooltip_0 (ref), v80 (copy)
        if l_FFlagAXMigrateCategoryTooltip_0 and v80.props.dismissTooltipRef.current then
            v80.props.dismissTooltipRef.current();
        end;
        if v80.props.shouldUseCategoryId then
            v80.props.onActivate(v80.props.categoryId);
            return;
        else
            v80.props.onActivate(v80.props.categoryIndex);
            return;
        end;
    end;
end;
return v5.forwardRef(function(v81, v82) --[[ Line: 408 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_FFlagAXMigrateCategoryTooltip_0 (copy), v16 (copy), l_FFlagAXRemoveCatalogCategoryNavKey_0 (copy), l_FFlagAXCatalogCategoryTooltip_0 (copy), l_useTokens_0 (copy), v5 (copy), l_FFlagAXCatalogCategoriesSDUI_0 (copy), v35 (copy), v4 (copy)
    local v83 = l_useIsSpatial_0();
    local v84 = nil;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    if not l_FFlagAXMigrateCategoryTooltip_0 then
        local v88, v89, v90 = v16(if l_FFlagAXRemoveCatalogCategoryNavKey_0 then v81.categoryId else v81.navigationKey, v81.avatarScreenOfOrigin, if l_FFlagAXCatalogCategoryTooltip_0 then v81.categoryTooltipKey else nil);
        v84 = v88;
        v85 = v89;
        v87 = v90;
        v86 = l_useTokens_0();
    end;
    local v91 = nil;
    local v92 = nil;
    if l_FFlagAXMigrateCategoryTooltip_0 then
        v91 = v5.createRef();
        local v93 = false;
        if v81.categoryTooltipKey ~= nil then
            v93 = v81.categoryTooltipLocalizationKey ~= nil;
        end;
        v92 = v93;
        if l_FFlagAXCatalogCategoriesSDUI_0 then
            v92 = v92 and (v81.categoryLocalizedTooltipBody ~= nil or v81.categoryTooltipLocalizationKey ~= nil);
        end;
    end;
    return v5.createElement(v35, v4.Dictionary.join(v81, {
        forwardRef = v82, 
        isSpatial = v83, 
        tooltipOpen = if not l_FFlagAXMigrateCategoryTooltip_0 then v84 else nil, 
        tooltipActivated = if not l_FFlagAXMigrateCategoryTooltip_0 then v85 else nil, 
        foundationTokens = if not l_FFlagAXMigrateCategoryTooltip_0 then v86 else nil, 
        tooltipText = if not l_FFlagAXMigrateCategoryTooltip_0 then v87 else nil, 
        dismissTooltipRef = if l_FFlagAXMigrateCategoryTooltip_0 then v91 else nil, 
        showTooltip = if l_FFlagAXMigrateCategoryTooltip_0 then v92 else nil
    }));
end);