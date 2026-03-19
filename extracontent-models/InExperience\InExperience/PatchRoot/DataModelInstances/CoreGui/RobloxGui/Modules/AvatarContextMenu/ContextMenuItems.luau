local l_Players_0 = game:GetService("Players");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Chat_0 = game:GetService("Chat");
local l_RunService_0 = game:GetService("RunService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Modules_0 = l_RobloxGui_0:WaitForChild("Modules");
local v11 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v12 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_AvatarContextMenu_0 = l_Modules_0:WaitForChild("AvatarContextMenu");
local l_ContextMenuUtil_0 = require(l_AvatarContextMenu_0:WaitForChild("ContextMenuUtil"));
local v15 = require(l_AvatarContextMenu_0.ThemeHandler);
local v16 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v17 = require(l_CorePackages_0.Packages.t);
local v18 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v19 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v20 = require(l_Modules_0.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor);
local v21 = require(l_Modules_0.Common.Flags.FFlagWaveEmoteOnAvatarContextMenuWithExpChat);
local v22 = require(l_Modules_0.Common.Flags.FFlagWhisperEmoteOnAvatarContextMenuWithExpChat);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v24 = {
    [Enum.AvatarContextMenuOption.Chat] = true, 
    [Enum.AvatarContextMenuOption.Friend] = true, 
    [Enum.AvatarContextMenuOption.Emote] = true, 
    [Enum.AvatarContextMenuOption.InspectMenu] = true
};
local v25 = {};
local v26 = 0;
local v27 = {};
v27.__index = v27;
v27.UpdateInspectMenuEnabled = function(_) --[[ Line: 74 ]] --[[ Name: UpdateInspectMenuEnabled ]]
    -- upvalues: l_GuiService_0 (copy), v24 (copy)
    local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
    if l_l_GuiService_0_InspectMenuEnabled_0 ~= v24[Enum.AvatarContextMenuOption.InspectMenu] then
        v24[Enum.AvatarContextMenuOption.InspectMenu] = l_l_GuiService_0_InspectMenuEnabled_0;
    end;
end;
v27.ClearMenuItems = function(v30) --[[ Line: 82 ]] --[[ Name: ClearMenuItems ]]
    local l_Children_0 = v30.MenuItemFrame:GetChildren();
    for v32 = 1, #l_Children_0 do
        if l_Children_0[v32]:IsA("GuiObject") then
            l_Children_0[v32]:Destroy();
        end;
    end;
end;
v27.AddCustomAvatarMenuItem = function(_, v34, v35) --[[ Line: 91 ]] --[[ Name: AddCustomAvatarMenuItem ]]
    -- upvalues: v26 (ref), v25 (copy)
    v26 = v26 + 1;
    v25[v34] = {
        event = v35, 
        layoutOrder = v26
    };
end;
v27.RemoveCustomAvatarMenuItem = function(_, v37) --[[ Line: 99 ]] --[[ Name: RemoveCustomAvatarMenuItem ]]
    -- upvalues: v25 (copy)
    v25[v37] = nil;
end;
v27.IsContextAvatarEnumItem = function(_, v39) --[[ Line: 103 ]] --[[ Name: IsContextAvatarEnumItem ]]
    local l_EnumItems_0 = Enum.AvatarContextMenuOption:GetEnumItems();
    for v41 = 1, #l_EnumItems_0 do
        if v39 == l_EnumItems_0[v41] then
            return true;
        end;
    end;
    return false;
end;
v27.EnableDefaultMenuItem = function(_, v43) --[[ Line: 113 ]] --[[ Name: EnableDefaultMenuItem ]]
    -- upvalues: v24 (copy)
    v24[v43] = true;
end;
v27.RemoveDefaultMenuItem = function(_, v45) --[[ Line: 117 ]] --[[ Name: RemoveDefaultMenuItem ]]
    -- upvalues: v24 (copy)
    v24[v45] = false;
end;
v27.RegisterCoreMethods = function(v46) --[[ Line: 121 ]] --[[ Name: RegisterCoreMethods ]]
    -- upvalues: l_StarterGui_0 (copy)
    l_StarterGui_0:RegisterSetCore("AddAvatarContextMenuOption", function(v47) --[[ Line: 122 ]] --[[ Name: addMenuItemFunc ]]
        -- upvalues: v46 (copy)
        if type(v47) == "table" then
            local v48 = "";
            if v47[1] and type(v47[1]) == "string" then
                v48 = v47[1];
            else
                error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption");
            end;
            if v47[2] and typeof(v47[2]) == "Instance" and v47[2].ClassName == "BindableEvent" then
                v46:AddCustomAvatarMenuItem(v48, v47[2]);
                return;
            else
                error("AddAvatarContextMenuOption second table entry must be a BindableEvent");
                return;
            end;
        elseif typeof(v47) == "EnumItem" then
            if v46:IsContextAvatarEnumItem(v47) then
                v46:EnableDefaultMenuItem(v47);
                return;
            else
                error("AddAvatarContextMenuOption given EnumItem is not valid");
                return;
            end;
        else
            error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption");
            return;
        end;
    end);
    l_StarterGui_0:RegisterSetCore("RemoveAvatarContextMenuOption", function(v49) --[[ Line: 147 ]] --[[ Name: removeMenuItemFunc ]]
        -- upvalues: v46 (copy)
        if type(v49) == "string" then
            v46:RemoveCustomAvatarMenuItem(v49);
            return;
        elseif typeof(v49) == "EnumItem" then
            if v46:IsContextAvatarEnumItem(v49) then
                v46:RemoveDefaultMenuItem(v49);
                return;
            else
                error("RemoveAvatarContextMenuOption given EnumItem is not valid");
                return;
            end;
        else
            error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption");
            return;
        end;
    end);
end;
v27.CreateCustomMenuItems = function(v50) --[[ Line: 163 ]] --[[ Name: CreateCustomMenuItems ]]
    -- upvalues: v25 (copy), l_RbxAnalyticsService_0 (copy), v12 (copy), l_ContextMenuUtil_0 (copy), v15 (copy)
    for v51, v52 in pairs(v25) do
        l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuCustomButton", "name: " .. tostring(v51));
        local function v53() --[[ Line: 166 ]] --[[ Name: customButtonFunc ]]
            -- upvalues: v50 (copy), v52 (copy)
            if v50.CloseMenuFunc then
                v50:CloseMenuFunc();
            end;
            v52.event:Fire(v50.SelectedPlayer);
        end;
        v51 = v12:TranslateGameText(v50.MenuItemFrame, v51);
        local v54 = l_ContextMenuUtil_0:MakeStyledButton("CustomButton", v51, UDim2.new(0.96, 0, 0, 52), v53, v15:GetTheme());
        v54.Name = "CustomButton";
        v54.LayoutOrder = v52.layoutOrder;
        v54.Parent = v50.MenuItemFrame;
    end;
end;
local v55 = "Add Friend";
local v56 = "Friends";
local v57 = "Friend Request Pending";
local v58 = "Accept Friend Request";
local v59 = "Player Blocked";
v27.CreateFriendButton = function(v60, v61, v62) --[[ Line: 197 ]] --[[ Name: CreateFriendButton ]]
    -- upvalues: v55 (ref), v11 (copy), v56 (ref), v57 (ref), v58 (ref), v59 (ref), l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (ref), l_ContextMenuUtil_0 (copy), v15 (copy), v26 (ref)
    v55 = v11:FormatByKey("Corescripts.AvatarContextMenu.AddFriend");
    v56 = v11:FormatByKey("Corescripts.AvatarContextMenu.Friends");
    v57 = v11:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending");
    v58 = v11:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest");
    v59 = v11:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked");
    local l_FriendStatus_0 = v60.MenuItemFrame:FindFirstChild("FriendStatus");
    if l_FriendStatus_0 then
        l_FriendStatus_0:Destroy();
        l_FriendStatus_0 = nil;
    end;
    local v64 = nil;
    local function v65() --[[ Line: 214 ]]
        -- upvalues: v64 (ref), l_FriendStatus_0 (ref), v57 (ref), l_RbxAnalyticsService_0 (ref), l_LocalPlayer_0 (ref), v60 (copy)
        if v64 and l_FriendStatus_0.Selectable then
            l_FriendStatus_0.Selectable = false;
            v64.TextTransparency = 0.75;
            v64.Text = v57;
            l_RbxAnalyticsService_0:ReportCounter("AvatarContextMenu-RequestFriendship");
            l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu");
            l_LocalPlayer_0:RequestFriendship(v60.SelectedPlayer);
        end;
    end;
    local v66, v67 = l_ContextMenuUtil_0:MakeStyledButton("FriendStatus", v55, UDim2.new(0.96, 0, 0, 52), v65, v15:GetTheme());
    l_FriendStatus_0 = v66;
    v64 = v67;
    if v62 then
        l_FriendStatus_0.Selectable = false;
        v64.TextTransparency = 0.75;
        v64.Text = v59;
    elseif v61 == Enum.FriendStatus.Friend then
        l_FriendStatus_0.Selectable = false;
        v64.TextTransparency = 0.75;
        v64.Text = v56;
    elseif v61 == Enum.FriendStatus.FriendRequestSent then
        l_FriendStatus_0.Selectable = false;
        v64.TextTransparency = 0.75;
        v64.Text = v57;
    elseif v61 == Enum.FriendStatus.FriendRequestReceived then
        v64.Text = v58;
    else
        l_FriendStatus_0.Selectable = true;
        v64.TextTransparency = 0;
    end;
    l_FriendStatus_0.LayoutOrder = v26 + 1;
    l_FriendStatus_0.Parent = v60.MenuItemFrame;
end;
v27.UpdateFriendButton = function(v68, v69, v70) --[[ Line: 256 ]] --[[ Name: UpdateFriendButton ]]
    if v68.MenuItemFrame:FindFirstChild("FriendStatus") then
        v68:CreateFriendButton(v69, v70);
    end;
end;
v27.CreateInspectAndBuyButton = function(v71) --[[ Line: 263 ]] --[[ Name: CreateInspectAndBuyButton ]]
    -- upvalues: v24 (copy), l_GuiService_0 (copy), l_ContextMenuUtil_0 (copy), v11 (copy), v15 (copy), v26 (ref)
    local function v72() --[[ Line: 264 ]] --[[ Name: browseItems ]]
        -- upvalues: v71 (copy), v24 (ref), l_GuiService_0 (ref)
        if v71.CloseMenuFunc then
            v71:CloseMenuFunc();
        end;
        if not v24[Enum.AvatarContextMenuOption.InspectMenu] then
            warn("The Inspect Menu is not currently available.");
            return;
        else
            l_GuiService_0:InspectPlayerFromUserIdWithCtx(v71.SelectedPlayer.UserId, "avatarContextMenu");
            return;
        end;
    end;
    local v73 = l_ContextMenuUtil_0:MakeStyledButton("View", v11:FormatByKey("InGame.InspectMenu.Action.View"), UDim2.new(0.96, 0, 0, 52), v72, v15:GetTheme());
    v73.LayoutOrder = v26 + 4;
    v73.Parent = v71.MenuItemFrame;
end;
local function v78() --[[ Line: 289 ]] --[[ Name: findFirstTextChannel ]]
    -- upvalues: l_TextChatService_0 (copy), l_Players_0 (copy)
    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXGeneral", true);
    if l_l_TextChatService_0_FirstChild_0 then
        return l_l_TextChatService_0_FirstChild_0;
    else
        for _, v76 in ipairs(l_TextChatService_0:GetDescendants()) do
            if v76:IsA("TextSource") and v76.UserId == l_Players_0.LocalPlayer.UserId and v76.CanSend == true then
                local l_Parent_0 = v76.Parent;
                if l_Parent_0:IsA("TextChannel") then
                    return l_Parent_0;
                end;
            end;
        end;
        return nil;
    end;
end;
local _ = function(v79) --[[ Line: 310 ]] --[[ Name: isExperienceChatOn ]]
    local l_status_0, _ = pcall(function() --[[ Line: 311 ]]
        local _ = Enum.ChatVersion.LegacyChatService;
    end);
    if l_status_0 and v79.ChatVersion == Enum.ChatVersion.TextChatService then
        return true;
    else
        return false;
    end;
end;
v27.CreateEmoteButton = function(v84) --[[ Line: 323 ]] --[[ Name: CreateEmoteButton ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_Players_0 (copy), v21 (copy), v78 (copy), v11 (copy), l_ContextMenuUtil_0 (copy), v15 (copy), v26 (ref)
    local function v90() --[[ Line: 324 ]] --[[ Name: wave ]]
        -- upvalues: v84 (copy), l_RbxAnalyticsService_0 (ref), l_Players_0 (ref), v21 (ref), v78 (ref)
        if v84.CloseMenuFunc then
            v84:CloseMenuFunc();
        end;
        l_RbxAnalyticsService_0:ReportCounter("AvatarContextMenu-Wave");
        l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(game.PlaceId));
        l_Players_0:Chat("/e wave");
        local l_TextChatService_1 = v84.TextChatService;
        local l_status_1, _ = pcall(function() --[[ Line: 311 ]]
            local _ = Enum.ChatVersion.LegacyChatService;
        end);
        if (if l_status_1 then l_TextChatService_1.ChatVersion == Enum.ChatVersion.TextChatService else false) and v21 then
            local v89 = v78();
            if v89 then
                v89:SendAsync("/e wave");
            end;
        end;
    end;
    local v91 = v11:FormatByKey("Corescripts.AvatarContextMenu.Wave");
    local v92 = l_ContextMenuUtil_0:MakeStyledButton("Wave", v91, UDim2.new(0.96, 0, 0, 52), v90, v15:GetTheme());
    v92.LayoutOrder = v26 + 5;
    v92.Parent = v84.MenuItemFrame;
end;
local v93 = v17.interface({
    localPlayerChatEnabled = v17.boolean, 
    localPlayerCanChatWithSelectedPlayer = v17.boolean
});
v27.CreateChatButton = function(v94, v95) --[[ Line: 361 ]] --[[ Name: CreateChatButton ]]
    -- upvalues: v22 (copy), l_RbxAnalyticsService_0 (copy), v78 (copy), v19 (copy), l_RobloxGui_0 (copy), l_LocalPlayer_0 (ref), v11 (copy), l_ContextMenuUtil_0 (copy), v15 (copy), v26 (ref), v20 (copy), v18 (copy), v93 (copy), l_Chat_0 (copy), l_RunService_0 (copy)
    local l_v22_0 = v22;
    if not l_v22_0 then
        local l_TextChatService_2 = v94.TextChatService;
        local l_status_2, _ = pcall(function() --[[ Line: 311 ]]
            local _ = Enum.ChatVersion.LegacyChatService;
        end);
        if if l_status_2 then l_TextChatService_2.ChatVersion == Enum.ChatVersion.TextChatService else false then
            return;
        end;
    end;
    local v101 = false;
    local function v110() --[[ Line: 368 ]] --[[ Name: chatFunc ]]
        -- upvalues: v101 (ref), v94 (copy), l_RbxAnalyticsService_0 (ref), l_v22_0 (copy), v78 (ref), v19 (ref), l_RobloxGui_0 (ref), l_LocalPlayer_0 (ref)
        local v102 = false;
        if v101 then
            return;
        else
            if v94.CloseMenuFunc then
                v94:CloseMenuFunc();
            end;
            l_RbxAnalyticsService_0:ReportCounter("AvatarContextMenu-Chat");
            l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(game.PlaceId));
            local v103;
            if l_v22_0 then
                local l_TextChatService_3 = v94.TextChatService;
                local l_status_3, _ = pcall(function() --[[ Line: 311 ]]
                    local _ = Enum.ChatVersion.LegacyChatService;
                end);
                if if l_status_3 then l_TextChatService_3.ChatVersion == Enum.ChatVersion.TextChatService else false then
                    v103 = v78();
                    if v103 then
                        task.spawn(function() --[[ Line: 383 ]]
                            -- upvalues: v103 (copy), v94 (ref)
                            v103:SendAsync("/w @" .. v94.SelectedPlayer.Name);
                        end);
                        if v19.Events and v19.Events.AvatarContextMenuWhisperSelected then
                            v19.Events.AvatarContextMenuWhisperSelected();
                            return;
                        else
                            v102 = true;
                        end;
                    else
                        v102 = true;
                    end;
                end;
            end;
            if not v102 then
                if not v102 then
                    v103 = require(l_RobloxGui_0.Modules.ChatSelector);
                    v103:SetVisible(true);
                    if not v103:EnterWhisperState(v94.SelectedPlayer) then
                        local v108 = nil;
                        if true then
                            local l_v108_0 = v108;
                            pcall(function() --[[ Line: 397 ]]
                                -- upvalues: l_v108_0 (ref), l_LocalPlayer_0 (ref)
                                l_v108_0 = l_LocalPlayer_0.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar;
                            end);
                            if l_v108_0 then
                                l_v108_0.Text = "/w " .. v94.SelectedPlayer.Name;
                            end;
                            v103:FocusChatBar();
                        end;
                    end;
                end;
            end;
            v102 = false;
            return;
        end;
    end;
    local v111 = v11:FormatByKey("Corescripts.AvatarContextMenu.Chat");
    local v112, v113 = l_ContextMenuUtil_0:MakeStyledButton("ChatStatus", v111, UDim2.new(0.96, 0, 0, 52), v110, v15:GetTheme());
    v112.LayoutOrder = v26 + 3;
    local v114 = nil;
    if v20 then
        v18.assert(v93(v95));
        v114 = v95.localPlayerChatEnabled;
    else
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 423 ]]
            -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
            return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
        end);
        v114 = l_status_4 and (l_RunService_0:IsStudio() or l_result_4);
    end;
    if v114 then
        v112.Parent = v94.MenuItemFrame;
        local _ = nil;
        if not if v20 then v95.localPlayerCanChatWithSelectedPlayer else l_ContextMenuUtil_0:GetCanChatWith(v94.SelectedPlayer) then
            v101 = true;
            v112.Selectable = false;
            v113.TextTransparency = 0.75;
            v113.Text = v11:FormatByKey("Corescripts.AvatarContextMenu.ChatDisabled");
        end;
    else
        v112.Parent = nil;
    end;
