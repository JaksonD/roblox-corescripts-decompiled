return function() --[[ Line: 1 ]] --[[ Name: startDebug ]]
    local l_CoreGui_0 = game:GetService("CoreGui");
    local l_TextChatService_0 = game:GetService("TextChatService");
    local l_game_EngineFeature_0 = game:GetEngineFeature("ExpChatDebuggerIncomingMessageEvent");
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "ExperienceChatDebug";
    l_ScreenGui_0.ResetOnSpawn = false;
    l_ScreenGui_0.DisplayOrder = -1;
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v4 = 7;
    local v5 = {
        {
            vertical = Enum.VerticalAlignment.Top, 
            horizontal = Enum.HorizontalAlignment.Left
        }, 
        {
            vertical = Enum.VerticalAlignment.Top, 
            horizontal = Enum.HorizontalAlignment.Center
        }, 
        {
            vertical = Enum.VerticalAlignment.Top, 
            horizontal = Enum.HorizontalAlignment.Right
        }, 
        {
            vertical = Enum.VerticalAlignment.Center, 
            horizontal = Enum.HorizontalAlignment.Left
        }, 
        {
            vertical = Enum.VerticalAlignment.Center, 
            horizontal = Enum.HorizontalAlignment.Center
        }, 
        {
            vertical = Enum.VerticalAlignment.Center, 
            horizontal = Enum.HorizontalAlignment.Right
        }, 
        {
            vertical = Enum.VerticalAlignment.Bottom, 
            horizontal = Enum.HorizontalAlignment.Left
        }, 
        {
            vertical = Enum.VerticalAlignment.Bottom, 
            horizontal = Enum.HorizontalAlignment.Center
        }, 
        {
            vertical = Enum.VerticalAlignment.Bottom, 
            horizontal = Enum.HorizontalAlignment.Right
        }
    };
    local v6 = {};
    local l_UIListLayout_0 = Instance.new("UIListLayout");
    l_UIListLayout_0.Parent = l_ScreenGui_0;
    local function _() --[[ Line: 30 ]] --[[ Name: updateContainerLayout ]]
        -- upvalues: v5 (copy), v4 (ref), l_UIListLayout_0 (copy)
        local v8 = v5[v4];
        l_UIListLayout_0.VerticalAlignment = v8.vertical;
        l_UIListLayout_0.HorizontalAlignment = v8.horizontal;
    end;
    local v10 = v5[v4];
    l_UIListLayout_0.VerticalAlignment = v10.vertical;
    l_UIListLayout_0.HorizontalAlignment = v10.horizontal;
    v10 = Instance.new("ImageButton");
    v10.AutomaticSize = Enum.AutomaticSize.XY;
    v10.Size = UDim2.new(0, 200, 0, 20);
    v10.BackgroundTransparency = 0.3;
    v10.BackgroundColor3 = Color3.fromRGB(32, 32, 32);
    v10.Parent = l_ScreenGui_0;
    v10.Activated:Connect(function() --[[ Line: 44 ]]
        -- upvalues: v4 (ref), v5 (copy), l_UIListLayout_0 (copy)
        v4 = v4 + 1;
        if v4 > #v5 then
            v4 = 1;
        end;
        local v11 = v5[v4];
        l_UIListLayout_0.VerticalAlignment = v11.vertical;
        l_UIListLayout_0.HorizontalAlignment = v11.horizontal;
    end);
    local function v14() --[[ Line: 53 ]] --[[ Name: clearEntries ]]
        -- upvalues: v6 (ref)
        for _, v13 in v6 do
            v13:Destroy();
        end;
        v6 = {};
    end;
    v10.MouseButton2Click:Connect(v14);
    v10.TouchLongPress:Connect(v14);
    local l_UIListLayout_1 = Instance.new("UIListLayout");
    l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Bottom;
    l_UIListLayout_1.Parent = v10;
    local function v21(v16, v17, v18) --[[ Line: 66 ]] --[[ Name: addEntryToContainer ]]
        -- upvalues: v6 (ref), v10 (copy)
        if #v6 > 10 then
            local v19 = table.remove(v6, 1);
            if v19 then
                v19:Destroy();
            end;
        end;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.AutomaticSize = Enum.AutomaticSize.X;
        l_TextLabel_0.BackgroundTransparency = v18;
        l_TextLabel_0.BackgroundColor3 = v17;
        l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
        l_TextLabel_0.Text = v16;
        l_TextLabel_0.RichText = true;
        l_TextLabel_0.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
        l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        l_TextLabel_0.TextSize = 16;
        l_TextLabel_0.FontFace = Font.fromEnum(Enum.Font.RobotoMono);
        l_TextLabel_0.Size = UDim2.new(0, 0, 0, 18);
        l_TextLabel_0.Parent = v10;
        table.insert(v6, l_TextLabel_0);
    end;
    local v22 = utf8.char(128227);
    local v23 = utf8.char(128229);
    local function v32(v24) --[[ Line: 96 ]] --[[ Name: formatEntry ]]
        -- upvalues: v22 (copy), v23 (copy), v21 (copy)
        local v25 = if v24.Status == Enum.TextChatMessageStatus.Sending then ("%* Sent"):format(v22) else ("%* Rec."):format(v23);
        local v26 = if v24.TextChannel then v24.TextChannel.Name else "Unknown";
        local v27 = v24.Status ~= Enum.TextChatMessageStatus.Success and v24.Status ~= Enum.TextChatMessageStatus.Sending;
        local v28 = if v27 then ("(%*)"):format(v24.Status.Name) else "";
        local v29 = if v27 then Color3.fromRGB(255, 0, 0) else Color3.fromRGB(32, 32, 32);
        local v30 = v27 and 0.5 or 1;
        local v31 = v24.TextChannel and v24.TextChannel.DirectChatRequester and " <font color='#00E344'>(Direct)</font>" or "";
        v21(("%* [%*%*] %* %*"):format(v25, v26, v31, v24.Text, v28), v29, v30);
    end;
    if l_game_EngineFeature_0 then
        l_TextChatService_0.OnIncomingMessageEvent:Connect(v32);
    else
        l_TextChatService_0.MessageReceived:Connect(v32);
        l_TextChatService_0.SendingMessage:Connect(v32);
    end;
    l_ScreenGui_0.Parent = l_CoreGui_0;
end;