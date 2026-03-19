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
local v18 = nil;
local v19 = {};
local v20 = nil;
local v21 = {};
local v22 = nil;
local v23 = nil;
local v24 = {};
local v25 = nil;
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v29 = game:GetService("RobloxReplicatedStorage"):WaitForChild("SetDialogInUse", 1e999);
local v30 = nil;
local v31 = nil;
local v32 = {};
local v33 = {};
local v34 = nil;
local v35 = false;
local v36 = nil;
local v37 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v38 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v39 = require(l_RobloxGui_0.Modules.GameTranslator);
local v40 = v38:IsSmallTouchScreen();
if v37 then
    l_Size24_0 = Enum.FontSize.Size36;
    v1 = 36;
    v4 = 500;
elseif v40 then
    l_Size24_0 = Enum.FontSize.Size14;
    v1 = 14;
    v4 = 250;
end;
v36 = if l_RobloxGui_0:FindFirstChild("ControlFrame") then l_RobloxGui_0.ControlFrame else l_RobloxGui_0;
local l_TouchEnabled_0 = game:GetService("UserInputService").TouchEnabled;
local function _(v42) --[[ Line: 120 ]] --[[ Name: isDialogMultiplePlayers ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 121 ]]
        -- upvalues: v42 (copy)
        return v42.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    return l_status_0 and l_result_0 or false;
end;
currentTone = function() --[[ Line: 125 ]] --[[ Name: currentTone ]]
    -- upvalues: v22 (ref)
    if v22 then
        return v22.Tone;
    else
        return Enum.DialogTone.Neutral;
    end;
end;
createChatNotificationGui = function() --[[ Line: 134 ]] --[[ Name: createChatNotificationGui ]]
    -- upvalues: v30 (ref), v3 (copy), l_UserInputService_0 (copy)
    v30 = Instance.new("BillboardGui");
    v30.Name = "ChatNotificationGui";
    v30.ExtentsOffset = Vector3.new(0, 1, 0, 0);
    v30.Size = UDim2.new(v3.X / 31.5, 0, v3.Y / 31.5, 0);
    v30.SizeOffset = Vector2.new(0, 0);
    v30.StudsOffset = Vector3.new(0, 3.700000047683716, 0, 0);
    v30.Enabled = true;
    v30.RobloxLocked = true;
    v30.Active = true;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "Background";
    l_ImageButton_0.Active = false;
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_ImageButton_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageButton_0.Image = "";
    l_ImageButton_0.Parent = v30;
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
getChatColor = function(v49) --[[ Line: 172 ]] --[[ Name: getChatColor ]]
    if v49 == Enum.DialogTone.Neutral then
        return Enum.ChatColor.Blue;
    elseif v49 == Enum.DialogTone.Friendly then
        return Enum.ChatColor.Green;
    elseif v49 == Enum.DialogTone.Enemy then
        return Enum.ChatColor.Red;
    else
        return;
    end;
end;
styleChoices = function() --[[ Line: 182 ]] --[[ Name: styleChoices ]]
    -- upvalues: v19 (copy), v20 (ref)
    for _, v51 in pairs(v19) do
        v51.BackgroundTransparency = 1;
    end;
    v20.BackgroundTransparency = 1;
end;
styleMainFrame = function(v52) --[[ Line: 189 ]] --[[ Name: styleMainFrame ]]
    -- upvalues: v18 (ref)
    if v52 == Enum.DialogTone.Neutral then
        v18.Style = Enum.FrameStyle.ChatBlue;
    elseif v52 == Enum.DialogTone.Friendly then
        v18.Style = Enum.FrameStyle.ChatGreen;
    elseif v52 == Enum.DialogTone.Enemy then
        v18.Style = Enum.FrameStyle.ChatRed;
    end;
    styleChoices();
end;
setChatNotificationTone = function(v53, v54, v55) --[[ Line: 200 ]] --[[ Name: setChatNotificationTone ]]
    -- upvalues: v0 (copy), v3 (copy)
    if v55 == Enum.DialogTone.Neutral then
        v53.Background.Image = "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png";
    elseif v55 == Enum.DialogTone.Friendly then
        v53.Background.Image = "rbxasset://textures/ui/chatBubble_green_notify_bkg.png";
    elseif v55 == Enum.DialogTone.Enemy then
        v53.Background.Image = "rbxasset://textures/ui/chatBubble_red_notify_bkg.png";
    end;
    local v56, v57 = unpack(v0[v54]);
    local v58 = v57 / v3;
    v53.Background.Icon.Size = UDim2.new(v58.X, 0, v58.Y, 0);
    v53.Background.Icon.Position = UDim2.new(0.5 - v58.X / 2, 0, 0.4 - v58.Y / 2, 0);
    v53.Background.Icon.Image = v56;
