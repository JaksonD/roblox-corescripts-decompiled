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
local l_Character_0 = l_LocalPlayer_0.Character;
if not l_Character_0 or l_Character_0.Parent == nil then
    l_Character_0 = l_LocalPlayer_0.CharacterAdded:Wait();
end;
l_LocalPlayer_0.CharacterAdded:Connect(function(v14) --[[ Line: 48 ]]
    -- upvalues: l_Character_0 (ref)
    l_Character_0 = v14;
end);
setUsingGamepad = function(v15, _) --[[ Line: 52 ]] --[[ Name: setUsingGamepad ]]
    -- upvalues: v10 (ref)
    if v15.UserInputType == Enum.UserInputType.Gamepad1 or v15.UserInputType == Enum.UserInputType.Gamepad2 or v15.UserInputType == Enum.UserInputType.Gamepad3 or v15.UserInputType == Enum.UserInputType.Gamepad4 then
        v10 = true;
        return;
    else
        v10 = false;
        return;
    end;
end;
game:GetService("UserInputService").InputBegan:Connect(setUsingGamepad);
game:GetService("UserInputService").InputChanged:Connect(setUsingGamepad);
local v17 = nil;
local v18 = {};
local v19 = nil;
local v20 = {};
local v21 = nil;
local v22 = nil;
local v23 = {};
local v24 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v28 = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999);
local v29 = nil;
local v30 = nil;
local v31 = {};
local v32 = {};
local v33 = nil;
local v34 = false;
local v35 = nil;
local v36 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v37 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v38 = require(l_RobloxGui_0.Modules.GameTranslator);
local v39 = v37:IsSmallTouchScreen();
if v36 then
    l_Size24_0 = Enum.FontSize.Size36;
    v1 = 36;
    v4 = 500;
elseif v39 then
    l_Size24_0 = Enum.FontSize.Size14;
    v1 = 14;
    v4 = 250;
end;
v35 = if l_RobloxGui_0:FindFirstChild("ControlFrame") then l_RobloxGui_0.ControlFrame else l_RobloxGui_0;
local l_TouchEnabled_0 = game:GetService("UserInputService").TouchEnabled;
local function _(v41) --[[ Line: 118 ]] --[[ Name: isDialogMultiplePlayers ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 119 ]]
        -- upvalues: v41 (copy)
        return v41.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    return l_status_0 and l_result_0 or false;
end;
currentTone = function() --[[ Line: 123 ]] --[[ Name: currentTone ]]
    -- upvalues: v21 (ref)
    if v21 then
        return v21.Tone;
    else
        return Enum.DialogTone.Neutral;
    end;
end;
createChatNotificationGui = function() --[[ Line: 132 ]] --[[ Name: createChatNotificationGui ]]
    -- upvalues: v29 (ref), v3 (copy), l_UserInputService_0 (copy)
    v29 = Instance.new("BillboardGui");
    v29.Name = "ChatNotificationGui";
    v29.ExtentsOffset = Vector3.new(0, 1, 0, 0);
    v29.Size = UDim2.new(v3.X / 31.5, 0, v3.Y / 31.5, 0);
    v29.SizeOffset = Vector2.new(0, 0);
    v29.StudsOffset = Vector3.new(0, 3.700000047683716, 0, 0);
    v29.Enabled = true;
    v29.RobloxLocked = true;
    v29.Active = true;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "Background";
    l_ImageButton_0.Active = false;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageButton_0.Image = "";
    l_ImageButton_0.Parent = v29;
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
getChatColor = function(v48) --[[ Line: 170 ]] --[[ Name: getChatColor ]]
    if v48 == Enum.DialogTone.Neutral then
        return Enum.ChatColor.Blue;
    elseif v48 == Enum.DialogTone.Friendly then
        return Enum.ChatColor.Green;
    elseif v48 == Enum.DialogTone.Enemy then
        return Enum.ChatColor.Red;
    else
        return;
    end;
end;
styleChoices = function() --[[ Line: 180 ]] --[[ Name: styleChoices ]]
    -- upvalues: v18 (copy), v19 (ref)
    for _, v50 in pairs(v18) do
        v50.BackgroundTransparency = 1;
    end;
    v19.BackgroundTransparency = 1;
