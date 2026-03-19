local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v2 = require(l_Parent_0.AvatarExperienceFlags);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.RoactGamepad);
local l_Popover_0 = v3.Popover;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Enums_0 = v3.Enums;
local l_PopoverSide_0 = v3.Enums.PopoverSide;
local l_PopoverAlign_0 = v3.Enums.PopoverAlign;
local l_NumberLocalization_0 = v5.NumberLocalization;
local v14 = require(script.Parent.WearTimeList);
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel);
local v16 = require(script.Parent.useWearTimePopoverFocusNavigationBindings);
local l_FFlagAXDurablesWearTimePopoverGamepadSupport_0 = v2.FFlagAXDurablesWearTimePopoverGamepadSupport;
local l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 = v2.FFlagAXMigrateWearTimePopoverToFocusNavigation;
local l_CombinedFFlagShouldUseLegacyGamepadFocus_0 = v2.CombinedFFlagShouldUseLegacyGamepadFocus;
return function(v20) --[[ Line: 30 ]] --[[ Name: WearTimeSelectedOptionView ]]
    -- upvalues: l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v4 (copy), l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 (copy), l_FFlagAXDurablesWearTimePopoverGamepadSupport_0 (copy), v16 (copy), l_GuiService_0 (copy), l_View_0 (copy), v3 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_NumberLocalization_0 (copy), l_Popover_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), v6 (copy), v14 (copy)
    local l_tokens_0 = v20.tokens;
    local v22 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v4.useRef(nil) else nil;
    local v23 = if not not l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 or l_FFlagAXDurablesWearTimePopoverGamepadSupport_0 then v4.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v20 (copy)
        v20.setIsOpen(false);
    end, {
        v20.setIsOpen
    }) else nil;
    local v24 = nil;
    if l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 then
        v24 = v16(v23, v20.isOpen);
    end;
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then
        local v25 = v4.useRef(false);
        local l_v25_0 = v25 --[[ copy: 5 -> 6 ]];
        v4.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: v20 (copy), l_v25_0 (copy), v22 (copy), l_GuiService_0 (ref)
            if v20.isOpen and not l_v25_0.current then
                if v22 and v22.current and v22.current:IsDescendantOf(game) then
                    l_GuiService_0.SelectedCoreObject = v22.current;
                end;
            elseif not v20.isOpen and l_v25_0.current and v20.anchorRef and v20.anchorRef.current and v20.anchorRef.current:IsDescendantOf(game) then
                l_GuiService_0.SelectedCoreObject = v20.anchorRef.current;
            end;
            l_v25_0.current = v20.isOpen;
        end, {
            v20.isOpen
        });
    end;
    local v27 = v4.createElement("TextButton", {
        Text = "", 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Selectable = l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and true or nil, 
        ref = v20.anchorRef, 
        [v4.Event.Activated] = function() --[[ Line: 72 ]]
            -- upvalues: v20 (copy)
            v20.setIsOpen(not v20.isOpen);
        end
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_tokens_0.Padding.XXSmall)
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_tokens_0.Padding.Medium), 
            PaddingRight = UDim.new(0, l_tokens_0.Padding.Medium), 
            PaddingTop = UDim.new(0, l_tokens_0.Padding.Small), 
            PaddingBottom = UDim.new(0, l_tokens_0.Padding.Small)
        }), 
        TopRow = v4.createElement(l_View_0, {
            tag = "row align-y-center gap-small auto-xy", 
            LayoutOrder = 1
        }, {
            RobuxIcon = v4.createElement(v3.Icon, {
                name = l_Enums_0.IconName.Robux, 
                variant = l_Enums_0.IconVariant.Filled, 
                size = l_Enums_0.IconSize.Small, 
                LayoutOrder = 1
            }), 
            PriceLabel = v4.createElement(l_Text_0, {
                tag = "auto-xy", 
                Text = l_NumberLocalization_0.localize(v20.price, v20.localization:GetLocale()), 
                textStyle = l_tokens_0.Color.Content.Emphasis, 
                fontStyle = {
                    Font = l_tokens_0.Typography.LabelMedium.Font, 
                    FontSize = l_tokens_0.FontSize.FontSize_400
                }, 
                LayoutOrder = 2
            }), 
            ChevronIcon = if not v20.disableOptionSelection then v4.createElement(v3.Icon, {
                name = l_Enums_0.IconName.ChevronLargeDown, 
                variant = l_Enums_0.IconVariant.Regular, 
                size = l_Enums_0.IconSize.Small, 
                LayoutOrder = 3
            }) else nil
        }), 
        SubLabel = v20.subLabelText and v4.createElement(l_Text_0, {
            tag = "auto-xy", 
            Text = v20.subLabelText, 
            textStyle = l_tokens_0.Color.Content.Muted, 
            fontStyle = {
                Font = l_tokens_0.Typography.CaptionSmall.Font, 
                FontSize = l_tokens_0.FontSize.FontSize_300
            }, 
            LayoutOrder = 2
        })
    });
    if v20.disableOptionSelection then
        return v27;
    else
        return v4.createElement(l_View_0, {
            tag = "auto-xy"
        }, {
            TriggerButton = v27, 
            Popover = v4.createElement(l_Popover_0.Root, {
                isOpen = v20.isOpen
            }, {
                Anchor = v4.createElement(l_Popover_0.Anchor, {
                    anchorRef = v20.anchorRef
                }), 
                Content = v4.createElement(l_Popover_0.Content, {
                    align = l_PopoverAlign_0.Start, 
                    side = l_PopoverSide_0.Top, 
                    hasArrow = false, 
                    selection = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then {
                        Selectable = true
                    } else nil, 
                    onPressedOutside = function() --[[ Line: 150 ]] --[[ Name: onPressedOutside ]]
                        -- upvalues: v20 (copy)
                        v20.setIsOpen(false);
                    end
                }, {
                    ContentWrapper = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v4.createElement(v6.Focusable.Frame, {
                        Size = UDim2.new(0, l_tokens_0.Size.Size_2900 * 2, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        SelectionGroup = true, 
                        inputBindings = if v20.isOpen then {
                            Back = v6.Input.onBegin(Enum.KeyCode.ButtonB, v23), 
                            BackKeyboard = v6.Input.onBegin(Enum.KeyCode.Escape, v23)
                        } else nil
                    }, {
                        WearTimeList = v4.createElement(v14, {
                            options = v20.updatedOptions, 
                            selectedIndex = v20.selectedIndex, 
                            onOptionActivated = v20.handleOptionActivated, 
                            firstItemRef = v22
                        })
                    }) else v4.createElement(l_View_0, {
                        Size = UDim2.new(0, l_tokens_0.Size.Size_2900 * 2, 0, 0), 
                        tag = "auto-y", 
                        ref = if l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 then v24 else nil
                    }, {
                        WearTimeList = v4.createElement(v14, {
                            options = v20.updatedOptions, 
                            selectedIndex = v20.selectedIndex, 
                            onOptionActivated = v20.handleOptionActivated
                        })
                    })
                })
            })
        });
    end;
end;