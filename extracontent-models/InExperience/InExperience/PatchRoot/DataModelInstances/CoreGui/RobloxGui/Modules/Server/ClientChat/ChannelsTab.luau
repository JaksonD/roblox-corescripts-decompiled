local v0 = {};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local v5 = {};
v5.__index = v5;
local function v19() --[[ Line: 20 ]] --[[ Name: CreateGuiObjects ]]
    -- upvalues: l_ChatSettings_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "BackgroundFrame";
    l_Frame_1.Size = UDim2.new(1, -2, 1, -2);
    l_Frame_1.Position = UDim2.new(0, 1, 0, 1);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Selectable = false;
    l_Frame_2.Name = "UnselectedFrame";
    l_Frame_2.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_2.BorderSizePixel = 0;
    l_Frame_2.BackgroundColor3 = l_ChatSettings_0.ChannelsTabUnselectedColor;
    l_Frame_2.BackgroundTransparency = 0.6;
    l_Frame_2.Parent = l_Frame_1;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Selectable = false;
    l_Frame_3.Name = "SelectedFrame";
    l_Frame_3.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_3.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_3.BorderSizePixel = 0;
    l_Frame_3.BackgroundColor3 = l_ChatSettings_0.ChannelsTabSelectedColor;
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Parent = l_Frame_1;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Selectable = false;
    l_ImageLabel_0.Name = "BackgroundImage";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.Parent = l_Frame_3;
    l_ImageLabel_0.BackgroundTransparency = -0.4;
    l_ImageLabel_0.BackgroundColor3 = Color3.fromRGB(93.6, 100.8, 115.19999999999999);
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Selectable = false;
    l_ImageLabel_1.Size = UDim2.new(0.5, -2, 0, 4);
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_1.SliceCenter = Rect.new(3, 3, 32, 21);
    l_ImageLabel_1.Parent = l_Frame_3;
    local v12 = l_ImageLabel_1:Clone();
    v12.Parent = l_Frame_3;
    l_ImageLabel_1.Position = UDim2.new(0, 2, 1, -4);
    v12.Position = UDim2.new(0.5, 0, 1, -4);
    l_ImageLabel_1.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png";
    v12.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png";
    l_ImageLabel_1.Name = "BlueBarLeft";
    v12.Name = "BlueBarRight";
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    l_TextButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Font = l_ChatSettings_0.DefaultFont;
    l_TextButton_0.TextSize = l_ChatSettings_0.ChatChannelsTabTextSize;
    l_TextButton_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextButton_0.TextStrokeTransparency = 0.75;
    l_TextButton_0.Parent = l_Frame_1;
    local v14 = l_TextButton_0:Clone();
    local v15 = l_TextButton_0:Clone();
    v14.Parent = l_Frame_2;
    v15.Parent = l_Frame_3;
    v14.Font = Enum.Font.SourceSans;
    v14.Active = false;
    v15.Active = false;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Selectable = false;
    l_Frame_4.Size = UDim2.new(0, 18, 0, 18);
    l_Frame_4.Position = UDim2.new(0.8, -9, 0.5, -9);
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_1;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Selectable = false;
    l_ImageLabel_2.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Image = "rbxasset://textures/ui/Chat/MessageCounter.png";
    l_ImageLabel_2.Visible = false;
    l_ImageLabel_2.Parent = l_Frame_4;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Selectable = false;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = UDim2.new(0, 13, 0, 9);
    l_TextLabel_0.Position = UDim2.new(0.5, -7, 0.5, -7);
    l_TextLabel_0.Font = l_ChatSettings_0.DefaultFont;
    l_TextLabel_0.TextSize = 14;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Text = "";
    l_TextLabel_0.Parent = l_ImageLabel_2;
    return l_Frame_0, l_TextButton_0, v14, v15, l_ImageLabel_2, l_Frame_2, l_Frame_3;
end;
v5.Destroy = function(v20) --[[ Line: 140 ]] --[[ Name: Destroy ]]
    v20.GuiObject:Destroy();
end;
v5.UpdateMessagePostedInChannel = function(v21, v22) --[[ Line: 144 ]] --[[ Name: UpdateMessagePostedInChannel ]]
    if v21.Active and v22 ~= true then
        return;
    else
        local v23 = v21.UnreadMessageCount + 1;
        v21.UnreadMessageCount = v23;
        local l_NewMessageIcon_0 = v21.NewMessageIcon;
        l_NewMessageIcon_0.Visible = true;
        l_NewMessageIcon_0.TextLabel.Text = v23 < 100 and tostring(v23) or "!";
        local v25 = UDim2.new(0, 0, -0.1, 0);
        local _ = l_NewMessageIcon_0.Position + v25;
        local l_Out_0 = Enum.EasingDirection.Out;
        local l_Quad_0 = Enum.EasingStyle.Quad;
        l_NewMessageIcon_0.Position = UDim2.new(0, 0, -0.15, 0);
        l_NewMessageIcon_0:TweenPosition(UDim2.new(0, 0, 0, 0), l_Out_0, l_Quad_0, 0.15, true);
        return;
    end;
end;
v5.SetActive = function(v29, v30) --[[ Line: 167 ]] --[[ Name: SetActive ]]
    v29.Active = v30;
    v29.UnselectedFrame.Visible = not v30;
    v29.SelectedFrame.Visible = v30;
    if v30 then
        v29.UnreadMessageCount = 0;
        v29.NewMessageIcon.Visible = false;
        v29.NameTag.Font = Enum.Font.SourceSansBold;
        return;
    else
        v29.NameTag.Font = Enum.Font.SourceSans;
        return;
    end;
end;
v5.SetTextSize = function(v31, v32) --[[ Line: 183 ]] --[[ Name: SetTextSize ]]
    v31.NameTag.TextSize = v32;