end;
styleMainFrame = function(v51) --[[ Line: 187 ]] --[[ Name: styleMainFrame ]]
    -- upvalues: v17 (ref)
    if v51 == Enum.DialogTone.Neutral then
        v17.Style = Enum.FrameStyle.ChatBlue;
    elseif v51 == Enum.DialogTone.Friendly then
        v17.Style = Enum.FrameStyle.ChatGreen;
    elseif v51 == Enum.DialogTone.Enemy then
        v17.Style = Enum.FrameStyle.ChatRed;
    end;
    styleChoices();
end;
setChatNotificationTone = function(v52, v53, v54) --[[ Line: 198 ]] --[[ Name: setChatNotificationTone ]]
    -- upvalues: v0 (copy), v3 (copy)
    if v54 == Enum.DialogTone.Neutral then
        v52.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png";
    elseif v54 == Enum.DialogTone.Friendly then
        v52.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png";
    elseif v54 == Enum.DialogTone.Enemy then
        v52.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png";
    end;
    local v55, v56 = unpack(v0[v53]);
    local v57 = v56 / v3;
    v52.Background.Icon.Size = UDim2.new(v57.X, 0, v57.Y, 0);
    v52.Background.Icon.Position = UDim2.new(0.5 - v57.X / 2, 0, 0.4 - v57.Y / 2, 0);
    v52.Background.Icon.Image = v55;
end;
createMessageDialog = function() --[[ Line: 214 ]] --[[ Name: createMessageDialog ]]
    -- upvalues: v30 (ref)
    v30 = Instance.new("Frame");
    v30.Name = "DialogScriptMessage";
    v30.Style = Enum.FrameStyle.Custom;
    v30.BackgroundTransparency = 0.5;
    v30.BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
    v30.Visible = false;
    v30.RobloxLocked = true;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Text";
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, -1);
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.FontSize = Enum.FontSize.Size14;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Parent = v30;
end;
showMessage = function(v59, v60) --[[ Line: 233 ]] --[[ Name: showMessage ]]
    -- upvalues: v30 (ref)
    v30.Text.Text = v59;
    v30.Size = UDim2.new(0, v60, 0, 40);
    v30.Position = UDim2.new(0.5, -v60 / 2, 0.5, -40);
    v30.Visible = true;
    wait(2);
    v30.Visible = false;
end;
variableDelay = function(v61) --[[ Line: 242 ]] --[[ Name: variableDelay ]]
    local v62 = math.min(string.len(v61), 100);
    wait(v62 / 75 * 1.5 + 0.75);
end;
resetColor = function(v63) --[[ Line: 247 ]] --[[ Name: resetColor ]]
    v63.BackgroundTransparency = 1;
end;
wanderDialog = function() --[[ Line: 251 ]] --[[ Name: wanderDialog ]]
    -- upvalues: v17 (ref)
    v17.Visible = false;
    endDialog();
    showMessage("Chat ended because you walked away", 350);
end;
timeoutDialog = function() --[[ Line: 257 ]] --[[ Name: timeoutDialog ]]
    -- upvalues: v17 (ref)
    v17.Visible = false;
    endDialog();
    showMessage("Chat ended because you didn't reply", 350);
end;
normalEndDialog = function() --[[ Line: 263 ]] --[[ Name: normalEndDialog ]]
    endDialog();
end;
endDialog = function() --[[ Line: 267 ]] --[[ Name: endDialog ]]
    -- upvalues: v24 (ref), v23 (copy), v21 (ref), v28 (copy), v31 (copy), l_ContextActionService_0 (copy), v22 (ref), v33 (ref), v34 (ref), v35 (ref), l_GuiService_0 (copy), v17 (ref)
    if v24 then
        v23[v24] = false;
        v24 = nil;
    end;
    local l_v21_0 = v21;
    v21 = nil;
    if l_v21_0 and l_v21_0.InUse then
        delay(5, function() --[[ Line: 277 ]]
            -- upvalues: v28 (ref), l_v21_0 (copy)
            v28:FireServer(l_v21_0, false);
            l_v21_0.InUse = false;
        end);
    end;
    for v65, v66 in pairs(v31) do
        if v65 and v66 then
            v66.Enabled = not v65.InUse;
        end;
    end;
    l_ContextActionService_0:UnbindCoreAction("Nothing");
    v22 = nil;
    if v33 then
        v33.Visible = true;
    end;
    if v34 then
        v35.BottomLeftControl.Visible = false;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v17 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
sanitizeMessage = function(v67) --[[ Line: 306 ]] --[[ Name: sanitizeMessage ]]
    if string.len(v67) == 0 then
        return "...";
    else
        return v67;
    end;
