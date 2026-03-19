local v0 = {};
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
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
local v14 = nil;
pcall(function() --[[ Line: 34 ]]
    -- upvalues: v14 (ref)
    v14 = require(game:GetService("Chat").ClientChatModules.ChatLocalization);
end);
if v14 == nil then
    v14 = {
        Get = function(_, _, v17) --[[ Line: 35 ]] --[[ Name: Get ]]
            return v17;
        end
    };
end;
local v18 = {};
v18.__index = v18;
v18.CreateGuiObjects = function(v19, v20) --[[ Line: 42 ]] --[[ Name: CreateGuiObjects ]]
    -- upvalues: l_ChatSettings_0 (copy)
    v19.ChatBarParentFrame = v20;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Selectable = false;
    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_0.BackgroundTransparency = 0.6;
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.BackgroundColor3 = l_ChatSettings_0.ChatBarBackGroundColor;
    l_Frame_0.Parent = v20;
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
    l_TextButton_0.TextColor3 = v19:GetDefaultChannelNameColor();
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
    v19.GuiObject = l_Frame_0;
    v19.TextBox = l_TextBox_0;
    v19.TextLabel = l_TextLabel_0;
    v19.GuiObjects.BaseFrame = l_Frame_0;
    v19.GuiObjects.TextBoxFrame = l_Frame_1;
    v19.GuiObjects.TextBox = l_TextBox_0;
    v19.GuiObjects.TextLabel = l_TextLabel_0;
    v19.GuiObjects.MessageModeTextButton = l_TextButton_0;
    v19:AnimGuiObjects();
    v19:SetUpTextBoxEvents(l_TextBox_0, l_TextLabel_0, l_TextButton_0);
    if v19.UserHasChatOff then
        v19:DoLockChatBar();
    end;
    v19.eGuiObjectsChanged:Fire();
end;
v18.DoLockChatBar = function(v27) --[[ Line: 141 ]] --[[ Name: DoLockChatBar ]]
    -- upvalues: l_LocalPlayer_0 (ref), v14 (ref)
    if v27.TextLabel then
        if l_LocalPlayer_0.UserId > 0 then
            v27.TextLabel.Text = v14:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.");
        else
            v27.TextLabel.Text = v14:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.");
        end;
        v27:CalculateSize();
    end;
    if v27.TextBox then
        v27.TextBox.Active = false;
        v27.TextBox.Focused:connect(function() --[[ Line: 158 ]]
            -- upvalues: v27 (copy)
            v27.TextBox:ReleaseFocus();
        end);
    end;
