local v0 = {};
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Chat");
local l_PlayerGui_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
local l_Chat_1 = game:GetService("Chat");
local l_ClientChatModules_0 = l_Chat_1:WaitForChild("ClientChatModules");
local l_Parent_0 = script.Parent;
local l_ChatChannel_0 = require(l_Parent_0:WaitForChild("ChatChannel"));
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local l_CurveUtil_0 = require(l_Parent_0:WaitForChild("CurveUtil"));
local v10 = {};
v10.__index = v10;
getClassicChatEnabled = function() --[[ Line: 34 ]] --[[ Name: getClassicChatEnabled ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Players_0 (copy)
    if l_ChatSettings_0.ClassicChatEnabled ~= nil then
        return l_ChatSettings_0.ClassicChatEnabled;
    else
        return l_Players_0.ClassicChat;
    end;
end;
getBubbleChatEnabled = function() --[[ Line: 41 ]] --[[ Name: getBubbleChatEnabled ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Players_0 (copy)
    if l_ChatSettings_0.BubbleChatEnabled ~= nil then
        return l_ChatSettings_0.BubbleChatEnabled;
    else
        return l_Players_0.BubbleChat;
    end;
end;
bubbleChatOnly = function() --[[ Line: 48 ]] --[[ Name: bubbleChatOnly ]]
    return not getClassicChatEnabled() and getBubbleChatEnabled();
end;
mergeProps = function(v11, v12) --[[ Line: 53 ]] --[[ Name: mergeProps ]]
    if not v11 or not v12 then
        return;
    else
        for v13, v14 in pairs(v11) do
            if v12[v13] ~= nil then
                v12[v13] = v14;
            end;
        end;
        return;
    end;
end;
v10.CreateGuiObjects = function(v15, v16) --[[ Line: 62 ]] --[[ Name: CreateGuiObjects ]]
    -- upvalues: l_Chat_1 (copy), l_ChatSettings_0 (copy), l_PlayerGui_0 (copy)
    local v17 = nil;
    pcall(function() --[[ Line: 64 ]]
        -- upvalues: v17 (ref), l_Chat_1 (ref)
        v17 = l_Chat_1:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil);
    end);
    mergeProps(v17, l_ChatSettings_0);
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Active = l_ChatSettings_0.WindowDraggable;
    l_Frame_0.Parent = v16;
    l_Frame_0.AutoLocalize = false;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Selectable = false;
    l_Frame_1.Name = "ChatBarParentFrame";
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_Frame_0;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Selectable = false;
    l_Frame_2.Name = "ChannelsBarParentFrame";
    l_Frame_2.BackgroundTransparency = 1;
    l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
    l_Frame_2.Parent = l_Frame_0;
    local l_Frame_3 = Instance.new("Frame");
    l_Frame_3.Selectable = false;
    l_Frame_3.Name = "ChatChannelParentFrame";
    l_Frame_3.BackgroundTransparency = 1;
    l_Frame_3.BackgroundColor3 = l_ChatSettings_0.BackGroundColor;
    l_Frame_3.BackgroundTransparency = 0.6;
    l_Frame_3.BorderSizePixel = 0;
    l_Frame_3.Parent = l_Frame_0;
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Selectable = false;
    l_ImageButton_0.Image = "";
    l_ImageButton_0.BackgroundTransparency = 0.6;
    l_ImageButton_0.BorderSizePixel = 0;
    l_ImageButton_0.Visible = false;
    l_ImageButton_0.BackgroundColor3 = l_ChatSettings_0.BackGroundColor;
    l_ImageButton_0.Active = true;
    if bubbleChatOnly() then
        l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 0, 0);
    else
        l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 1, -l_ImageButton_0.AbsoluteSize.Y);
    end;
    l_ImageButton_0.Parent = l_Frame_0;
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Selectable = false;
    l_ImageLabel_0.Size = UDim2.new(0.8, 0, 0.8, 0);
    l_ImageLabel_0.Position = UDim2.new(0.2, 0, 0.2, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxassetid://261880743";
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local function _() --[[ Line: 122 ]] --[[ Name: GetScreenGuiParent ]]
        -- upvalues: l_Frame_0 (copy)
        local l_l_Frame_0_0 = l_Frame_0;
        while l_l_Frame_0_0 and not l_l_Frame_0_0:IsA("ScreenGui") do
            l_l_Frame_0_0 = l_l_Frame_0_0.Parent;
        end;
        return l_l_Frame_0_0;
    end;
    local v26 = 3;
    local l_l_Frame_0_1 = l_Frame_0;
    while l_l_Frame_0_1 and not l_l_Frame_0_1:IsA("ScreenGui") do
        l_l_Frame_0_1 = l_l_Frame_0_1.Parent;
    end;
    local l_l_l_Frame_0_1_0 = l_l_Frame_0_1;
    if l_l_l_Frame_0_1_0.AbsoluteSize.X <= 640 then
        v26 = 1;
    elseif l_l_l_Frame_0_1_0.AbsoluteSize.X <= 1024 then
        v26 = 2;
    end;
    l_l_Frame_0_1 = false;
    local function v45() --[[ Line: 145 ]] --[[ Name: doCheckSizeBounds ]]
        -- upvalues: l_l_Frame_0_1 (ref), l_Frame_0 (copy), l_PlayerGui_0 (ref), l_ChatSettings_0 (ref), l_Frame_2 (copy), l_Frame_1 (copy)
        if l_l_Frame_0_1 then
            return;
        else
            l_l_Frame_0_1 = true;
            if not l_Frame_0:IsDescendantOf(l_PlayerGui_0) then
                return;
            else
                local l_l_Frame_0_2 = l_Frame_0;
                while l_l_Frame_0_2 and not l_l_Frame_0_2:IsA("ScreenGui") do
                    l_l_Frame_0_2 = l_l_Frame_0_2.Parent;
                end;
                local l_l_l_Frame_0_2_0 = l_l_Frame_0_2;
                l_l_Frame_0_2 = l_ChatSettings_0.MinimumWindowSize;
                local l_MaximumWindowSize_0 = l_ChatSettings_0.MaximumWindowSize;
                local v32 = l_Frame_2.AbsoluteSize.Y + l_Frame_1.AbsoluteSize.Y;
                local v33 = l_l_Frame_0_2.X.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.X + l_l_Frame_0_2.X.Offset;
                local v34 = math.max(l_l_Frame_0_2.Y.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.Y + l_l_Frame_0_2.Y.Offset, v32);
                local v35 = l_MaximumWindowSize_0.X.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.X + l_MaximumWindowSize_0.X.Offset;
                local v36 = l_MaximumWindowSize_0.Y.Scale * l_l_l_Frame_0_2_0.AbsoluteSize.Y + l_MaximumWindowSize_0.Y.Offset;
                local l_X_0 = l_Frame_0.AbsoluteSize.X;
                local l_Y_0 = l_Frame_0.AbsoluteSize.Y;
                if l_X_0 < v33 then
                    local v39 = UDim2.new(0, v33 - l_X_0, 0, 0);
                    l_Frame_0.Size = l_Frame_0.Size + v39;
                elseif v35 < l_X_0 then
                    local v40 = UDim2.new(0, v35 - l_X_0, 0, 0);
                    l_Frame_0.Size = l_Frame_0.Size + v40;
                end;
                if l_Y_0 < v34 then
                    local v41 = UDim2.new(0, 0, 0, v34 - l_Y_0);
                    l_Frame_0.Size = l_Frame_0.Size + v41;
                elseif v36 < l_Y_0 then
                    local v42 = UDim2.new(0, 0, 0, v36 - l_Y_0);
                    l_Frame_0.Size = l_Frame_0.Size + v42;
                end;
                local v43 = l_Frame_0.AbsoluteSize.X / l_l_l_Frame_0_2_0.AbsoluteSize.X;
                local v44 = l_Frame_0.AbsoluteSize.Y / l_l_l_Frame_0_2_0.AbsoluteSize.Y;
                l_Frame_0.Size = UDim2.new(v43, 0, v44, 0);
                l_l_Frame_0_1 = false;
                return;
            end;
        end;
    end;
    l_Frame_0.Changed:connect(function(v46) --[[ Line: 196 ]]
        -- upvalues: v45 (copy)
        if v46 == "AbsoluteSize" then
            v45();
        end;
    end);
    l_ImageButton_0.DragBegin:connect(function(_) --[[ Line: 202 ]]
        -- upvalues: l_Frame_0 (copy)
        l_Frame_0.Draggable = false;
    end);
    local function v50(v48) --[[ Line: 206 ]] --[[ Name: UpdatePositionFromDrag ]]
        -- upvalues: l_ChatSettings_0 (ref), l_Frame_0 (copy), l_ImageButton_0 (copy)
        if l_ChatSettings_0.WindowDraggable == false and l_ChatSettings_0.WindowResizable == false then
            return;
        else
            local v49 = v48 - l_Frame_0.AbsolutePosition + l_ImageButton_0.AbsoluteSize;
            l_Frame_0.Size = UDim2.new(0, v49.X, 0, v49.Y);
            if bubbleChatOnly() then
                l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 0, 0);
                return;
            else
                l_ImageButton_0.Position = UDim2.new(1, -l_ImageButton_0.AbsoluteSize.X, 1, -l_ImageButton_0.AbsoluteSize.Y);
                return;
            end;
        end;
    end;
    l_ImageButton_0.DragStopped:connect(function(_, _) --[[ Line: 219 ]]
        -- upvalues: l_Frame_0 (copy), l_ChatSettings_0 (ref)
        l_Frame_0.Draggable = l_ChatSettings_0.WindowDraggable;
    end);
    local v53 = false;
    l_ImageButton_0.Changed:connect(function(v54) --[[ Line: 225 ]]
        -- upvalues: l_Frame_0 (copy), v53 (ref), v50 (copy), l_ImageButton_0 (copy)
        if v54 == "AbsolutePosition" and not l_Frame_0.Draggable then
            if v53 then
                return;
            else
                v53 = true;
                v50(l_ImageButton_0.AbsolutePosition);
                v53 = false;
            end;
        end;
    end);
    local function _(v55) --[[ Line: 236 ]] --[[ Name: CalculateChannelsBarPixelSize ]]
        -- upvalues: v26 (ref), l_ChatSettings_0 (ref)
        return math.max(32, (if v26 == 1 then v55 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else v55 or l_ChatSettings_0.ChatChannelsTabTextSize) + 8) + 2;
    end;
    local function _(v57) --[[ Line: 249 ]] --[[ Name: CalculateChatBarPixelSize ]]
        -- upvalues: v26 (ref), l_ChatSettings_0 (ref)
        return (if v26 == 1 then v57 or l_ChatSettings_0.ChatBarTextSizePhone else v57 or l_ChatSettings_0.ChatBarTextSize) + 14 + 10;
    end;
    if bubbleChatOnly() then
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_2.Visible = false;
        l_Frame_2.Active = false;
        l_Frame_3.Visible = false;
        l_Frame_3.Active = false;
        local v59 = 0;
        local v60 = 0;
        local l_l_Frame_0_3 = l_Frame_0;
        while l_l_Frame_0_3 and not l_l_Frame_0_3:IsA("ScreenGui") do
            l_l_Frame_0_3 = l_l_Frame_0_3.Parent;
        end;
        local _ = l_l_Frame_0_3;
        if v26 == 1 then
            v59 = l_ChatSettings_0.DefaultWindowSizePhone.X.Scale;
            v60 = l_ChatSettings_0.DefaultWindowSizePhone.X.Offset;
        elseif v26 == 2 then
            v59 = l_ChatSettings_0.DefaultWindowSizeTablet.X.Scale;
            v60 = l_ChatSettings_0.DefaultWindowSizeTablet.X.Offset;
        else
            v59 = l_ChatSettings_0.DefaultWindowSizeDesktop.X.Scale;
            v60 = l_ChatSettings_0.DefaultWindowSizeDesktop.X.Offset;
        end;
        local v63 = nil;
        l_l_Frame_0_3 = (if v26 == 1 then v63 or l_ChatSettings_0.ChatBarTextSizePhone else v63 or l_ChatSettings_0.ChatBarTextSize) + 14 + 10;
        l_Frame_0.Size = UDim2.new(v59, v60, 0, l_l_Frame_0_3);
        l_Frame_0.Position = l_ChatSettings_0.DefaultWindowPosition;
    else
        local l_l_Frame_0_4 = l_Frame_0;
        while l_l_Frame_0_4 and not l_l_Frame_0_4:IsA("ScreenGui") do
            l_l_Frame_0_4 = l_l_Frame_0_4.Parent;
        end;
        local _ = l_l_Frame_0_4;
        if v26 == 1 then
            l_Frame_0.Size = l_ChatSettings_0.DefaultWindowSizePhone;
        elseif v26 == 2 then
            l_Frame_0.Size = l_ChatSettings_0.DefaultWindowSizeTablet;
        else
            l_Frame_0.Size = l_ChatSettings_0.DefaultWindowSizeDesktop;
        end;
        l_Frame_0.Position = l_ChatSettings_0.DefaultWindowPosition;
    end;
    if v26 == 1 then
        l_ChatSettings_0.ChatWindowTextSize = l_ChatSettings_0.ChatWindowTextSizePhone;
        l_ChatSettings_0.ChatChannelsTabTextSize = l_ChatSettings_0.ChatChannelsTabTextSizePhone;
        l_ChatSettings_0.ChatBarTextSize = l_ChatSettings_0.ChatBarTextSizePhone;
    end;
    local function _(v66) --[[ Line: 318 ]] --[[ Name: UpdateDraggable ]]
        -- upvalues: l_Frame_0 (copy)
        l_Frame_0.Active = v66;
        l_Frame_0.Draggable = v66;
    end;
    local function v70(v68) --[[ Line: 323 ]] --[[ Name: UpdateResizable ]]
        -- upvalues: l_ImageButton_0 (copy), l_Frame_1 (copy)
        l_ImageButton_0.Visible = v68;
        l_ImageButton_0.Draggable = v68;
        local l_Offset_0 = l_Frame_1.Size.Y.Offset;
        if v68 then
            l_Frame_1.Size = UDim2.new(1, -l_Offset_0 - 2, 0, l_Offset_0);
            if not bubbleChatOnly() then
                l_Frame_1.Position = UDim2.new(0, 0, 1, -l_Offset_0);
                return;
            end;
        else
            l_Frame_1.Size = UDim2.new(1, 0, 0, l_Offset_0);
            if not bubbleChatOnly() then
                l_Frame_1.Position = UDim2.new(0, 0, 1, -l_Offset_0);
            end;
        end;
    end;
    local function v74() --[[ Line: 342 ]] --[[ Name: UpdateChatChannelParentFrameSize ]]
        -- upvalues: v26 (ref), l_ChatSettings_0 (ref), l_Frame_3 (copy)
        local v71 = nil;
        local v72 = math.max(32, (if v26 == 1 then v71 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else v71 or l_ChatSettings_0.ChatChannelsTabTextSize) + 8) + 2;
        local v73 = nil;
        v71 = (if v26 == 1 then v73 or l_ChatSettings_0.ChatBarTextSizePhone else v73 or l_ChatSettings_0.ChatBarTextSize) + 14 + 10;
        if l_ChatSettings_0.ShowChannelsBar then
            l_Frame_3.Size = UDim2.new(1, 0, 1, -(v72 + v71 + 2 + 2));
            l_Frame_3.Position = UDim2.new(0, 0, 0, v72 + 2);
            return;
        else
            l_Frame_3.Size = UDim2.new(1, 0, 1, -(v71 + 2 + 2));
            l_Frame_3.Position = UDim2.new(0, 0, 0, 2);
            return;
        end;
    end;
    local function _(v75) --[[ Line: 357 ]] --[[ Name: UpdateChatChannelsTabTextSize ]]
        -- upvalues: v26 (ref), l_ChatSettings_0 (ref), l_Frame_2 (copy), v74 (copy)
        local l_v75_0 = v75;
        local v77 = math.max(32, (if v26 == 1 then l_v75_0 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else l_v75_0 or l_ChatSettings_0.ChatChannelsTabTextSize) + 8) + 2;
        l_Frame_2.Size = UDim2.new(1, 0, 0, v77);
        v74();
    end;
    local function v82(v79) --[[ Line: 364 ]] --[[ Name: UpdateChatBarTextSize ]]
        -- upvalues: v26 (ref), l_ChatSettings_0 (ref), l_Frame_1 (copy), l_ImageButton_0 (copy), v74 (copy), v70 (copy)
        local l_v79_0 = v79;
        local v81 = (if v26 == 1 then l_v79_0 or l_ChatSettings_0.ChatBarTextSizePhone else l_v79_0 or l_ChatSettings_0.ChatBarTextSize) + 14 + 10;
        l_Frame_1.Size = UDim2.new(1, 0, 0, v81);
        if not bubbleChatOnly() then
            l_Frame_1.Position = UDim2.new(0, 0, 1, -v81);
        end;
        l_ImageButton_0.Size = UDim2.new(0, v81, 0, v81);
        l_ImageButton_0.Position = UDim2.new(1, -v81, 1, -v81);
        v74();
        v70(l_ChatSettings_0.WindowResizable);
    end;
    local function _(v83) --[[ Line: 379 ]] --[[ Name: UpdateShowChannelsBar ]]
        -- upvalues: l_Frame_2 (copy), v74 (copy)
        l_Frame_2.Visible = v83;
        v74();
    end;
    local l_ChatChannelsTabTextSize_0 = l_ChatSettings_0.ChatChannelsTabTextSize;
    local v86 = math.max(32, (if v26 == 1 then l_ChatChannelsTabTextSize_0 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else l_ChatChannelsTabTextSize_0 or l_ChatSettings_0.ChatChannelsTabTextSize) + 8) + 2;
    l_Frame_2.Size = UDim2.new(1, 0, 0, v86);
    v74();
    v82(l_ChatSettings_0.ChatBarTextSize);
    local l_WindowDraggable_0 = l_ChatSettings_0.WindowDraggable;
    l_Frame_0.Active = l_WindowDraggable_0;
    l_Frame_0.Draggable = l_WindowDraggable_0;
    v70(l_ChatSettings_0.WindowResizable);
    l_Frame_2.Visible = l_ChatSettings_0.ShowChannelsBar;
    v74();
    l_ChatSettings_0.SettingsChanged:connect(function(v88, v89) --[[ Line: 390 ]]
        -- upvalues: l_Frame_0 (copy), v70 (copy), v26 (ref), l_ChatSettings_0 (ref), l_Frame_2 (copy), v74 (copy), v82 (copy)
        if v88 == "WindowDraggable" then
            l_Frame_0.Active = v89;
            l_Frame_0.Draggable = v89;
            return;
        elseif v88 == "WindowResizable" then
            v70(v89);
            return;
        elseif v88 == "ChatChannelsTabTextSize" then
            local l_v89_0 = v89;
            local v91 = math.max(32, (if v26 == 1 then l_v89_0 or l_ChatSettings_0.ChatChannelsTabTextSizePhone else l_v89_0 or l_ChatSettings_0.ChatChannelsTabTextSize) + 8) + 2;
            l_Frame_2.Size = UDim2.new(1, 0, 0, v91);
            v74();
            return;
        elseif v88 == "ChatBarTextSize" then
            v82(v89);
            return;
        else
            if v88 == "ShowChannelsBar" then
                l_Frame_2.Visible = v89;
                v74();
            end;
            return;
        end;
    end);
    v15.GuiObject = l_Frame_0;
    v15.GuiObjects.BaseFrame = l_Frame_0;
    v15.GuiObjects.ChatBarParentFrame = l_Frame_1;
    v15.GuiObjects.ChannelsBarParentFrame = l_Frame_2;
    v15.GuiObjects.ChatChannelParentFrame = l_Frame_3;
    v15.GuiObjects.ChatResizerFrame = l_ImageButton_0;
    v15.GuiObjects.ResizeIcon = l_ImageLabel_0;
    v15:AnimGuiObjects();
end;
v10.GetChatBar = function(v92) --[[ Line: 420 ]] --[[ Name: GetChatBar ]]
    return v92.ChatBar;
end;
v10.RegisterChatBar = function(v93, v94) --[[ Line: 424 ]] --[[ Name: RegisterChatBar ]]
    v93.ChatBar = v94;
    v93.ChatBar:CreateGuiObjects(v93.GuiObjects.ChatBarParentFrame);
end;
v10.RegisterChannelsBar = function(v95, v96) --[[ Line: 429 ]] --[[ Name: RegisterChannelsBar ]]
    v95.ChannelsBar = v96;
    v95.ChannelsBar:CreateGuiObjects(v95.GuiObjects.ChannelsBarParentFrame);
end;
v10.RegisterMessageLogDisplay = function(v97, v98) --[[ Line: 434 ]] --[[ Name: RegisterMessageLogDisplay ]]
    v97.MessageLogDisplay = v98;
    v97.MessageLogDisplay.GuiObject.Parent = v97.GuiObjects.ChatChannelParentFrame;
end;
v10.AddChannel = function(v99, v100) --[[ Line: 439 ]] --[[ Name: AddChannel ]]
    -- upvalues: l_ChatChannel_0 (copy)
    if v99:GetChannel(v100) then
        error("Channel '" .. v100 .. "' already exists!");
        return;
    else
        local v101 = l_ChatChannel_0.new(v100, v99.MessageLogDisplay);
        v99.Channels[v100:lower()] = v101;
        v101:SetActive(false);
        local v102 = v99.ChannelsBar:AddChannelTab(v100);
        v102.NameTag.MouseButton1Click:connect(function() --[[ Line: 451 ]]
            -- upvalues: v99 (copy), v100 (copy)
            v99:SwitchCurrentChannel(v100);
        end);
        v101:RegisterChannelTab(v102);
        return v101;
    end;
end;
v10.GetFirstChannel = function(v103) --[[ Line: 460 ]] --[[ Name: GetFirstChannel ]]
    for _, v105 in pairs(v103.Channels) do
        return v105;
    end;
    return nil;
end;
v10.RemoveChannel = function(v106, v107) --[[ Line: 469 ]] --[[ Name: RemoveChannel ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if not v106:GetChannel(v107) then
        error("Channel '" .. v107 .. "' does not exist!");
    end;
    local v108 = v107:lower();
    local v109 = false;
    if v106.Channels[v108] == v106:GetCurrentChannel() then
        v109 = true;
        v106:SwitchCurrentChannel(nil);
    end;
    v106.Channels[v108]:Destroy();
    v106.Channels[v108] = nil;
    v106.ChannelsBar:RemoveChannelTab(v107);
    if v109 then
        local v110 = v106:GetChannel(l_ChatSettings_0.GeneralChannelName) ~= nil;
        local v111 = v108 == l_ChatSettings_0.GeneralChannelName:lower();
        local v112 = nil;
        if v110 and not v111 then
            v112 = l_ChatSettings_0.GeneralChannelName;
        else
            local l_v106_FirstChannel_0 = v106:GetFirstChannel();
            v112 = l_v106_FirstChannel_0 and l_v106_FirstChannel_0.Name or nil;
        end;
        v106:SwitchCurrentChannel(v112);
    end;
    if not l_ChatSettings_0.ShowChannelsBar and v106.ChatBar.TargetChannel == v107 then
        v106.ChatBar:SetChannelTarget(l_ChatSettings_0.GeneralChannelName);
    end;
end;
v10.GetChannel = function(v114, v115) --[[ Line: 511 ]] --[[ Name: GetChannel ]]
    return v115 and v114.Channels[v115:lower()] or nil;
end;
v10.GetTargetMessageChannel = function(v116) --[[ Line: 515 ]] --[[ Name: GetTargetMessageChannel ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if not l_ChatSettings_0.ShowChannelsBar then
        return v116.ChatBar.TargetChannel;
    else
        local l_v116_CurrentChannel_0 = v116:GetCurrentChannel();
        return l_v116_CurrentChannel_0 and l_v116_CurrentChannel_0.Name;
    end;
end;
v10.GetCurrentChannel = function(v118) --[[ Line: 524 ]] --[[ Name: GetCurrentChannel ]]
    return v118.CurrentChannel;
end;
v10.SwitchCurrentChannel = function(v119, v120) --[[ Line: 528 ]] --[[ Name: SwitchCurrentChannel ]]
    -- upvalues: l_ChatSettings_0 (copy)
    if not l_ChatSettings_0.ShowChannelsBar then
        local l_v119_Channel_0 = v119:GetChannel(v120);
        if l_v119_Channel_0 then
            v119.ChatBar:SetChannelTarget(l_v119_Channel_0.Name);
        end;
        v120 = l_ChatSettings_0.GeneralChannelName;
    end;
    local l_v119_CurrentChannel_0 = v119:GetCurrentChannel();
    local l_v119_Channel_1 = v119:GetChannel(v120);
    if l_v119_Channel_1 == nil then
        error(string.format("Channel '%s' does not exist.", v120));
    end;
    if l_v119_Channel_1 ~= l_v119_CurrentChannel_0 then
        if l_v119_CurrentChannel_0 then
            l_v119_CurrentChannel_0:SetActive(false);
            v119.ChannelsBar:GetChannelTab(l_v119_CurrentChannel_0.Name):SetActive(false);
        end;
        if l_v119_Channel_1 then
            l_v119_Channel_1:SetActive(true);
            v119.ChannelsBar:GetChannelTab(l_v119_Channel_1.Name):SetActive(true);
        end;
        v119.CurrentChannel = l_v119_Channel_1;
    end;
end;
v10.UpdateFrameVisibility = function(v124) --[[ Line: 562 ]] --[[ Name: UpdateFrameVisibility ]]
    v124.GuiObject.Visible = v124.Visible and v124.CoreGuiEnabled;
end;
v10.GetVisible = function(v125) --[[ Line: 566 ]] --[[ Name: GetVisible ]]
    return v125.Visible;
end;
v10.SetVisible = function(v126, v127) --[[ Line: 570 ]] --[[ Name: SetVisible ]]
    v126.Visible = v127;
    v126:UpdateFrameVisibility();
end;
v10.GetCoreGuiEnabled = function(v128) --[[ Line: 575 ]] --[[ Name: GetCoreGuiEnabled ]]
    return v128.CoreGuiEnabled;
end;
v10.SetCoreGuiEnabled = function(v129, v130) --[[ Line: 579 ]] --[[ Name: SetCoreGuiEnabled ]]
    v129.CoreGuiEnabled = v130;
    v129:UpdateFrameVisibility();
end;
v10.EnableResizable = function(v131) --[[ Line: 584 ]] --[[ Name: EnableResizable ]]
    v131.GuiObjects.ChatResizerFrame.Active = true;
end;
v10.DisableResizable = function(v132) --[[ Line: 588 ]] --[[ Name: DisableResizable ]]
    v132.GuiObjects.ChatResizerFrame.Active = false;
end;
v10.FadeOutBackground = function(v133, v134) --[[ Line: 592 ]] --[[ Name: FadeOutBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v133.ChannelsBar:FadeOutBackground(v134);
    v133.MessageLogDisplay:FadeOutBackground(v134);
    v133.ChatBar:FadeOutBackground(v134);
    v133.AnimParams.Background_TargetTransparency = 1;
    v133.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v134);
end;
v10.FadeInBackground = function(v135, v136) --[[ Line: 601 ]] --[[ Name: FadeInBackground ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v135.ChannelsBar:FadeInBackground(v136);
    v135.MessageLogDisplay:FadeInBackground(v136);
    v135.ChatBar:FadeInBackground(v136);
    v135.AnimParams.Background_TargetTransparency = 0.6;
    v135.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(v136);
end;
v10.FadeOutText = function(v137, v138) --[[ Line: 610 ]] --[[ Name: FadeOutText ]]
    v137.MessageLogDisplay:FadeOutText(v138);
    v137.ChannelsBar:FadeOutText(v138);
end;
v10.FadeInText = function(v139, v140) --[[ Line: 615 ]] --[[ Name: FadeInText ]]
    v139.MessageLogDisplay:FadeInText(v140);
    v139.ChannelsBar:FadeInText(v140);
end;
v10.AnimGuiObjects = function(v141) --[[ Line: 620 ]] --[[ Name: AnimGuiObjects ]]
    v141.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = v141.AnimParams.Background_CurrentTransparency;
    v141.GuiObjects.ChatResizerFrame.BackgroundTransparency = v141.AnimParams.Background_CurrentTransparency;
    v141.GuiObjects.ResizeIcon.ImageTransparency = v141.AnimParams.Background_CurrentTransparency;
end;
v10.InitializeAnimParams = function(v142) --[[ Line: 626 ]] --[[ Name: InitializeAnimParams ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v142.AnimParams.Background_TargetTransparency = 0.6;
    v142.AnimParams.Background_CurrentTransparency = 0.6;
    v142.AnimParams.Background_NormalizedExptValue = l_CurveUtil_0:NormalizedDefaultExptValueInSeconds(0);
end;
v10.Update = function(v143, v144) --[[ Line: 632 ]] --[[ Name: Update ]]
    -- upvalues: l_CurveUtil_0 (copy)
    v143.ChatBar:Update(v144);
    v143.ChannelsBar:Update(v144);
    v143.MessageLogDisplay:Update(v144);
    v143.AnimParams.Background_CurrentTransparency = l_CurveUtil_0:Expt(v143.AnimParams.Background_CurrentTransparency, v143.AnimParams.Background_TargetTransparency, v143.AnimParams.Background_NormalizedExptValue, v144);
    v143:AnimGuiObjects();
end;
v0.new = function() --[[ Line: 650 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    local v145 = setmetatable({}, v10);
    v145.GuiObject = nil;
    v145.GuiObjects = {};
    v145.ChatBar = nil;
    v145.ChannelsBar = nil;
    v145.MessageLogDisplay = nil;
    v145.Channels = {};
    v145.CurrentChannel = nil;
    v145.Visible = true;
    v145.CoreGuiEnabled = true;
    v145.AnimParams = {};
    v145:InitializeAnimParams();
    return v145;
end;
return v0;