end;
local function v71(v68, ...) --[[ Line: 314 ]] --[[ Name: chatFunc ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 119 ]]
        -- upvalues: v68 (copy)
        return v68.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    if l_status_1 and l_result_1 or false then
        game:GetService("Chat"):ChatLocal(...);
        return;
    else
        game:GetService("Chat"):Chat(...);
        return;
    end;
end;
selectChoice = function(v72) --[[ Line: 322 ]] --[[ Name: selectChoice ]]
    -- upvalues: v21 (ref), l_Character_0 (ref), v17 (ref), v19 (ref), v71 (copy), v20 (ref), l_LocalPlayer_0 (ref), v22 (ref)
    if not v21 then
        return;
    else
        renewKillswitch(v21);
        if not l_Character_0:FindFirstAncestorOfClass("Workspace") then
            return;
        else
            v17.Visible = false;
            if v72 == v19 then
                v71(v21, l_Character_0, v19.UserPrompt.Text, getChatColor(currentTone()));
                normalEndDialog();
                return;
            else
                local v73 = v20[v72];
                v71(v21, l_Character_0, sanitizeMessage(v73.UserDialog), getChatColor(currentTone()));
                wait(1);
                if not v21 then
                    return;
                else
                    v21:SignalDialogChoiceSelected(l_LocalPlayer_0, v73);
                    v71(v21, v22, sanitizeMessage(v73.ResponseDialog), getChatColor(currentTone()));
                    variableDelay(v73.ResponseDialog);
                    presentDialogChoices(v22, v73:GetChildren(), v73);
                    return;
                end;
            end;
        end;
    end;
