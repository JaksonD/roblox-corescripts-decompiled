local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Chat_0 = game:GetService("Chat");
local l_TextService_0 = game:GetService("TextService");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while l_LocalPlayer_0 == nil do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
    return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble");
end);
local v8 = l_status_0 and l_result_0;
local v9 = nil;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 30 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText");
end);
v9 = l_status_1 and l_result_1;
l_status_1 = nil;
local v12;
l_result_1, v12 = pcall(function() --[[ Line: 37 ]]
    return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta");
end);
l_status_1 = l_result_1 and v12;
l_result_1 = nil;
local v13;
v12, v13 = pcall(function() --[[ Line: 44 ]]
    return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap");
end);
l_result_1 = v12 and v13;
v12 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
v13 = function(v14) --[[ Line: 52 ]] --[[ Name: getMessageLength ]]
    return utf8.len(utf8.nfcnormalize(v14));
end;
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_Size24_0 = Enum.FontSize.Size24;
local v17 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1;
local v18 = {
    WHITE = "dub", 
    BLUE = "blu", 
    GREEN = "gre", 
    RED = "red"
};
local l_ScreenGui_0 = Instance.new("ScreenGui");
l_ScreenGui_0.Name = "BubbleChat";
l_ScreenGui_0.ResetOnSpawn = false;
l_ScreenGui_0.Parent = l_PlayerGui_0;
local function _(v20, v21, v22) --[[ Line: 95 ]] --[[ Name: lerpLength ]]
    return v21 + (v22 - v21) * math.min(utf8.len(utf8.nfcnormalize(v20)) / 75, 1);
end;
local function v35() --[[ Line: 99 ]] --[[ Name: createFifo ]]
    local v24 = {
        data = {}
    };
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v24.Emptied = l_BindableEvent_0.Event;
    v24.Size = function(_) --[[ Line: 106 ]] --[[ Name: Size ]]
        -- upvalues: v24 (copy)
        return #v24.data;
    end;
    v24.Empty = function(_) --[[ Line: 110 ]] --[[ Name: Empty ]]
        -- upvalues: v24 (copy)
        return v24:Size() <= 0;
    end;
    v24.PopFront = function(_) --[[ Line: 114 ]] --[[ Name: PopFront ]]
        -- upvalues: v24 (copy), l_BindableEvent_0 (copy)
        table.remove(v24.data, 1);
        if v24:Empty() then
            l_BindableEvent_0:Fire();
        end;
    end;
    v24.Front = function(_) --[[ Line: 119 ]] --[[ Name: Front ]]
        -- upvalues: v24 (copy)
        return v24.data[1];
    end;
    v24.Get = function(_, v31) --[[ Line: 123 ]] --[[ Name: Get ]]
        -- upvalues: v24 (copy)
        return v24.data[v31];
    end;
    v24.PushBack = function(_, v33) --[[ Line: 127 ]] --[[ Name: PushBack ]]
        -- upvalues: v24 (copy)
        table.insert(v24.data, v33);
    end;
    v24.GetData = function(_) --[[ Line: 131 ]] --[[ Name: GetData ]]
        -- upvalues: v24 (copy)
        return v24.data;
    end;
    return v24;
end;
local function _() --[[ Line: 138 ]] --[[ Name: createCharacterChats ]]
    -- upvalues: v35 (copy)
    return {
        Fifo = v35(), 
        BillboardGui = nil
    };
end;
local function v50() --[[ Line: 147 ]] --[[ Name: createMap ]]
    -- upvalues: v35 (copy)
    local v37 = {
        data = {}
    };
    local v38 = 0;
    v37.Size = function(_) --[[ Line: 152 ]] --[[ Name: Size ]]
        -- upvalues: v38 (ref)
        return v38;
    end;
    v37.Erase = function(_, v41) --[[ Line: 156 ]] --[[ Name: Erase ]]
        -- upvalues: v37 (copy), v38 (ref)
        if v37.data[v41] then
            v38 = v38 - 1;
        end;
        v37.data[v41] = nil;
    end;
    v37.Set = function(_, v43, v44) --[[ Line: 161 ]] --[[ Name: Set ]]
        -- upvalues: v37 (copy), v38 (ref)
        v37.data[v43] = v44;
        if v44 then
            v38 = v38 + 1;
        end;
    end;
    v37.Get = function(_, v46) --[[ Line: 166 ]] --[[ Name: Get ]]
        -- upvalues: v37 (copy), v35 (ref)
        if not v46 then
            return;
        else
            if not v37.data[v46] then
                v37.data[v46] = {
                    Fifo = v35(), 
                    BillboardGui = nil
                };
                local v47 = nil;
                do
                    local l_v47_0 = v47;
                    l_v47_0 = v37.data[v46].Fifo.Emptied:connect(function() --[[ Line: 171 ]]
                        -- upvalues: l_v47_0 (ref), v37 (ref), v46 (copy)
                        l_v47_0:disconnect();
                        v37:Erase(v46);
                    end);
                end;
            end;
            return v37.data[v46];
        end;
    end;
    v37.GetData = function(_) --[[ Line: 179 ]] --[[ Name: GetData ]]
        -- upvalues: v37 (copy)
        return v37.data;
    end;
    return v37;
