local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_FFlagAvatarSwitcherUiFixes_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes;
return function(v5) --[[ Line: 20 ]] --[[ Name: MessageCard ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy), l_FFlagAvatarSwitcherUiFixes_0 (copy)
    local l_Size_800_0 = l_useTokens_0().Size.Size_800;
    return v1.createElement(v2.View, {
        tag = "col gap-medium stroke-default bg-shift-100 radius-medium padding-large", 
        Size = v5.Size, 
        AutomaticSize = v5.AutomaticSize
    }, {
        Header = v1.createElement(v2.View, {
            tag = "size-full-0 auto-y row align-y-center gap-small"
        }, {
            Image = v1.createElement(v2.Image, {
                tag = v5.icon == "Info" and "" or "content-system-warning", 
                Image = v5.icon == "Info" and "icons/actions/info" or "icons/status/alert", 
                Size = UDim2.fromOffset(l_Size_800_0, l_Size_800_0), 
                LayoutOrder = 1
            }), 
            HeaderText = v1.createElement(v2.Text, {
                tag = "auto-y text-align-x-left anchor-center-right text-title-medium text-wrap grow", 
                Text = v5.headerText, 
                LayoutOrder = 2
            }), 
            CloseButton = v5.onClose and v1.createElement(v2.Image, {
                tag = "size-600 radius-small", 
                Image = "icons/navigation/close", 
                onActivated = v5.onClose, 
                LayoutOrder = 3
            })
        }), 
        ContentText = (not l_FFlagAvatarSwitcherUiFixes_0 or v5.contentText) and v1.createElement(v2.Text, {
            tag = " size-full-0 auto-y text-align-x-left text-body-medium text-wrap", 
            Text = v5.contentText
        })
    });
end;