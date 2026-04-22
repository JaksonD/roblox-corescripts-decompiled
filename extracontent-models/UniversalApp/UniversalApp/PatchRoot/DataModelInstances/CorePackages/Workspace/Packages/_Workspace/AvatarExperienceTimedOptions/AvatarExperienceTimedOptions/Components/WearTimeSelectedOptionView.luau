local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent;
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
local v20 = game:DefineFastFlag("AXDurablesWearTimePopoverGamepadSupportFollowup", false) and l_CombinedFFlagShouldUseLegacyGamepadFocus_0;
return function(v21) --[[ Line: 34 ]] --[[ Name: WearTimeSelectedOptionView ]]
    -- upvalues: l_CombinedFFlagShouldUseLegacyGamepadFocus_0 (copy), v4 (copy), l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 (copy), l_FFlagAXDurablesWearTimePopoverGamepadSupport_0 (copy), v16 (copy), l_GuiService_0 (copy), v20 (copy), l_View_0 (copy), v3 (copy), l_Enums_0 (copy), l_Text_0 (copy), l_NumberLocalization_0 (copy), l_Popover_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), v6 (copy), v14 (copy)
    local l_tokens_0 = v21.tokens;
    local v23 = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v4.useRef(nil) else nil;
    local v24 = if not not l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 or l_FFlagAXDurablesWearTimePopoverGamepadSupport_0 then v4.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v21 (copy)
        v21.setIsOpen(false);
    end, {
        v21.setIsOpen
    }) else nil;
    local v25 = nil;
    if l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 then
        v25 = v16(v24, v21.isOpen);
    end;
    if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then
        local v26 = v4.useRef(false);
        local l_v26_0 = v26 --[[ copy: 5 -> 6 ]];
        v4.useEffect(function() --[[ Line: 53 ]]
            -- upvalues: v21 (copy), l_v26_0 (copy), v23 (copy), l_GuiService_0 (ref)
            if v21.isOpen and not l_v26_0.current then
                if v23 and v23.current and v23.current:IsDescendantOf(game) then
                    l_GuiService_0.SelectedCoreObject = v23.current;
                end;
            elseif not v21.isOpen and l_v26_0.current and v21.anchorRef and v21.anchorRef.current and v21.anchorRef.current:IsDescendantOf(game) then
                l_GuiService_0.SelectedCoreObject = v21.anchorRef.current;
            end;
            l_v26_0.current = v21.isOpen;
        end, {
            v21.isOpen, 
            if v20 and v21.anchorRef then v21.anchorRef.current else nil
        });
    end;
    local v28 = v4.createElement("TextButton", {
        Text = "", 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Selectable = l_CombinedFFlagShouldUseLegacyGamepadFocus_0 and true or nil, 
        ref = v21.anchorRef, 
        [v4.Event.Activated] = function() --[[ Line: 84 ]]
            -- upvalues: v21 (copy)
            v21.setIsOpen(not v21.isOpen);
        end
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        TopRow = v4.createElement(l_View_0, {
            tag = "row align-y-center gap-xsmall auto-xy padding-top-xxsmall", 
            LayoutOrder = 1
        }, {
            RobuxIcon = v4.createElement(v3.Icon, {
                name = l_Enums_0.IconName.Robux, 
                variant = l_Enums_0.IconVariant.Filled, 
                size = l_Enums_0.IconSize.Small, 
                style = l_tokens_0.Color.Content.Emphasis, 
                LayoutOrder = 1
            }), 
            PriceLabel = v4.createElement(l_Text_0, {
                tag = "auto-xy", 
                Text = l_NumberLocalization_0.localize(v21.price, v21.localization:GetLocale()), 
                textStyle = l_tokens_0.Color.Content.Emphasis, 
                fontStyle = {
                    Font = l_tokens_0.Typography.TitleSmall.Font, 
                    FontSize = l_tokens_0.FontSize.FontSize_400
                }, 
                LayoutOrder = 2
            }), 
            ChevronIcon = if not v21.disableOptionSelection then v4.createElement(v3.Icon, {
                name = l_Enums_0.IconName.ChevronLargeDown, 
                variant = l_Enums_0.IconVariant.Regular, 
                size = l_Enums_0.IconSize.Small, 
                style = l_tokens_0.Color.Content.Emphasis, 
                LayoutOrder = 3
            }) else nil
        }), 
        SubLabel = v21.subLabelText and v4.createElement(l_Text_0, {
            tag = "auto-xy padding-top-xxsmall", 
            Text = v21.subLabelText, 
            textStyle = l_tokens_0.Color.Content.Muted, 
            fontStyle = {
                Font = l_tokens_0.Typography.CaptionMedium.Font, 
                FontSize = l_tokens_0.FontSize.FontSize_300
            }, 
            LayoutOrder = 2
        })
    });
    if v21.disableOptionSelection then
        return v28;
    else
        return v4.createElement(l_View_0, {
            tag = "auto-xy"
        }, {
            TriggerButton = v28, 
            Popover = v4.createElement(l_Popover_0.Root, {
                isOpen = v21.isOpen
            }, {
                Anchor = v4.createElement(l_Popover_0.Anchor, {
                    anchorRef = v21.anchorRef
                }), 
                Content = v4.createElement(l_Popover_0.Content, {
                    align = l_PopoverAlign_0.Start, 
                    side = l_PopoverSide_0.Top, 
                    hasArrow = false, 
                    selection = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then {
                        Selectable = true
                    } else nil, 
                    onPressedOutside = function() --[[ Line: 157 ]] --[[ Name: onPressedOutside ]]
                        -- upvalues: v21 (copy)
                        v21.setIsOpen(false);
                    end
                }, {
                    ContentWrapper = if l_CombinedFFlagShouldUseLegacyGamepadFocus_0 then v4.createElement(v6.Focusable.Frame, {
                        Size = UDim2.new(0, l_tokens_0.Size.Size_2900 * 2, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        SelectionGroup = true, 
                        inputBindings = if v21.isOpen then {
                            Back = v6.Input.onBegin(Enum.KeyCode.ButtonB, v24), 
                            BackKeyboard = v6.Input.onBegin(Enum.KeyCode.Escape, v24)
                        } else nil
                    }, {
                        WearTimeList = v4.createElement(v14, {
                            options = v21.updatedOptions, 
                            selectedIndex = v21.selectedIndex, 
                            onOptionActivated = v21.handleOptionActivated, 
                            firstItemRef = v23
                        })
                    }) else v4.createElement(l_View_0, {
                        Size = UDim2.new(0, l_tokens_0.Size.Size_2900 * 2, 0, 0), 
                        tag = "auto-y", 
                        ref = if l_FFlagAXMigrateWearTimePopoverToFocusNavigation_0 then v25 else nil
                    }, {
                        WearTimeList = v4.createElement(v14, {
                            options = v21.updatedOptions, 
                            selectedIndex = v21.selectedIndex, 
                            onOptionActivated = v21.handleOptionActivated
                        })
                    })
                })
            })
        });
    end;
end;