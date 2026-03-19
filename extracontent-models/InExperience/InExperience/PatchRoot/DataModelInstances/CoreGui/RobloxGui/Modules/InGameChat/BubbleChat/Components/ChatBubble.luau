local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_TextChatService_0 = game:GetService("TextChatService");
local v3 = require(l_CorePackages_0.Packages.Otter);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Types);
local v10 = require(l_Parent_0.Helpers.getSizeSpringFromSettings);
local v11 = require(l_Parent_0.Helpers.getTransparencySpringFromSettings);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v14 = require(l_RobloxGui_0.Modules.Flags.FFlagEnableRichTextForBubbleChat);
local v15 = game:DefineFastFlag("FixMockSizingLabelMemoryLeak", false);
local v16 = game:DefineFastFlag("FixMockSizingLabelMemoryLeak2", false);
local v17 = v4.PureComponent:extend("ChatBubble");
v17.validateProps = v6.strictInterface({
    messageId = v6.string, 
    fadingOut = v6.optional(v6.boolean), 
    onFadeOut = v6.optional(v6.callback), 
    isMostRecent = v6.optional(v6.boolean), 
    theme = v6.optional(v6.string), 
    renderInsert = v6.optional(v6.callback), 
    insertSize = v6.optional(v6.Vector2), 
    chatSettings = v9.IChatSettings, 
    text = v6.string, 
    timestamp = v6.number
});
v17.defaultProps = {
    theme = "Light", 
    isMostRecent = true
};
local function _() --[[ Line: 46 ]] --[[ Name: initMockSizingLabel ]]
    -- upvalues: l_CoreGui_0 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Enabled = false;
    l_ScreenGui_0.Name = "RichTextSizingLabel";
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.Parent = l_ScreenGui_0;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    return l_TextLabel_0;
end;
v17.init = function(v21) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v3 (copy), v15 (copy), l_CoreGui_0 (copy), l_TextChatService_0 (copy), v14 (copy)
    local v22, v23 = v4.createBinding(0);
    v21.width = v22;
    v21.updateWidth = v23;
    v21.widthMotor = v3.createSingleMotor(0);
    v21.widthMotor:onStep(function(v24) --[[ Line: 61 ]]
        -- upvalues: v21 (copy)
        v21.updateWidth((math.round(v24)));
    end);
    v22, v23 = v4.createBinding(0);
    v21.height = v22;
    v21.updateHeight = v23;
    v21.heightMotor = v3.createSingleMotor(0);
    v21.heightMotor:onStep(function(v25) --[[ Line: 67 ]]
        -- upvalues: v21 (copy)
        v21.updateHeight((math.round(v25)));
    end);
    v22, v23 = v4.createBinding(1);
    v21.transparency = v22;
    v21.updateTransparency = v23;
    v21.transparencyMotor = v3.createSingleMotor(1);
    v21.transparencyMotor:onStep(v21.updateTransparency);
    v21.size = v4.joinBindings({
        v21.width, 
        v21.height
    }):map(function(v26) --[[ Line: 75 ]]
        return UDim2.fromOffset(v26[1], v26[2]);
    end);
    if v15 then
        v21.mockSizingLabel = nil;
    else
        v23 = Instance.new("ScreenGui");
        v23.Enabled = false;
        v23.Name = "RichTextSizingLabel";
        local l_TextLabel_1 = Instance.new("TextLabel");
        l_TextLabel_1.TextWrapped = true;
        l_TextLabel_1.RichText = true;
        l_TextLabel_1.Parent = v23;
        v23.Parent = l_CoreGui_0;
        v21.mockSizingLabel = l_TextLabel_1;
    end;
    v21.isRichTextEnabled = l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService and (v14 and true or false);