end;
newChoice = function() --[[ Line: 357 ]] --[[ Name: newChoice ]]
    -- upvalues: l_Size24_0 (ref), l_UserInputService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Visible = false;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.BackgroundColor3 = Color3.new(0.8901960784313725, 0.8901960784313725, 0.8901960784313725);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Text = "";
    l_TextButton_0.MouseEnter:connect(function() --[[ Line: 367 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 0;
    end);
    l_TextButton_0.MouseLeave:connect(function() --[[ Line: 370 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 1;
    end);
    l_TextButton_0.SelectionImageObject = l_Frame_0;
    l_TextButton_0.Activated:connect(function() --[[ Line: 374 ]]
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
initialize = function(v78) --[[ Line: 404 ]] --[[ Name: initialize ]]
    -- upvalues: v18 (copy), v19 (ref), v1 (ref), v17 (ref), v4 (ref)
    v18[1] = newChoice();
    v18[2] = newChoice();
    v18[3] = newChoice();
    v18[4] = newChoice();
    v19 = newChoice();
    v19.UserPrompt.Text = "Goodbye!";
    v19.Size = UDim2.new(1, 28, 0, v1 + 12);
    v17 = Instance.new("Frame");
    v17.Name = "UserDialogArea";
    v17.Size = UDim2.new(0, v4, 0, 200);
    v17.Style = Enum.FrameStyle.ChatBlue;
    v17.Visible = false;
    for _, v80 in pairs(v18) do
        v80.RobloxLocked = true;
        v80.Parent = v17;
    end;
    v19.RobloxLocked = true;
    v19.Parent = v17;
    v17.RobloxLocked = true;
    v17.Parent = v78;
end;
presentDialogChoices = function(v81, v82, v83) --[[ Line: 432 ]] --[[ Name: presentDialogChoices ]]
    -- upvalues: v21 (ref), v22 (ref), v20 (ref), v18 (copy), v1 (ref), v38 (copy), v19 (ref), v17 (ref), v4 (ref), v39 (copy), l_LocalPlayer_0 (ref), v33 (ref), l_TouchEnabled_0 (copy), v35 (ref), v34 (ref), v10 (ref)
    if not v21 then
        return;
    else
        v22 = v81;
        local v84 = {};
        for _, v86 in pairs(v82) do
            if v86:IsA("DialogChoice") then
                table.insert(v84, v86);
            end;
        end;
        table.sort(v84, function(v87, v88) --[[ Line: 444 ]]
            return v87.Name < v88.Name;
        end);
        if #v84 == 0 then
            normalEndDialog();
            return;
        else
            local v89 = 1;
            local v90 = 0;
            v20 = {};
            for _, v92 in pairs(v18) do
                v92.Visible = false;
            end;
            for _, v94 in pairs(v84) do
                if v89 <= #v18 then
                    v18[v89].Size = UDim2.new(1, 28, 0, v1 * 3);
                    v38:TranslateAndRegister(v18[v89].UserPrompt, v94, v94.UserDialog);
                    local v95 = math.ceil(v18[v89].UserPrompt.TextBounds.Y / v1) * v1 + 12;
                    v18[v89].Position = UDim2.new(0, -11, 0, v90 + -8);
                    v18[v89].Size = UDim2.new(1, 28, 0, v95);
                    v18[v89].Visible = true;
                    v20[v18[v89]] = v94;
                    v90 = v90 + v95 + 1;
                    v89 = v89 + 1;
                end;
            end;
            v19.Size = UDim2.new(1, 28, 0, v1 * 3);
            v19.UserPrompt.Text = v83.GoodbyeDialog == "" and "Goodbye!" or v83.GoodbyeDialog;
            local v96 = math.ceil(v19.UserPrompt.TextBounds.Y / v1) * v1 + 12;
            v19.Size = UDim2.new(1, 28, 0, v96);
            v19.Position = UDim2.new(0, -11, 0, v90 + -8);
            v19.Visible = true;
            if not v83.GoodbyeChoiceActive then
                v19.Visible = false;
                v17.Size = UDim2.new(0, v4, 0, v90 + 34 + -16);
            else
                v17.Size = UDim2.new(0, v4, 0, v90 + v19.AbsoluteSize.Y + 34 + -16);
            end;
            v17.Position = UDim2.new(0, 20, 1, -v17.Size.Y.Offset - 20);
            if v39 then
                local l_TouchGui_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("TouchGui");
                if l_TouchGui_0 then
                    v33 = l_TouchGui_0:FindFirstChild("TouchControlFrame");
                    if v33 then
                        v33.Visible = false;
                    end;
                end;
                v17.Position = UDim2.new(0, 10, 1, -v17.Size.Y.Offset);
            elseif not l_TouchEnabled_0 and not v35.BottomLeftControl.Visible then
                v35.BottomLeftControl.Visible = true;
                v34 = true;
            end;
            styleMainFrame(currentTone());
            v17.Visible = true;
            if v10 then
                game:GetService("GuiService").SelectedCoreObject = v18[1];
            end;
            return;
        end;
    end;
end;
doDialog = function(v98) --[[ Line: 516 ]] --[[ Name: doDialog ]]
    -- upvalues: v21 (ref), l_ContextActionService_0 (copy), v28 (copy), v71 (copy)
    if v98.InitialPrompt == "" then
        warn("Can't start a dialog with an empty InitialPrompt");
        return;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 119 ]]
            -- upvalues: v98 (copy)
            return v98.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
        end);
        local v101 = l_status_2 and l_result_2 or false;
        if v98.InUse and not v101 then
            return;
        else
            v21 = v98;
            v98.InUse = true;
            l_ContextActionService_0:BindCoreAction("Nothing", function() --[[ Line: 530 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            v28:FireServer(v98, true);
            v71(v98, v98.Parent, v98.InitialPrompt, getChatColor(v98.Tone));
            variableDelay(v98.InitialPrompt);
            presentDialogChoices(v98.Parent, v98:GetChildren(), v98);
            return;
        end;
    end;
end;
renewKillswitch = function(v102) --[[ Line: 541 ]] --[[ Name: renewKillswitch ]]
    -- upvalues: v24 (ref), v23 (copy), v28 (copy)
    if v24 then
        v23[v24] = false;
        v24 = nil;
    end;
    v24 = coroutine.create(function(v103) --[[ Line: 547 ]]
        -- upvalues: v23 (ref), v28 (ref), v102 (copy)
        wait(15);
        if v103 ~= nil then
            if v23[v103] == nil then
                v28:FireServer(v102, false);
                v102.InUse = false;
            end;
            v23[v103] = nil;
        end;
    end);
    coroutine.resume(v24, v24);
end;
checkForLeaveArea = function() --[[ Line: 560 ]] --[[ Name: checkForLeaveArea ]]
    -- upvalues: v21 (ref), l_LocalPlayer_0 (ref)
    while v21 do
        if v21.Parent and l_LocalPlayer_0:DistanceFromCharacter(v21.Parent.Position) >= v21.ConversationDistance then
            wanderDialog();
        end;
        wait(1);
    end;
end;
startDialog = function(v104) --[[ Line: 569 ]] --[[ Name: startDialog ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref), v31 (copy)
    if v104.Parent and v104.Parent:IsA("BasePart") then
        l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated");
        if l_LocalPlayer_0:DistanceFromCharacter(v104.Parent.Position) >= v104.ConversationDistance then
            showMessage("You are too far away to chat!", 300);
            return;
        else
            for v105, v106 in pairs(v31) do
                if v105 and v106 then
                    v106.Enabled = false;
                end;
            end;
            renewKillswitch(v104);
            delay(1, checkForLeaveArea);
            doDialog(v104);
        end;
    end;
end;
removeDialog = function(v107) --[[ Line: 591 ]] --[[ Name: removeDialog ]]
    -- upvalues: v31 (copy), v32 (copy)
    if v31[v107] then
        v31[v107]:Destroy();
        v31[v107] = nil;
    end;
    if v32[v107] then
        v32[v107]:disconnect();
        v32[v107] = nil;
    end;
end;
addDialog = function(v108) --[[ Line: 602 ]] --[[ Name: addDialog ]]
    -- upvalues: v11 (ref), l_RbxAnalyticsService_0 (copy), v29 (ref), l_CoreGui_0 (copy), v31 (copy), v32 (copy), v21 (ref)
    if v108.Parent then
        if v108.Parent:IsA("BasePart") and v108:IsDescendantOf(game.Workspace) then
            v11 = true;
            l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId);
            local v109 = v29:clone();
            v109.Adornee = v108.Parent;
            v109.RobloxLocked = true;
            local v110 = not v108.InUse;
            if not v110 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 119 ]]
                    -- upvalues: v108 (copy)
                    return v108.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                end);
                v110 = l_status_3 and l_result_3 or false;
            end;
            v109.Enabled = v110;
            v109.Parent = l_CoreGui_0;
            v109.Background.MouseButton1Click:connect(function() --[[ Line: 614 ]]
                -- upvalues: v108 (copy)
                startDialog(v108);
            end);
            setChatNotificationTone(v109, v108.Purpose, v108.Tone);
            if game:GetEngineFeature("ClosestVisibleDialogAPI") then
                v108:SetGuiObject(v109);
            end;
            v31[v108] = v109;
            v32[v108] = v108.Changed:connect(function(v113) --[[ Line: 624 ]]
                -- upvalues: v108 (copy), v109 (copy), v21 (ref)
                if v113 == "Parent" and v108.Parent then
                    removeDialog(v108);
                    addDialog(v108);
                    return;
                else
                    if v113 == "InUse" then
                        local l_v108_0 = v108;
                        local l_l_v108_0_0 = l_v108_0 --[[ copy: 2 -> 5 ]];
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 119 ]]
                            -- upvalues: l_l_v108_0_0 (copy)
                            return l_l_v108_0_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                        end);
                        if not (l_status_4 and l_result_4 or false) then
                            local l_v109_0 = v109;
                            l_v108_0 = false;
                            if v21 == nil then
                                l_v108_0 = not v108.InUse;
                            end;
                            l_v109_0.Enabled = l_v108_0;
                        else
                            v109.Enabled = v21 ~= v108;
                        end;
                        if not v108.InUse then
                            l_v108_0 = v108;
                            l_status_4, l_result_4 = pcall(function() --[[ Line: 119 ]]
                                -- upvalues: l_v108_0 (copy)
                                return l_v108_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                            end);
                            if not (l_status_4 and l_result_4 or false) and v108 == v21 then
                                timeoutDialog();
                                return;
                            end;
                        end;
                    elseif v113 == "Tone" or v113 == "Purpose" then
                        setChatNotificationTone(v109, v108.Purpose, v108.Tone);
                    end;
                    return;
                end;
            end);
            return;
        else
            v32[v108] = v108.Changed:connect(function(v119) --[[ Line: 644 ]]
                -- upvalues: v108 (copy)
                if v119 == "Parent" and v108.Parent then
                    removeDialog(v108);
                    addDialog(v108);
                end;
            end);
        end;
    end;