end;
local function v58(v51, v52, v53) --[[ Line: 186 ]] --[[ Name: createChatLine ]]
    local v57 = {
        ComputeBubbleLifetime = function(_, v55, v56) --[[ Line: 189 ]] --[[ Name: ComputeBubbleLifetime ]]
            if v56 then
                return 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(v55)) / 75, 1);
            else
                return 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(v55)) / 75, 1);
            end;
        end, 
        Origin = nil, 
        RenderBubble = nil, 
        Message = v51
    };
    v57.BubbleDieDelay = v57:ComputeBubbleLifetime(v51, v53);
    v57.BubbleColor = v52;
    v57.IsLocalPlayer = v53;
    return v57;
end;
local function _(v59, v60, v61) --[[ Line: 207 ]] --[[ Name: createPlayerChatLine ]]
    -- upvalues: v58 (copy), v18 (copy)
    local v62 = v58(v60, v18.WHITE, v61);
    if v59 then
        v62.User = v59.Name;
        v62.Origin = v59.Character;
    end;
    return v62;
end;
local function _(v64, v65, v66, v67) --[[ Line: 218 ]] --[[ Name: createGameChatLine ]]
    -- upvalues: v58 (copy)
    local v68 = v58(v65, v67, v66);
    v68.Origin = v64;
    return v68;
end;
createChatBubbleMain = function(v70, v71) --[[ Line: 225 ]] --[[ Name: createChatBubbleMain ]]
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "ChatBubble";
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = v71;
    l_ImageLabel_0.Image = "rbxasset://textures/" .. tostring(v70) .. ".png";
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.BorderSizePixel = 0;
    l_ImageLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_ImageLabel_0.Position = UDim2.new(0, 0, 0, 0);
    return l_ImageLabel_0;
end;
createChatBubbleTail = function(v73, v74) --[[ Line: 239 ]] --[[ Name: createChatBubbleTail ]]
    local l_ImageLabel_1 = Instance.new("ImageLabel");
    l_ImageLabel_1.Name = "ChatBubbleTail";
    l_ImageLabel_1.Image = "rbxasset://textures/ui/dialog_tail.png";
    l_ImageLabel_1.BackgroundTransparency = 1;
    l_ImageLabel_1.BorderSizePixel = 0;
    l_ImageLabel_1.Position = v73;
    l_ImageLabel_1.Size = v74;
    return l_ImageLabel_1;
end;
createChatBubbleWithTail = function(v76, v77, v78, v79) --[[ Line: 251 ]] --[[ Name: createChatBubbleWithTail ]]
    local v80 = createChatBubbleMain(v76, v79);
    createChatBubbleTail(v77, v78).Parent = v80;
    return v80;
end;
createScaledChatBubbleWithTail = function(v81, v82, v83, v84) --[[ Line: 260 ]] --[[ Name: createScaledChatBubbleWithTail ]]
    local v85 = createChatBubbleMain(v81, v84);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "ChatBubbleTailFrame";
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.SizeConstraint = Enum.SizeConstraint.RelativeXX;
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Size = UDim2.new(v82, 0, v82, 0);
    l_Frame_0.Parent = v85;
    createChatBubbleTail(v83, UDim2.new(1, 0, 0.5, 0)).Parent = l_Frame_0;
    return v85;
