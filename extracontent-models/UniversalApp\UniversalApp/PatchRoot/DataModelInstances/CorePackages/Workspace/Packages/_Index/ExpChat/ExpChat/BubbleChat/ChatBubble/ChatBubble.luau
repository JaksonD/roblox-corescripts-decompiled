local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v3 = require(l_Flags_0.getEnablePerBubbleCustomization);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.Otter);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.memoize);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v11 = require(l_Helpers_0.getSpringFromSettings);
local v12 = require(l_Helpers_0.getTextBounds);
local v13 = require(l_Helpers_0.getDictFromBubbleChatMessageProperties);
local v14 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v15 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatUseUpdatedMessageRendered);
local v17 = require(l_script_FirstAncestor_0.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatExcludeFOMORenders);
local v19 = v5.Component:extend("ChatBubble");
v19.defaultProps = {
    isMostRecent = true, 
    text = "", 
    timestamp = 0
};
local v22 = v9(function(v20, v21) --[[ Line: 35 ]]
    -- upvalues: l_Dictionary_0 (copy), v13 (copy)
    if v21 then
        return l_Dictionary_0.join(v20, v13(v21));
    else
        return v20;
    end;
end);
v19.init = function(v23) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v24, v25 = v5.createBinding(0);
    v23.width = v24;
    v23.updateWidth = v25;
    v23.widthMotor = v6.createSingleMotor(0);
    v23.widthMotor:onStep(function(v26) --[[ Line: 49 ]]
        -- upvalues: v23 (copy)
        v23.updateWidth((math.round(v26)));
    end);
    v24, v25 = v5.createBinding(0);
    v23.height = v24;
    v23.updateHeight = v25;
    v23.heightMotor = v6.createSingleMotor(0);
    v23.heightMotor:onStep(function(v27) --[[ Line: 55 ]]
        -- upvalues: v23 (copy)
        v23.updateHeight((math.round(v27)));
    end);
    v24, v25 = v5.createBinding(1);
    v23.transparency = v24;
    v23.updateTransparency = v25;
    v23.transparencyMotor = v6.createSingleMotor(1);
    v23.transparencyMotor:onStep(v23.updateTransparency);
    v24, v25 = v5.createBinding(1);
    v23.backgroundTransparency = v24;
    v23.updateBackgroundTransparency = v25;
    v23.backgroundTransparencyMotor = v6.createSingleMotor(1);
    v23.backgroundTransparencyMotor:onStep(v23.updateBackgroundTransparency);
    v23.size = v5.joinBindings({
        v23.width, 
        v23.height
    }):map(function(v28) --[[ Line: 67 ]]
        return UDim2.fromOffset(v28[1], v28[2]);
    end);