end;
createMessageDialog = function() --[[ Line: 216 ]] --[[ Name: createMessageDialog ]]
    -- upvalues: v31 (ref)
    v31 = Instance.new("Frame");
    v31.Name = "DialogScriptMessage";
    v31.Style = Enum.FrameStyle.Custom;
    v31.BackgroundTransparency = 0.5;
    v31.BackgroundColor3 = Color3.new(0.12156862745098039, 0.12156862745098039, 0.12156862745098039);
    v31.Visible = false;
    v31.RobloxLocked = true;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Text";
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, -1);
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.FontSize = Enum.FontSize.Size14;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.Parent = v31;
end;
showMessage = function(v60, v61) --[[ Line: 235 ]] --[[ Name: showMessage ]]
    -- upvalues: v31 (ref)
    v31.Text.Text = v60;
    v31.Size = UDim2.new(0, v61, 0, 40);
    v31.Position = UDim2.new(0.5, -v61 / 2, 0.5, -40);
    v31.Visible = true;
    wait(2);
    v31.Visible = false;
end;
variableDelay = function(v62) --[[ Line: 244 ]] --[[ Name: variableDelay ]]
    local v63 = math.min(string.len(v62), 100);
    wait(v63 / 75 * 1.5 + 0.75);
end;
resetColor = function(v64) --[[ Line: 249 ]] --[[ Name: resetColor ]]
    v64.BackgroundTransparency = 1;
end;
wanderDialog = function() --[[ Line: 253 ]] --[[ Name: wanderDialog ]]
    -- upvalues: v18 (ref)
    v18.Visible = false;
    endDialog();
    showMessage("Chat ended because you walked away", 350);
end;
timeoutDialog = function() --[[ Line: 259 ]] --[[ Name: timeoutDialog ]]
    -- upvalues: v18 (ref)
    v18.Visible = false;
    endDialog();
    showMessage("Chat ended because you didn't reply", 350);
end;
normalEndDialog = function() --[[ Line: 265 ]] --[[ Name: normalEndDialog ]]
    endDialog();
end;
endDialog = function() --[[ Line: 269 ]] --[[ Name: endDialog ]]
    -- upvalues: v25 (ref), v24 (copy), v22 (ref), v29 (copy), v32 (copy), l_ContextActionService_0 (copy), v23 (ref), v34 (ref), v13 (copy), v35 (ref), v36 (ref), l_GuiService_0 (copy), v18 (ref)
    if v25 then
        v24[v25] = false;
        v25 = nil;
    end;
    local l_v22_0 = v22;
    v22 = nil;
    if l_v22_0 and l_v22_0.InUse then
        delay(5, function() --[[ Line: 279 ]]
            -- upvalues: v29 (ref), l_v22_0 (copy)
            v29:FireServer(l_v22_0, false);
            l_v22_0.InUse = false;
        end);
    end;
    for v66, v67 in pairs(v32) do
        if v66 and v67 then
            v67.Enabled = not v66.InUse;
        end;
    end;
    l_ContextActionService_0:UnbindCoreAction("Nothing");
    v23 = nil;
    if v34 then
        v34.Visible = true;
    end;
    if v13 and v35 then
        v36.BottomLeftControl.Visible = false;
    end;
    if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent == v18 then
        l_GuiService_0.SelectedCoreObject = nil;
    end;
end;
sanitizeMessage = function(v68) --[[ Line: 308 ]] --[[ Name: sanitizeMessage ]]
    if string.len(v68) == 0 then
        return "...";
    else
        return v68;
    end;
end;
local function v72(v69, ...) --[[ Line: 316 ]] --[[ Name: chatFunc ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 121 ]]
        -- upvalues: v69 (copy)
        return v69.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
    end);
    if l_status_1 and l_result_1 or false then
        game:GetService("Chat"):ChatLocal(...);
        return;
    else
        game:GetService("Chat"):Chat(...);
        return;
    end;