end;
v5.FadeOutBackground = function(v33, v34) --[[ Line: 187 ]] --[[ Name: FadeOutBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v33.AnimParams.Background_TargetTransparency = 1;
    v33.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v34);
end;
v5.FadeInBackground = function(v35, v36) --[[ Line: 192 ]] --[[ Name: FadeInBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v35.AnimParams.Background_TargetTransparency = 0.6;
    v35.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v36);
end;
v5.FadeOutText = function(v37, v38) --[[ Line: 197 ]] --[[ Name: FadeOutText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v37.AnimParams.Text_TargetTransparency = 1;
    v37.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v38);
    v37.AnimParams.TextStroke_TargetTransparency = 1;
    v37.AnimParams.TextStroke_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v38);
end;
v5.FadeInText = function(v39, v40) --[[ Line: 204 ]] --[[ Name: FadeInText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v39.AnimParams.Text_TargetTransparency = 0;
    v39.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v40);
    v39.AnimParams.TextStroke_TargetTransparency = 0.75;
    v39.AnimParams.TextStroke_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v40);
end;
v5.AnimGuiObjects = function(v41) --[[ Line: 211 ]] --[[ Name: AnimGuiObjects ]]
    v41.UnselectedFrame.BackgroundTransparency = v41.AnimParams.Background_CurrentTransparency;
    v41.SelectedFrame.BackgroundImage.BackgroundTransparency = v41.AnimParams.Background_CurrentTransparency;
    v41.SelectedFrame.BlueBarLeft.ImageTransparency = v41.AnimParams.Background_CurrentTransparency;
    v41.SelectedFrame.BlueBarRight.ImageTransparency = v41.AnimParams.Background_CurrentTransparency;
    v41.NameTagNonSelect.TextTransparency = v41.AnimParams.Background_CurrentTransparency;
    v41.NameTagNonSelect.TextStrokeTransparency = v41.AnimParams.Background_CurrentTransparency;
    v41.NameTag.TextTransparency = v41.AnimParams.Text_CurrentTransparency;
    v41.NewMessageIcon.ImageTransparency = v41.AnimParams.Text_CurrentTransparency;
    v41.WhiteTextNewMessageNotification.TextTransparency = v41.AnimParams.Text_CurrentTransparency;
    v41.NameTagSelect.TextTransparency = v41.AnimParams.Text_CurrentTransparency;
    v41.NameTag.TextStrokeTransparency = v41.AnimParams.TextStroke_CurrentTransparency;
    v41.WhiteTextNewMessageNotification.TextStrokeTransparency = v41.AnimParams.TextStroke_CurrentTransparency;
    v41.NameTagSelect.TextStrokeTransparency = v41.AnimParams.TextStroke_CurrentTransparency;
end;
v5.InitializeAnimParams = function(v42) --[[ Line: 229 ]] --[[ Name: InitializeAnimParams ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v42.AnimParams.Text_TargetTransparency = 0;
    v42.AnimParams.Text_CurrentTransparency = 0;
    v42.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
    v42.AnimParams.TextStroke_TargetTransparency = 0.75;
    v42.AnimParams.TextStroke_CurrentTransparency = 0.75;
    v42.AnimParams.TextStroke_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
    v42.AnimParams.Background_TargetTransparency = 0.6;
    v42.AnimParams.Background_CurrentTransparency = 0.6;
    v42.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v5.Update = function(v43, v44) --[[ Line: 243 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v43.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v43.AnimParams.Background_CurrentTransparency, v43.AnimParams.Background_TargetTransparency, v43.AnimParams.Background_NormalizedExptValue, v44);
    v43.AnimParams.Text_CurrentTransparency = l_CurveUtil_0:Expt(v43.AnimParams.Text_CurrentTransparency, v43.AnimParams.Text_TargetTransparency, v43.AnimParams.Text_NormalizedExptValue, v44);
    v43.AnimParams.TextStroke_CurrentTransparency = l_CurveUtil_0:Expt(v43.AnimParams.TextStroke_CurrentTransparency, v43.AnimParams.TextStroke_TargetTransparency, v43.AnimParams.TextStroke_NormalizedExptValue, v44);
    v43:AnimGuiObjects();
end;
v0.new = function(v45) --[[ Line: 269 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v19 (copy), l_ChatSettings_0 (copy)
    local v46 = setmetatable({}, v5);
    local v47, v48, v49, v50, v51, v52, v53 = v19();
    v46.GuiObject = v47;
    v46.NameTag = v48;
    v46.NameTagNonSelect = v49;
    v46.NameTagSelect = v50;
    v46.NewMessageIcon = v51;
    v46.UnselectedFrame = v52;
    v46.SelectedFrame = v53;
    v46.BlueBarLeft = v53.BlueBarLeft;
    v46.BlueBarRight = v53.BlueBarRight;
    v46.BackgroundImage = v53.BackgroundImage;
    v46.WhiteTextNewMessageNotification = v46.NewMessageIcon.TextLabel;
    v46.ChannelName = v45;
    v46.UnreadMessageCount = 0;
    v46.Active = false;
    v46.GuiObject.Name = "Frame_" .. v46.ChannelName;
    if string.len(v45) > l_ChatSettings_0.MaxChannelNameLength then
        v45 = string.sub(v45, 1, l_ChatSettings_0.MaxChannelNameLength - 3) .. "...";
    end;
    v46.NameTag.Text = "";
    v46.NameTagNonSelect.Text = v45;
    v46.NameTagSelect.Text = v45;
    v46.AnimParams = {};
    v46:InitializeAnimParams();
    v46:AnimGuiObjects();
    v46:SetActive(false);
    return v46;
end;
return v0;