local v0 = {
    [Enum.DialogPurpose.Quest] = {
        "rbxasset://textures/ui/dialog_purpose_quest.png", 
        Vector2.new(10, 34)
    }, 
    [Enum.DialogPurpose.Help] = {
        "rbxasset://textures/ui/dialog_purpose_help.png", 
        Vector2.new(20, 35)
    }, 
    [Enum.DialogPurpose.Shop] = {
        "rbxasset://textures/ui/dialog_purpose_shop.png", 
        Vector2.new(22, 43)
    }
};
local v1 = 24;
local l_Size24_0 = Enum.FontSize.Size24;
local v3 = Vector2.new(80, 90);
local v4 = 350;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v10 = false;
local v11 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v13 = game:DefineFastFlag("DisplayBottomLeftControlForDialogs", false);
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or l_Character_0.Parent == nil then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:Wait();
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(v15) --[[ Line: 50 ]]
    -- upvalues: l_Character_0 (ref)
    l_Character_0 = v15;
end);
setUsingGamepad = function(v16, _) --[[ Line: 54 ]] --[[ Name: setUsingGamepad ]]
    -- upvalues: v10 (ref)
    if v16.UserInputType == Enum.UserInputType.Gamepad1 or v16.UserInputType == Enum.UserInputType.Gamepad2 or v16.UserInputType == Enum.UserInputType.Gamepad3 or v16.UserInputType == Enum.UserInputType.Gamepad4 then
        v10 = true;
        return;
    else
        v10 = false;
        return;
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad);
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 66 ]]
    return settings():GetFFlag("GoodbyeChoiceActiveProperty");
end);
local v20 = l_status_0 and l_result_0;
local v21 = nil;
local v22 = {};
local v23 = nil;
local v24 = {};
local v25 = nil;
local v26 = nil;
local v27 = {};
local v28 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v32 = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999);
local v33 = nil;
local v34 = nil;
local v35 = {};
local v36 = {};
local v37 = nil;
local v38 = false;
local v39 = nil;
local v40 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v41 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v42 = require(l_RobloxGui_0.Modules.GameTranslator);
local v43 = v41:IsSmallTouchScreen();
if v40 then
    l_Size24_0 = Enum.FontSize.Size36;
    v1 = 36;
    v4 = 500;
elseif v43 then
    l_Size24_0 = Enum.FontSize.Size14;
    v1 = 14;
    v4 = 250;
end;
v39 = if l_RobloxGui_0:FindFirstChild("ControlFrame") then l_RobloxGui_0.ControlFrame else l_RobloxGui_0;
local l_TouchEnabled_0 = game:GetService("UserInputService").TouchEnabled;
local function _(v45) --[[ Line: 125 ]] --[[ Name: isDialogMultiplePlayers ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 126 ]]
        -- upvalues: v45 (copy)
        return v45.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    return l_status_1 and l_result_1 or false;
end;
currentTone = function() --[[ Line: 130 ]] --[[ Name: currentTone ]]
    -- upvalues: v25 (ref)
    if v25 then
        return v25.Tone;
    else
        return Enum.DialogTone.Neutral;
    end;
end;
createChatNotificationGui = function() --[[ Line: 139 ]] --[[ Name: createChatNotificationGui ]]
    -- upvalues: v33 (ref), v3 (copy), l_UserInputService_0 (copy)
    v33 = Instance.new("BillboardGui");
    v33.Name = "ChatNotificationGui";
    v33.ExtentsOffset = Vector3.new(0, 1, 0, 0);
    v33.Size = UDim2.new(v3.X / 31.5, 0, v3.Y / 31.5, 0);
    v33.SizeOffset = Vector2.new(0, 0);
    v33.StudsOffset = Vector3.new(0, 3.700000047683716, 0, 0);
    v33.Enabled = true;
    v33.RobloxLocked = true;
    v33.Active = true;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "Background";
    l_ImageButton_0.Active = false;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageButton_0.Image = "";
    l_ImageButton_0.Parent = v33;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "Icon";
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Image = "";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "ActivationButton";
    l_ImageLabel_1.Position = UDim2.new(-0.3, 0, -0.4, 0);
    l_ImageLabel_1.Size = UDim2.new(0.8, 0, 0.8 * (v3.X / v3.Y), 0);
    l_ImageLabel_1.Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonX);
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.Visible = false;
    l_ImageLabel_1.Parent = l_ImageButton_0;
