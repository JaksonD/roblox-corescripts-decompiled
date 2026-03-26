local v0 = {};
local l_Chat_0 = game:GetService("Chat");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChannelsTab_0 = require(l_Parent_0:WaitForChild("ChannelsTab"));
local l_MessageSender_0 = require(l_Parent_0:WaitForChild("MessageSender"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local v9 = {};
v9.__index = v9;
v9.CreateGuiObjects = function(v10, v11) --[[ Line: 24 ]] --[[ Name: CreateGuiObjects ]]
    -- upvalues: l_ChatSettings_0 (copy), l_MessageSender_0 (copy), l_game_EngineFeature_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Parent = v11;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "ScrollingBase";
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.ClipsDescendants = true;
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Selectable = false;
    l_Frame_2.Name = "ScrollerSizer";
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_2.Parent = l_Frame_1;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Selectable = false;
    l_Frame_3.Name = "ScrollerFrame";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_3.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_3.Parent = l_Frame_2;
    local l_Frame_4 = Instance.new("Frame");
    l_Frame_4.Selectable = false;
    l_Frame_4.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_4.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_4.ClipsDescendants = true;
    l_Frame_4.BackgroundTransparency = 1;
    l_Frame_4.Parent = l_Frame_0;
    local l_Frame_5 = Instance.new("Frame");
    l_Frame_5.Selectable = false;
    l_Frame_5.Name = "LeaveConfirmationFrame";
    l_Frame_5.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_5.Position = UDim2.new(0, 0, 1, 0);
    l_Frame_5.BackgroundTransparency = 0.6;
    l_Frame_5.BorderSizePixel = 0;
    l_Frame_5.BackgroundColor3 = Color3.new(0, 0, 0);
    l_Frame_5.Parent = l_Frame_4;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Text = "";
    l_TextButton_0.Parent = l_Frame_5;
    local l_TextButton_1 = Instance.new("TextButton");
    l_TextButton_1.Selectable = false;
    l_TextButton_1.Size = UDim2.new(0.25, 0, 1, 0);
    l_TextButton_1.BackgroundTransparency = 1;
    l_TextButton_1.Font = l_ChatSettings_0.DefaultFont;
    l_TextButton_1.TextSize = 18;
    l_TextButton_1.TextStrokeTransparency = 0.75;
    l_TextButton_1.Position = UDim2.new(0, 0, 0, 0);
    l_TextButton_1.TextColor3 = Color3.new(0, 1, 0);
    l_TextButton_1.Text = "Confirm";
    l_TextButton_1.Parent = l_Frame_5;
    local v20 = l_TextButton_1:Clone();
    v20.Parent = l_Frame_5;
    v20.Position = UDim2.new(0.75, 0, 0, 0);
    v20.TextColor3 = Color3.new(1, 0, 0);
    v20.Text = "Cancel";
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Selectable = false;
    l_TextLabel_0.Size = UDim2.new(0.5, 0, 1, 0);
    l_TextLabel_0.Position = UDim2.new(0.25, 0, 0, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0.75;
    l_TextLabel_0.Text = "Leave channel <XX>?";
    l_TextLabel_0.Font = l_ChatSettings_0.DefaultFont;
    l_TextLabel_0.TextSize = 18;
    l_TextLabel_0.Parent = l_Frame_5;
    local l_StringValue_0 = Instance.new("StringValue");
    l_StringValue_0.Name = "LeaveTarget";
    l_StringValue_0.Parent = l_Frame_5;
    local l_Position_0 = l_Frame_5.Position;
    l_TextButton_1.MouseButton1Click:connect(function() --[[ Line: 116 ]]
        -- upvalues: l_MessageSender_0 (ref), l_StringValue_0 (copy), l_game_EngineFeature_0 (ref), l_Frame_5 (copy), l_Position_0 (copy)
        l_MessageSender_0:SendMessage(string.format("/leave %s", l_StringValue_0.Value), nil);
        if l_game_EngineFeature_0 then
            l_Frame_5:TweenPositionInternal(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            return;
        else
            l_Frame_5:TweenPosition(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            return;
        end;
    end);
    v20.MouseButton1Click:connect(function() --[[ Line: 124 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), l_Frame_5 (copy), l_Position_0 (copy)
        if l_game_EngineFeature_0 then
            l_Frame_5:TweenPositionInternal(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            return;
        else
            l_Frame_5:TweenPosition(l_Position_0, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            return;
        end;
    end);
    local v24 = "rbxasset://textures/ui/Chat/TabArrowBackground.png";
    local v25 = "rbxasset://textures/ui/Chat/TabArrow.png";
    v24 = "rbxassetid://471630199";
    v25 = "rbxassetid://471630112";
    local v26 = Instance.new("ImageButton", l_Frame_0);
    v26.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    v26.Name = "PageLeftButton";
    v26.SizeConstraint = Enum.SizeConstraint.RelativeYY;
    v26.Size = UDim2.new(0.7, 0, 0.7, 0);
    v26.BackgroundTransparency = 1;
    v26.Position = UDim2.new(0, 4, 0.15000000000000002, 0);
    v26.Visible = false;
    v26.Image = v24;
    local v27 = Instance.new("ImageLabel", v26);
    v27.Name = "ArrowLabel";
    v27.BackgroundTransparency = 1;
    v27.Size = UDim2.new(0.4, 0, 0.4, 0);
    v27.Image = v25;
    local v28 = Instance.new("Frame", l_Frame_0);
    v28.Selectable = false;
    v28.BackgroundTransparency = 1;
    v28.Name = "PositionalHelper";
    v28.Size = v26.Size;
    v28.SizeConstraint = v26.SizeConstraint;
    v28.Position = UDim2.new(1, 0, 0.15000000000000002, 0);
    local v29 = v26:Clone();
    v29.Parent = v28;
    v29.Name = "PageRightButton";
    v29.Size = UDim2.new(1, 0, 1, 0);
    v29.SizeConstraint = Enum.SizeConstraint.RelativeXY;
    v29.Position = UDim2.new(-1, -4, 0, 0);
    local v30 = UDim2.new(0.05, 0, 0, 0);
    v29.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + v30;
    v26.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - v30;
    v26.ArrowLabel.Rotation = 180;
    v10.GuiObject = l_Frame_0;
    v10.GuiObjects.BaseFrame = l_Frame_0;
    v10.GuiObjects.ScrollerSizer = l_Frame_2;
    v10.GuiObjects.ScrollerFrame = l_Frame_3;
    v10.GuiObjects.PageLeftButton = v26;
    v10.GuiObjects.PageRightButton = v29;
    v10.GuiObjects.LeaveConfirmationFrame = l_Frame_5;
    v10.GuiObjects.LeaveConfirmationNotice = l_TextLabel_0;
    v10.GuiObjects.PageLeftButtonArrow = v26.ArrowLabel;
    v10.GuiObjects.PageRightButtonArrow = v29.ArrowLabel;
    v10:AnimGuiObjects();
    v26.MouseButton1Click:connect(function() --[[ Line: 196 ]]
        -- upvalues: v10 (copy)
        v10:ScrollChannelsFrame(-1);
    end);
    v29.MouseButton1Click:connect(function() --[[ Line: 197 ]]
        -- upvalues: v10 (copy)
        v10:ScrollChannelsFrame(1);
    end);
    v10:ScrollChannelsFrame(0);
end;
v9.UpdateMessagePostedInChannel = function(v31, v32) --[[ Line: 203 ]] --[[ Name: UpdateMessagePostedInChannel ]]
    local l_v31_ChannelTab_0 = v31:GetChannelTab(v32);
    if l_v31_ChannelTab_0 then
        l_v31_ChannelTab_0:UpdateMessagePostedInChannel();
        return;
    else
        warn("ChannelsTab '" .. v32 .. "' does not exist!");
        return;
    end;
end;
v9.AddChannelTab = function(v34, v35) --[[ Line: 212 ]] --[[ Name: AddChannelTab ]]
    -- upvalues: l_ChannelsTab_0 (copy), l_ChatSettings_0 (copy), l_game_EngineFeature_0 (copy)
    if v34:GetChannelTab(v35) then
        error("Channel tab '" .. v35 .. "'already exists!");
    end;
    local v36 = l_ChannelsTab_0.new(v35);
    v36.GuiObject.Parent = v34.GuiObjects.ScrollerFrame;
    v34.ChannelTabs[v35:lower()] = v36;
    v34.NumTabs = v34.NumTabs + 1;
    v34:OrganizeChannelTabs();
    if l_ChatSettings_0.RightClickToLeaveChannelEnabled then
        v36.NameTag.MouseButton2Click:connect(function() --[[ Line: 225 ]]
            -- upvalues: v34 (copy), v36 (copy), l_game_EngineFeature_0 (ref)
            v34.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", v36.ChannelName);
            v34.LeaveConfirmationFrame.LeaveTarget.Value = v36.ChannelName;
            if l_game_EngineFeature_0 then
                v34.LeaveConfirmationFrame:TweenPositionInternal(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true);
                return;
            else
                v34.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true);
                return;
            end;
        end);
    end;
    return v36;
end;
v9.RemoveChannelTab = function(v37, v38) --[[ Line: 239 ]] --[[ Name: RemoveChannelTab ]]
    if not v37:GetChannelTab(v38) then
        error("Channel tab '" .. v38 .. "'does not exist!");
    end;
    local v39 = v38:lower();
    v37.ChannelTabs[v39]:Destroy();
    v37.ChannelTabs[v39] = nil;
    v37.NumTabs = v37.NumTabs - 1;
    v37:OrganizeChannelTabs();
end;
v9.GetChannelTab = function(v40, v41) --[[ Line: 252 ]] --[[ Name: GetChannelTab ]]
    return v40.ChannelTabs[v41:lower()];
end;
v9.OrganizeChannelTabs = function(v42) --[[ Line: 256 ]] --[[ Name: OrganizeChannelTabs ]]
    -- upvalues: l_ChatSettings_0 (copy)
    local v43 = {};
    table.insert(v43, v42:GetChannelTab(l_ChatSettings_0.GeneralChannelName));
    table.insert(v43, v42:GetChannelTab("System"));
    for _, v45 in pairs(v42.ChannelTabs) do
        if v45.ChannelName ~= l_ChatSettings_0.GeneralChannelName and v45.ChannelName ~= "System" then
            table.insert(v43, v45);
        end;
    end;
    for v46, v47 in pairs(v43) do
        v47.GuiObject.Position = UDim2.new(v46 - 1, 0, 0, 0);
    end;
    v42.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, (math.min(l_ChatSettings_0.ChannelsBarFullTabSize, v42.NumTabs))), 0, 1, 0);
    v42:ScrollChannelsFrame(0);
end;
v9.ResizeChannelTabText = function(v48, v49) --[[ Line: 278 ]] --[[ Name: ResizeChannelTabText ]]
    for _, v51 in pairs(v48.ChannelTabs) do
        v51:SetTextSize(v49);
    end;
end;
v9.ScrollChannelsFrame = function(v52, v53) --[[ Line: 284 ]] --[[ Name: ScrollChannelsFrame ]]
    -- upvalues: l_ChatSettings_0 (copy), l_game_EngineFeature_0 (copy)
    if v52.ScrollChannelsFrameLock then
        return;
    else
        v52.ScrollChannelsFrameLock = true;
        local l_ChannelsBarFullTabSize_0 = l_ChatSettings_0.ChannelsBarFullTabSize;
        local v55 = v52.CurPageNum + v53;
        if v55 < 0 then
            v55 = 0;
        elseif v55 > 0 and v55 + l_ChannelsBarFullTabSize_0 > v52.NumTabs then
            v55 = v52.NumTabs - l_ChannelsBarFullTabSize_0;
        end;
        v52.CurPageNum = v55;
        local v56 = UDim2.new(-v52.CurPageNum, 0, 0, 0);
        v52.GuiObjects.PageLeftButton.Visible = v52.CurPageNum > 0;
        v52.GuiObjects.PageRightButton.Visible = v52.CurPageNum + l_ChannelsBarFullTabSize_0 < v52.NumTabs;
        if v53 == 0 then
            v52.ScrollChannelsFrameLock = false;
            return;
        else
            local function v57() --[[ Line: 310 ]] --[[ Name: UnlockFunc ]]
                -- upvalues: v52 (copy)
                v52.ScrollChannelsFrameLock = false;
            end;
            v52:WaitUntilParentedCorrectly();
            if l_game_EngineFeature_0 then
                v52.GuiObjects.ScrollerFrame:TweenPositionInternal(v56, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, v57);
                return;
            else
                v52.GuiObjects.ScrollerFrame:TweenPosition(v56, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, v57);
                return;
            end;
        end;
    end;
end;
v9.FadeOutBackground = function(v58, v59) --[[ Line: 323 ]] --[[ Name: FadeOutBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    for _, v61 in pairs(v58.ChannelTabs) do
        v61:FadeOutBackground(v59);
    end;
    v58.AnimParams.Background_TargetTransparency = 1;
    v58.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v59);
end;
v9.FadeInBackground = function(v62, v63) --[[ Line: 332 ]] --[[ Name: FadeInBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    for _, v65 in pairs(v62.ChannelTabs) do
        v65:FadeInBackground(v63);
    end;
    v62.AnimParams.Background_TargetTransparency = 0.6;
    v62.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v63);
end;
v9.FadeOutText = function(v66, v67) --[[ Line: 341 ]] --[[ Name: FadeOutText ]]
    for _, v69 in pairs(v66.ChannelTabs) do
        v69:FadeOutText(v67);
    end;
end;
v9.FadeInText = function(v70, v71) --[[ Line: 347 ]] --[[ Name: FadeInText ]]
    for _, v73 in pairs(v70.ChannelTabs) do
        v73:FadeInText(v71);
    end;
end;
v9.AnimGuiObjects = function(v74) --[[ Line: 353 ]] --[[ Name: AnimGuiObjects ]]
    v74.GuiObjects.PageLeftButton.ImageTransparency = v74.AnimParams.Background_CurrentTransparency;
    v74.GuiObjects.PageRightButton.ImageTransparency = v74.AnimParams.Background_CurrentTransparency;
    v74.GuiObjects.PageLeftButtonArrow.ImageTransparency = v74.AnimParams.Background_CurrentTransparency;
    v74.GuiObjects.PageRightButtonArrow.ImageTransparency = v74.AnimParams.Background_CurrentTransparency;
end;
v9.InitializeAnimParams = function(v75) --[[ Line: 360 ]] --[[ Name: InitializeAnimParams ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v75.AnimParams.Background_TargetTransparency = 0.6;
    v75.AnimParams.Background_CurrentTransparency = 0.6;
    v75.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v9.Update = function(v76, v77) --[[ Line: 366 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    for _, v79 in pairs(v76.ChannelTabs) do
        v79:Update(v77);
    end;
    v76.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v76.AnimParams.Background_CurrentTransparency, v76.AnimParams.Background_TargetTransparency, v76.AnimParams.Background_NormalizedExptValue, v77);
    v76:AnimGuiObjects();
end;
v9.WaitUntilParentedCorrectly = function(v80) --[[ Line: 382 ]] --[[ Name: WaitUntilParentedCorrectly ]]
    while not v80.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
        v80.GuiObject.AncestryChanged:wait();
    end;
end;
v0.new = function() --[[ Line: 391 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_ChatSettings_0 (copy)
    local v81 = setmetatable({}, v9);
    v81.GuiObject = nil;
    v81.GuiObjects = {};
    v81.ChannelTabs = {};
    v81.NumTabs = 0;
    v81.CurPageNum = 0;
    v81.ScrollChannelsFrameLock = false;
    v81.AnimParams = {};
    v81:InitializeAnimParams();
    l_ChatSettings_0.SettingsChanged:connect(function(v82, v83) --[[ Line: 407 ]]
        -- upvalues: v81 (copy)
        if v82 == "ChatChannelsTabTextSize" then
            v81:ResizeChannelTabText(v83);
        end;
    end);
    return v81;
end;
return v0;