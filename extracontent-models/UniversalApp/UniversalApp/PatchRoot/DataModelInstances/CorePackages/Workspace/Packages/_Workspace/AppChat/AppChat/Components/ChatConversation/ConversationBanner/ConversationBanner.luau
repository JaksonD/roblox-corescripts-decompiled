local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local l_useTokens_0 = v3.Hooks.useTokens;
local v7 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v8 = {
    actionText = "PLACEHOLDER Action", 
    bodyText = "PLACEHOLDER Body", 
    onActivated = function() --[[ Line: 24 ]] --[[ Name: onActivated ]]

    end, 
    onDismissed = function() --[[ Line: 25 ]] --[[ Name: onDismissed ]]

    end
};
return v4.memo(function(v9) --[[ Line: 28 ]] --[[ Name: ConversationBanner ]]
    -- upvalues: v2 (copy), v8 (copy), l_useTokens_0 (copy), v7 (copy), v4 (copy), v3 (copy)
    local v10 = v2.Dictionary.union(v8, v9);
    local l_Medium_0 = l_useTokens_0().Padding.Medium;
    local v12 = v7();
    return v4.createElement(v3.View, {
        padding = {
            left = UDim.new(0, v12.left), 
            right = UDim.new(0, v12.right), 
            top = UDim.new(0, l_Medium_0), 
            bottom = UDim.new(0, l_Medium_0)
        }, 
        tag = "row gap-medium align-y-center size-full-0 auto-y bg-shift-200", 
        LayoutOrder = v10.layoutOrder
    }, {
        BodyText = v4.createElement(v3.Text, {
            tag = "text-title-medium text-align-x-left text-truncate-end content-emphasis auto-y fill", 
            LayoutOrder = 1, 
            Text = v10.bodyText
        }), 
        ActionContainer = v4.createElement(v3.View, {
            LayoutOrder = 2, 
            tag = "row gap-small align-y-center auto-xy"
        }, {
            ActionButton = v4.createElement(v3.Button, {
                text = v10.actionText, 
                onActivated = v10.onActivated, 
                size = v3.Enums.InputSize.Small, 
                LayoutOrder = 1
            }), 
            CloseButton = v4.createElement(v3.View, {
                onActivated = v10.onDismissed, 
                LayoutOrder = 2, 
                tag = "auto-xy x-default-transparent radius-small padding-xsmall"
            }, {
                Icon = v4.createElement(v3.Icon, {
                    size = v3.Enums.IconSize.Large, 
                    name = v3.Enums.IconName.X
                })
            })
        })
    });
end);