end;
getChatColor = function(v52) --[[ Line: 177 ]] --[[ Name: getChatColor ]]
    if v52 == Enum.DialogTone.Neutral then
        return Enum.ChatColor.Blue;
    elseif v52 == Enum.DialogTone.Friendly then
        return Enum.ChatColor.Green;
    elseif v52 == Enum.DialogTone.Enemy then
        return Enum.ChatColor.Red;
    else
        return;
    end;
end;
styleChoices = function() --[[ Line: 187 ]] --[[ Name: styleChoices ]]
    -- upvalues: v22 (copy), v23 (ref)
    for _, v54 in pairs(v22) do
        v54.BackgroundTransparency = 1;
    end;
    v23.BackgroundTransparency = 1;
end;
styleMainFrame = function(v55) --[[ Line: 194 ]] --[[ Name: styleMainFrame ]]
    -- upvalues: v21 (ref)
    if v55 == Enum.DialogTone.Neutral then
        v21.Style = Enum.FrameStyle.ChatBlue;
    elseif v55 == Enum.DialogTone.Friendly then
        v21.Style = Enum.FrameStyle.ChatGreen;
    elseif v55 == Enum.DialogTone.Enemy then
        v21.Style = Enum.FrameStyle.ChatRed;
    end;
    styleChoices();
end;
setChatNotificationTone = function(v56, v57, v58) --[[ Line: 205 ]] --[[ Name: setChatNotificationTone ]]
    -- upvalues: v0 (copy), v3 (copy)
    if v58 == Enum.DialogTone.Neutral then
        v56.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png";
    elseif v58 == Enum.DialogTone.Friendly then
        v56.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png";
    elseif v58 == Enum.DialogTone.Enemy then
        v56.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png";
    end;
    local v59, v60 = unpack(v0[v57]);
    local v61 = v60 / v3;
    v56.Background.Icon.Size = UDim2.new(v61.X, 0, v61.Y, 0);
    v56.Background.Icon.Position = UDim2.new(0.5 - v61.X / 2, 0, 0.4 - v61.Y / 2, 0);
    v56.Background.Icon.Image = v59;
end;
createMessageDialog = function() --[[ Line: 221 ]] --[[ Name: createMessageDialog ]]
    -- upvalues: v34 (ref)
    v34 = Instance.new("Frame");
    v34.Name = "DialogScriptMessage";
    v34.Style = Enum.FrameStyle.Custom;
    v34.BackgroundTransparency = 0.5;
    v34.BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
    v34.Visible = false;
    v34.RobloxLocked = true;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Text";
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, -1);
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.FontSize = Enum.FontSize.Size14;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Parent = v34;
end;
showMessage = function(v63, v64) --[[ Line: 240 ]] --[[ Name: showMessage ]]
    -- upvalues: v34 (ref)
    v34.Text.Text = v63;
    v34.Size = UDim2.new(0, v64, 0, 40);
    v34.Position = UDim2.new(0.5, -v64 / 2, 0.5, -40);
    v34.Visible = true;
    wait(2);
    v34.Visible = false;
end;
variableDelay = function(v65) --[[ Line: 249 ]] --[[ Name: variableDelay ]]
    local v66 = math.min(string.len(v65), 100);
    wait(v66 / 75 * 1.5 + 0.75);
end;
resetColor = function(v67) --[[ Line: 254 ]] --[[ Name: resetColor ]]
    v67.BackgroundTransparency = 1;
end;
wanderDialog = function() --[[ Line: 258 ]] --[[ Name: wanderDialog ]]
    -- upvalues: v21 (ref)
    v21.Visible = false;
    endDialog();
    showMessage("Chat ended because you walked away", 350);
