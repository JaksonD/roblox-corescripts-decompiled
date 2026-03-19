local v0 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixOverlappingRtlChatMessages2");
end);
if l_status_0 then
    v0 = l_result_0;
end;
l_status_0 = game:GetService("TextService");
l_result_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_result_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_result_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_result_0.LocalPlayer;
end;
local l_Parent_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_Parent_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_Parent_0:WaitForChild("ChatConstants"));
local v7 = {};
local v8 = {};
v8.__index = v8;
v8.GetStringTextBounds = function(_, v10, v11, v12, v13) --[[ Line: 66 ]] --[[ Name: GetStringTextBounds ]]
    -- upvalues: l_status_0 (copy)
    local v14 = v13 or Vector2.new(10000, 10000);
    return l_status_0:GetTextSize(v10, v12, v11, v14);
end;
v8.GetMessageHeight = function(v15, v16, v17, v18) --[[ Line: 72 ]] --[[ Name: GetMessageHeight ]]
    -- upvalues: v0 (ref)
    v18 = v18 or v17.AbsoluteSize.X;
    local l_v15_StringTextBounds_0 = v15:GetStringTextBounds(if v0 then v16.ContentText else v16.Text, v16.Font, v16.TextSize, Vector2.new(v18, 1000));
    if l_v15_StringTextBounds_0.Y ~= math.floor(l_v15_StringTextBounds_0.Y) then
        return l_v15_StringTextBounds_0.Y + 1;
    else
        return l_v15_StringTextBounds_0.Y;
    end;
end;
v8.GetNumberOfSpaces = function(v20, v21, v22, v23) --[[ Line: 84 ]] --[[ Name: GetNumberOfSpaces ]]
    local l_v20_StringTextBounds_0 = v20:GetStringTextBounds(v21, v22, v23);
    local l_v20_StringTextBounds_1 = v20:GetStringTextBounds(" ", v22, v23);
    return (math.ceil(l_v20_StringTextBounds_0.X / l_v20_StringTextBounds_1.X));
end;
v8.CreateLeadingSpaces = function(_, v27) --[[ Line: 90 ]] --[[ Name: CreateLeadingSpaces ]]
    -- upvalues: v0 (ref)
    if v0 then
        return "<font dir=\"ltr\">" .. string.rep(" ", v27) .. "</font>";
    else
        return string.rep(" ", v27);
    end;
end;
v8.SanitizeForRichText = function(_, v29) --[[ Line: 98 ]] --[[ Name: SanitizeForRichText ]]
    -- upvalues: v0 (ref)
    if v0 then
        return string.gsub(v29, "%p", {
            ["<"] = "&lt;", 
            [">"] = "&gt;", 
            ["&"] = "&amp;"
        });
    else
        return v29;
    end;
end;
v8.CreateBaseMessage = function(v30, v31, v32, v33, v34) --[[ Line: 110 ]] --[[ Name: CreateBaseMessage ]]
    -- upvalues: v0 (ref)
    local l_v30_FromObjectPool_0 = v30:GetFromObjectPool("Frame");
    l_v30_FromObjectPool_0.Selectable = false;
    l_v30_FromObjectPool_0.Size = UDim2.new(1, 0, 0, 18);
    l_v30_FromObjectPool_0.Visible = true;
    l_v30_FromObjectPool_0.BackgroundTransparency = 1;
    local l_v30_FromObjectPool_1 = v30:GetFromObjectPool("TextLabel");
    l_v30_FromObjectPool_1.Selectable = false;
    l_v30_FromObjectPool_1.Size = UDim2.new(1, -14, 1, 0);
    l_v30_FromObjectPool_1.Position = UDim2.new(0, 8, 0, 0);
    l_v30_FromObjectPool_1.BackgroundTransparency = 1;
    l_v30_FromObjectPool_1.Font = v32;
    l_v30_FromObjectPool_1.TextSize = v33;
    l_v30_FromObjectPool_1.TextXAlignment = Enum.TextXAlignment.Left;
    l_v30_FromObjectPool_1.TextYAlignment = Enum.TextYAlignment.Top;
    l_v30_FromObjectPool_1.TextTransparency = 0;
    l_v30_FromObjectPool_1.TextStrokeTransparency = 0.75;
    l_v30_FromObjectPool_1.TextColor3 = v34;
    l_v30_FromObjectPool_1.TextWrapped = true;
    l_v30_FromObjectPool_1.ClipsDescendants = true;
    l_v30_FromObjectPool_1.Text = v31;
    l_v30_FromObjectPool_1.Visible = true;
    l_v30_FromObjectPool_1.RichText = v0 and true or false;
    l_v30_FromObjectPool_1.Parent = l_v30_FromObjectPool_0;
    return l_v30_FromObjectPool_0, l_v30_FromObjectPool_1;