end;
selectChoice = function(v73) --[[ Line: 324 ]] --[[ Name: selectChoice ]]
    -- upvalues: v22 (ref), l_Character_0 (ref), v18 (ref), v20 (ref), v72 (copy), v21 (ref), l_LocalPlayer_0 (ref), v23 (ref)
    if not v22 then
        return;
    else
        renewKillswitch(v22);
        if not l_Character_0:FindFirstAncestorOfClass("Workspace") then
            return;
        else
            v18.Visible = false;
            if v73 == v20 then
                v72(v22, l_Character_0, v20.UserPrompt.Text, getChatColor(currentTone()));
                normalEndDialog();
                return;
            else
                local v74 = v21[v73];
                v72(v22, l_Character_0, sanitizeMessage(v74.UserDialog), getChatColor(currentTone()));
                wait(1);
                if not v22 then
                    return;
                else
                    v22:SignalDialogChoiceSelected(l_LocalPlayer_0, v74);
                    v72(v22, v23, sanitizeMessage(v74.ResponseDialog), getChatColor(currentTone()));
                    variableDelay(v74.ResponseDialog);
                    presentDialogChoices(v23, v74:GetChildren(), v74);
                    return;
                end;
            end;
        end;
    end;
end;
newChoice = function() --[[ Line: 359 ]] --[[ Name: newChoice ]]
    -- upvalues: l_Size24_0 (ref), l_UserInputService_0 (copy)
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Visible = false;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.BackgroundColor3 = Color3.new(0.8901960784313725, 0.8901960784313725, 0.8901960784313725);
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.AutoButtonColor = false;
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Text = "";
    l_TextButton_0.MouseEnter:connect(function() --[[ Line: 369 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 0;
    end);
    l_TextButton_0.MouseLeave:connect(function() --[[ Line: 372 ]]
        -- upvalues: l_TextButton_0 (copy)
        l_TextButton_0.BackgroundTransparency = 1;
    end);
    l_TextButton_0.SelectionImageObject = l_Frame_0;
    l_TextButton_0.Activated:connect(function() --[[ Line: 376 ]]
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
initialize = function(v79) --[[ Line: 406 ]] --[[ Name: initialize ]]
    -- upvalues: v19 (copy), v20 (ref), v1 (ref), v18 (ref), v4 (ref)
    v19[1] = newChoice();
    v19[2] = newChoice();
    v19[3] = newChoice();
    v19[4] = newChoice();
    v20 = newChoice();
    v20.UserPrompt.Text = "Goodbye!";
    v20.Size = UDim2.new(1, 28, 0, v1 + 12);
    v18 = Instance.new("Frame");
    v18.Name = "UserDialogArea";
    v18.Size = UDim2.new(0, v4, 0, 200);
    v18.Style = Enum.FrameStyle.ChatBlue;
    v18.Visible = false;
    for _, v81 in pairs(v19) do
        v81.RobloxLocked = true;
        v81.Parent = v18;
    end;
    v20.RobloxLocked = true;
    v20.Parent = v18;
    v18.RobloxLocked = true;
    v18.Parent = v79;
end;
presentDialogChoices = function(v82, v83, v84) --[[ Line: 434 ]] --[[ Name: presentDialogChoices ]]
    -- upvalues: v22 (ref), v23 (ref), v21 (ref), v19 (copy), v1 (ref), v39 (copy), v20 (ref), v18 (ref), v4 (ref), v40 (copy), l_LocalPlayer_0 (ref), v34 (ref), v13 (copy), l_TouchEnabled_0 (copy), v36 (ref), v35 (ref), v10 (ref)
    if not v22 then
        return;
    else
        v23 = v82;
        local v85 = {};
        for _, v87 in pairs(v83) do
            if v87:IsA("DialogChoice") then
                table.insert(v85, v87);
            end;
        end;
        table.sort(v85, function(v88, v89) --[[ Line: 446 ]]
            return v88.Name < v89.Name;
        end);
        if #v85 == 0 then
            normalEndDialog();
            return;
        else
            local v90 = 1;
            local v91 = 0;
            v21 = {};
            for _, v93 in pairs(v19) do
                v93.Visible = false;
            end;
            for _, v95 in pairs(v85) do
                if v90 <= #v19 then
                    v19[v90].Size = UDim2.new(1, 28, 0, v1 * 3);
                    v39:TranslateAndRegister(v19[v90].UserPrompt, v95, v95.UserDialog);
                    local v96 = math.ceil(v19[v90].UserPrompt.TextBounds.Y / v1) * v1 + 12;
                    v19[v90].Position = UDim2.new(0, -11, 0, v91 + -8);
                    v19[v90].Size = UDim2.new(1, 28, 0, v96);
                    v19[v90].Visible = true;
                    v21[v19[v90]] = v95;
                    v91 = v91 + v96 + 1;
                    v90 = v90 + 1;
                end;
            end;
            v20.Size = UDim2.new(1, 28, 0, v1 * 3);
            v20.UserPrompt.Text = v84.GoodbyeDialog == "" and "Goodbye!" or v84.GoodbyeDialog;
            local v97 = math.ceil(v20.UserPrompt.TextBounds.Y / v1) * v1 + 12;
            v20.Size = UDim2.new(1, 28, 0, v97);
            v20.Position = UDim2.new(0, -11, 0, v91 + -8);
            v20.Visible = true;
            if not v84.GoodbyeChoiceActive then
                v20.Visible = false;
                v18.Size = UDim2.new(0, v4, 0, v91 + 34 + -16);
            else
                v18.Size = UDim2.new(0, v4, 0, v91 + v20.AbsoluteSize.Y + 34 + -16);
            end;
            v18.Position = UDim2.new(0, 20, 1, -v18.Size.Y.Offset - 20);
            if v40 then
                local l_TouchGui_0 = l_LocalPlayer_0.PlayerGui:FindFirstChild("TouchGui");
                if l_TouchGui_0 then
                    v34 = l_TouchGui_0:FindFirstChild("TouchControlFrame");
                    if v34 then
                        v34.Visible = false;
                    end;
                end;
                v18.Position = UDim2.new(0, 10, 1, -v18.Size.Y.Offset);
            elseif v13 and not l_TouchEnabled_0 and not v36.BottomLeftControl.Visible then
                v36.BottomLeftControl.Visible = true;
                v35 = true;
            end;
            styleMainFrame(currentTone());
            v18.Visible = true;
            if v10 then
                game:GetService("GuiService").SelectedCoreObject = v19[1];
            end;
            return;
        end;
    end;
end;
doDialog = function(v99) --[[ Line: 518 ]] --[[ Name: doDialog ]]
    -- upvalues: v22 (ref), l_ContextActionService_0 (copy), v29 (copy), v72 (copy)
    if v99.InitialPrompt == "" then
        warn("Can't start a dialog with an empty InitialPrompt");
        return;
    else
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 121 ]]
            -- upvalues: v99 (copy)
            return v99.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
        end);
        local v102 = l_status_2 and l_result_2 or false;
        if v99.InUse and not v102 then
            return;
        else
            v22 = v99;
            v99.InUse = true;
            l_ContextActionService_0:BindCoreAction("Nothing", function() --[[ Line: 532 ]]

            end, false, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
            v29:FireServer(v99, true);
            v72(v99, v99.Parent, v99.InitialPrompt, getChatColor(v99.Tone));
            variableDelay(v99.InitialPrompt);
            presentDialogChoices(v99.Parent, v99:GetChildren(), v99);
            return;
        end;
    end;
end;
renewKillswitch = function(v103) --[[ Line: 543 ]] --[[ Name: renewKillswitch ]]
    -- upvalues: v25 (ref), v24 (copy), v29 (copy)
    if v25 then
        v24[v25] = false;
        v25 = nil;
    end;
    v25 = coroutine.create(function(v104) --[[ Line: 549 ]]
        -- upvalues: v24 (ref), v29 (ref), v103 (copy)
        wait(15);
        if v104 ~= nil then
            if v24[v104] == nil then
                v29:FireServer(v103, false);
                v103.InUse = false;
            end;
            v24[v104] = nil;
        end;
    end);
    coroutine.resume(v25, v25);
end;
checkForLeaveArea = function() --[[ Line: 562 ]] --[[ Name: checkForLeaveArea ]]
    -- upvalues: v22 (ref), l_LocalPlayer_0 (ref)
    while v22 do
        if v22.Parent and l_LocalPlayer_0:DistanceFromCharacter(v22.Parent.Position) >= v22.ConversationDistance then
            wanderDialog();
        end;
        wait(1);
    end;
end;
startDialog = function(v105) --[[ Line: 571 ]] --[[ Name: startDialog ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref), v32 (copy)
    if v105.Parent and v105.Parent:IsA("BasePart") then
        l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Conversation Initiated");
        if l_LocalPlayer_0:DistanceFromCharacter(v105.Parent.Position) >= v105.ConversationDistance then
            showMessage("You are too far away to chat!", 300);
            return;
        else
            for v106, v107 in pairs(v32) do
                if v106 and v107 then
                    v107.Enabled = false;
                end;
            end;
            renewKillswitch(v105);
            delay(1, checkForLeaveArea);
            doDialog(v105);
        end;
    end;
end;
removeDialog = function(v108) --[[ Line: 593 ]] --[[ Name: removeDialog ]]
    -- upvalues: v32 (copy), v33 (copy)
    if v32[v108] then
        v32[v108]:Destroy();
        v32[v108] = nil;
    end;
    if v33[v108] then
        v33[v108]:disconnect();
        v33[v108] = nil;
    end;
end;
addDialog = function(v109) --[[ Line: 604 ]] --[[ Name: addDialog ]]
    -- upvalues: v11 (ref), l_RbxAnalyticsService_0 (copy), v30 (ref), l_CoreGui_0 (copy), v32 (copy), v33 (copy), v22 (ref)
    if v109.Parent then
        if v109.Parent:IsA("BasePart") and v109:IsDescendantOf(game.Workspace) then
            v11 = true;
            l_RbxAnalyticsService_0:TrackEvent("Dialogue", "Old Dialogue", "Used In Place", nil, game.PlaceId);
            local v110 = v30:clone();
            v110.Adornee = v109.Parent;
            v110.RobloxLocked = true;
            local v111 = not v109.InUse;
            if not v111 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 121 ]]
                    -- upvalues: v109 (copy)
                    return v109.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                end);
                v111 = l_status_3 and l_result_3 or false;
            end;
            v110.Enabled = v111;
            v110.Parent = l_CoreGui_0;
            v110.Background.MouseButton1Click:connect(function() --[[ Line: 616 ]]
                -- upvalues: v109 (copy)
                startDialog(v109);
            end);
            setChatNotificationTone(v110, v109.Purpose, v109.Tone);
            if game:GetEngineFeature("ClosestVisibleDialogAPI") then
                v109:SetGuiObject(v110);
            end;
            v32[v109] = v110;
            v33[v109] = v109.Changed:connect(function(v114) --[[ Line: 626 ]]
                -- upvalues: v109 (copy), v110 (copy), v22 (ref)
                if v114 == "Parent" and v109.Parent then
                    removeDialog(v109);
                    addDialog(v109);
                    return;
                else
                    if v114 == "InUse" then
                        local l_v109_0 = v109;
                        local l_l_v109_0_0 = l_v109_0 --[[ copy: 2 -> 5 ]];
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 121 ]]
                            -- upvalues: l_l_v109_0_0 (copy)
                            return l_l_v109_0_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                        end);
                        if not (l_status_4 and l_result_4 or false) then
                            local l_v110_0 = v110;
                            l_v109_0 = false;
                            if v22 == nil then
                                l_v109_0 = not v109.InUse;
                            end;
                            l_v110_0.Enabled = l_v109_0;
                        else
                            v110.Enabled = v22 ~= v109;
                        end;
                        if not v109.InUse then
                            l_v109_0 = v109;
                            l_status_4, l_result_4 = pcall(function() --[[ Line: 121 ]]
                                -- upvalues: l_v109_0 (copy)
                                return l_v109_0.BehaviorType == Enum.DialogBehaviorType.MultiplePlayers;
                            end);
                            if not (l_status_4 and l_result_4 or false) and v109 == v22 then
                                timeoutDialog();
                                return;
                            end;
                        end;
                    elseif v114 == "Tone" or v114 == "Purpose" then
                        setChatNotificationTone(v110, v109.Purpose, v109.Tone);
                    end;
                    return;
                end;
            end);
            return;
        else
            v33[v109] = v109.Changed:connect(function(v120) --[[ Line: 646 ]]
                -- upvalues: v109 (copy)
                if v120 == "Parent" and v109.Parent then
                    removeDialog(v109);
                    addDialog(v109);
                end;
            end);
        end;
    end;