end;
timeoutDialog = function() --[[ Line: 264 ]] --[[ Name: timeoutDialog ]]
    -- upvalues: v21 (ref)
    v21.Visible = false;
    endDialog();
    showMessage("Chat ended because you didn't reply", 350);
end;
normalEndDialog = function() --[[ Line: 270 ]] --[[ Name: normalEndDialog ]]
    endDialog();
end;
endDialog = function() --[[ Line: 274 ]] --[[ Name: endDialog ]]
    -- upvalues: v28 (ref), v27 (copy), v25 (ref), v32 (copy), v35 (copy), l_ContextActionService_0 (copy), v26 (ref), v37 (ref), v13 (copy), v38 (ref), v39 (ref), l_GuiService_0 (copy), v21 (ref)
    if v28 then
        v27[v28] = false;
        v28 = nil;
    end;
    local l_v25_0 = v25;
    v25 = nil;
    if l_v25_0 and l_v25_0.InUse then
        delay(5, function() --[[ Line: 284 ]]
            -- upvalues: v32 (ref), l_v25_0 (copy)
            v32:FireServer(l_v25_0, false);
            l_v25_0.InUse = false;
        end);
    end;
    for v69, v70 in pairs(v35) do
        if v69 and v70 then
            v70.Enabled = not v69.InUse;
        end;
    end;
    l_ContextActionService_0:UnbindCoreAction("Nothing");
    v26 = nil;
    if v37 then
        v37.Visible = true;
    end;
    if v13 and v38 then
        v39.BottomLeftControl.Visible = false;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v21 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
sanitizeMessage = function(v71) --[[ Line: 313 ]] --[[ Name: sanitizeMessage ]]
    if string.len(v71) == 0 then
        return "...";
    else
        return v71;
    end;
end;
local function v75(v72, ...) --[[ Line: 321 ]] --[[ Name: chatFunc ]]
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 126 ]]
        -- upvalues: v72 (copy)
        return v72.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    if l_status_2 and l_result_2 or false then
        game:GetService("Chat"):ChatLocal(...);
        return;
    else
        game:GetService("Chat"):Chat(...);
        return;
    end;
end;
selectChoice = function(v76) --[[ Line: 329 ]] --[[ Name: selectChoice ]]
    -- upvalues: v25 (ref), l_Character_0 (ref), v21 (ref), v23 (ref), v75 (copy), v24 (ref), l_LocalPlayer_0 (ref), v26 (ref)
    if not v25 then
        return;
    else
        renewKillswitch(v25);
        if not l_Character_0:FindFirstAncestorOfClass("Workspace") then
            return;
        else
            v21.Visible = false;
            if v76 == v23 then
                v75(v25, l_Character_0, v23.UserPrompt.Text, getChatColor(currentTone()));
                normalEndDialog();
                return;
            else
                local v77 = v24[v76];
                v75(v25, l_Character_0, sanitizeMessage(v77.UserDialog), getChatColor(currentTone()));
                wait(1);
                if not v25 then
                    return;
                else
                    v25:SignalDialogChoiceSelected(l_LocalPlayer_0, v77);
                    v75(v25, v26, sanitizeMessage(v77.ResponseDialog), getChatColor(currentTone()));
                    variableDelay(v77.ResponseDialog);
                    presentDialogChoices(v26, v77:GetChildren(), v77);
                    return;
                end;
            end;
        end;
    end;
