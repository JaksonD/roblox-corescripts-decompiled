local v0 = {};
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local v6 = {};
v6.__index = v6;
local function v20() --[[ Line: 22 ]] --[[ Name: CreateGuiObjects ]]
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
    local v13 = l_ImageLabel_1:Clone();
    v13.Parent = l_Frame_3;
    l_ImageLabel_1.Position = UDim2.new(0, 2, 1, -4);
    v13.Position = UDim2.new(0.5, 0, 1, -4);
    l_ImageLabel_1.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png";
    v13.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png";
    l_ImageLabel_1.Name = "BlueBarLeft";
    v13.Name = "BlueBarRight";
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
    local v15 = l_TextButton_0:Clone();
    local v16 = l_TextButton_0:Clone();
    v15.Parent = l_Frame_2;
    v16.Parent = l_Frame_3;
    v15.Font = Enum.Font.SourceSans;
    v15.Active = false;
    v16.Active = false;
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
    return l_Frame_0, l_TextButton_0, v15, v16, l_ImageLabel_2, l_Frame_2, l_Frame_3;
end;
v6.Destroy = function(v21) --[[ Line: 142 ]] --[[ Name: Destroy ]]
    v21.GuiObject:Destroy();
end;
v6.UpdateMessagePostedInChannel = function(v22, v23) --[[ Line: 146 ]] --[[ Name: UpdateMessagePostedInChannel ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if v22.Active and v23 ~= true then
        return;
    else
        local v24 = v22.UnreadMessageCount + 1;
        v22.UnreadMessageCount = v24;
        local l_NewMessageIcon_0 = v22.NewMessageIcon;
        l_NewMessageIcon_0.Visible = true;
        l_NewMessageIcon_0.TextLabel.Text = v24 < 100 and tostring(v24) or "!";
        local v26 = UDim2.new(0, 0, -0.1, 0);
        local _ = l_NewMessageIcon_0.Position + v26;
        local l_Out_0 = Enum.EasingDirection.Out;
        local l_Quad_0 = Enum.EasingStyle.Quad;
        l_NewMessageIcon_0.Position = UDim2.new(0, 0, -0.15, 0);
        if l_game_EngineFeature_0 then
            l_NewMessageIcon_0:TweenPositionInternal(UDim2.new(0, 0, 0, 0), l_Out_0, l_Quad_0, 0.15, true);
            return;
        else
            l_NewMessageIcon_0:TweenPosition(UDim2.new(0, 0, 0, 0), l_Out_0, l_Quad_0, 0.15, true);
            return;
        end;
    end;
end;
v6.SetActive = function(v30, v31) --[[ Line: 173 ]] --[[ Name: SetActive ]]
    v30.Active = v31;
    v30.UnselectedFrame.Visible = not v31;
    v30.SelectedFrame.Visible = v31;
    if v31 then
        v30.UnreadMessageCount = 0;
        v30.NewMessageIcon.Visible = false;
        v30.NameTag.Font = Enum.Font.SourceSansBold;
        return;
    else
        v30.NameTag.Font = Enum.Font.SourceSans;
        return;
    end;
end;
v6.SetTextSize = function(v32, v33) --[[ Line: 189 ]] --[[ Name: SetTextSize ]]
    v32.NameTag.TextSize = v33;
end;
v6.FadeOutBackground = function(v34, v35) --[[ Line: 193 ]] --[[ Name: FadeOutBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v34.AnimParams.Background_TargetTransparency = 1;
    v34.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v35);
end;
v6.FadeInBackground = function(v36, v37) --[[ Line: 198 ]] --[[ Name: FadeInBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v36.AnimParams.Background_TargetTransparency = 0.6;
    v36.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v37);
end;
v6.FadeOutText = function(v38, v39) --[[ Line: 203 ]] --[[ Name: FadeOutText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v38.AnimParams.Text_TargetTransparency = 1;
    v38.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v39);
    v38.AnimParams.TextStroke_TargetTransparency = 1;
    v38.AnimParams.TextStroke_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v39);
end;
v6.FadeInText = function(v40, v41) --[[ Line: 210 ]] --[[ Name: FadeInText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v40.AnimParams.Text_TargetTransparency = 0;
    v40.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v41);
    v40.AnimParams.TextStroke_TargetTransparency = 0.75;
    v40.AnimParams.TextStroke_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v41);
end;
v6.AnimGuiObjects = function(v42) --[[ Line: 217 ]] --[[ Name: AnimGuiObjects ]]
    v42.UnselectedFrame.BackgroundTransparency = v42.AnimParams.Background_CurrentTransparency;
    v42.SelectedFrame.BackgroundImage.BackgroundTransparency = v42.AnimParams.Background_CurrentTransparency;
    v42.SelectedFrame.BlueBarLeft.ImageTransparency = v42.AnimParams.Background_CurrentTransparency;
    v42.SelectedFrame.BlueBarRight.ImageTransparency = v42.AnimParams.Background_CurrentTransparency;
    v42.NameTagNonSelect.TextTransparency = v42.AnimParams.Background_CurrentTransparency;
    v42.NameTagNonSelect.TextStrokeTransparency = v42.AnimParams.Background_CurrentTransparency;
    v42.NameTag.TextTransparency = v42.AnimParams.Text_CurrentTransparency;
    v42.NewMessageIcon.ImageTransparency = v42.AnimParams.Text_CurrentTransparency;
    v42.WhiteTextNewMessageNotification.TextTransparency = v42.AnimParams.Text_CurrentTransparency;
    v42.NameTagSelect.TextTransparency = v42.AnimParams.Text_CurrentTransparency;
    v42.NameTag.TextStrokeTransparency = v42.AnimParams.TextStroke_CurrentTransparency;
    v42.WhiteTextNewMessageNotification.TextStrokeTransparency = v42.AnimParams.TextStroke_CurrentTransparency;
    v42.NameTagSelect.TextStrokeTransparency = v42.AnimParams.TextStroke_CurrentTransparency;
end;
v6.InitializeAnimParams = function(v43) --[[ Line: 235 ]] --[[ Name: InitializeAnimParams ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v43.AnimParams.Text_TargetTransparency = 0;
    v43.AnimParams.Text_CurrentTransparency = 0;
    v43.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
    v43.AnimParams.TextStroke_TargetTransparency = 0.75;
    v43.AnimParams.TextStroke_CurrentTransparency = 0.75;
    v43.AnimParams.TextStroke_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
    v43.AnimParams.Background_TargetTransparency = 0.6;
    v43.AnimParams.Background_CurrentTransparency = 0.6;
    v43.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v6.Update = function(v44, v45) --[[ Line: 249 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v44.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v44.AnimParams.Background_CurrentTransparency, v44.AnimParams.Background_TargetTransparency, v44.AnimParams.Background_NormalizedExptValue, v45);
    v44.AnimParams.Text_CurrentTransparency = l_CurveUtil_0:Expt(v44.AnimParams.Text_CurrentTransparency, v44.AnimParams.Text_TargetTransparency, v44.AnimParams.Text_NormalizedExptValue, v45);
    v44.AnimParams.TextStroke_CurrentTransparency = l_CurveUtil_0:Expt(v44.AnimParams.TextStroke_CurrentTransparency, v44.AnimParams.TextStroke_TargetTransparency, v44.AnimParams.TextStroke_NormalizedExptValue, v45);
    v44:AnimGuiObjects();
end;
v0.new = function(v46) --[[ Line: 275 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v20 (copy), l_ChatSettings_0 (copy)
    local v47 = setmetatable({}, v6);
    local v48, v49, v50, v51, v52, v53, v54 = v20();
    v47.GuiObject = v48;
    v47.NameTag = v49;
    v47.NameTagNonSelect = v50;
    v47.NameTagSelect = v51;
    v47.NewMessageIcon = v52;
    v47.UnselectedFrame = v53;
    v47.SelectedFrame = v54;
    v47.BlueBarLeft = v54.BlueBarLeft;
    v47.BlueBarRight = v54.BlueBarRight;
    v47.BackgroundImage = v54.BackgroundImage;
    v47.WhiteTextNewMessageNotification = v47.NewMessageIcon.TextLabel;
    v47.ChannelName = v46;
    v47.UnreadMessageCount = 0;
    v47.Active = false;
    v47.GuiObject.Name = "Frame_" .. v47.ChannelName;
    if string.len(v46) > l_ChatSettings_0.MaxChannelNameLength then
        v46 = string.sub(v46, 1, l_ChatSettings_0.MaxChannelNameLength - 3) .. "...";
    end;
    v47.NameTag.Text = "";
    v47.NameTagNonSelect.Text = v46;
    v47.NameTagSelect.Text = v46;
    v47.AnimParams = {};
    v47:InitializeAnimParams();
    v47:AnimGuiObjects();
    v47:SetActive(false);
    return v47;
end;
return v0;