end;
createChatImposter = function(v87, v88, v89) --[[ Line: 277 ]] --[[ Name: createChatImposter ]]
    local l_ImageLabel_2 = Instance.new("ImageLabel");
    l_ImageLabel_2.Name = "DialogPlaceholder";
    l_ImageLabel_2.Image = "rbxasset://textures/" .. tostring(v87) .. ".png";
    l_ImageLabel_2.BackgroundTransparency = 1;
    l_ImageLabel_2.BorderSizePixel = 0;
    l_ImageLabel_2.Position = UDim2.new(0, 0, -1.25, 0);
    l_ImageLabel_2.Size = UDim2.new(1, 0, 1, 0);
    local l_ImageLabel_3 = Instance.new("ImageLabel");
    l_ImageLabel_3.Name = "DotDotDot";
    l_ImageLabel_3.Image = "rbxasset://textures/" .. tostring(v88) .. ".png";
    l_ImageLabel_3.BackgroundTransparency = 1;
    l_ImageLabel_3.BorderSizePixel = 0;
    l_ImageLabel_3.Position = UDim2.new(0.001, 0, v89, 0);
    l_ImageLabel_3.Size = UDim2.new(1, 0, 0.7, 0);
    l_ImageLabel_3.Parent = l_ImageLabel_2;
    return l_ImageLabel_2;
end;
local v92 = {
    ChatBubble = {}, 
    ChatBubbleWithTail = {}, 
    ScalingChatBubbleWithTail = {}, 
    CharacterSortedMsg = v50()
};
local function v98(v93, v94, _, v96, v97) --[[ Line: 306 ]] --[[ Name: initChatBubbleType ]]
    -- upvalues: v92 (copy)
    v92.ChatBubble[v93] = createChatBubbleMain(v94, v97);
    v92.ChatBubbleWithTail[v93] = createChatBubbleWithTail(v94, UDim2.new(0.5, -14, 1, v96 and -1 or 0), UDim2.new(0, 30, 0, 14), v97);
    v92.ScalingChatBubbleWithTail[v93] = createScaledChatBubbleWithTail(v94, 0.5, UDim2.new(-0.5, 0, 0, v96 and -1 or 0), v97);