end;
v18.SetUpTextBoxEvents = function(v28, v29, v30, v31) --[[ Line: 164 ]] --[[ Name: SetUpTextBoxEvents ]]
    -- upvalues: l_UserInputService_0 (copy), l_ChatSettings_0 (copy)
    for v32, v33 in pairs(v28.TextBoxConnections) do
        v33:disconnect();
        v28.TextBoxConnections[v32] = nil;
    end;
    v28.TextBoxConnections.UserInputBegan = l_UserInputService_0.InputBegan:connect(function(v34, _) --[[ Line: 172 ]]
        -- upvalues: v28 (copy), v29 (copy), l_ChatSettings_0 (ref)
        if v34.KeyCode == Enum.KeyCode.Backspace and v28:IsFocused() and v29.Text == "" then
            v28:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
        end;
    end);
    v28.TextBoxConnections.TextBoxChanged = v29.Changed:connect(function(v36) --[[ Line: 180 ]]
        -- upvalues: v28 (copy), v29 (copy), l_ChatSettings_0 (ref)
        if v36 == "AbsoluteSize" then
            v28:CalculateSize();
            return;
        elseif v36 ~= "Text" then
            return;
        else
            v28:CalculateSize();
            if utf8.len(utf8.nfcnormalize(v29.Text)) > l_ChatSettings_0.MaximumMessageLength then
                v29.Text = v28.PreviousText;
            else
                v28.PreviousText = v29.Text;
            end;
            if not v28.InCustomState then
                local v37 = v28.CommandProcessor:ProcessInProgressChatMessage(v29.Text, v28.ChatWindow, v28);
                if v37 then
                    v28.InCustomState = true;
                    v28.CustomState = v37;
                    return;
                end;
            else
                v28.CustomState:TextUpdated();
            end;
            return;
        end;
    end);
    local function _(v38) --[[ Line: 209 ]] --[[ Name: UpdateOnFocusStatusChanged ]]
        -- upvalues: v29 (copy), v30 (copy)
        if v38 or v29.Text ~= "" then
            v30.Visible = false;
            return;
        else
            v30.Visible = true;
            return;
        end;
    end;
    v28.TextBoxConnections.MessageModeClick = v31.MouseButton1Click:connect(function() --[[ Line: 217 ]]
        -- upvalues: v31 (copy), v28 (copy), l_ChatSettings_0 (ref)
        if v31.Text ~= "" then
            v28:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
        end;
    end);
    v28.TextBoxConnections.TextBoxFocused = v29.Focused:connect(function() --[[ Line: 223 ]]
        -- upvalues: v28 (copy), v30 (copy)
        if not v28.UserHasChatOff then
            v28:CalculateSize();
            v30.Visible = false;
        end;
    end);
    v28.TextBoxConnections.TextBoxFocusLost = v29.FocusLost:connect(function(_, v41) --[[ Line: 230 ]]
        -- upvalues: v28 (copy), v29 (copy), v30 (copy)
        v28:CalculateSize();
        if v41 and v41.KeyCode == Enum.KeyCode.Escape then
            v29.Text = "";
        end;
        if v29.Text ~= "" then
            v30.Visible = false;
            return;
        else
            v30.Visible = true;
            return;
        end;
    end);
end;
v18.GetTextBox = function(v42) --[[ Line: 239 ]] --[[ Name: GetTextBox ]]
    return v42.TextBox;
end;
v18.GetMessageModeTextButton = function(v43) --[[ Line: 243 ]] --[[ Name: GetMessageModeTextButton ]]
    return v43.GuiObjects.MessageModeTextButton;
end;
v18.GetMessageModeTextLabel = function(v44) --[[ Line: 249 ]] --[[ Name: GetMessageModeTextLabel ]]
    return v44:GetMessageModeTextButton();
end;
v18.IsFocused = function(v45) --[[ Line: 253 ]] --[[ Name: IsFocused ]]
    if v45.UserHasChatOff then
        return false;
    else
        return v45:GetTextBox():IsFocused();
    end;
end;
v18.GetVisible = function(v46) --[[ Line: 261 ]] --[[ Name: GetVisible ]]
    return v46.GuiObject.Visible;
end;
v18.CaptureFocus = function(v47) --[[ Line: 265 ]] --[[ Name: CaptureFocus ]]
    if not v47.UserHasChatOff then
        v47:GetTextBox():CaptureFocus();
    end;
end;
v18.ReleaseFocus = function(v48, v49) --[[ Line: 271 ]] --[[ Name: ReleaseFocus ]]
    v48:GetTextBox():ReleaseFocus(v49);
end;
v18.ResetText = function(v50) --[[ Line: 275 ]] --[[ Name: ResetText ]]
    v50:GetTextBox().Text = "";
end;
v18.SetText = function(v51, v52) --[[ Line: 279 ]] --[[ Name: SetText ]]
    v51:GetTextBox().Text = v52;
end;
v18.GetEnabled = function(v53) --[[ Line: 283 ]] --[[ Name: GetEnabled ]]
    return v53.GuiObject.Visible;
end;
v18.SetEnabled = function(v54, v55) --[[ Line: 287 ]] --[[ Name: SetEnabled ]]
    if v54.UserHasChatOff then
        v54.GuiObject.Visible = true;
        return;
    else
        v54.GuiObject.Visible = v55;
        return;
    end;
end;
v18.SetTextLabelText = function(v56, v57) --[[ Line: 297 ]] --[[ Name: SetTextLabelText ]]
    if not v56.UserHasChatOff then
        v56.TextLabel.Text = v57;
    end;