end;
onLoad = function() --[[ Line: 655 ]] --[[ Name: onLoad ]]
    -- upvalues: v30 (ref), v35 (ref), l_TouchEnabled_0 (copy), v39 (copy)
    createChatNotificationGui();
    createMessageDialog();
    v30.RobloxLocked = true;
    v30.Parent = v35;
    v35:WaitForChild("BottomLeftControl");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DialogFrame";
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.RobloxLocked = true;
    game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", l_Frame_1);
    if l_TouchEnabled_0 and not v39 then
        l_Frame_1.Position = UDim2.new(0, 20, 0.5, 0);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v35;
    elseif v39 then
        l_Frame_1.Position = UDim2.new(0, 0, 0.9, -10);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v35;
    else
        l_Frame_1.Parent = v35.BottomLeftControl;
    end;
    initialize(l_Frame_1);
    game:GetService("CollectionService").ItemAdded:Connect(function(v121) --[[ Line: 686 ]]
        if v121:IsA("Dialog") then
            addDialog(v121);
        end;
    end);
    game:GetService("CollectionService").ItemRemoved:Connect(function(v122) --[[ Line: 691 ]]
        if v122:IsA("Dialog") then
            removeDialog(v122);
        end;
    end);
    for _, v124 in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
        if v124:IsA("Dialog") then
            addDialog(v124);
        end;
    end;
