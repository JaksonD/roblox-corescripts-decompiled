local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_Text_0 = v3.Text;
local l_UIBlox_0 = v3.UIBlox;
local l_ConversationCell_0 = v1.Components.Cells.ConversationCell;
local v8 = require(script.Parent.SendButton);
return function(v9) --[[ Line: 19 ]]
    -- upvalues: l_UIBlox_0 (copy), l_Text_0 (copy), l_Roact_0 (copy), l_ConversationCell_0 (copy), v8 (copy)
    local v10 = v9.failedText or "";
    local v11 = v9.sendingText or "";
    local v12 = v9.sendText or "";
    local v13 = v9.sentText or "";
    local v14 = v9.isLoading or false;
    local l_conversation_0 = v9.conversation;
    local l_onSendButtonActivated_0 = v9.onSendButtonActivated;
    return l_UIBlox_0.Style.withStyle(function(v17) --[[ Line: 29 ]]
        -- upvalues: l_Text_0 (ref), v12 (copy), l_Roact_0 (ref), v9 (copy), l_ConversationCell_0 (ref), l_conversation_0 (copy), v14 (copy), v8 (ref), v13 (copy), v11 (copy), v10 (copy), l_onSendButtonActivated_0 (copy)
        local l_Font_0 = v17.Font;
        local v19 = l_Font_0.CaptionBody.RelativeSize * l_Font_0.BaseSize;
        local v20 = l_Text_0.GetTextWidth(v12, l_Font_0.CaptionBody.Font, v19) + 14;
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = v17.Theme.BackgroundUIDefault.Transparency, 
            BackgroundColor3 = v17.Theme.BackgroundUIDefault.Color, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            Visible = v9.Visible, 
            LayoutOrder = v9.LayoutOrder
        }, {
            content = l_Roact_0.createElement(l_ConversationCell_0, {
                style = v17, 
                conversation = l_conversation_0, 
                subTitleText = v9.subTitleText, 
                secondaryTitleText = v9.secondaryTitleText, 
                childWidth = v20 + 24 + 12, 
                Size = UDim2.new(1, 0, 1, 0), 
                isLoading = v14
            }, {
                rightAlignedComponent = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    padding = l_Roact_0.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, 12)
                    }), 
                    layout = l_Roact_0.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    sendButton = l_Roact_0.createElement(v8, {
                        sendText = v12, 
                        sentText = v13, 
                        sendingText = v11, 
                        sentStatus = v9.sentStatus, 
                        failedText = v10, 
                        isLoading = v14, 
                        conversation = l_conversation_0, 
                        onActivated = function() --[[ Line: 74 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_onSendButtonActivated_0 (ref), l_conversation_0 (ref)
                            return l_onSendButtonActivated_0(l_conversation_0);
                        end
                    })
                })
            })
        });
    end);
end;