end;
newChoice = function() --[[ Line: 364 ]] --[[ Name: newChoice ]]
    -- upvalues: l_Size24_0 (ref), l_UserInputService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Visible = false;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.BackgroundColor3 = Color3.new(0.8901960784313725, 0.8901960784313725, 0.8901960784313725);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Text = "";
    l_TextButton_0.MouseEnter:connect(function() --[[ Line: 374 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 0;
    end);
    l_TextButton_0.MouseLeave:connect(function() --[[ Line: 377 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 1;
    end);
    l_TextButton_0.SelectionImageObject = l_Frame_0;
    l_TextButton_0.Activated:connect(function() --[[ Line: 381 ]]
        -- upvalues: l_TextButton_0 (copy)
        selectChoice(l_TextButton_0);
    end);
    l_TextButton_0.RobloxLocked = true;
    local l_TextLabel_1 = Instance.new("TextLabel");
    l_TextLabel_1.AutoLocalize = false;
    l_TextLabel_1.Name = "UserPrompt";
    l_TextLabel_1.BackgroundTransparency = 1;
    l_TextLabel_1.Font = Enum.Font.SourceSans;
    l_TextLabel_1.FontSize = l_Size24_0;
    l_TextLabel_1.Position = UDim2.new(0, 40, 0, 0);
    l_TextLabel_1.Size = UDim2.new(1, -72, 1, 0);
    l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextLabel_1.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_1.TextWrap = true;
    l_TextLabel_1.Parent = l_TextButton_0;
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "RBXchatDialogSelectionButton";
    l_ImageLabel_2.Position = UDim2.new(0, 0, 0.5, -16.5);
    l_ImageLabel_2.Size = UDim2.new(0, 33, 0, 33);
    l_ImageLabel_2.Image = l_UserInputService_0:GetImageForKeyCode(Enum.KeyCode.ButtonA);
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.Visible = false;
    l_ImageLabel_2.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
initialize = function(v82) --[[ Line: 411 ]] --[[ Name: initialize ]]
    -- upvalues: v22 (copy), v23 (ref), v1 (ref), v21 (ref), v4 (ref)
    v22[1] = newChoice();
    v22[2] = newChoice();
    v22[3] = newChoice();
    v22[4] = newChoice();
    v23 = newChoice();
    v23.UserPrompt.Text = "Goodbye!";
    v23.Size = UDim2.new(1, 28, 0, v1 + 12);
    v21 = Instance.new("Frame");
    v21.Name = "UserDialogArea";
    v21.Size = UDim2.new(0, v4, 0, 200);
    v21.Style = Enum.FrameStyle.ChatBlue;
    v21.Visible = false;
    for _, v84 in pairs(v22) do
        v84.RobloxLocked = true;
        v84.Parent = v21;
    end;
    v23.RobloxLocked = true;
    v23.Parent = v21;
    v21.RobloxLocked = true;
    v21.Parent = v82;
end;
presentDialogChoices = function(v85, v86, v87) --[[ Line: 439 ]] --[[ Name: presentDialogChoices ]]
    -- upvalues: v25 (ref), v26 (ref), v24 (ref), v22 (copy), v1 (ref), v42 (copy), v23 (ref), v20 (copy), v21 (ref), v4 (ref), v43 (copy), l_LocalPlayer_0 (ref), v37 (ref), v13 (copy), l_TouchEnabled_0 (copy), v39 (ref), v38 (ref), v10 (ref)
    if not v25 then
        return;
    else
        v26 = v85;
        local v88 = {};
        for _, v90 in pairs(v86) do
            if v90:IsA("DialogChoice") then
                table.insert(v88, v90);
            end;
        end;
        table.sort(v88, function(v91, v92) --[[ Line: 451 ]]
            return v91.Name < v92.Name;
        end);
        if #v88 == 0 then
            normalEndDialog();
            return;
        else
            local v93 = 1;
            local v94 = 0;
            v24 = {};
            for _, v96 in pairs(v22) do
                v96.Visible = false;
            end;
            for _, v98 in pairs(v88) do
                if v93 <= #v22 then
                    v22[v93].Size = UDim2.new(1, 28, 0, v1 * 3);
                    v42:TranslateAndRegister(v22[v93].UserPrompt, v98, v98.UserDialog);
                    local v99 = math.ceil(v22[v93].UserPrompt.TextBounds.Y / v1) * v1 + 12;
                    v22[v93].Position = UDim2.new(0, -11, 0, v94 + -8);
                    v22[v93].Size = UDim2.new(1, 28, 0, v99);
                    v22[v93].Visible = true;
                    v24[v22[v93]] = v98;
                    v94 = v94 + v99 + 1;
                    v93 = v93 + 1;
                end;
            end;
            v23.Size = UDim2.new(1, 28, 0, v1 * 3);
            v23.UserPrompt.Text = v87.GoodbyeDialog == "" and "Goodbye!" or v87.GoodbyeDialog;
            local v100 = math.ceil(v23.UserPrompt.TextBounds.Y / v1) * v1 + 12;
            v23.Size = UDim2.new(1, 28, 0, v100);
            v23.Position = UDim2.new(0, -11, 0, v94 + -8);
            v23.Visible = true;
            if v20 and not v87.GoodbyeChoiceActive then
                v23.Visible = false;
                v21.Size = UDim2.new(0, v4, 0, v94 + 34 + -16);
            else
                v21.Size = UDim2.new(0, v4, 0, v94 + v23.AbsoluteSize.Y + 34 + -16);
            end;
            v21.Position = UDim2.new(0, 20, 1, -v21.Size.Y.Offset - 20);
            if v43 then
                local l_TouchGui_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("TouchGui");
                if l_TouchGui_0 then
                    v37 = l_TouchGui_0:FindFirstChild("TouchControlFrame");
                    if v37 then
                        v37.Visible = false;
                    end;
                end;
                v21.Position = UDim2.new(0, 10, 1, -v21.Size.Y.Offset);
            elseif v13 and not l_TouchEnabled_0 and not v39.BottomLeftControl.Visible then
                v39.BottomLeftControl.Visible = true;
                v38 = true;
            end;
            styleMainFrame(currentTone());
            v21.Visible = true;
            if v10 then
                game:GetService("GuiService").SelectedCoreObject = v22[1];
            end;
            return;
        end;
    end;
end;
doDialog = function(v102) --[[ Line: 523 ]] --[[ Name: doDialog ]]
    -- upvalues: v25 (ref), l_ContextActionService_0 (copy), v32 (copy), v75 (copy)
    if v102.InitialPrompt == "" then
        warn("Can't start a dialog with an empty InitialPrompt");
        return;
    else
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 126 ]]
            -- upvalues: v102 (copy)
            return v102.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
        end);
        local v105 = l_status_3 and l_result_3 or false;
        if v102.InUse and not v105 then
            return;
        else
            v25 = v102;
            v102.InUse = true;
            l_ContextActionService_0:BindCoreAction("Nothing", function() --[[ Line: 537 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            v32:FireServer(v102, true);
            v75(v102, v102.Parent, v102.InitialPrompt, getChatColor(v102.Tone));
            variableDelay(v102.InitialPrompt);
            presentDialogChoices(v102.Parent, v102:GetChildren(), v102);
            return;
        end;
    end;
end;
renewKillswitch = function(v106) --[[ Line: 548 ]] --[[ Name: renewKillswitch ]]
    -- upvalues: v28 (ref), v27 (copy), v32 (copy)
    if v28 then
        v27[v28] = false;
        v28 = nil;
    end;
    v28 = coroutine.create(function(v107) --[[ Line: 554 ]]
        -- upvalues: v27 (ref), v32 (ref), v106 (copy)
        wait(15);
        if v107 ~= nil then
            if v27[v107] == nil then
                v32:FireServer(v106, false);
                v106.InUse = false;
            end;
            v27[v107] = nil;
        end;
    end);
    coroutine.resume(v28, v28);
end;
checkForLeaveArea = function() --[[ Line: 567 ]] --[[ Name: checkForLeaveArea ]]
    -- upvalues: v25 (ref), l_LocalPlayer_0 (ref)
    while v25 do
        if v25.Parent and l_LocalPlayer_0:DistanceFromCharacter(v25.Parent.Position) >= v25.ConversationDistance then
            wanderDialog();
        end;
        wait(1);
    end;
end;
startDialog = function(v108) --[[ Line: 576 ]] --[[ Name: startDialog ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref), v35 (copy)
    if v108.Parent and v108.Parent:IsA("BasePart") then
        l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated");
        if l_LocalPlayer_0:DistanceFromCharacter(v108.Parent.Position) >= v108.ConversationDistance then
            showMessage("You are too far away to chat!", 300);
            return;
        else
            for v109, v110 in pairs(v35) do
                if v109 and v110 then
                    v110.Enabled = false;
                end;
            end;
            renewKillswitch(v108);
            delay(1, checkForLeaveArea);
            doDialog(v108);
        end;
    end;
end;
removeDialog = function(v111) --[[ Line: 598 ]] --[[ Name: removeDialog ]]
    -- upvalues: v35 (copy), v36 (copy)
    if v35[v111] then
        v35[v111]:Destroy();
        v35[v111] = nil;
    end;
    if v36[v111] then
        v36[v111]:disconnect();
        v36[v111] = nil;
    end;
end;
addDialog = function(v112) --[[ Line: 609 ]] --[[ Name: addDialog ]]
    -- upvalues: v11 (ref), l_RbxAnalyticsService_0 (copy), v33 (ref), l_CoreGui_0 (copy), v35 (copy), v36 (copy), v25 (ref)
    if v112.Parent then
        if v112.Parent:IsA("BasePart") and v112:IsDescendantOf(game.Workspace) then
            v11 = true;
            l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId);
            local v113 = v33:clone();
            v113.Adornee = v112.Parent;
            v113.RobloxLocked = true;
            local v114 = not v112.InUse;
            if not v114 then
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 126 ]]
                    -- upvalues: v112 (copy)
                    return v112.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                end);
                v114 = l_status_4 and l_result_4 or false;
            end;
            v113.Enabled = v114;
            v113.Parent = l_CoreGui_0;
            v113.Background.MouseButton1Click:connect(function() --[[ Line: 621 ]]
                -- upvalues: v112 (copy)
                startDialog(v112);
            end);
            setChatNotificationTone(v113, v112.Purpose, v112.Tone);
            if game:GetEngineFeature("ClosestVisibleDialogAPI") then
                v112:SetGuiObject(v113);
            end;
            v35[v112] = v113;
            v36[v112] = v112.Changed:connect(function(v117) --[[ Line: 631 ]]
                -- upvalues: v112 (copy), v113 (copy), v25 (ref)
                if v117 == "Parent" and v112.Parent then
                    removeDialog(v112);
                    addDialog(v112);
                    return;
                else
                    if v117 == "InUse" then
                        local l_v112_0 = v112;
                        local l_l_v112_0_0 = l_v112_0 --[[ copy: 2 -> 5 ]];
                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 126 ]]
                            -- upvalues: l_l_v112_0_0 (copy)
                            return l_l_v112_0_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                        end);
                        if not (l_status_5 and l_result_5 or false) then
                            local l_v113_0 = v113;
                            l_v112_0 = false;
                            if v25 == nil then
                                l_v112_0 = not v112.InUse;
                            end;
                            l_v113_0.Enabled = l_v112_0;
                        else
                            v113.Enabled = v25 ~= v112;
                        end;
                        if not v112.InUse then
                            l_v112_0 = v112;
                            l_status_5, l_result_5 = pcall(function() --[[ Line: 126 ]]
                                -- upvalues: l_v112_0 (copy)
                                return l_v112_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                            end);
                            if not (l_status_5 and l_result_5 or false) and v112 == v25 then
                                timeoutDialog();
                                return;
                            end;
                        end;
                    elseif v117 == "Tone" or v117 == "Purpose" then
                        setChatNotificationTone(v113, v112.Purpose, v112.Tone);
                    end;
                    return;
                end;
            end);
            return;
        else
            v36[v112] = v112.Changed:connect(function(v123) --[[ Line: 651 ]]
                -- upvalues: v112 (copy)
                if v123 == "Parent" and v112.Parent then
                    removeDialog(v112);
                    addDialog(v112);
                end;
            end);
        end;
    end;
