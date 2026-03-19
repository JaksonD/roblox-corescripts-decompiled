local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local v2 = require(l_Parent_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v6 = require(l_Parent_0.type);
local l_ButtonStack_0 = l_UIBlox_0.App.Button.ButtonStack;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v9 = require(l_Parent_0.constants);
local l_DefaultContentPadding_0 = v9.DefaultContentPadding;
local l_DefaultButtonHeight_0 = v9.DefaultButtonHeight;
local v12 = require(l_context_0.useNotificationCardState);
local v13 = require(l_context_0.useNotificationCardData);
local function _(v14) --[[ Line: 17 ]]
    -- upvalues: v6 (copy), l_ButtonType_0 (copy)
    if v14 == v6.SENDERButtonStyleEnum.Growth then
        return l_ButtonType_0.PrimaryContextual;
    elseif v14 == v6.SENDERButtonStyleEnum.Primary then
        return l_ButtonType_0.PrimarySystem;
    elseif v14 == v6.SENDERButtonStyleEnum.Secondary then
        return l_ButtonType_0.Secondary;
    elseif v14 == v6.SENDERButtonStyleEnum.Alert then
        return l_ButtonType_0.Alert;
    else
        return l_ButtonType_0.Secondary;
    end;
end;
local function v25(v16, v17, v18) --[[ Line: 31 ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), l_ButtonType_0 (copy)
    local l_CaptionHeader_0 = l_useStyle_0().Font.CaptionHeader;
    local v20 = {};
    if v16 then
        for _, v22 in ipairs(v16) do
            local v23 = {};
            local l_buttonStyle_0 = v22.buttonStyle;
            v23.buttonType = if l_buttonStyle_0 == v6.SENDERButtonStyleEnum.Growth then l_ButtonType_0.PrimaryContextual else if l_buttonStyle_0 == v6.SENDERButtonStyleEnum.Primary then l_ButtonType_0.PrimarySystem else if l_buttonStyle_0 == v6.SENDERButtonStyleEnum.Secondary then l_ButtonType_0.Secondary else if l_buttonStyle_0 == v6.SENDERButtonStyleEnum.Alert then l_ButtonType_0.Alert else l_ButtonType_0.Secondary;
            v23.props = {
                text = v22.label.text, 
                fontStyle = l_CaptionHeader_0, 
                onActivated = function() --[[ Line: 47 ]] --[[ Name: onActivated ]]
                    -- upvalues: v17 (copy), v18 (copy), v22 (copy)
                    if v17 and v18 then
                        v17(v22, v18);
                    end;
                end
            };
            table.insert(v20, v23);
        end;
    end;
    return v20;
end;
return function() --[[ Line: 60 ]]
    -- upvalues: v12 (copy), v13 (copy), v25 (copy), l_React_0 (copy), l_DefaultContentPadding_0 (copy), l_ButtonStack_0 (copy), l_DefaultButtonHeight_0 (copy)
    local v26 = v12("button");
    local v27 = v13();
    local l_handleActions_0 = v27.handleActions;
    local v29 = v25(v26, l_handleActions_0, v27.notificationPayload);
    if #v29 > 0 then
        return (l_React_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 3
        }, {
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_DefaultContentPadding_0)
            }), 
            ActionButtons = v29 and l_React_0.createElement(l_ButtonStack_0, {
                buttonHeight = l_DefaultButtonHeight_0, 
                buttons = v29, 
                marginBetween = l_DefaultContentPadding_0
            })
        }));
    else
        return nil;
    end;
end;