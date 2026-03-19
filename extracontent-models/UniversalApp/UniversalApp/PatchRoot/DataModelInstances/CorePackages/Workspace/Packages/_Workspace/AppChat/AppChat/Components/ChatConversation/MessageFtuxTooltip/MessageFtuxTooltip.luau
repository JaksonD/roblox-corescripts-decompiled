local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local l_Enums_0 = v4.Enums;
local v6 = require(script.Parent.useMessageFtuxTooltip);
local v7 = {
    variant = require(script.Parent.MessageFtuxTooltipVariant).None, 
    isReversed = false
};
return v2.memo(function(v8) --[[ Line: 25 ]]
    -- upvalues: v3 (copy), v7 (copy), v4 (copy), v6 (copy), v2 (copy), l_Text_0 (copy), l_Enums_0 (copy)
    local v9 = v3.Dictionary.union(v7, v8);
    local v10 = v4.Hooks.useTokens();
    local v11 = v6(v9.variant);
    local v12, v13 = v2.useState(false);
    local v14, v15 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v10 (copy), l_Text_0 (ref), v11 (copy), v13 (copy), v9 (copy), v15 (copy)
        local l_TitleSmall_0 = v10.Typography.TitleSmall;
        local v17 = l_Text_0.GetTextWidth(v11.text, l_TitleSmall_0.Font, l_TitleSmall_0.FontSize) + v10.Padding.Small * 2;
        v13(if v9.messageRef.current then v17 > v9.messageRef.current.AbsoluteSize.X else false);
        v15(true);
    end, {
        v11.text, 
        v10
    });
    local v19, v20 = v2.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v12 (copy), v9 (copy), l_Enums_0 (ref), v10 (copy)
        local v18 = if v12 then if v9.isReversed then l_Enums_0.PopoverAlign.Start else l_Enums_0.PopoverAlign.End else if v9.isReversed then l_Enums_0.PopoverAlign.End else l_Enums_0.PopoverAlign.Start;
        if v12 then
            return v18, 0;
        elseif v9.isReversed then
            return v18, v10.Padding.Medium;
        else
            return v18, -v10.Padding.Medium;
        end;
    end, {
        v12, 
        v9.isReversed, 
        v10
    });
    if not v11.isDismissed then
        return (v2.createElement(v4.Popover.Root, {
            isOpen = v14
        }, {
            Anchor = v2.createElement(v4.Popover.Anchor, {
                anchorRef = v9.messageRef
            }), 
            Content = v2.createElement(v4.Popover.Content, {
                side = {
                    position = v4.Enums.PopoverSide.Bottom, 
                    offset = -v10.Padding.Small
                }, 
                align = {
                    position = v19, 
                    offset = v20
                }, 
                hasArrow = true, 
                radius = v4.Enums.Radius.Small, 
                backgroundStyle = v10.Color.Content.Emphasis, 
                onPressedOutside = v11.handleDismiss
            }, {
                TooltipText = v2.createElement(v4.Text, {
                    tag = "auto-xy text-title-small padding-x-small padding-y-xsmall content-inverse-emphasis", 
                    Text = v11.text
                })
            })
        }));
    else
        return nil;
    end;
end);