end;
v98(v18.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15));
v98(v18.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33));
v98(v18.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33));
v98(v18.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33));
v92.SanitizeChatLine = function(_, v100) --[[ Line: 317 ]] --[[ Name: SanitizeChatLine ]]
    -- upvalues: v17 (copy)
    if utf8.len(utf8.nfcnormalize(v100)) > v17 then
        return (string.sub(v100, 1, utf8.offset(v100, v17 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1));
    else
        return v100;
    end;
end;
local function v105(v101) --[[ Line: 326 ]] --[[ Name: createBillboardInstance ]]
    -- upvalues: l_ScreenGui_0 (copy), v92 (copy), v18 (copy)
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Adornee = v101;
    l_BillboardGui_0.Size = UDim2.new(0, 400, 0, 250);
    l_BillboardGui_0.StudsOffset = Vector3.new(0, 1.5, 2, 0);
    l_BillboardGui_0.Parent = l_ScreenGui_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Name = "BillboardFrame";
    l_Frame_1.Size = UDim2.new(1, 0, 1, 0);
    l_Frame_1.Position = UDim2.new(0, 0, -0.5, 0);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_BillboardGui_0;
    local v104 = nil;
    v104 = l_Frame_1.ChildRemoved:connect(function() --[[ Line: 341 ]]
        -- upvalues: l_Frame_1 (copy), v104 (ref), l_BillboardGui_0 (copy)
        if #l_Frame_1:GetChildren() <= 1 then
            v104:disconnect();
            l_BillboardGui_0:Destroy();
        end;
    end);
    v92:CreateSmallTalkBubble(v18.WHITE).Parent = l_Frame_1;
    return l_BillboardGui_0;
end;
v92.CreateBillboardGuiHelper = function(_, v107, v108) --[[ Line: 353 ]] --[[ Name: CreateBillboardGuiHelper ]]
    -- upvalues: v92 (copy), v105 (copy)
    if v107 and not v92.CharacterSortedMsg:Get(v107).BillboardGui then
        if not v108 and v107:IsA("BasePart") then
            local v109 = v105(v107);
            v92.CharacterSortedMsg:Get(v107).BillboardGui = v109;
            return;
        elseif v107:IsA("Model") then
            local l_Head_0 = v107:FindFirstChild("Head");
            if l_Head_0 and l_Head_0:IsA("BasePart") then
                local v111 = v105(l_Head_0);
                v92.CharacterSortedMsg:Get(v107).BillboardGui = v111;
            end;
        end;
    end;
end;
local function _(v112) --[[ Line: 375 ]] --[[ Name: distanceToBubbleOrigin ]]
    if not v112 then
        return 100000;
    else
        return (v112.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude;
    end;
end;
local function _(v114) --[[ Line: 381 ]] --[[ Name: isPartOfLocalPlayer ]]
    -- upvalues: l_Players_0 (copy)
    if v114 and l_Players_0.LocalPlayer.Character then
        return v114:IsDescendantOf(l_Players_0.LocalPlayer.Character);
    else
        return;
    end;
end;
v92.SetBillboardLODNear = function(_, v117) --[[ Line: 387 ]] --[[ Name: SetBillboardLODNear ]]
    -- upvalues: l_Players_0 (copy)
    local l_Adornee_0 = v117.Adornee;
    local v119 = if l_Adornee_0 and l_Players_0.LocalPlayer.Character then l_Adornee_0:IsDescendantOf(l_Players_0.LocalPlayer.Character) else nil;
    v117.Size = UDim2.new(0, 400, 0, 250);
    v117.StudsOffset = Vector3.new(0, v119 and 1.5 or 2.5, v119 and 2 or 0.1);
    v117.Enabled = true;
    l_Adornee_0 = v117.BillboardFrame:GetChildren();
    for v120 = 1, #l_Adornee_0 do
        l_Adornee_0[v120].Visible = true;
    end;
    v117.BillboardFrame.SmallTalkBubble.Visible = false;
end;
v92.SetBillboardLODDistant = function(_, v122) --[[ Line: 399 ]] --[[ Name: SetBillboardLODDistant ]]
    -- upvalues: l_Players_0 (copy)
    local l_Adornee_1 = v122.Adornee;
    local v124 = if l_Adornee_1 and l_Players_0.LocalPlayer.Character then l_Adornee_1:IsDescendantOf(l_Players_0.LocalPlayer.Character) else nil;
    v122.Size = UDim2.new(4, 0, 3, 0);
    v122.StudsOffset = Vector3.new(0, 3, v124 and 2 or 0.1);
    v122.Enabled = true;
    l_Adornee_1 = v122.BillboardFrame:GetChildren();
    for v125 = 1, #l_Adornee_1 do
        l_Adornee_1[v125].Visible = false;
    end;
    v122.BillboardFrame.SmallTalkBubble.Visible = true;
end;
v92.SetBillboardLODVeryFar = function(_, v127) --[[ Line: 411 ]] --[[ Name: SetBillboardLODVeryFar ]]
    v127.Enabled = false;
end;
v92.SetBillboardGuiLOD = function(_, v129, v130) --[[ Line: 415 ]] --[[ Name: SetBillboardGuiLOD ]]
    -- upvalues: v92 (copy)
    if not v130 then
        return;
    else
        if v130:IsA("Model") then
            v130 = v130:FindFirstChild("Head") or v130.PrimaryPart;
        end;
        local l_v130_0 = v130;
        local v132 = not l_v130_0 and 100000 or (l_v130_0.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude;
        if v132 < 65 then
            v92:SetBillboardLODNear(v129);
            return;
        elseif v132 >= 65 and v132 < 100 then
            v92:SetBillboardLODDistant(v129);
            return;
        else
            v92:SetBillboardLODVeryFar(v129);
            return;
        end;
    end;
end;
v92.CameraCFrameChanged = function(_) --[[ Line: 435 ]] --[[ Name: CameraCFrameChanged ]]
    -- upvalues: v92 (copy)
    for v134, v135 in pairs(v92.CharacterSortedMsg:GetData()) do
        local l_BillboardGui_1 = v135.BillboardGui;
        if l_BillboardGui_1 then
            v92:SetBillboardGuiLOD(l_BillboardGui_1, v134);
        end;
    end;
end;
v92.CreateBubbleText = function(_, v138, v139) --[[ Line: 442 ]] --[[ Name: CreateBubbleText ]]
    -- upvalues: v9 (ref), l_SourceSans_0 (copy), l_Size24_0 (copy)
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "BubbleText";
    l_TextLabel_0.BackgroundTransparency = 1;
    if v9 then
        l_TextLabel_0.Size = UDim2.fromScale(1, 1);
    else
        l_TextLabel_0.Position = UDim2.new(0, 15, 0, 0);
        l_TextLabel_0.Size = UDim2.new(1, -30, 1, 0);
    end;
    l_TextLabel_0.Font = l_SourceSans_0;
    l_TextLabel_0.ClipsDescendants = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.FontSize = l_Size24_0;
    l_TextLabel_0.Text = v138;
    l_TextLabel_0.Visible = false;
    l_TextLabel_0.AutoLocalize = v139;
    if v9 then
        local l_UIPadding_0 = Instance.new("UIPadding");
        l_UIPadding_0.PaddingTop = UDim.new(0, 12);
        l_UIPadding_0.PaddingRight = UDim.new(0, 12);
        l_UIPadding_0.PaddingBottom = UDim.new(0, 12);
        l_UIPadding_0.PaddingLeft = UDim.new(0, 12);
        l_UIPadding_0.Parent = l_TextLabel_0;
    end;
    return l_TextLabel_0;
end;
v92.CreateSmallTalkBubble = function(_, v143) --[[ Line: 474 ]] --[[ Name: CreateSmallTalkBubble ]]
    -- upvalues: v92 (copy)
    local v144 = v92.ScalingChatBubbleWithTail[v143]:Clone();
    v144.Name = "SmallTalkBubble";
    v144.AnchorPoint = Vector2.new(0, 0.5);
    v144.Position = UDim2.new(0, 0, 0.5, 0);
    v144.Visible = false;
    local l_v92_BubbleText_0 = v92:CreateBubbleText("...");
    l_v92_BubbleText_0.TextScaled = true;
    l_v92_BubbleText_0.TextWrapped = false;
    l_v92_BubbleText_0.Visible = true;
    l_v92_BubbleText_0.Parent = v144;
    return v144;
end;
v92.UpdateChatLinesForOrigin = function(_, v147, v148) --[[ Line: 489 ]] --[[ Name: UpdateChatLinesForOrigin ]]
    -- upvalues: v92 (copy), v12 (copy)
    local l_Fifo_0 = v92.CharacterSortedMsg:Get(v147).Fifo;
    local v150 = l_Fifo_0:Size();
    local l_l_Fifo_0_Data_0 = l_Fifo_0:GetData();
    if #l_l_Fifo_0_Data_0 <= 1 then
        return;
    else
        for v152 = #l_l_Fifo_0_Data_0 - 1, 1, -1 do
            local l_RenderBubble_0 = l_l_Fifo_0_Data_0[v152].RenderBubble;
            if not l_RenderBubble_0 then
                return;
            else
                if v150 - v152 + 1 > 1 then
                    local l_ChatBubbleTail_0 = l_RenderBubble_0:FindFirstChild("ChatBubbleTail");
                    if l_ChatBubbleTail_0 then
                        l_ChatBubbleTail_0:Destroy();
                    end;
                    local l_BubbleText_0 = l_RenderBubble_0:FindFirstChild("BubbleText");
                    if l_BubbleText_0 then
                        l_BubbleText_0.TextTransparency = 0.5;
                    end;
                end;
                local v156 = UDim2.new(l_RenderBubble_0.Position.X.Scale, l_RenderBubble_0.Position.X.Offset, 1, v148 - l_RenderBubble_0.Size.Y.Offset - 14);
                if v12 then
                    l_RenderBubble_0:TweenPositionInternal(v156, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true);
                else
                    l_RenderBubble_0:TweenPosition(v156, Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true);
                end;
                v148 = v148 - l_RenderBubble_0.Size.Y.Offset - 14;
            end;
        end;
        return;
    end;
end;
v92.DestroyBubble = function(_, v158, v159) --[[ Line: 519 ]] --[[ Name: DestroyBubble ]]
    if not v158 then
        return;
    elseif v158:Empty() then
        return;
    else
        local l_RenderBubble_1 = v158:Front().RenderBubble;
        if not l_RenderBubble_1 then
            v158:PopFront();
            return;
        else
            spawn(function() --[[ Line: 529 ]]
                -- upvalues: v158 (copy), v159 (copy), l_RenderBubble_1 (ref)
                while v158:Front().RenderBubble ~= v159 do
                    wait();
                end;
                l_RenderBubble_1 = v158:Front().RenderBubble;
                local v161 = 0;
                local l_BubbleText_1 = l_RenderBubble_1:FindFirstChild("BubbleText");
                local l_ChatBubbleTail_1 = l_RenderBubble_1:FindFirstChild("ChatBubbleTail");
                while l_RenderBubble_1 and l_RenderBubble_1.ImageTransparency < 1 do
                    v161 = wait();
                    if l_RenderBubble_1 then
                        local v164 = v161 * 1.5;
                        l_RenderBubble_1.ImageTransparency = l_RenderBubble_1.ImageTransparency + v164;
                        if l_BubbleText_1 then
                            l_BubbleText_1.TextTransparency = l_BubbleText_1.TextTransparency + v164;
                        end;
                        if l_ChatBubbleTail_1 then
                            l_ChatBubbleTail_1.ImageTransparency = l_ChatBubbleTail_1.ImageTransparency + v164;
                        end;
                    end;
                end;
                if l_RenderBubble_1 then
                    l_RenderBubble_1:Destroy();
                    v158:PopFront();
                end;
            end);
            return;
        end;
    end;
end;
v92.CreateChatLineRender = function(_, v166, v167, v168, v169, v170) --[[ Line: 557 ]] --[[ Name: CreateChatLineRender ]]
    -- upvalues: v92 (copy), l_TextService_0 (copy), l_SourceSans_0 (copy), v9 (ref)
    if not v166 then
        return;
    else
        if not v92.CharacterSortedMsg:Get(v166).BillboardGui then
            v92:CreateBillboardGuiHelper(v166, v168);
        end;
        local l_BillboardGui_2 = v92.CharacterSortedMsg:Get(v166).BillboardGui;
        if l_BillboardGui_2 then
            local v172 = v92.ChatBubbleWithTail[v167.BubbleColor]:Clone();
            v172.Visible = false;
            local l_v92_BubbleText_1 = v92:CreateBubbleText(v167.Message, v170);
            l_v92_BubbleText_1.Parent = v172;
            v172.Parent = l_BillboardGui_2.BillboardFrame;
            v167.RenderBubble = v172;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_v92_BubbleText_1.Text, 24, l_SourceSans_0, Vector2.new(400, 250));
            local v175 = l_l_TextService_0_TextSize_0.Y / 24;
            if v9 then
                local v176 = math.ceil(l_l_TextService_0_TextSize_0.X + 24);
                local v177 = v175 * 34;
                v172.Size = UDim2.fromOffset(0, 0);
                v172.Position = UDim2.fromScale(0.5, 1);
                v172:TweenSizeAndPosition(UDim2.fromOffset(v176, v177), UDim2.new(0.5, -v176 / 2, 1, -v177), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function() --[[ Line: 596 ]]
                    -- upvalues: l_v92_BubbleText_1 (copy)
                    l_v92_BubbleText_1.Visible = true;
                end);
                v92:SetBillboardGuiLOD(l_BillboardGui_2, v167.Origin);
                v92:UpdateChatLinesForOrigin(v167.Origin, -v177);
            else
                local v178 = math.max((l_l_TextService_0_TextSize_0.X + 30) / 400, 0.1);
                v172.Size = UDim2.new(0, 0, 0, 0);
                v172.Position = UDim2.new(0.5, 0, 1, 0);
                local v179 = v175 * 34;
                v172:TweenSizeAndPosition(UDim2.new(v178, 0, 0, v179), UDim2.new((1 - v178) / 2, 0, 1, -v179), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function() --[[ Line: 616 ]]
                    -- upvalues: l_v92_BubbleText_1 (copy)
                    l_v92_BubbleText_1.Visible = true;
                end);
                v92:SetBillboardGuiLOD(l_BillboardGui_2, v167.Origin);
                v92:UpdateChatLinesForOrigin(v167.Origin, -v179);
            end;
            delay(v167.BubbleDieDelay, function() --[[ Line: 623 ]]
                -- upvalues: v92 (ref), v169 (copy), v172 (copy)
                v92:DestroyBubble(v169, v172);
            end);
        end;
        return;
    end;
end;
v92.OnPlayerChatMessage = function(_, v181, v182, _) --[[ Line: 629 ]] --[[ Name: OnPlayerChatMessage ]]
    -- upvalues: v92 (copy), l_Players_0 (copy), v58 (copy), v18 (copy)
    if not v92:BubbleChatEnabled() then
        return;
    else
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        local v185 = false;
        if l_LocalPlayer_1 ~= nil then
            v185 = v181 ~= l_LocalPlayer_1;
        end;
        local v186 = v92:SanitizeChatLine(v182);
        local v187 = not v185;
        local v188 = v58(v186, v18.WHITE, v187);
        if v181 then
            v188.User = v181.Name;
            v188.Origin = v181.Character;
        end;
        local l_v188_0 = v188;
        if v181 and l_v188_0.Origin then
            v187 = v92.CharacterSortedMsg:Get(l_v188_0.Origin).Fifo;
            v187:PushBack(l_v188_0);
            v92:CreateChatLineRender(v181.Character, l_v188_0, true, v187, false);
        end;
        return;
    end;
end;
v92.OnGameChatMessage = function(_, v191, v192, v193) --[[ Line: 648 ]] --[[ Name: OnGameChatMessage ]]
    -- upvalues: l_status_1 (ref), l_result_1 (ref), l_Chat_0 (copy), l_Players_0 (copy), v18 (copy), v92 (copy), v58 (copy), v8 (copy)
    if l_status_1 or l_result_1 and l_Chat_0.BubbleChatEnabled then
        return;
    else
        local l_LocalPlayer_2 = l_Players_0.LocalPlayer;
        local v195 = false;
        if l_LocalPlayer_2 ~= nil then
            v195 = l_LocalPlayer_2.Character ~= v191;
        end;
        local l_WHITE_0 = v18.WHITE;
        if v193 == Enum.ChatColor.Blue then
            l_WHITE_0 = v18.BLUE;
        elseif v193 == Enum.ChatColor.Green then
            l_WHITE_0 = v18.GREEN;
        elseif v193 == Enum.ChatColor.Red then
            l_WHITE_0 = v18.RED;
        end;
        local v197 = v92:SanitizeChatLine(v192);
        local v198 = not v195;
        local v199 = v58(v197, l_WHITE_0, v198);
        v199.Origin = v191;
        local l_v199_0 = v199;
        v92.CharacterSortedMsg:Get(l_v199_0.Origin).Fifo:PushBack(l_v199_0);
        if v8 then
            v92:CreateChatLineRender(v191, l_v199_0, false, v92.CharacterSortedMsg:Get(l_v199_0.Origin).Fifo, true);
            return;
        else
            v92:CreateChatLineRender(v191, l_v199_0, false, v92.CharacterSortedMsg:Get(l_v199_0.Origin).Fifo, false);
            return;
        end;
    end;
end;
v92.BubbleChatEnabled = function(_) --[[ Line: 674 ]] --[[ Name: BubbleChatEnabled ]]
    -- upvalues: l_status_1 (ref), l_result_1 (ref), l_Chat_0 (copy), l_Players_0 (copy)
    if l_status_1 or l_result_1 and l_Chat_0.BubbleChatEnabled then
        return false;
    else
        local l_ClientChatModules_0 = l_Chat_0:FindFirstChild("ClientChatModules");
        if l_ClientChatModules_0 then
            local l_ChatSettings_0 = l_ClientChatModules_0:FindFirstChild("ChatSettings");
            if l_ChatSettings_0 then
                l_ChatSettings_0 = require(l_ChatSettings_0);
                if l_ChatSettings_0.BubbleChatEnabled ~= nil then
                    return l_ChatSettings_0.BubbleChatEnabled;
                end;
            end;
        end;
        return l_Players_0.BubbleChat;
    end;
end;
v92.ShowOwnFilteredMessage = function(_) --[[ Line: 691 ]] --[[ Name: ShowOwnFilteredMessage ]]
    -- upvalues: l_Chat_0 (copy)
    local l_ClientChatModules_1 = l_Chat_0:FindFirstChild("ClientChatModules");
    if l_ClientChatModules_1 then
        local l_ChatSettings_1 = l_ClientChatModules_1:FindFirstChild("ChatSettings");
        if l_ChatSettings_1 then
            return require(l_ChatSettings_1).ShowUserOwnFilteredMessage;
        end;
    end;
    return false;
end;
findPlayer = function(v207) --[[ Line: 703 ]] --[[ Name: findPlayer ]]
    -- upvalues: l_Players_0 (copy)
    for _, v209 in pairs(l_Players_0:GetPlayers()) do
        if v209.Name == v207 then
            return v209;
        end;
    end;
end;
l_Chat_0.Chatted:connect(function(v210, v211, v212) --[[ Line: 711 ]]
    -- upvalues: v92 (copy)
    v92:OnGameChatMessage(v210, v211, v212);
end);
local v213 = nil;
if game.Workspace.CurrentCamera then
    v213 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_) --[[ Line: 715 ]]
        -- upvalues: v92 (copy)
        v92:CameraCFrameChanged();
    end);
