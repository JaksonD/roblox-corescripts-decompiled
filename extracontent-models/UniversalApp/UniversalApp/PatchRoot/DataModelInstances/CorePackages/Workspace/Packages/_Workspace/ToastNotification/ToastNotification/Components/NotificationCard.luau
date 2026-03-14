local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.constants);
local v3 = require(l_Parent_1.dependencies);
local l_context_0 = l_Parent_1.context;
local _ = require(l_Parent_1.type);
local v6 = require(l_Parent_0.NotificationActionsFrame);
local v7 = require(l_Parent_0.NotificationContentFrame);
local v8 = require(l_context_0.useNotificationCardData);
local v9 = require(l_context_0.useNotificationCardState);
local l_UIBlox_0 = v3.UIBlox;
local l_Parent_2 = l_Parent_1.Parent;
local v12 = require(l_Parent_2.React);
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local l_DefaultCardPadding_0 = v2.Padding.DefaultCardPadding;
local l_DefaultContentPadding_0 = v2.DefaultContentPadding;
local l_DefaultCardCornerRadius_0 = v2.DefaultCardCornerRadius;
return function(v18) --[[ Line: 32 ]]
    -- upvalues: v8 (copy), v2 (copy), l_DefaultCardPadding_0 (copy), l_useStyle_0 (copy), v9 (copy), v12 (copy), l_Interactable_0 (copy), l_DefaultCardCornerRadius_0 (copy), l_DefaultContentPadding_0 (copy), v7 (copy), v6 (copy)
    local v19 = v8();
    local l_cardSize_0 = v19.cardSize;
    local v21 = if v19.cardTransparency then v19.cardTransparency else v2.CardTransparency.Default;
    local v22 = if l_cardSize_0 and l_cardSize_0.cardPadding then l_cardSize_0.cardPadding else l_DefaultCardPadding_0;
    local v23 = l_useStyle_0();
    local l_handleActions_0 = v19.handleActions;
    local v25 = v9("textBody");
    local v26 = v25 and v25[1];
    return v12.createElement(l_Interactable_0, {
        AutoButtonColor = false, 
        BackgroundColor3 = v23.Theme.BackgroundUIDefault.Color, 
        BackgroundTransparency = v21, 
        BorderSizePixel = 0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        onStateChanged = function() --[[ Line: 50 ]] --[[ Name: onStateChanged ]]

        end, 
        Size = UDim2.new(1, 0, 0, 0), 
        [v12.Event.Activated] = function() --[[ Line: 52 ]]
            -- upvalues: l_handleActions_0 (copy), v26 (copy)
            if l_handleActions_0 and v26 then
                l_handleActions_0(v26);
            end;
        end
    }, {
        UICorner = v12.createElement("UICorner", {
            CornerRadius = l_DefaultCardCornerRadius_0
        }), 
        UIListLayout = v12.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_DefaultContentPadding_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v12.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v22), 
            PaddingLeft = UDim.new(0, v22), 
            PaddingRight = UDim.new(0, v22), 
            PaddingTop = UDim.new(0, v22)
        }), 
        NotificationContentFrame = v12.createElement(v7, {
            showHoldButton = v18.showHoldButton, 
            shouldAutoFocus = v18.shouldAutoFocus, 
            holdProgress = v18.holdProgress
        }), 
        NotificationActionsFrame = v12.createElement(v6, {
            shouldAutoFocus = v18.shouldAutoFocus
        })
    });
end;