end;
v19.render = function(v29) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v22 (copy), v8 (copy), v16 (copy), v14 (copy), v17 (copy), v18 (copy), l_TextChatService_0 (copy), v5 (copy), l_Dictionary_0 (copy)
    local l_chatSettings_0 = v29.props.chatSettings;
    if v3() then
        l_chatSettings_0 = v22(v29.props.chatSettings, v29.props.bubbleChatMessageProperties);
    end;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    if v29.props.isTextChatServiceOn then
        v31 = l_chatSettings_0.ImageLabel;
        v32 = l_chatSettings_0.UIGradient;
        v33 = l_chatSettings_0.UICorner;
        v34 = l_chatSettings_0.UIPadding;
        v35 = l_chatSettings_0.FontFace;
    else
        v31 = l_chatSettings_0.BackgroundImage;
        v32 = l_chatSettings_0.BackgroundGradient;
        if l_chatSettings_0.CornerEnabled then
            v33 = {
                CornerRadius = l_chatSettings_0.CornerRadius
            };
        elseif l_chatSettings_0.CornerEnabled == false then
            v33 = {
                CornerRadius = UDim.new(0, 0)
            };
        end;
        v34 = l_chatSettings_0.Padding and {
            PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
            PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
        } or nil;
    end;
    local l_CornerRadius_0 = v8.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local l_UIPadding_0 = v8.DefaultBubbleChatChildrenCustomizationProperties.UIPadding;
    local v38 = v29.props.renderInsert and v29.props.insertSize.X + l_chatSettings_0.Padding or 0;
    local v39 = v29.props.isMostRecent and l_chatSettings_0.TailVisible and v29.props.showCaret;
    if v16() and v29.props.textChatMessageInstance and v14(v17) and (not v18() or not v29.props.isHiddenMessage) then
        l_TextChatService_0:SendExpChatMessageClientRendered(v29.props.textChatMessageInstance, "bubble_chat");
    end;
    local l_createElement_0 = v5.createElement;
    local v41 = "Frame";
    local v42 = {
        LayoutOrder = v29.props.timestamp, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v29.size, 
        Position = UDim2.fromScale(1, 0.5), 
        Transparency = 1
    };
    local v43 = {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, -1)
        })
    };
    local l_createElement_1 = v5.createElement;
    local v45 = "ImageLabel";
    local v46 = l_Dictionary_0.join(v31, {
        LayoutOrder = 1, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundTransparency = v31 and v31.Image ~= "" and 1 or v29.backgroundTransparency or v29.transparency, 
        ClipsDescendants = true, 
        ImageTransparency = v29.backgroundTransparency or v29.transparency
    });
    local v47 = {
        UICorner = v33 and v5.createElement("UICorner", {
            CornerRadius = v33.CornerRadius
        }) or v5.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, l_chatSettings_0.Padding)
        }), 
        Padding = v34 and v5.createElement("UIPadding", v34) or v5.createElement("UIPadding", l_UIPadding_0), 
        Insert = v29.props.renderInsert and v29.props.renderInsert(), 
        Text = v5.createElement("TextLabel", {
            Text = if v29.props.useTranslation and v29.props.translation and v29.props.translation ~= "" then v29.props.translation else v29.props.text, 
            Size = UDim2.new(1, -v38, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            FontFace = v35 or nil, 
            Font = if not v35 then l_chatSettings_0.Font else nil, 
            TextColor3 = l_chatSettings_0.TextColor3, 
            TextSize = l_chatSettings_0.TextSize, 
            TextTransparency = v29.transparency, 
            TextWrapped = true, 
            AutoLocalize = false, 
            LayoutOrder = 2, 
            RichText = v29.props.isTextChatServiceOn
        })
    };
    local v48 = false;
    if v32 ~= nil then
        v48 = v5.createElement("UIGradient", v32);
    end;
    v47.Gradient = v48;
    v43.ChatBubbleFrame = l_createElement_1(v45, v46, v47);
    if v39 then
        l_createElement_1 = v5.createElement;
        v45 = "ImageLabel";
        v46 = {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(9, 6), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = v29.backgroundTransparency
        };
        v47 = {};
        v48 = false;
        if v32 ~= nil then
            v48 = v5.createElement("UIGradient", v32);
        end;
        v47.Gradient = v48;
        l_createElement_1 = l_createElement_1(v45, v46, v47);
    else
        l_createElement_1 = nil;
    end;
    v43.Caret = l_createElement_1;
    return l_createElement_0(v41, v42, v43);
end;
v19.fadeOut = function(v49) --[[ Line: 216 ]] --[[ Name: fadeOut ]]
    -- upvalues: v3 (copy), v22 (copy), v11 (copy)
    local l_chatSettings_1 = v49.props.chatSettings;
    if v3() then
        l_chatSettings_1 = v22(v49.props.chatSettings, v49.props.bubbleChatMessageProperties);
    end;
    if not v49.isFadingOut then
        v49.isFadingOut = true;
        v49.transparencyMotor:onComplete(function() --[[ Line: 224 ]]
            -- upvalues: v49 (copy)
            if v49.props.onFadeOut then
                v49.props.onFadeOut(v49.props.messageId);
            end;
        end);
        local v51 = v11(l_chatSettings_1, "transparency");
        v49.transparencyMotor:setGoal(v51(1));
        v49.backgroundTransparencyMotor:setGoal(v51(1));
    end;
