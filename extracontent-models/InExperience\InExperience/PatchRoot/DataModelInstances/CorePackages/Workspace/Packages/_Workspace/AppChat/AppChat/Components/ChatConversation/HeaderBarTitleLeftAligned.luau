local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_script_FirstAncestor_0.Components.ChatConversation.ConversationTitleWithFacePile);
local l_useTokens_0 = v2.Hooks.useTokens;
local v5 = require(l_Parent_0.React);
return function(v6) --[[ Line: 19 ]] --[[ Name: HeaderBarTitleLeftAligned ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), v2 (copy), v3 (copy)
    local v7 = l_useTokens_0();
    return v5.createElement(v2.View, {
        Size = UDim2.new(1, 0, 1, 0), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v7.Gap.Medium), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }
    }, {
        LeftFrame = if v6.renderLeft then v5.createElement(v2.View, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            ItemLineAlignment = Enum.ItemLineAlignment.Center
        }, v5.createElement(v6.renderLeft)) else nil, 
        CenterFrame = v5.createElement(v2.View, {
            flexItem = {
                FlexMode = Enum.UIFlexMode.Fill
            }, 
            Size = UDim2.new(1, 0, 1, 0), 
            LayoutOrder = 2
        }, {
            ConversationTitle = v5.createElement(v3, {
                titleText = v6.titleText, 
                conversationId = v6.conversationId, 
                navigateToChatDetails = v6.navigateToChatDetails
            })
        }), 
        RightFrame = if v6.renderRight then v5.createElement(v2.View, {
            tag = if v6.ignoreRightMargin then nil else "padding-right-small", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ItemLineAlignment = Enum.ItemLineAlignment.Center, 
            LayoutOrder = 3
        }, v5.createElement(v6.renderRight)) else nil
    });
end;