end;
v17.getBoundsFromSizingLabel = function(v28, v29, v30, v31, v32) --[[ Line: 91 ]] --[[ Name: getBoundsFromSizingLabel ]]
    -- upvalues: v15 (copy), l_CoreGui_0 (copy), v16 (copy)
    if v15 then
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Enabled = false;
        l_ScreenGui_1.Name = "RichTextSizingLabel";
        local l_TextLabel_2 = Instance.new("TextLabel");
        l_TextLabel_2.TextWrapped = true;
        l_TextLabel_2.RichText = true;
        l_TextLabel_2.Parent = l_ScreenGui_1;
        l_ScreenGui_1.Parent = l_CoreGui_0;
        local l_l_TextLabel_2_0 = l_TextLabel_2;
        l_l_TextLabel_2_0.Text = v29;
        l_l_TextLabel_2_0.TextSize = v30;
        l_l_TextLabel_2_0.Font = v31;
        l_l_TextLabel_2_0.Size = UDim2.fromOffset(v32.X, v32.Y);
        l_ScreenGui_1 = l_l_TextLabel_2_0.TextBounds;
        if v16 then
            l_l_TextLabel_2_0.Parent:Destroy();
            return l_ScreenGui_1;
        else
            l_l_TextLabel_2_0:Destroy();
            return l_ScreenGui_1;
        end;
    else
        v28.mockSizingLabel.Text = v29;
        v28.mockSizingLabel.TextSize = v30;
        v28.mockSizingLabel.Font = v31;
        v28.mockSizingLabel.Size = UDim2.fromOffset(v32.X, v32.Y);
        return v28.mockSizingLabel.TextBounds;
    end;
end;
v17.getTextBounds = function(v36) --[[ Line: 117 ]] --[[ Name: getTextBounds ]]
    -- upvalues: l_TextService_0 (copy)
    local l_chatSettings_0 = v36.props.chatSettings;
    local v38 = Vector2.new(l_chatSettings_0.Padding * 4, l_chatSettings_0.Padding * 2);
    local _ = Vector2.new(0, 0);
    return (if v36.isRichTextEnabled then v36:getBoundsFromSizingLabel(v36.props.text, l_chatSettings_0.TextSize, l_chatSettings_0.Font, Vector2.new(l_chatSettings_0.MaxWidth, 10000)) else l_TextService_0:GetTextSize(v36.props.text, l_chatSettings_0.TextSize, l_chatSettings_0.Font, Vector2.new(l_chatSettings_0.MaxWidth, 10000))) + v38;
end;
v17.render = function(v40) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v7 (copy)
    local l_chatSettings_1 = v40.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_1.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_1.BackgroundGradient;
    local v44 = v40.props.renderInsert and v40.props.insertSize.X + l_chatSettings_1.Padding or 0;
    return v4.createElement("Frame", {
        LayoutOrder = v40.props.timestamp, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v40.size, 
        Position = UDim2.fromScale(1, 0.5), 
        Transparency = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, -1)
        }), 
        Frame = v4.createElement("ImageLabel", v7.Dictionary.join(l_BackgroundImage_0, {
            LayoutOrder = 1, 
            BackgroundColor3 = l_chatSettings_1.BackgroundColor3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            BackgroundTransparency = l_BackgroundImage_0.Image ~= "" and 1 or v40.transparency, 
            ClipsDescendants = true, 
            ImageTransparency = v40.transparency
        }), {
            UICorner = l_chatSettings_1.CornerEnabled and v4.createElement("UICorner", {
                CornerRadius = l_chatSettings_1.CornerRadius
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, l_chatSettings_1.Padding)
            }), 
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_chatSettings_1.Padding), 
                PaddingRight = UDim.new(0, l_chatSettings_1.Padding), 
                PaddingBottom = UDim.new(0, l_chatSettings_1.Padding), 
                PaddingLeft = UDim.new(0, l_chatSettings_1.Padding)
            }), 
            Insert = v40.props.renderInsert and v40.props.renderInsert(), 
            Text = v4.createElement("TextLabel", {
                Text = v40.props.text, 
                Size = UDim2.new(1, -v44, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Font = l_chatSettings_1.Font, 
                TextColor3 = l_chatSettings_1.TextColor3, 
                TextSize = l_chatSettings_1.TextSize, 
                TextTransparency = v40.transparency, 
                TextWrapped = true, 
                AutoLocalize = false, 
                LayoutOrder = 2, 
                RichText = v40.isRichTextEnabled
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v4.createElement("UIGradient", l_BackgroundGradient_0)
        }), 
        Carat = v40.props.isMostRecent and l_chatSettings_1.TailVisible and v40.props.showCarat and v4.createElement("ImageLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(9, 6), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_1.BackgroundColor3, 
            ImageTransparency = v40.transparency
        })
    });