end;
onLoad = function() --[[ Line: 662 ]] --[[ Name: onLoad ]]
    -- upvalues: v34 (ref), v39 (ref), l_TouchEnabled_0 (copy), v43 (copy)
    createChatNotificationGui();
    createMessageDialog();
    v34.RobloxLocked = true;
    v34.Parent = v39;
    v39:WaitForChild("BottomLeftControl");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DialogFrame";
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.RobloxLocked = true;
    game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", l_Frame_1);
    if l_TouchEnabled_0 and not v43 then
        l_Frame_1.Position = UDim2.new(0, 20, 0.5, 0);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v39;
    elseif v43 then
        l_Frame_1.Position = UDim2.new(0, 0, 0.9, -10);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v39;
    else
        l_Frame_1.Parent = v39.BottomLeftControl;
    end;
    initialize(l_Frame_1);
    game:GetService("CollectionService").ItemAdded:Connect(function(v125) --[[ Line: 693 ]]
        if v125:IsA("Dialog") then
            addDialog(v125);
        end;
    end);
    game:GetService("CollectionService").ItemRemoved:Connect(function(v126) --[[ Line: 698 ]]
        if v126:IsA("Dialog") then
            removeDialog(v126);
        end;
    end);
    for _, v128 in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
        if v128:IsA("Dialog") then
            addDialog(v128);
        end;
    end;
