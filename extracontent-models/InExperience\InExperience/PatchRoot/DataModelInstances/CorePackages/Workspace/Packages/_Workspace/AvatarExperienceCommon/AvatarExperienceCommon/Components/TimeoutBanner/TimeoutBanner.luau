local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(script.Parent.useTimeoutBannerProps);
return function(v4) --[[ Line: 17 ]] --[[ Name: TimeoutBanner ]]
    -- upvalues: v1 (copy), v2 (copy)
    if not v4.shouldShow then
        return nil;
    else
        local l_onBannerActivated_0 = v4.onBannerActivated;
        local l_messageText_0 = v4.messageText;
        return v1.createElement(v2.View, {
            tag = "auto-y size-full-0 padding-x-medium padding-y-small row align-x-center align-y-center gap-small", 
            onActivated = l_onBannerActivated_0 or nil
        }, {
            WarningIcon = v1.createElement(v2.Image, {
                tag = "content-system-warning size-600", 
                Image = "icons/status/alert", 
                LayoutOrder = 1
            }), 
            Text = v1.createElement(v2.Text, {
                tag = "auto-xy text-title-large text-wrap content-emphasis", 
                Text = l_messageText_0, 
                LayoutOrder = 2
            })
        });
    end;
end;