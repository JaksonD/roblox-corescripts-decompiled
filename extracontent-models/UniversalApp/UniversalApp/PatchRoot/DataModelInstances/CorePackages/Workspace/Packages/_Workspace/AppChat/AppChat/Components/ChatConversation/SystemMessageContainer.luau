local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.SocialCards);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_Parent_0.Cryo);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v8 = require(script.Parent.CardContainer);
local v9 = require(script.Parent.SystemMessage);
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
local v11 = {
    cards = nil, 
    text = "", 
    parentWidth = 0, 
    showDateTime = false, 
    senderTargetId = nil
};
SystemMessageContainer = function(v12) --[[ Line: 43 ]] --[[ Name: SystemMessageContainer ]]
    -- upvalues: v5 (copy), v11 (copy), l_useStyle_0 (copy), v3 (copy), v7 (copy), l_GetFFlagEnableSocialCards_0 (copy), v8 (copy), v9 (copy)
    local v13 = v5.Dictionary.join(v11, v12);
    local v14 = l_useStyle_0();
    local v15, v16 = v3.useState(false);
    local v18 = v3.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v7 (ref), v16 (copy)
        if v7() then
            v16(function(v17) --[[ Line: 50 ]]
                return not v17;
            end);
        end;
    end, {
        v16
    });
    if l_GetFFlagEnableSocialCards_0() and v13.cards then
        return v3.createElement(v8, {
            cards = v13.cards, 
            senderTargetId = v13.senderTargetId, 
            conversationId = v13.conversationId
        });
    else
        return v3.createElement(v7() and "TextButton" or "Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Text = v7() and "" or nil, 
            [v3.Event.Activated] = if v7() then v18 else nil
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            DateTime = v13.showDateTime and v3.createElement(v9, {
                LayoutOrder = 1, 
                Text = v13.sent:GetLongRelativeTime(), 
                maxWidth = 1000
            }), 
            SystemMessage = v3.createElement(v9, {
                LayoutOrder = 2, 
                Text = v13.text, 
                maxWidth = v13.parentWidth * 0.75
            }), 
            Notice = v15 and v3.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                Text = v13.messageId, 
                TextColor3 = v14.Theme.UIDefault.Color, 
                TextTransparency = v14.Theme.UIDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center
            }), 
            debug = v13.debugElement or nil
        });
    end;
end;
return l_memo_0(SystemMessageContainer);