end;
v27.RemoveLastButtonUnderline = function(v118) --[[ Line: 450 ]] --[[ Name: RemoveLastButtonUnderline ]]
    local l_Children_1 = v118.MenuItemFrame:GetChildren();
    local v120 = nil;
    local v121 = -1;
    for _, v123 in pairs(l_Children_1) do
        if v123:IsA("GuiObject") and v121 < v123.LayoutOrder then
            v121 = v123.LayoutOrder;
            v120 = v123;
        end;
    end;
    if v120 then
        local l_Underline_0 = v120:FindFirstChild("Underline");
        if l_Underline_0 then
            l_Underline_0:Destroy();
        end;
    end;
end;
v27.BuildContextMenuItems = function(v125, v126, v127) --[[ Line: 468 ]] --[[ Name: BuildContextMenuItems ]]
    -- upvalues: l_ContextMenuUtil_0 (copy), v16 (copy), v24 (copy)
    if not v126 then
        return;
    else
        local l_l_ContextMenuUtil_0_FriendStatus_0 = l_ContextMenuUtil_0:GetFriendStatus(v126);
        local v129 = v16:IsPlayerBlockedByUserId(v126.UserId);
        v125:ClearMenuItems();
        v125:SetSelectedPlayer(v126);
        if v24[Enum.AvatarContextMenuOption.Friend] then
            v125:CreateFriendButton(l_l_ContextMenuUtil_0_FriendStatus_0, v129);
        end;
        if v24[Enum.AvatarContextMenuOption.Chat] then
            v125:CreateChatButton(v127);
        end;
        if v24[Enum.AvatarContextMenuOption.Emote] then
            v125:CreateEmoteButton();
        end;
        if v24[Enum.AvatarContextMenuOption.InspectMenu] then
            v125:CreateInspectAndBuyButton();
        end;
        v125:CreateCustomMenuItems();
        v125:RemoveLastButtonUnderline();
        return;
    end;
end;
v27.SetSelectedPlayer = function(v130, v131) --[[ Line: 495 ]] --[[ Name: SetSelectedPlayer ]]
    v130.SelectedPlayer = v131;
end;
v27.SetCloseMenuFunc = function(v132, v133) --[[ Line: 499 ]] --[[ Name: SetCloseMenuFunc ]]
    v132.CloseMenuFunc = v133;
end;
v27.new = function(v134, v135) --[[ Line: 503 ]] --[[ Name: new ]]
    -- upvalues: v27 (copy), l_TextChatService_0 (copy)
    local v136 = setmetatable({}, v27);
    v136.MenuItemFrame = v134;
    v136.SelectedPlayer = nil;
    v136.TextChatService = v135 and v135.TextChatService or l_TextChatService_0;
    v136:RegisterCoreMethods();
    v27:UpdateInspectMenuEnabled();
    return v136;
end;
l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v137) --[[ Line: 517 ]]
    -- upvalues: v27 (copy)
    if not v137 then
        v27:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu);
        return;
    else
        v27:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu);
        return;
    end;
end);
return v27;