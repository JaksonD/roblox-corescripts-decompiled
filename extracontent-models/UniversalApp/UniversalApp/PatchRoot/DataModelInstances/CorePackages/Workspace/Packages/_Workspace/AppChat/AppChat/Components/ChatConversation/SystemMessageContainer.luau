local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.SocialCards);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_Parent_0.Cryo);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugAppChat);
local v9 = require(script.Parent.CardContainer);
local v10 = require(script.Parent.SystemMessage);
local l_GetFFlagEnableSocialCards_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSocialCards;
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatDomLocatorFoundationMigration);
local v14 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v15 = {
    cards = nil, 
    text = "", 
    parentWidth = 0, 
    showDateTime = false, 
    senderTargetId = nil
};
local function v23(v16) --[[ Line: 47 ]] --[[ Name: getCardComponentTypes ]]
    local v17 = {};
    if not v16 then
        return v17;
    else
        for _, v19 in v16 do
            local l_components_0 = v19.components;
            if l_components_0 then
                for _, v22 in l_components_0 do
                    if v22.type then
                        table.insert(v17, v22.type);
                    end;
                end;
            end;
        end;
        return v17;
    end;
end;
SystemMessageContainer = function(v24) --[[ Line: 67 ]] --[[ Name: SystemMessageContainer ]]
    -- upvalues: v6 (copy), v15 (copy), l_useStyle_0 (copy), v4 (copy), v8 (copy), l_GetFFlagEnableSocialCards_0 (copy), v12 (copy), v23 (copy), v14 (copy), v9 (copy), v13 (copy), v3 (copy), v10 (copy)
    local v25 = v6.Dictionary.join(v15, v24);
    local v26 = l_useStyle_0();
    local v27, v28 = v4.useState(false);
    local v30 = v4.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: v8 (ref), v28 (copy)
        if v8() then
            v28(function(v29) --[[ Line: 74 ]]
                return not v29;
            end);
        end;
    end, {
        v28
    });
    if l_GetFFlagEnableSocialCards_0() and v25.cards then
        local v31 = nil;
        if v12 then
            local v32 = v23(v25.cards);
            if #v32 > 0 then
                v31 = v14.chatConversationSystemMessageCard(v32);
            end;
        end;
        return v4.createElement(v9, {
            cards = v25.cards, 
            senderTargetId = v25.senderTargetId, 
            conversationId = v25.conversationId, 
            testId = v31
        });
    elseif v13 then
        return v4.createElement(v3.View, {
            tag = "col size-full-0 auto-y align-x-center", 
            onActivated = if v8() then v30 else nil, 
            testId = if v12 then v14.chatConversationSystemMessage(v25.text) else nil
        }, {
            DateTime = v25.showDateTime and v4.createElement(v10, {
                LayoutOrder = 1, 
                Text = v25.sent:GetLongRelativeTime(), 
                maxWidth = 1000
            }), 
            SystemMessage = v4.createElement(v10, {
                LayoutOrder = 2, 
                Text = v25.text, 
                maxWidth = v25.parentWidth * 0.75
            }), 
            Notice = v27 and v4.createElement(v3.Text, {
                tag = "auto-xy text-body-small", 
                LayoutOrder = 3, 
                Text = v25.messageId
            }), 
            debug = v25.debugElement or nil
        });
    else
        return v4.createElement(v8() and "TextButton" or "Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0), 
            Text = v8() and "" or nil, 
            [v4.Event.Activated] = if v8() then v30 else nil
        }, {
            Layout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            DateTime = v25.showDateTime and v4.createElement(v10, {
                LayoutOrder = 1, 
                Text = v25.sent:GetLongRelativeTime(), 
                maxWidth = 1000
            }), 
            SystemMessage = v4.createElement(v10, {
                LayoutOrder = 2, 
                Text = v25.text, 
                maxWidth = v25.parentWidth * 0.75
            }), 
            Notice = v27 and v4.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 3, 
                Text = v25.messageId, 
                TextColor3 = v26.Theme.UIDefault.Color, 
                TextTransparency = v26.Theme.UIDefault.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Center
            }), 
            debug = v25.debugElement or nil
        });
    end;
end;
return l_memo_0(SystemMessageContainer);