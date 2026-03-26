local v0 = {};
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_Chat_0 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_0:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local l_CommandModules_0 = l_ClientChatModules_0:WaitForChild("CommandModules");
local l_Whisper_0 = require(l_CommandModules_0:WaitForChild("Whisper"));
local _ = require(l_Parent_0:WaitForChild("MessageSender"));
local v15 = nil;
pcall(function() --[[ Line: 36 ]]
    -- upvalues: v15 (ref)
    v15 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v15 == nil then
    v15 = {
        Get = function(_, _, v18) --[[ Line: 37 ]] --[[ Name: Get ]]
            return v18;
        end
    };
end;
local v19 = {};
v19.__index = v19;
v19.CreateGuiObjects = function(v20, v21) --[[ Line: 44 ]] --[[ Name: CreateGuiObjects ]]
    -- upvalues: l_ChatSettings_0 (copy)
    v20.ChatBarParentFrame = v21;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 0.6;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = l_ChatSettings_0.ChatBarBackGroundColor;
    l_Frame_0.Parent = v21;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "BoxFrame";
    l_Frame_1.BackgroundTransparency = 0.6;
    l_Frame_1.BorderSizePixel = 0;
    l_Frame_1.BackgroundColor3 = l_ChatSettings_0.ChatBarBoxColor;
    l_Frame_1.Size = UDim2.new(1, -14, 1, -14);
    l_Frame_1.Position = UDim2.new(0, 7, 0, 7);
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Size = UDim2.new(1, -10, 1, -10);
    l_Frame_2.Position = UDim2.new(0, 5, 0, 5);
    l_Frame_2.Parent = l_Frame_1;
    local l_TextBox_0 = Instance.new("TextBox");
    l_TextBox_0.Selectable = l_ChatSettings_0.GamepadNavigationEnabled;
    l_TextBox_0.Name = "ChatBar";
    l_TextBox_0.BackgroundTransparency = 1;
    l_TextBox_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextBox_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextBox_0.TextSize = l_ChatSettings_0.ChatBarTextSize;
    l_TextBox_0.Font = l_ChatSettings_0.ChatBarFont;
    l_TextBox_0.TextColor3 = l_ChatSettings_0.ChatBarTextColor;
    l_TextBox_0.TextTransparency = 0.4;
    l_TextBox_0.TextStrokeTransparency = 1;
    l_TextBox_0.ClearTextOnFocus = false;
    l_TextBox_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextBox_0.TextYAlignment = Enum.TextYAlignment.Top;
    l_TextBox_0.TextWrapped = true;
    l_TextBox_0.Text = "";
    l_TextBox_0.Parent = l_Frame_2;
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Selectable = false;
    l_TextButton_0.Name = "MessageMode";
    l_TextButton_0.BackgroundTransparency = 1;
    l_TextButton_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextButton_0.TextSize = l_ChatSettings_0.ChatBarTextSize;
    l_TextButton_0.Font = l_ChatSettings_0.ChatBarFont;
    l_TextButton_0.TextXAlignment = Enum.TextXAlignment.Left;
    l_TextButton_0.TextWrapped = true;
    l_TextButton_0.Text = "";
    l_TextButton_0.Size = UDim2.new(0, 0, 0, 0);
    l_TextButton_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextButton_0.TextColor3 = v20:GetDefaultChannelNameColor();
    l_TextButton_0.Visible = true;
    l_TextButton_0.Parent = l_Frame_2;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Selectable = false;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Size = l_TextBox_0.Size;
    l_TextLabel_0.Position = l_TextBox_0.Position;
    l_TextLabel_0.TextSize = l_TextBox_0.TextSize;
    l_TextLabel_0.Font = l_TextBox_0.Font;
    l_TextLabel_0.TextColor3 = l_TextBox_0.TextColor3;
    l_TextLabel_0.TextTransparency = l_TextBox_0.TextTransparency;
    l_TextLabel_0.TextStrokeTransparency = l_TextBox_0.TextStrokeTransparency;
    l_TextLabel_0.TextXAlignment = l_TextBox_0.TextXAlignment;
    l_TextLabel_0.TextYAlignment = l_TextBox_0.TextYAlignment;
    l_TextLabel_0.Text = "...";
    l_TextLabel_0.Parent = l_Frame_2;
    v20.GuiObject = l_Frame_0;
    v20.TextBox = l_TextBox_0;
    v20.TextLabel = l_TextLabel_0;
    v20.GuiObjects.BaseFrame = l_Frame_0;
    v20.GuiObjects.TextBoxFrame = l_Frame_1;
    v20.GuiObjects.TextBox = l_TextBox_0;
    v20.GuiObjects.TextLabel = l_TextLabel_0;
    v20.GuiObjects.MessageModeTextButton = l_TextButton_0;
    v20:AnimGuiObjects();
    v20:SetUpTextBoxEvents(l_TextBox_0, l_TextLabel_0, l_TextButton_0);
    if v20.UserHasChatOff then
        v20:DoLockChatBar();
    end;
    v20.eGuiObjectsChanged:Fire();
end;
v19.DoLockChatBar = function(v28) --[[ Line: 143 ]] --[[ Name: DoLockChatBar ]]
    -- upvalues: l_LocalPlayer_0 (ref), v15 (ref)
    if v28.TextLabel then
        if l_LocalPlayer_0.UserId > 0 then
            v28.TextLabel.Text = v15:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.");
        else
            v28.TextLabel.Text = v15:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.");
        end;
        v28:CalculateSize();
    end;
    if v28.TextBox then
        v28.TextBox.Active = false;
        v28.TextBox.Focused:connect(function() --[[ Line: 160 ]]
            -- upvalues: v28 (copy)
            v28.TextBox:ReleaseFocus();
        end);
    end;
end;
v19.SetUpTextBoxEvents = function(v29, v30, v31, v32) --[[ Line: 166 ]] --[[ Name: SetUpTextBoxEvents ]]
    -- upvalues: l_UserInputService_0 (copy), l_ChatSettings_0 (copy)
    for v33, v34 in pairs(v29.TextBoxConnections) do
        v34:disconnect();
        v29.TextBoxConnections[v33] = nil;
    end;
    v29.TextBoxConnections.UserInputBegan = l_UserInputService_0.InputBegan:connect(function(v35, _) --[[ Line: 174 ]]
        -- upvalues: v29 (copy), v30 (copy), l_ChatSettings_0 (ref)
        if v35.KeyCode == Enum.KeyCode.Backspace and v29:IsFocused() and v30.Text == "" then
            v29:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
        end;
    end);
    v29.TextBoxConnections.TextBoxChanged = v30.Changed:connect(function(v37) --[[ Line: 182 ]]
        -- upvalues: v29 (copy), v30 (copy), l_ChatSettings_0 (ref)
        if v37 == "AbsoluteSize" then
            v29:CalculateSize();
            return;
        elseif v37 ~= "Text" then
            return;
        else
            v29:CalculateSize();
            if utf8.len(utf8.nfcnormalize(v30.Text)) > l_ChatSettings_0.MaximumMessageLength then
                v30.Text = v29.PreviousText;
            else
                v29.PreviousText = v30.Text;
            end;
            if not v29.InCustomState then
                local v38 = v29.CommandProcessor:ProcessInProgressChatMessage(v30.Text, v29.ChatWindow, v29);
                if v38 then
                    v29.InCustomState = true;
                    v29.CustomState = v38;
                    return;
                end;
            else
                v29.CustomState:TextUpdated();
            end;
            return;
        end;
    end);
    local function _(v39) --[[ Line: 211 ]] --[[ Name: UpdateOnFocusStatusChanged ]]
        -- upvalues: v30 (copy), v31 (copy)
        if v39 or v30.Text ~= "" then
            v31.Visible = false;
            return;
        else
            v31.Visible = true;
            return;
        end;
    end;
    v29.TextBoxConnections.MessageModeClick = v32.MouseButton1Click:connect(function() --[[ Line: 219 ]]
        -- upvalues: v32 (copy), v29 (copy), l_ChatSettings_0 (ref)
        if v32.Text ~= "" then
            v29:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
        end;
    end);
    v29.TextBoxConnections.TextBoxFocused = v30.Focused:connect(function() --[[ Line: 225 ]]
        -- upvalues: v29 (copy), v31 (copy)
        if not v29.UserHasChatOff then
            v29:CalculateSize();
            v31.Visible = false;
        end;
    end);
    v29.TextBoxConnections.TextBoxFocusLost = v30.FocusLost:connect(function(_, v42) --[[ Line: 232 ]]
        -- upvalues: v29 (copy), v30 (copy), v31 (copy)
        v29:CalculateSize();
        if v42 and v42.KeyCode == Enum.KeyCode.Escape then
            v30.Text = "";
        end;
        if v30.Text ~= "" then
            v31.Visible = false;
            return;
        else
            v31.Visible = true;
            return;
        end;
    end);
end;
v19.GetTextBox = function(v43) --[[ Line: 241 ]] --[[ Name: GetTextBox ]]
    return v43.TextBox;
end;
v19.GetMessageModeTextButton = function(v44) --[[ Line: 245 ]] --[[ Name: GetMessageModeTextButton ]]
    return v44.GuiObjects.MessageModeTextButton;
end;
v19.GetMessageModeTextLabel = function(v45) --[[ Line: 251 ]] --[[ Name: GetMessageModeTextLabel ]]
    return v45:GetMessageModeTextButton();
end;
v19.IsFocused = function(v46) --[[ Line: 255 ]] --[[ Name: IsFocused ]]
    if v46.UserHasChatOff then
        return false;
    else
        return v46:GetTextBox():IsFocused();
    end;
end;
v19.GetVisible = function(v47) --[[ Line: 263 ]] --[[ Name: GetVisible ]]
    return v47.GuiObject.Visible;
end;
v19.CaptureFocus = function(v48) --[[ Line: 267 ]] --[[ Name: CaptureFocus ]]
    if not v48.UserHasChatOff then
        v48:GetTextBox():CaptureFocus();
    end;
end;
v19.ReleaseFocus = function(v49, v50) --[[ Line: 273 ]] --[[ Name: ReleaseFocus ]]
    v49:GetTextBox():ReleaseFocus(v50);
end;
v19.ResetText = function(v51) --[[ Line: 277 ]] --[[ Name: ResetText ]]
    v51:GetTextBox().Text = "";
end;
v19.SetText = function(v52, v53) --[[ Line: 281 ]] --[[ Name: SetText ]]
    v52:GetTextBox().Text = v53;
end;
v19.GetEnabled = function(v54) --[[ Line: 285 ]] --[[ Name: GetEnabled ]]
    return v54.GuiObject.Visible;
end;
v19.SetEnabled = function(v55, v56) --[[ Line: 289 ]] --[[ Name: SetEnabled ]]
    if v55.UserHasChatOff then
        v55.GuiObject.Visible = true;
        return;
    else
        v55.GuiObject.Visible = v56;
        return;
    end;
end;
v19.SetTextLabelText = function(v57, v58) --[[ Line: 299 ]] --[[ Name: SetTextLabelText ]]
    if not v57.UserHasChatOff then
        v57.TextLabel.Text = v58;
    end;
end;
v19.SetTextBoxText = function(v59, v60) --[[ Line: 305 ]] --[[ Name: SetTextBoxText ]]
    v59.TextBox.Text = v60;
end;
v19.GetTextBoxText = function(v61) --[[ Line: 309 ]] --[[ Name: GetTextBoxText ]]
    return v61.TextBox.Text;
end;
v19.ResetSize = function(v62) --[[ Line: 313 ]] --[[ Name: ResetSize ]]
    v62.TargetYSize = 0;
    v62:TweenToTargetYSize();
end;
local function _(v63) --[[ Line: 318 ]] --[[ Name: measureSize ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v63.Text, v63.TextSize, v63.Font, Vector2.new(v63.AbsoluteSize.X, 10000));
end;
v19.CalculateSize = function(v65) --[[ Line: 327 ]] --[[ Name: CalculateSize ]]
    -- upvalues: l_TextService_0 (copy)
    if v65.CalculatingSizeLock then
        return;
    else
        v65.CalculatingSizeLock = true;
        local v66 = nil;
        local v67 = nil;
        if v65:IsFocused() or v65.TextBox.Text ~= "" then
            v66 = v65.TextBox.TextSize;
            local l_TextBox_1 = v65.TextBox;
            v67 = l_TextService_0:GetTextSize(l_TextBox_1.Text, l_TextBox_1.TextSize, l_TextBox_1.Font, Vector2.new(l_TextBox_1.AbsoluteSize.X, 10000)).Y;
        else
            v66 = v65.TextLabel.TextSize;
            local l_TextLabel_1 = v65.TextLabel;
            v67 = l_TextService_0:GetTextSize(l_TextLabel_1.Text, l_TextLabel_1.TextSize, l_TextLabel_1.Font, Vector2.new(l_TextLabel_1.AbsoluteSize.X, 10000)).Y;
        end;
        local v70 = v67 - v66;
        if v65.TargetYSize ~= v70 then
            v65.TargetYSize = v70;
            v65:TweenToTargetYSize();
        end;
        v65.CalculatingSizeLock = false;
        return;
    end;
end;
v19.TweenToTargetYSize = function(v71) --[[ Line: 353 ]] --[[ Name: TweenToTargetYSize ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    local v72 = UDim2.new(1, 0, 1, v71.TargetYSize);
    local l_Size_0 = v71.GuiObject.Size;
    local l_Y_0 = v71.GuiObject.AbsoluteSize.Y;
    v71.GuiObject.Size = v72;
    local l_Y_1 = v71.GuiObject.AbsoluteSize.Y;
    v71.GuiObject.Size = l_Size_0;
    local v76 = math.min(1, math.abs(l_Y_1 - l_Y_0) * (1 / v71.TweenPixelsPerSecond));
    if not pcall(function() --[[ Line: 365 ]]
        -- upvalues: l_game_EngineFeature_0 (ref), v71 (copy), v72 (copy), v76 (copy)
        if l_game_EngineFeature_0 then
            v71.GuiObject:TweenSizeInternal(v72, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v76, true);
            return;
        else
            v71.GuiObject:TweenSize(v72, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v76, true);
            return;
        end;
    end) then
        v71.GuiObject.Size = v72;
    end;
end;
v19.SetTextSize = function(v77, v78) --[[ Line: 377 ]] --[[ Name: SetTextSize ]]
    if not v77:IsInCustomState() then
        if v77.TextBox then
            v77.TextBox.TextSize = v78;
        end;
        if v77.TextLabel then
            v77.TextLabel.TextSize = v78;
        end;
    end;
end;
v19.GetDefaultChannelNameColor = function(_) --[[ Line: 388 ]] --[[ Name: GetDefaultChannelNameColor ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if l_ChatSettings_0.DefaultChannelNameColor then
        return l_ChatSettings_0.DefaultChannelNameColor;
    else
        return Color3.fromRGB(35, 76, 142);
    end;
end;
v19.SetChannelTarget = function(v80, v81) --[[ Line: 395 ]] --[[ Name: SetChannelTarget ]]
    -- upvalues: l_ChatSettings_0 (copy), v15 (ref)
    local l_MessageModeTextButton_0 = v80.GuiObjects.MessageModeTextButton;
    local l_TextBox_2 = v80.TextBox;
    local l_TextLabel_2 = v80.TextLabel;
    v80.TargetChannel = v81;
    if not v80:IsInCustomState() then
        if v81 ~= l_ChatSettings_0.GeneralChannelName then
            l_MessageModeTextButton_0.Size = UDim2.new(0, 1000, 1, 0);
            local l_v81_0 = v81;
            if v15.tryLocalize then
                l_v81_0 = v15:tryLocalize(v81);
            end;
            l_MessageModeTextButton_0.Text = string.format("[%s] ", l_v81_0);
            local l_v80_ChannelNameColor_0 = v80:GetChannelNameColor(v81);
            if l_v80_ChannelNameColor_0 then
                l_MessageModeTextButton_0.TextColor3 = l_v80_ChannelNameColor_0;
            else
                l_MessageModeTextButton_0.TextColor3 = v80:GetDefaultChannelNameColor();
            end;
            local l_X_0 = l_MessageModeTextButton_0.TextBounds.X;
            l_MessageModeTextButton_0.Size = UDim2.new(0, l_X_0, 1, 0);
            l_TextBox_2.Size = UDim2.new(1, -l_X_0, 1, 0);
            l_TextBox_2.Position = UDim2.new(0, l_X_0, 0, 0);
            l_TextLabel_2.Size = UDim2.new(1, -l_X_0, 1, 0);
            l_TextLabel_2.Position = UDim2.new(0, l_X_0, 0, 0);
            return;
        else
            l_MessageModeTextButton_0.Text = "";
            l_MessageModeTextButton_0.Size = UDim2.new(0, 0, 0, 0);
            l_TextBox_2.Size = UDim2.new(1, 0, 1, 0);
            l_TextBox_2.Position = UDim2.new(0, 0, 0, 0);
            l_TextLabel_2.Size = UDim2.new(1, 0, 1, 0);
            l_TextLabel_2.Position = UDim2.new(0, 0, 0, 0);
        end;
    end;
end;
v19.IsInCustomState = function(v88) --[[ Line: 435 ]] --[[ Name: IsInCustomState ]]
    return v88.InCustomState;
end;
v19.ResetCustomState = function(v89) --[[ Line: 439 ]] --[[ Name: ResetCustomState ]]
    -- upvalues: v15 (ref)
    if v89.InCustomState then
        v89.CustomState:Destroy();
        v89.CustomState = nil;
        v89.InCustomState = false;
        v89.ChatBarParentFrame:ClearAllChildren();
        v89:CreateGuiObjects(v89.ChatBarParentFrame);
        v89:SetTextLabelText(v15:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
    end;
end;
v19.EnterWhisperState = function(v90, v91) --[[ Line: 456 ]] --[[ Name: EnterWhisperState ]]
    -- upvalues: l_Whisper_0 (copy), l_ChatSettings_0 (copy)
    v90:ResetCustomState();
    if l_Whisper_0.CustomStateCreator then
        v90.CustomState = l_Whisper_0.CustomStateCreator(v91, v90.ChatWindow, v90, l_ChatSettings_0);
        v90.InCustomState = true;
    else
        local _ = nil;
        v90:SetText("/w " .. if l_ChatSettings_0.PlayerDisplayNamesEnabled then v91.DisplayName else v91.Name);
    end;
    v90:CaptureFocus();
end;
v19.GetCustomMessage = function(v93) --[[ Line: 480 ]] --[[ Name: GetCustomMessage ]]
    if v93.InCustomState then
        return v93.CustomState:GetMessage();
    else
        return nil;
    end;
end;
v19.CustomStateProcessCompletedMessage = function(v94, _) --[[ Line: 487 ]] --[[ Name: CustomStateProcessCompletedMessage ]]
    if v94.InCustomState then
        return v94.CustomState:ProcessCompletedMessage();
    else
        return false;
    end;
end;
v19.FadeOutBackground = function(v96, v97) --[[ Line: 494 ]] --[[ Name: FadeOutBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v96.AnimParams.Background_TargetTransparency = 1;
    v96.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v97);
    v96:FadeOutText(v97);
end;
v19.FadeInBackground = function(v98, v99) --[[ Line: 500 ]] --[[ Name: FadeInBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v98.AnimParams.Background_TargetTransparency = 0.6;
    v98.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v99);
    v98:FadeInText(v99);
end;
v19.FadeOutText = function(v100, v101) --[[ Line: 506 ]] --[[ Name: FadeOutText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v100.AnimParams.Text_TargetTransparency = 1;
    v100.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v101);
end;
v19.FadeInText = function(v102, v103) --[[ Line: 511 ]] --[[ Name: FadeInText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v102.AnimParams.Text_TargetTransparency = 0.4;
    v102.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v103);
end;
v19.AnimGuiObjects = function(v104) --[[ Line: 516 ]] --[[ Name: AnimGuiObjects ]]
    v104.GuiObject.BackgroundTransparency = v104.AnimParams.Background_CurrentTransparency;
    v104.GuiObjects.TextBoxFrame.BackgroundTransparency = v104.AnimParams.Background_CurrentTransparency;
    v104.GuiObjects.TextLabel.TextTransparency = v104.AnimParams.Text_CurrentTransparency;
    v104.GuiObjects.TextBox.TextTransparency = v104.AnimParams.Text_CurrentTransparency;
    v104.GuiObjects.MessageModeTextButton.TextTransparency = v104.AnimParams.Text_CurrentTransparency;
end;
v19.InitializeAnimParams = function(v105) --[[ Line: 525 ]] --[[ Name: InitializeAnimParams ]]
    v105.AnimParams.Text_TargetTransparency = 0.4;
    v105.AnimParams.Text_CurrentTransparency = 0.4;
    v105.AnimParams.Text_NormalizedExptValue = 1;
    v105.AnimParams.Background_TargetTransparency = 0.6;
    v105.AnimParams.Background_CurrentTransparency = 0.6;
    v105.AnimParams.Background_NormalizedExptValue = 1;
end;
v19.Update = function(v106, v107) --[[ Line: 535 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v106.AnimParams.Text_CurrentTransparency = l_CurveUtil_0:Expt(v106.AnimParams.Text_CurrentTransparency, v106.AnimParams.Text_TargetTransparency, v106.AnimParams.Text_NormalizedExptValue, v107);
    v106.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v106.AnimParams.Background_CurrentTransparency, v106.AnimParams.Background_TargetTransparency, v106.AnimParams.Background_NormalizedExptValue, v107);
    v106:AnimGuiObjects();
end;
v19.SetChannelNameColor = function(v108, v109, v110) --[[ Line: 552 ]] --[[ Name: SetChannelNameColor ]]
    v108.ChannelNameColors[v109] = v110;
    if v108.GuiObjects.MessageModeTextButton.Text == v109 then
        v108.GuiObjects.MessageModeTextButton.TextColor3 = v110;
    end;
end;
v19.GetChannelNameColor = function(v111, v112) --[[ Line: 559 ]] --[[ Name: GetChannelNameColor ]]
    return v111.ChannelNameColors[v112];
end;
v0.new = function(v113, v114) --[[ Line: 566 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy), l_ChatSettings_0 (copy), l_Chat_0 (copy), l_LocalPlayer_0 (ref), l_RunService_0 (copy)
    local v115 = setmetatable({}, v19);
    v115.GuiObject = nil;
    v115.ChatBarParentFrame = nil;
    v115.TextBox = nil;
    v115.TextLabel = nil;
    v115.GuiObjects = {};
    v115.eGuiObjectsChanged = Instance.new("BindableEvent");
    v115.GuiObjectsChanged = v115.eGuiObjectsChanged.Event;
    v115.TextBoxConnections = {};
    v115.PreviousText = "";
    v115.InCustomState = false;
    v115.CustomState = nil;
    v115.TargetChannel = nil;
    v115.CommandProcessor = v113;
    v115.ChatWindow = v114;
    v115.TweenPixelsPerSecond = 500;
    v115.TargetYSize = 0;
    v115.AnimParams = {};
    v115.CalculatingSizeLock = false;
    v115.ChannelNameColors = {};
    v115.UserHasChatOff = false;
    v115:InitializeAnimParams();
    l_ChatSettings_0.SettingsChanged:connect(function(v116, v117) --[[ Line: 598 ]]
        -- upvalues: v115 (copy)
        if v116 == "ChatBarTextSize" then
            v115:SetTextSize(v117);
        end;
    end);
    coroutine.wrap(function() --[[ Line: 604 ]]
        -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref), l_RunService_0 (ref), v115 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 605 ]]
            -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
        end);
        if (l_status_0 and (l_RunService_0:IsStudio() or l_result_0)) == false then
            v115.UserHasChatOff = true;
            v115:DoLockChatBar();
        end;
    end)();
    return v115;
end;
return v0;