end;
v17.fadeOut = function(v45) --[[ Line: 230 ]] --[[ Name: fadeOut ]]
    -- upvalues: v11 (copy)
    if not v45.isFadingOut then
        v45.isFadingOut = true;
        v45.transparencyMotor:onComplete(function() --[[ Line: 234 ]]
            -- upvalues: v45 (copy)
            if v45.props.onFadeOut then
                v45.props.onFadeOut(v45.props.messageId);
            end;
        end);
        local v46 = v11(v45.props.chatSettings);
        v45.transparencyMotor:setGoal(v46(1));
    end;
end;
v17.didUpdate = function(v47, v48) --[[ Line: 245 ]] --[[ Name: didUpdate ]]
    -- upvalues: v10 (copy)
    if v47.props.fadingOut then
        v47:fadeOut();
    end;
    if v48.text ~= v47.props.text or v48.chatSettings ~= v47.props.chatSettings or v48.renderInsert ~= v47.props.renderInsert or v48.insertSize ~= v47.props.insertSize then
        local v49 = v47:getTextBounds();
        local v50 = v10(v47.props.chatSettings);
        local l_Padding_0 = v47.props.chatSettings.Padding;
        local l_X_0 = v49.X;
        local l_Y_0 = v49.Y;
        if v47.props.renderInsert then
            l_X_0 = l_X_0 + (v47.props.insertSize.X + l_Padding_0);
            l_Y_0 = math.max(l_Y_0, v47.props.insertSize.Y + l_Padding_0 * 2);
        end;
        v47.heightMotor:setGoal(v50(l_Y_0));
        v47.widthMotor:setGoal(v50(l_X_0));
    end;
end;
v17.didMount = function(v54) --[[ Line: 272 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy), v11 (copy), v3 (copy)
    v54.isMounted = true;
    local v55 = v54:getTextBounds();
    local l_chatSettings_2 = v54.props.chatSettings;
    local v57 = v10(l_chatSettings_2);
    local v58 = v11(l_chatSettings_2);
    local l_X_1 = v55.X;
    local l_Y_1 = v55.Y;
    if v54.props.renderInsert then
        l_X_1 = l_X_1 + (v54.props.insertSize.X + l_chatSettings_2.Padding);
        l_Y_1 = math.max(l_Y_1, v54.props.insertSize.Y + l_chatSettings_2.Padding * 2);
    end;
    if v54.props.isMostRecent then
        v54.heightMotor:setGoal(v57(l_Y_1));
        v54.widthMotor:setGoal(v3.instant(l_X_1));
    else
        v54.heightMotor:setGoal(v57(l_Y_1));
        v54.widthMotor:setGoal(v57(l_X_1));
    end;
    v54.transparencyMotor:setGoal(v58(l_chatSettings_2.Transparency));
end;
v17.willUnmount = function(v61) --[[ Line: 300 ]] --[[ Name: willUnmount ]]
    v61.isMounted = false;
    v61.transparencyMotor:destroy();
    v61.heightMotor:destroy();
    v61.widthMotor:destroy();
end;
return v5.connect(function(v62, v63) --[[ Line: 307 ]] --[[ Name: mapStateToProps ]]
    local v64 = v62.messages[v63.messageId];
    return {
        text = v64 and v64.text or "", 
        timestamp = v64 and v64.timestamp or 0
    };
end)(v17);