end;
game.Workspace.Changed:Connect(function(v215) --[[ Line: 718 ]]
    -- upvalues: v213 (ref), v92 (copy)
    if v215 == "CurrentCamera" then
        if v213 then
            v213:disconnect();
        end;
        if game.Workspace.CurrentCamera then
            v213 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_) --[[ Line: 722 ]]
                -- upvalues: v92 (ref)
                v92:CameraCFrameChanged();
            end);
        end;
    end;
end);
local v217 = nil;
getAllowedMessageTypes = function() --[[ Line: 730 ]] --[[ Name: getAllowedMessageTypes ]]
    -- upvalues: v217 (ref), l_Chat_0 (copy)
    if v217 then
        return v217;
    else
        local l_ClientChatModules_2 = l_Chat_0:FindFirstChild("ClientChatModules");
        if l_ClientChatModules_2 then
            local l_ChatSettings_2 = l_ClientChatModules_2:FindFirstChild("ChatSettings");
            if l_ChatSettings_2 then
                l_ChatSettings_2 = require(l_ChatSettings_2);
                if l_ChatSettings_2.BubbleChatMessageTypes then
                    v217 = l_ChatSettings_2.BubbleChatMessageTypes;
                    return v217;
                end;
            end;
            local l_ChatConstants_0 = l_ClientChatModules_2:FindFirstChild("ChatConstants");
            if l_ChatConstants_0 then
                l_ChatConstants_0 = require(l_ChatConstants_0);
                v217 = {
                    l_ChatConstants_0.MessageTypeDefault, 
                    l_ChatConstants_0.MessageTypeWhisper
                };
            end;
            return v217;
        else
            return {
                "Message", 
                "Whisper"
            };
        end;
    end;
