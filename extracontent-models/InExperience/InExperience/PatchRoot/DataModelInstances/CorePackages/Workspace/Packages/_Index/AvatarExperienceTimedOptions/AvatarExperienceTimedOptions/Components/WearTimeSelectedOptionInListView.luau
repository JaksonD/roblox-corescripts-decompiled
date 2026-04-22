local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local l_Popover_0 = v1.Popover;
local l_View_0 = v1.View;
local l_Text_0 = v1.Text;
local l_Enums_0 = v1.Enums;
local l_PopoverSide_0 = v1.Enums.PopoverSide;
local l_PopoverAlign_0 = v1.Enums.PopoverAlign;
local v9 = require(script.Parent.WearTimeList);
local _ = require(script.Parent.useWearTimeSelectedOptionViewModel);
local v11 = require(script.Parent.useWearTimePopoverFocusNavigationBindings);
return function(v12) --[[ Line: 19 ]] --[[ Name: WearTimeSelectedOptionInListView ]]
    -- upvalues: v2 (copy), v11 (copy), l_View_0 (copy), l_Text_0 (copy), v1 (copy), l_Enums_0 (copy), l_Popover_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), v9 (copy)
    local l_tokens_0 = v12.tokens;
    local v14 = v2.useCallback(function() --[[ Line: 22 ]]
        -- upvalues: v12 (copy)
        v12.setIsOpen(false);
    end, {
        v12.setIsOpen
    });
    local v15 = v11(v14, v12.isOpen);
    local v16 = v2.createElement("TextButton", {
        Text = "", 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BorderSizePixel = 0, 
        Transparency = v12.tokens.Color.Shift.Shift_200.Transparency, 
        BackgroundColor3 = v12.tokens.Color.Shift.Shift_200.Color3, 
        ref = v12.anchorRef, 
        [v2.Event.Activated] = function() --[[ Line: 38 ]]
            -- upvalues: v12 (copy)
            v12.setIsOpen(not v12.isOpen);
        end
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, l_tokens_0.Radius.Circle)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_tokens_0.Padding.XXSmall)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_tokens_0.Padding.Medium), 
            PaddingRight = UDim.new(0, l_tokens_0.Padding.Medium), 
            PaddingTop = UDim.new(0, l_tokens_0.Padding.Small), 
            PaddingBottom = UDim.new(0, l_tokens_0.Padding.Small)
        }), 
        TopRow = v2.createElement(l_View_0, {
            tag = "row align-y-center gap-small auto-xy", 
            LayoutOrder = 1
        }, {
            Duration = v2.createElement(l_Text_0, {
                tag = "auto-xy", 
                Text = v12.listLabelText, 
                textStyle = l_tokens_0.Color.Content.Emphasis, 
                fontStyle = {
                    Font = l_tokens_0.Typography.TitleSmall.Font, 
                    FontSize = l_tokens_0.FontSize.FontSize_300
                }, 
                LayoutOrder = 2
            }), 
            ChevronIcon = v2.createElement(v1.Icon, {
                name = l_Enums_0.IconName.ChevronLargeDown, 
                variant = l_Enums_0.IconVariant.Regular, 
                size = l_Enums_0.IconSize.Small, 
                LayoutOrder = 3
            })
        })
    });
    return v2.createElement(l_View_0, {
        tag = "auto-xy"
    }, {
        TriggerButton = v16, 
        Popover = v2.createElement(l_Popover_0.Root, {
            isOpen = v12.isOpen
        }, {
            Anchor = v2.createElement(l_Popover_0.Anchor, {
                anchorRef = v12.anchorRef
            }), 
            Content = v2.createElement(l_Popover_0.Content, {
                align = l_PopoverAlign_0.Start, 
                side = l_PopoverSide_0.Bottom, 
                hasArrow = false, 
                onPressedOutside = function() --[[ Line: 93 ]] --[[ Name: onPressedOutside ]]
                    -- upvalues: v12 (copy)
                    v12.setIsOpen(false);
                end
            }, {
                ContentWrapper = v2.createElement(l_View_0, {
                    Size = UDim2.new(0, l_tokens_0.Size.Size_2900 * 2, 0, 0), 
                    tag = "auto-y", 
                    ref = v15
                }, {
                    WearTimeList = v2.createElement(v9, {
                        options = v12.updatedOptions, 
                        selectedIndex = v12.selectedIndex, 
                        onOptionActivated = v12.handleOptionActivated
                    })
                })
            })
        })
    });
end;