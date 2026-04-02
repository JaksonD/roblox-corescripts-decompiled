local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v2.IconButton;
local l_IconName_0 = v2.Enums.IconName;
local l_IconSize_0 = v2.Enums.IconSize;
local l_Popover_0 = v2.Popover;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
local l_PopoverSide_0 = v2.Enums.PopoverSide;
local l_Radius_0 = v2.Enums.Radius;
local l_Text_0 = v2.Text;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v13) --[[ Line: 26 ]] --[[ Name: PlusMoreMenuTooltip ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_Popover_0 (copy), l_PopoverSide_0 (copy), l_PopoverAlign_0 (copy), l_Radius_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy)
    local v14 = l_useTokens_0();
    if not v13.isOpen or not v13.text or v13.text == "" then
        return nil;
    else
        local v15 = if v13.title and v13.title ~= "" then v13.title else nil;
        local l_isOpen_0 = v13.isOpen;
        return v1.createElement(l_Popover_0.Root, {
            isOpen = l_isOpen_0
        }, {
            Anchor = v1.createElement(l_Popover_0.Anchor, {
                anchorRef = v13.anchorRef
            }), 
            Content = v1.createElement(l_Popover_0.Content, {
                side = {
                    position = l_PopoverSide_0.Top, 
                    offset = v14.Padding.Medium
                }, 
                align = l_PopoverAlign_0.End, 
                hasArrow = true, 
                radius = l_Radius_0.Medium, 
                onPressedOutside = v13.onPressedOutside
            }, {
                Layout = if v15 ~= nil and v15 ~= "" then v1.createElement(l_View_0, {
                    tag = "col gap-xxsmall padding-x-small padding-y-small auto-xy"
                }, {
                    Header = v1.createElement(l_View_0, {
                        tag = "row align-y-center flex-between size-full-0 auto-y"
                    }, {
                        Title = v1.createElement(l_Text_0, {
                            Text = v15, 
                            tag = "auto-xy text-title-small content-emphasis"
                        }), 
                        CloseButton = v1.createElement(l_IconButton_0, {
                            icon = l_IconName_0.X, 
                            size = l_IconSize_0.XSmall, 
                            onActivated = v13.onClose
                        })
                    }), 
                    Body = v1.createElement(l_Text_0, {
                        Text = v13.text, 
                        tag = "auto-xy text-body-small content-default"
                    })
                }) else v1.createElement(l_View_0, {
                    tag = "row align-y-center flex-between gap-x-small padding-x-small padding-y-small auto-xy"
                }, {
                    TooltipText = v1.createElement(l_Text_0, {
                        Text = v13.text, 
                        tag = "auto-xy text-body-small content-default"
                    }), 
                    CloseButton = v1.createElement(l_IconButton_0, {
                        icon = l_IconName_0.X, 
                        size = l_IconSize_0.XSmall, 
                        onActivated = v13.onClose
                    })
                })
            })
        });
    end;
end;