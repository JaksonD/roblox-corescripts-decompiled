local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
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
return function(v11) --[[ Line: 18 ]] --[[ Name: WearTimeSelectedOptionInListView ]]
    -- upvalues: v2 (copy), l_View_0 (copy), l_Text_0 (copy), v1 (copy), l_Enums_0 (copy), l_Popover_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy), v9 (copy)
    local l_tokens_0 = v11.tokens;
    local v13 = v2.createElement("TextButton", {
        Text = "", 
        Size = UDim2.fromScale(0, 0), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        BorderSizePixel = 0, 
        Transparency = v11.tokens.Color.Shift.Shift_100.Transparency, 
        BackgroundColor3 = v11.tokens.Color.Shift.Shift_100.Color3, 
        ref = v11.anchorRef, 
        [v2.Event.Activated] = function() --[[ Line: 31 ]]
            -- upvalues: v11 (copy)
            v11.setIsOpen(not v11.isOpen);
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
                Text = v11.listLabelText, 
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
        TriggerButton = v13, 
        Popover = v2.createElement(l_Popover_0.Root, {
            isOpen = v11.isOpen
        }, {
            Anchor = v2.createElement(l_Popover_0.Anchor, {
                anchorRef = v11.anchorRef
            }), 
            Content = v2.createElement(l_Popover_0.Content, {
                align = l_PopoverAlign_0.Start, 
                side = l_PopoverSide_0.Bottom, 
                hasArrow = false, 
                onPressedOutside = function() --[[ Line: 86 ]] --[[ Name: onPressedOutside ]]
                    -- upvalues: v11 (copy)
                    v11.setIsOpen(false);
                end
            }, {
                ContentWrapper = v2.createElement(l_View_0, {
                    Size = UDim2.new(0, l_tokens_0.Size.Size_2900 * 2, 0, 0), 
                    tag = "auto-y"
                }, {
                    WearTimeList = v2.createElement(v9, {
                        options = v11.updatedOptions, 
                        selectedIndex = v11.selectedIndex, 
                        onOptionActivated = v11.handleOptionActivated
                    })
                })
            })
        })
    });
end;