end;
v8.AddNameButtonToBaseMessage = function(v37, v38, v39, v40, v41) --[[ Line: 141 ]] --[[ Name: AddNameButtonToBaseMessage ]]
    local l_v37_StringTextBounds_0 = v37:GetStringTextBounds(v40, v38.Font, v38.TextSize);
    local l_v37_FromObjectPool_0 = v37:GetFromObjectPool("TextButton");
    l_v37_FromObjectPool_0.Selectable = false;
    l_v37_FromObjectPool_0.Size = UDim2.new(0, l_v37_StringTextBounds_0.X, 0, l_v37_StringTextBounds_0.Y);
    l_v37_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v37_FromObjectPool_0.BackgroundTransparency = 1;
    l_v37_FromObjectPool_0.Font = v38.Font;
    l_v37_FromObjectPool_0.TextSize = v38.TextSize;
    l_v37_FromObjectPool_0.TextXAlignment = v38.TextXAlignment;
    l_v37_FromObjectPool_0.TextYAlignment = v38.TextYAlignment;
    l_v37_FromObjectPool_0.TextTransparency = v38.TextTransparency;
    l_v37_FromObjectPool_0.TextStrokeTransparency = v38.TextStrokeTransparency;
    l_v37_FromObjectPool_0.TextColor3 = v39;
    l_v37_FromObjectPool_0.Text = v40;
    l_v37_FromObjectPool_0.Visible = true;
    l_v37_FromObjectPool_0.Parent = v38;
    local v44 = l_v37_FromObjectPool_0.MouseButton1Click:connect(function() --[[ Line: 159 ]]
        -- upvalues: v37 (copy), l_v37_FromObjectPool_0 (copy), v41 (copy)
        v37:NameButtonClicked(l_v37_FromObjectPool_0, v41);
    end);
    local v45 = nil;
    v45 = l_v37_FromObjectPool_0.Changed:connect(function(v46) --[[ Line: 164 ]]
        -- upvalues: v44 (copy), v45 (ref)
        if v46 == "Parent" then
            v44:Disconnect();
            v45:Disconnect();
        end;
    end);
    return l_v37_FromObjectPool_0;
end;
v8.AddTranslationButtonToBaseMessage = function(v47, v48) --[[ Line: 174 ]] --[[ Name: AddTranslationButtonToBaseMessage ]]
    local v49 = math.floor(v48.TextSize * 0.9);
    local v50 = Vector2.new(v49, v49);
    local l_v47_FromObjectPool_0 = v47:GetFromObjectPool("ImageButton");
    l_v47_FromObjectPool_0.Selectable = false;
    l_v47_FromObjectPool_0.Size = UDim2.new(0, v50.X, 0, v50.Y);
    l_v47_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v47_FromObjectPool_0.BackgroundTransparency = 1;
    l_v47_FromObjectPool_0.Visible = false;
    l_v47_FromObjectPool_0.Parent = v48;
    l_v47_FromObjectPool_0.Image = "rbxasset://textures/translateIcon.png";
    l_v47_FromObjectPool_0.HoverImage = "rbxasset://textures/translateIconDark.png";
    l_v47_FromObjectPool_0.PressedImage = "rbxasset://textures/translateIconDark.png";
    return l_v47_FromObjectPool_0;