end;
v18.SetTextBoxText = function(v58, v59) --[[ Line: 303 ]] --[[ Name: SetTextBoxText ]]
    v58.TextBox.Text = v59;
end;
v18.GetTextBoxText = function(v60) --[[ Line: 307 ]] --[[ Name: GetTextBoxText ]]
    return v60.TextBox.Text;
end;
v18.ResetSize = function(v61) --[[ Line: 311 ]] --[[ Name: ResetSize ]]
    v61.TargetYSize = 0;
    v61:TweenToTargetYSize();
end;
local function _(v62) --[[ Line: 316 ]] --[[ Name: measureSize ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v62.Text, v62.TextSize, v62.Font, Vector2.new(v62.AbsoluteSize.X, 10000));
end;
v18.CalculateSize = function(v64) --[[ Line: 325 ]] --[[ Name: CalculateSize ]]
    -- upvalues: l_TextService_0 (copy)
    if v64.CalculatingSizeLock then
        return;
    else
        v64.CalculatingSizeLock = true;
        local v65 = nil;
        local v66 = nil;
        if v64:IsFocused() or v64.TextBox.Text ~= "" then
            v65 = v64.TextBox.TextSize;
            local l_TextBox_1 = v64.TextBox;
            v66 = l_TextService_0:GetTextSize(l_TextBox_1.Text, l_TextBox_1.TextSize, l_TextBox_1.Font, Vector2.new(l_TextBox_1.AbsoluteSize.X, 10000)).Y;
        else
            v65 = v64.TextLabel.TextSize;
            local l_TextLabel_1 = v64.TextLabel;
            v66 = l_TextService_0:GetTextSize(l_TextLabel_1.Text, l_TextLabel_1.TextSize, l_TextLabel_1.Font, Vector2.new(l_TextLabel_1.AbsoluteSize.X, 10000)).Y;
        end;
        local v69 = v66 - v65;
        if v64.TargetYSize ~= v69 then
            v64.TargetYSize = v69;
            v64:TweenToTargetYSize();
        end;
        v64.CalculatingSizeLock = false;
        return;
    end;
end;
v18.TweenToTargetYSize = function(v70) --[[ Line: 351 ]] --[[ Name: TweenToTargetYSize ]]
    local v71 = UDim2.new(1, 0, 1, v70.TargetYSize);
    local l_Size_0 = v70.GuiObject.Size;
    local l_Y_0 = v70.GuiObject.AbsoluteSize.Y;
    v70.GuiObject.Size = v71;
    local l_Y_1 = v70.GuiObject.AbsoluteSize.Y;
    v70.GuiObject.Size = l_Size_0;
    local v75 = math.min(1, math.abs(l_Y_1 - l_Y_0) * (1 / v70.TweenPixelsPerSecond));
    if not pcall(function() --[[ Line: 363 ]]
        -- upvalues: v70 (copy), v71 (copy), v75 (copy)
        v70.GuiObject:TweenSize(v71, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v75, true);
    end) then
        v70.GuiObject.Size = v71;
    end;
end;
v18.SetTextSize = function(v76, v77) --[[ Line: 369 ]] --[[ Name: SetTextSize ]]
    if not v76:IsInCustomState() then
        if v76.TextBox then
            v76.TextBox.TextSize = v77;
        end;
        if v76.TextLabel then
            v76.TextLabel.TextSize = v77;
        end;
    end;
end;
v18.GetDefaultChannelNameColor = function(_) --[[ Line: 380 ]] --[[ Name: GetDefaultChannelNameColor ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if l_ChatSettings_0.DefaultChannelNameColor then
        return l_ChatSettings_0.DefaultChannelNameColor;
    else
        return Color3.fromRGB(35, 76, 142);
    end;
end;
v18.SetChannelTarget = function(v79, v80) --[[ Line: 387 ]] --[[ Name: SetChannelTarget ]]
    -- upvalues: l_ChatSettings_0 (copy), v14 (ref)
    local l_MessageModeTextButton_0 = v79.GuiObjects.MessageModeTextButton;
    local l_TextBox_2 = v79.TextBox;
    local l_TextLabel_2 = v79.TextLabel;
    v79.TargetChannel = v80;
    if not v79:IsInCustomState() then
        if v80 ~= l_ChatSettings_0.GeneralChannelName then
            l_MessageModeTextButton_0.Size = UDim2.new(0, 1000, 1, 0);
            local l_v80_0 = v80;
            if v14.tryLocalize then
                l_v80_0 = v14:tryLocalize(v80);
            end;
            l_MessageModeTextButton_0.Text = string.format("[%s] ", l_v80_0);
            local l_v79_ChannelNameColor_0 = v79:GetChannelNameColor(v80);
            if l_v79_ChannelNameColor_0 then
                l_MessageModeTextButton_0.TextColor3 = l_v79_ChannelNameColor_0;
            else
                l_MessageModeTextButton_0.TextColor3 = v79:GetDefaultChannelNameColor();
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
v18.IsInCustomState = function(v87) --[[ Line: 427 ]] --[[ Name: IsInCustomState ]]
    return v87.InCustomState;
end;
v18.ResetCustomState = function(v88) --[[ Line: 431 ]] --[[ Name: ResetCustomState ]]
    -- upvalues: v14 (ref)
    if v88.InCustomState then
        v88.CustomState:Destroy();
        v88.CustomState = nil;
        v88.InCustomState = false;
        v88.ChatBarParentFrame:ClearAllChildren();
        v88:CreateGuiObjects(v88.ChatBarParentFrame);
        v88:SetTextLabelText(v14:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"));
    end;
end;
v18.EnterWhisperState = function(v89, v90) --[[ Line: 448 ]] --[[ Name: EnterWhisperState ]]
    -- upvalues: l_Whisper_0 (copy), l_ChatSettings_0 (copy)
    v89:ResetCustomState();
    if l_Whisper_0.CustomStateCreator then
        v89.CustomState = l_Whisper_0.CustomStateCreator(v90, v89.ChatWindow, v89, l_ChatSettings_0);
        v89.InCustomState = true;
    else
        local _ = nil;
        v89:SetText("/w " .. if l_ChatSettings_0.PlayerDisplayNamesEnabled then v90.DisplayName else v90.Name);
    end;
    v89:CaptureFocus();
end;
v18.GetCustomMessage = function(v92) --[[ Line: 472 ]] --[[ Name: GetCustomMessage ]]
    if v92.InCustomState then
        return v92.CustomState:GetMessage();
    else
        return nil;
    end;
end;
v18.CustomStateProcessCompletedMessage = function(v93, _) --[[ Line: 479 ]] --[[ Name: CustomStateProcessCompletedMessage ]]
    if v93.InCustomState then
        return v93.CustomState:ProcessCompletedMessage();
    else
        return false;
    end;
end;
v18.FadeOutBackground = function(v95, v96) --[[ Line: 486 ]] --[[ Name: FadeOutBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v95.AnimParams.Background_TargetTransparency = 1;
    v95.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v96);
    v95:FadeOutText(v96);
end;
v18.FadeInBackground = function(v97, v98) --[[ Line: 492 ]] --[[ Name: FadeInBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v97.AnimParams.Background_TargetTransparency = 0.6;
    v97.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v98);
    v97:FadeInText(v98);
end;
v18.FadeOutText = function(v99, v100) --[[ Line: 498 ]] --[[ Name: FadeOutText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v99.AnimParams.Text_TargetTransparency = 1;
    v99.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v100);
end;
v18.FadeInText = function(v101, v102) --[[ Line: 503 ]] --[[ Name: FadeInText ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v101.AnimParams.Text_TargetTransparency = 0.4;
    v101.AnimParams.Text_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v102);
end;
v18.AnimGuiObjects = function(v103) --[[ Line: 508 ]] --[[ Name: AnimGuiObjects ]]
    v103.GuiObject.BackgroundTransparency = v103.AnimParams.Background_CurrentTransparency;
    v103.GuiObjects.TextBoxFrame.BackgroundTransparency = v103.AnimParams.Background_CurrentTransparency;
    v103.GuiObjects.TextLabel.TextTransparency = v103.AnimParams.Text_CurrentTransparency;
    v103.GuiObjects.TextBox.TextTransparency = v103.AnimParams.Text_CurrentTransparency;
    v103.GuiObjects.MessageModeTextButton.TextTransparency = v103.AnimParams.Text_CurrentTransparency;
end;
v18.InitializeAnimParams = function(v104) --[[ Line: 517 ]] --[[ Name: InitializeAnimParams ]]
    v104.AnimParams.Text_TargetTransparency = 0.4;
    v104.AnimParams.Text_CurrentTransparency = 0.4;
    v104.AnimParams.Text_NormalizedExptValue = 1;
    v104.AnimParams.Background_TargetTransparency = 0.6;
    v104.AnimParams.Background_CurrentTransparency = 0.6;
    v104.AnimParams.Background_NormalizedExptValue = 1;
end;
v18.Update = function(v105, v106) --[[ Line: 527 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v105.AnimParams.Text_CurrentTransparency = l_CurveUtil_0:Expt(v105.AnimParams.Text_CurrentTransparency, v105.AnimParams.Text_TargetTransparency, v105.AnimParams.Text_NormalizedExptValue, v106);
    v105.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v105.AnimParams.Background_CurrentTransparency, v105.AnimParams.Background_TargetTransparency, v105.AnimParams.Background_NormalizedExptValue, v106);
    v105:AnimGuiObjects();
end;
v18.SetChannelNameColor = function(v107, v108, v109) --[[ Line: 544 ]] --[[ Name: SetChannelNameColor ]]
    v107.ChannelNameColors[v108] = v109;
    if v107.GuiObjects.MessageModeTextButton.Text == v108 then
        v107.GuiObjects.MessageModeTextButton.TextColor3 = v109;
    end;
end;
v18.GetChannelNameColor = function(v110, v111) --[[ Line: 551 ]] --[[ Name: GetChannelNameColor ]]
    return v110.ChannelNameColors[v111];
end;
v0.new = function(v112, v113) --[[ Line: 558 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), l_ChatSettings_0 (copy), l_Chat_0 (copy), l_LocalPlayer_0 (ref), l_RunService_0 (copy)
    local v114 = setmetatable({}, v18);
    v114.GuiObject = nil;
    v114.ChatBarParentFrame = nil;
    v114.TextBox = nil;
    v114.TextLabel = nil;
    v114.GuiObjects = {};
    v114.eGuiObjectsChanged = Instance.new("BindableEvent");
    v114.GuiObjectsChanged = v114.eGuiObjectsChanged.Event;
    v114.TextBoxConnections = {};
    v114.PreviousText = "";
    v114.InCustomState = false;
    v114.CustomState = nil;
    v114.TargetChannel = nil;
    v114.CommandProcessor = v112;
    v114.ChatWindow = v113;
    v114.TweenPixelsPerSecond = 500;
    v114.TargetYSize = 0;
    v114.AnimParams = {};
    v114.CalculatingSizeLock = false;
    v114.ChannelNameColors = {};
    v114.UserHasChatOff = false;
    v114:InitializeAnimParams();
    l_ChatSettings_0.SettingsChanged:connect(function(v115, v116) --[[ Line: 590 ]]
        -- upvalues: v114 (copy)
        if v115 == "ChatBarTextSize" then
            v114:SetTextSize(v116);
        end;
    end);
    coroutine.wrap(function() --[[ Line: 596 ]]
        -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref), l_RunService_0 (ref), v114 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 597 ]]
            -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
        end);
        if (l_status_0 and (l_RunService_0:IsStudio() or l_result_0)) == false then
            v114.UserHasChatOff = true;
            v114:DoLockChatBar();
        end;
    end)();
    return v114;
end;
return v0;