end;
getLocalHumanoidRootPart = function() --[[ Line: 703 ]] --[[ Name: getLocalHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.Character then
        return l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
    else
        return;
    end;
end;
dialogIsValid = function(v125) --[[ Line: 709 ]] --[[ Name: dialogIsValid ]]
    return v125 and v125.Parent and v125.Parent:IsA("BasePart");
end;
local v126 = nil;
local l_GetClosestDialogToPosition_0 = l_GuiService_0.GetClosestDialogToPosition;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 716 ]]
    -- upvalues: l_GetClosestDialogToPosition_0 (copy), l_GuiService_0 (copy), v21 (ref), l_LocalPlayer_0 (ref), v10 (ref), v126 (ref), v31 (copy), l_ContextActionService_0 (copy)
    local v128 = nil;
    local v129 = getLocalHumanoidRootPart();
    if v129 then
        local l_Position_0 = v129.Position;
        v128 = l_GetClosestDialogToPosition_0(l_GuiService_0, l_Position_0);
    end;
    if getLocalHumanoidRootPart() and dialogIsValid(v128) and v21 == nil then
        local l_TriggerDistance_0 = v128.TriggerDistance;
        local l_TriggerOffset_0 = v128.TriggerOffset;
        local v133 = l_LocalPlayer_0:DistanceFromCharacter(v128.Parent.Position + l_TriggerOffset_0);
        if l_TriggerDistance_0 ~= 0 and v133 < v128.ConversationDistance and v133 < l_TriggerDistance_0 then
            startDialog(v128);
        end;
    end;
    if v10 == true then
        if v129 and game:GetEngineFeature("ClosestVisibleDialogAPI") then
            local l_Position_1 = v129.Position;
            v128 = l_GuiService_0.GetClosestVisibleDialogToPosition(l_GuiService_0, l_Position_1);
        end;
        if v128 ~= v126 then
            if v31[v126] then
                v31[v126].Background.ActivationButton.Visible = false;
            end;
            v126 = v128;
            l_ContextActionService_0:UnbindCoreAction("StartDialogAction");
            if v128 ~= nil then
                l_ContextActionService_0:BindCoreAction("StartDialogAction", function(_, v136, _) --[[ Line: 755 ]]
                    -- upvalues: v128 (ref)
                    if v136 == Enum.UserInputState.Begin and v128 and v128.Parent then
                        startDialog(v128);
                    end;
                end, false, Enum.KeyCode.ButtonX);
                if v31[v128] then
                    v31[v128].Background.ActivationButton.Visible = true;
                end;
            end;
        end;
    end;
end);
local v138 = nil;
l_GuiService_0.Changed:connect(function(v139) --[[ Line: 772 ]]
    -- upvalues: v138 (ref), l_GuiService_0 (copy)
    if v139 == "SelectedCoreObject" then
        if v138 and v138:FindFirstChild("RBXchatDialogSelectionButton") then
            v138:FindFirstChild("RBXchatDialogSelectionButton").Visible = false;
            v138.BackgroundTransparency = 1;
        end;
        v138 = l_GuiService_0.SelectedCoreObject;
        if v138 and v138:FindFirstChild("RBXchatDialogSelectionButton") then
            v138:FindFirstChild("RBXchatDialogSelectionButton").Visible = true;
            v138.BackgroundTransparency = 0;
        end;
    end;
end);
onLoad();