end;
v8.AddChannelButtonToBaseMessage = function(v52, v53, v54, v55, v56) --[[ Line: 191 ]] --[[ Name: AddChannelButtonToBaseMessage ]]
    local l_v52_StringTextBounds_0 = v52:GetStringTextBounds(v55, v53.Font, v53.TextSize);
    local l_v52_FromObjectPool_0 = v52:GetFromObjectPool("TextButton");
    l_v52_FromObjectPool_0.Selectable = false;
    l_v52_FromObjectPool_0.Size = UDim2.new(0, l_v52_StringTextBounds_0.X, 0, l_v52_StringTextBounds_0.Y);
    l_v52_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v52_FromObjectPool_0.BackgroundTransparency = 1;
    l_v52_FromObjectPool_0.Font = v53.Font;
    l_v52_FromObjectPool_0.TextSize = v53.TextSize;
    l_v52_FromObjectPool_0.TextXAlignment = v53.TextXAlignment;
    l_v52_FromObjectPool_0.TextYAlignment = v53.TextYAlignment;
    l_v52_FromObjectPool_0.TextTransparency = v53.TextTransparency;
    l_v52_FromObjectPool_0.TextStrokeTransparency = v53.TextStrokeTransparency;
    l_v52_FromObjectPool_0.TextColor3 = v54;
    l_v52_FromObjectPool_0.Text = v55;
    l_v52_FromObjectPool_0.Visible = true;
    l_v52_FromObjectPool_0.Parent = v53;
    local v59 = l_v52_FromObjectPool_0.MouseButton1Click:connect(function() --[[ Line: 209 ]]
        -- upvalues: v52 (copy), l_v52_FromObjectPool_0 (copy), v56 (copy)
        v52:ChannelButtonClicked(l_v52_FromObjectPool_0, v56);
    end);
    local v60 = nil;
    v60 = l_v52_FromObjectPool_0.Changed:connect(function(v61) --[[ Line: 214 ]]
        -- upvalues: v59 (copy), v60 (ref)
        if v61 == "Parent" then
            v59:Disconnect();
            v60:Disconnect();
        end;
    end);
    return l_v52_FromObjectPool_0;
end;
v8.AddTagLabelToBaseMessage = function(v62, v63, v64, v65) --[[ Line: 224 ]] --[[ Name: AddTagLabelToBaseMessage ]]
    local l_v62_StringTextBounds_0 = v62:GetStringTextBounds(v65, v63.Font, v63.TextSize);
    local l_v62_FromObjectPool_0 = v62:GetFromObjectPool("TextLabel");
    l_v62_FromObjectPool_0.Selectable = false;
    l_v62_FromObjectPool_0.Size = UDim2.new(0, l_v62_StringTextBounds_0.X, 0, l_v62_StringTextBounds_0.Y);
    l_v62_FromObjectPool_0.Position = UDim2.new(0, 0, 0, 0);
    l_v62_FromObjectPool_0.BackgroundTransparency = 1;
    l_v62_FromObjectPool_0.Font = v63.Font;
    l_v62_FromObjectPool_0.TextSize = v63.TextSize;
    l_v62_FromObjectPool_0.TextXAlignment = v63.TextXAlignment;
    l_v62_FromObjectPool_0.TextYAlignment = v63.TextYAlignment;
    l_v62_FromObjectPool_0.TextTransparency = v63.TextTransparency;
    l_v62_FromObjectPool_0.TextStrokeTransparency = v63.TextStrokeTransparency;
    l_v62_FromObjectPool_0.TextColor3 = v64;
    l_v62_FromObjectPool_0.Text = v65;
    l_v62_FromObjectPool_0.Visible = true;
    l_v62_FromObjectPool_0.Parent = v63;
    return l_v62_FromObjectPool_0;
end;
GetWhisperChannelPrefix = function() --[[ Line: 245 ]] --[[ Name: GetWhisperChannelPrefix ]]
    -- upvalues: l_ChatConstants_0 (copy)
    if l_ChatConstants_0.WhisperChannelPrefix then
        return l_ChatConstants_0.WhisperChannelPrefix;
    else
        return "To ";
    end;
end;
v8.NameButtonClicked = function(v68, _, v70) --[[ Line: 252 ]] --[[ Name: NameButtonClicked ]]
    -- upvalues: l_ChatSettings_0 (copy), l_result_0 (copy), l_LocalPlayer_0 (ref)
    if not v68.ChatWindow then
        return;
    else
        if l_ChatSettings_0.ClickOnPlayerNameToWhisper then
            local l_l_result_0_FirstChild_0 = l_result_0:FindFirstChild(v70);
            if l_l_result_0_FirstChild_0 and l_l_result_0_FirstChild_0 ~= l_LocalPlayer_0 then
                local v72 = GetWhisperChannelPrefix() .. v70;
                if v68.ChatWindow:GetChannel(v72) then
                    v68.ChatBar:ResetCustomState();
                    if v68.ChatWindow:GetTargetMessageChannel() ~= v72 then
                        v68.ChatWindow:SwitchCurrentChannel(v72);
                    end;
                    local v73 = "/w " .. v70;
                    v68.ChatBar:SetText(v73);
                    v68.ChatBar:CaptureFocus();
                    return;
                elseif not v68.ChatBar:IsInCustomState() then
                    local v74 = "/w " .. v70;
                    v68.ChatBar:SetText(v74);
                    v68.ChatBar:CaptureFocus();
                end;
            end;
        end;
        return;
    end;