end;
checkAllowedMessageType = function(v221) --[[ Line: 754 ]] --[[ Name: checkAllowedMessageType ]]
    local v222 = getAllowedMessageTypes();
    for v223 = 1, #v222 do
        if v222[v223] == v221.MessageType then
            return true;
        end;
    end;
    return false;
end;
local l_DefaultChatSystemChatEvents_0 = l_ReplicatedStorage_0:WaitForChild("DefaultChatSystemChatEvents");
local l_OnMessageDoneFiltering_0 = l_DefaultChatSystemChatEvents_0:WaitForChild("OnMessageDoneFiltering");
l_DefaultChatSystemChatEvents_0:WaitForChild("OnNewMessage").OnClientEvent:connect(function(v226, _) --[[ Line: 768 ]]
    -- upvalues: l_LocalPlayer_0 (ref), v92 (copy)
    if not checkAllowedMessageType(v226) then
        return;
    else
        local v228 = findPlayer(v226.FromSpeaker);
        if not v228 then
            return;
        elseif (not v226.IsFiltered or v226.FromSpeaker == l_LocalPlayer_0.Name) and (v226.FromSpeaker ~= l_LocalPlayer_0.Name or v92:ShowOwnFilteredMessage()) then
            return;
        else
            v92:OnPlayerChatMessage(v228, v226.Message, nil);
            return;
        end;
    end;
end);
l_OnMessageDoneFiltering_0.OnClientEvent:connect(function(v229, _) --[[ Line: 787 ]]
    -- upvalues: l_LocalPlayer_0 (ref), v92 (copy)
    if not checkAllowedMessageType(v229) then
        return;
    else
        local v231 = findPlayer(v229.FromSpeaker);
        if not v231 then
            return;
        elseif v229.FromSpeaker == l_LocalPlayer_0.Name and not v92:ShowOwnFilteredMessage() then
            return;
        else
            v92:OnPlayerChatMessage(v231, v229.Message, nil);
            return;
        end;
    end;
end);