end;
onLoad = function() --[[ Line: 657 ]] --[[ Name: onLoad ]]
    -- upvalues: v31 (ref), v36 (ref), l_TouchEnabled_0 (copy), v40 (copy)
    createChatNotificationGui();
    createMessageDialog();
    v31.RobloxLocked = true;
    v31.Parent = v36;
    v36:WaitForChild("BottomLeftControl");
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "DialogFrame";
    l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_1.Size = UDim2.new(0, 0, 0, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.RobloxLocked = true;
    game:GetService("GuiService"):AddSelectionParent("RBXDialogGroup", l_Frame_1);
    if l_TouchEnabled_0 and not v40 then
        l_Frame_1.Position = UDim2.new(0, 20, 0.5, 0);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v36;
    elseif v40 then
        l_Frame_1.Position = UDim2.new(0, 0, 0.9, -10);
        l_Frame_1.Size = UDim2.new(0.25, 0, 0.1, 0);
        l_Frame_1.Parent = v36;
    else
        l_Frame_1.Parent = v36.BottomLeftControl;
    end;
    initialize(l_Frame_1);
    game:GetService("CollectionService").ItemAdded:Connect(function(v122) --[[ Line: 688 ]]
        if v122:IsA("Dialog") then
            addDialog(v122);
        end;
    end);
    game:GetService("CollectionService").ItemRemoved:Connect(function(v123) --[[ Line: 693 ]]
        if v123:IsA("Dialog") then
            removeDialog(v123);
        end;
    end);
    for _, v125 in pairs(game:GetService("CollectionService"):GetCollection("Dialog")) do
        if v125:IsA("Dialog") then
            addDialog(v125);
        end;
    end;
end;
getLocalHumanoidRootPart = function() --[[ Line: 705 ]] --[[ Name: getLocalHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    if l_LocalPlayer_0.Character then
        return l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
    else
        return;
    end;
end;
dialogIsValid = function(v126) --[[ Line: 711 ]] --[[ Name: dialogIsValid ]]
    return v126 and v126.Parent and v126.Parent:IsA("BasePart");
end;
local v127 = nil;
local l_GetClosestDialogToPosition_0 = l_GuiService_0.GetClosestDialogToPosition;
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 718 ]]
    -- upvalues: l_GetClosestDialogToPosition_0 (copy), l_GuiService_0 (copy), v22 (ref), l_LocalPlayer_0 (ref), v10 (ref), v127 (ref), v32 (copy), l_ContextActionService_0 (copy)
    local v129 = nil;
    local v130 = getLocalHumanoidRootPart();
    if v130 then
        local l_Position_0 = v130.Position;
        v129 = l_GetClosestDialogToPosition_0(l_GuiService_0, l_Position_0);
    end;
    if getLocalHumanoidRootPart() and dialogIsValid(v129) and v22 == nil then
        local l_TriggerDistance_0 = v129.TriggerDistance;
        local l_TriggerOffset_0 = v129.TriggerOffset;
        local v134 = l_LocalPlayer_0:DistanceFromCharacter(v129.Parent.Position + l_TriggerOffset_0);
        if l_TriggerDistance_0 ~= 0 and v134 < v129.ConversationDistance and v134 < l_TriggerDistance_0 then
            startDialog(v129);
        end;
    end;
    if v10 == true then
        if v130 and game:GetEngineFeature("ClosestVisibleDialogAPI") then
            local l_Position_1 = v130.Position;
            v129 = l_GuiService_0.GetClosestVisibleDialogToPosition(l_GuiService_0, l_Position_1);
        end;
        if v129 ~= v127 then
            if v32[v127] then
                v32[v127].Background.ActivationButton.Visible = false;
            end;
            v127 = v129;
            l_ContextActionService_0:UnbindCoreAction("StartDialogAction");
            if v129 ~= nil then
                l_ContextActionService_0:BindCoreAction("StartDialogAction", function(_, v137, _) --[[ Line: 757 ]]
                    -- upvalues: v129 (ref)
                    if v137 == Enum.UserInputState.Begin and v129 and v129.Parent then
                        startDialog(v129);
                    end;
                end, false, Enum.KeyCode.ButtonX);
                if v32[v129] then
                    v32[v129].Background.ActivationButton.Visible = true;
                end;
            end;
        end;
    end;
end);
local v139 = nil;
l_GuiService_0.Changed:connect(function(v140) --[[ Line: 774 ]]
    -- upvalues: v139 (ref), l_GuiService_0 (copy)
    if v140 == "SelectedCoreObject" then
        if v139 and v139:FindFirstChild("RBXchatDialogSelectionButton") then
            v139:FindFirstChild("RBXchatDialogSelectionButton").Visible = false;
            v139.BackgroundTransparency = 1;
        end;
        v139 = l_GuiService_0.SelectedCoreObject;
        if v139 and v139:FindFirstChild("RBXchatDialogSelectionButton") then
            v139:FindFirstChild("RBXchatDialogSelectionButton").Visible = true;
            v139.BackgroundTransparency = 0;
        end;
    end;
end);
onLoad();