end;
v19.didUpdate = function(v52, v53) --[[ Line: 236 ]] --[[ Name: didUpdate ]]
    -- upvalues: v3 (copy), v22 (copy), v12 (copy), v11 (copy)
    if v52.props.fadingOut then
        v52:fadeOut();
    end;
    local l_chatSettings_2 = v52.props.chatSettings;
    if v3() then
        l_chatSettings_2 = v22(v52.props.chatSettings, v52.props.bubbleChatMessageProperties);
    end;
    if v53.text ~= v52.props.text or v53.useTranslation ~= v52.props.useTranslation or v53.translation ~= v52.props.translation or v53.chatSettings ~= v52.props.chatSettings or v53.renderInsert ~= v52.props.renderInsert or v53.insertSize ~= v52.props.insertSize then
        local v55 = if v52.props.useTranslation and v52.props.translation and v52.props.translation ~= "" then v12(v52.props.translation, l_chatSettings_2) else v12(v52.props.text, l_chatSettings_2);
        local v56 = v11(l_chatSettings_2, "size");
        local l_Padding_0 = l_chatSettings_2.Padding;
        local l_X_0 = v55.X;
        local l_Y_0 = v55.Y;
        if v52.props.renderInsert then
            l_X_0 = l_X_0 + (v52.props.insertSize.X + l_Padding_0);
            l_Y_0 = math.max(l_Y_0, v52.props.insertSize.Y + l_Padding_0 * 2);
        end;
        v52.heightMotor:setGoal(v56(l_Y_0));
        v52.widthMotor:setGoal(v56(l_X_0));
    end;
end;
v19.didMount = function(v60) --[[ Line: 273 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy), v22 (copy), v12 (copy), v11 (copy), v6 (copy), v15 (copy)
    v60.isMounted = true;
    local l_chatSettings_3 = v60.props.chatSettings;
    if v3() then
        l_chatSettings_3 = v22(v60.props.chatSettings, v60.props.bubbleChatMessageProperties);
    end;
    local v62 = if v60.props.useTranslation and v60.props.translation and v60.props.translation ~= "" then v12(v60.props.translation, l_chatSettings_3) else v12(v60.props.text, l_chatSettings_3);
    local v63 = v11(l_chatSettings_3, "size");
    local v64 = v11(l_chatSettings_3, "transparency");
    local l_X_1 = v62.X;
    local l_Y_1 = v62.Y;
    if v60.props.renderInsert then
        l_X_1 = l_X_1 + (v60.props.insertSize.X + l_chatSettings_3.Padding);
        l_Y_1 = math.max(l_Y_1, v60.props.insertSize.Y + l_chatSettings_3.Padding * 2);
    end;
    if v60.props.isMostRecent then
        v60.heightMotor:setGoal(v63(l_Y_1));
        v60.widthMotor:setGoal(v6.instant(l_X_1));
    else
        v60.heightMotor:setGoal(v63(l_Y_1));
        v60.widthMotor:setGoal(v63(l_X_1));
    end;
    local l_Transparency_0 = l_chatSettings_3.Transparency;
    v60.transparencyMotor:setGoal(v64(l_Transparency_0));
    local v68 = v15.getBackgroundTransparency(l_chatSettings_3, v60.props.clientSettings);
    if v3() then
        local l_bubbleChatMessageProperties_0 = v60.props.bubbleChatMessageProperties;
        if l_bubbleChatMessageProperties_0 and l_bubbleChatMessageProperties_0.BackgroundTransparency then
            v68 = v15.getBackgroundTransparency({
                BackgroundTransparency = l_bubbleChatMessageProperties_0.BackgroundTransparency
            }, v60.props.clientSettings);
        end;
    end;
    v60.backgroundTransparencyMotor:setGoal(v64(v68));
end;
v19.willUnmount = function(v70) --[[ Line: 324 ]] --[[ Name: willUnmount ]]
    v70.isMounted = false;
    v70.transparencyMotor:destroy();
    v70.backgroundTransparencyMotor:destroy();
    v70.heightMotor:destroy();
    v70.widthMotor:destroy();
end;
return v19;