end;
v8.ChannelButtonClicked = function(v75, _, v77) --[[ Line: 282 ]] --[[ Name: ChannelButtonClicked ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if not v75.ChatWindow then
        return;
    else
        if l_ChatSettings_0.ClickOnChannelNameToSetMainChannel and v75.ChatWindow:GetChannel(v77) then
            v75.ChatBar:ResetCustomState();
            if v75.ChatWindow:GetTargetMessageChannel() ~= v77 then
                v75.ChatWindow:SwitchCurrentChannel(v77);
            end;
            v75.ChatBar:ResetText();
            v75.ChatBar:CaptureFocus();
        end;
        return;
    end;
end;
v8.RegisterChatWindow = function(v78, v79) --[[ Line: 300 ]] --[[ Name: RegisterChatWindow ]]
    v78.ChatWindow = v79;
    v78.ChatBar = v79:GetChatBar();
end;
v8.GetFromObjectPool = function(v80, v81) --[[ Line: 305 ]] --[[ Name: GetFromObjectPool ]]
    if v80.ObjectPool == nil then
        return Instance.new(v81);
    else
        return v80.ObjectPool:GetInstance(v81);
    end;
end;
v8.RegisterObjectPool = function(v82, v83) --[[ Line: 312 ]] --[[ Name: RegisterObjectPool ]]
    v82.ObjectPool = v83;
end;
v8.CreateFadeFunctions = function(_, v85) --[[ Line: 332 ]] --[[ Name: CreateFadeFunctions ]]
    local v86 = {};
    for v87, v88 in pairs(v85) do
        v86[v87] = {};
        for v89, v90 in pairs(v88) do
            v86[v87][v89] = {
                Target = v90.FadedIn, 
                Current = v87[v89], 
                NormalizedExptValue = 1
            };
        end;
    end;
    local function v97(v91, v92) --[[ Line: 345 ]] --[[ Name: FadeInFunction ]]
        -- upvalues: v86 (copy), v85 (copy)
        for v93, v94 in pairs(v86) do
            for v95, v96 in pairs(v94) do
                v96.Target = v85[v93][v95].FadedIn;
                v96.NormalizedExptValue = v92:NormalizedDefaultExptValueInSeconds(v91);
            end;
        end;
    end;
    local function v104(v98, v99) --[[ Line: 354 ]] --[[ Name: FadeOutFunction ]]
        -- upvalues: v86 (copy), v85 (copy)
        for v100, v101 in pairs(v86) do
            for v102, v103 in pairs(v101) do
                v103.Target = v85[v100][v102].FadedOut;
                v103.NormalizedExptValue = v99:NormalizedDefaultExptValueInSeconds(v98);
            end;
        end;
    end;
    local function v109() --[[ Line: 363 ]] --[[ Name: AnimGuiObjects ]]
        -- upvalues: v86 (copy)
        for v105, v106 in pairs(v86) do
            for v107, v108 in pairs(v106) do
                v105[v107] = v108.Current;
            end;
        end;
    end;
    return v97, v104, function(v110, v111) --[[ Line: 371 ]] --[[ Name: UpdateAnimFunction ]]
        -- upvalues: v86 (copy), v109 (copy)
        for _, v113 in pairs(v86) do
            for _, v115 in pairs(v113) do
                v115.Current = v111:Expt(v115.Current, v115.Target, v115.NormalizedExptValue, v110);
            end;
        end;
        v109();
    end;
end;
v8.NewBindableEvent = function(_, v117) --[[ Line: 389 ]] --[[ Name: NewBindableEvent ]]
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = v117;
    return l_BindableEvent_0;
end;
v8.RegisterGuiRoot = function(_) --[[ Line: 396 ]] --[[ Name: RegisterGuiRoot ]]

end;
v7.new = function() --[[ Line: 401 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v120 = setmetatable({}, v8);
    v120.ObjectPool = nil;
    v120.ChatWindow = nil;
    v120.DEFAULT_MESSAGE_CREATOR = "UnknownMessage";
    v120.MESSAGE_CREATOR_MODULES_VERSION = 1;
    v120.KEY_MESSAGE_TYPE = "MessageType";
    v120.KEY_CREATOR_FUNCTION = "MessageCreatorFunc";
    v120.KEY_BASE_FRAME = "BaseFrame";
    v120.KEY_BASE_MESSAGE = "BaseMessage";
    v120.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction";
    v120.KEY_GET_HEIGHT = "GetHeightFunction";
    v120.KEY_FADE_IN = "FadeInFunction";
    v120.KEY_FADE_OUT = "FadeOutFunction";
    v120.KEY_UPDATE_ANIMATION = "UpdateAnimFunction";
    return v120;
end;
return v7.new();