end;
getLocalHumanoidRootPart = function() --[[ Line: 710 ]] --[[ Name: getLocalHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.Character then
        return l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
    else
        return;
    end;
end;
dialogIsValid = function(v129) --[[ Line: 716 ]] --[[ Name: dialogIsValid ]]
    return v129 and v129.Parent and v129.Parent:IsA("BasePart");
end;
local v130 = nil;
local l_GetClosestDialogToPosition_0 = l_GuiService_0.GetClosestDialogToPosition;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 723 ]]
    -- upvalues: l_GetClosestDialogToPosition_0 (copy), l_GuiService_0 (copy), v25 (ref), l_LocalPlayer_0 (ref), v10 (ref), v130 (ref), v35 (copy), l_ContextActionService_0 (copy)
    local v132 = nil;
    local v133 = getLocalHumanoidRootPart();
    if v133 then
        local l_Position_0 = v133.Position;
        v132 = l_GetClosestDialogToPosition_0(l_GuiService_0, l_Position_0);
    end;
    if getLocalHumanoidRootPart() and dialogIsValid(v132) and v25 == nil then
        local l_TriggerDistance_0 = v132.TriggerDistance;
        local l_TriggerOffset_0 = v132.TriggerOffset;
        local v137 = l_LocalPlayer_0:DistanceFromCharacter(v132.Parent.Position + l_TriggerOffset_0);
        if l_TriggerDistance_0 ~= 0 and v137 < v132.ConversationDistance and v137 < l_TriggerDistance_0 then
            startDialog(v132);
        end;
    end;
    if v10 == true then
        if v133 and game:GetEngineFeature("ClosestVisibleDialogAPI") then
            local l_Position_1 = v133.Position;
            v132 = l_GuiService_0.GetClosestVisibleDialogToPosition(l_GuiService_0, l_Position_1);
        end;
        if v132 ~= v130 then
            if v35[v130] then
                v35[v130].Background.ActivationButton.Visible = false;
            end;
            v130 = v132;
            l_ContextActionService_0:UnbindCoreAction("StartDialogAction");
            if v132 ~= nil then
                l_ContextActionService_0:BindCoreAction("StartDialogAction", function(_, v140, _) --[[ Line: 762 ]]
                    -- upvalues: v132 (ref)
                    if v140 == Enum.UserInputState.Begin and v132 and v132.Parent then
                        startDialog(v132);
                    end;
                end, false, Enum.KeyCode.ButtonX);
                if v35[v132] then
                    v35[v132].Background.ActivationButton.Visible = true;
                end;
            end;
        end;
    end;
end);
local v142 = nil;
l_GuiService_0.Changed:connect(function(v143) --[[ Line: 779 ]]
    -- upvalues: v142 (ref), l_GuiService_0 (copy)
    if v143 == "SelectedCoreObject" then
        if v142 and v142:FindFirstChild("RBXchatDialogSelectionButton") then
            v142:FindFirstChild("RBXchatDialogSelectionButton").Visible = false;
            v142.BackgroundTransparency = 1;
        end;
        v142 = l_GuiService_0.SelectedCoreObject;
        if v142 and v142:FindFirstChild("RBXchatDialogSelectionButton") then
            v142:FindFirstChild("RBXchatDialogSelectionButton").Visible = true;
            v142.BackgroundTransparency = 0;
        end;
    end;
end);
onLoad();