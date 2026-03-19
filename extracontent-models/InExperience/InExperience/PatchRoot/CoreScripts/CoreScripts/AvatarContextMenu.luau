local v0 = game:GetService("RunService"):IsStudio();
local v1 = false;
local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
local v3 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local l_CorePackages_0 = game:GetService("CorePackages");
local v15 = false;
enableAvatarContextMenu = function(v16) --[[ Line: 42 ]] --[[ Name: enableAvatarContextMenu ]]
    -- upvalues: v1 (ref), v15 (ref), l_RbxAnalyticsService_0 (copy)
    v1 = not not v16;
    if v1 and not v15 then
        v15 = true;
        l_RbxAnalyticsService_0:TrackEvent("Game", "AvatarContextMenuEnabled", "placeId: " .. tostring(game.PlaceId));
    end;
end;
l_StarterGui_0:RegisterSetCore("SetAvatarContextMenuEnabled", enableAvatarContextMenu);
l_StarterGui_0:RegisterSetCore("AvatarContextMenuEnabled", enableAvatarContextMenu);
l_StarterGui_0:RegisterGetCore("AvatarContextMenuEnabled", function() --[[ Line: 53 ]]
    -- upvalues: v1 (ref)
    return v1;
end);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_AvatarContextMenu_0 = l_Modules_0.AvatarContextMenu;
local v19 = require(l_AvatarContextMenu_0.ContextMenuGui);
local v20 = require(l_AvatarContextMenu_0.ContextMenuItems);
local v21 = require(l_AvatarContextMenu_0.ContextMenuUtil);
local v22 = require(l_AvatarContextMenu_0.SelectedCharacterIndicator);
local v23 = require(l_AvatarContextMenu_0.ThemeHandler);
local v24 = require(l_Modules_0.BackpackScript);
local v25 = require(l_Modules_0.EmotesMenu.EmotesMenuMaster);
local v26 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v27 = require(l_Modules_0.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 76 ]]
    return UserSettings():IsUserFeatureEnabled("UserRaycastUpdateAPI2");
end);
l_result_0 = l_status_0 and l_result_0;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
if l_LocalPlayer_0.UserId <= 0 and not v0 then
    return;
else
    local v31 = nil;
    local v32 = nil;
    local v33 = false;
    local v34 = false;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = RaycastParams.new();
    v40.FilterType = Enum.RaycastFilterType.Exclude;
    v32 = v19:CreateMenuFrame(v23:GetTheme());
    v31 = v20.new(v32.Content.ContextActionList);
    SetSelectedPlayer = function(v41, v42) --[[ Line: 114 ]] --[[ Name: SetSelectedPlayer ]]
        -- upvalues: v35 (ref), v22 (copy), v23 (copy), v27 (copy), l_Chat_0 (copy), l_LocalPlayer_0 (ref), l_RunService_0 (copy), v21 (copy), v31 (ref), v19 (copy)
        if v35 == v41 then
            return;
        else
            v35 = v41;
            v22:ChangeSelectedPlayer(v35, v23:GetTheme());
            if v27 then
                local v43 = {};
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 121 ]]
                    -- upvalues: l_Chat_0 (ref), l_LocalPlayer_0 (ref)
                    return l_Chat_0:CanUserChatAsync(l_LocalPlayer_0.UserId);
                end);
                v43.localPlayerChatEnabled = l_status_1 and (l_RunService_0:IsStudio() or l_result_1);
                v43.localPlayerCanChatWithSelectedPlayer = false;
                if v35 then
                    v43.localPlayerCanChatWithSelectedPlayer = v21:GetCanChatWith(v35);
                end;
                v31:BuildContextMenuItems(v35, v43);
            else
                v31:BuildContextMenuItems(v35);
            end;
            v19:SwitchToPlayerEntry(v35, v42);
            return;
        end;
    end;
    OpenMenu = function(v46) --[[ Line: 135 ]] --[[ Name: OpenMenu ]]
        -- upvalues: v33 (ref), v32 (ref), v39 (ref), v19 (copy), l_TweenService_0 (copy), v2 (copy)
        v33 = true;
        v32.Visible = true;
        v32.Content.ContextActionList.CanvasPosition = Vector2.new(0, 0);
        v32.Position = v46.OffScreenPosition;
        v39 = v19.SelectedPlayerChanged:connect(function() --[[ Line: 142 ]]
            -- upvalues: v19 (ref)
            SetSelectedPlayer(v19:GetSelectedPlayer());
        end);
        v32.Position = v46.OffScreenPosition;
        local v47 = l_TweenService_0:Create(v32, v2, {
            Position = v46.OnScreenPosition
        });
        v47:Play();
        v47.Completed:wait();
        v33 = false;
    end;
    BindMenuActions = function() --[[ Line: 154 ]] --[[ Name: BindMenuActions ]]
        -- upvalues: l_ContextActionService_0 (copy), v19 (copy), l_GuiService_0 (copy)
        l_ContextActionService_0:BindCoreAction("EscapeAvatarContextMenu", function(_, v49, _) --[[ Line: 156 ]]
            if v49 ~= Enum.UserInputState.Begin then
                return;
            else
                CloseContextMenu();
                return;
            end;
        end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB);
        l_ContextActionService_0:BindCoreAction("SwitchPageAvatarContextMenu", function(_, v52, v53) --[[ Line: 165 ]]
            -- upvalues: v19 (ref)
            if v52 == Enum.UserInputState.Begin then
                if v53.KeyCode == Enum.KeyCode.ButtonR1 then
                    v19:OffsetPlayerEntry(1);
                    return;
                elseif v53.KeyCode == Enum.KeyCode.ButtonL1 then
                    v19:OffsetPlayerEntry(-1);
                end;
            end;
        end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1);
        local v54 = nil;
        v54 = l_GuiService_0.MenuOpened:connect(function() --[[ Line: 178 ]]
            -- upvalues: v54 (ref)
            v54:disconnect();
            if Enum.UserInputState.Begin ~= Enum.UserInputState.Begin then
                return;
            else
                CloseContextMenu();
                return;
            end;
        end);
    end;
    BuildPlayerCarousel = function(_, v56) --[[ Line: 184 ]] --[[ Name: BuildPlayerCarousel ]]
        -- upvalues: l_Players_0 (copy), v0 (copy), l_LocalPlayer_0 (ref), v21 (copy), v19 (copy), v23 (copy)
        local v57 = {};
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        for v59 = 1, #l_l_Players_0_Players_0 do
            if (l_l_Players_0_Players_0[v59].UserId > 0 or v0) and l_l_Players_0_Players_0[v59] ~= l_LocalPlayer_0 then
                local l_v21_PlayerPosition_0 = v21:GetPlayerPosition(l_l_Players_0_Players_0[v59]);
                if l_v21_PlayerPosition_0 then
                    local l_magnitude_0 = (v56 - l_v21_PlayerPosition_0).magnitude;
                    table.insert(v57, {
                        l_l_Players_0_Players_0[v59], 
                        l_magnitude_0
                    });
                end;
            end;
        end;
        table.sort(v57, function(v62, v63) --[[ Line: 199 ]] --[[ Name: closestPlayerComp ]]
            return v62[2] > v63[2];
        end);
        v19:BuildPlayerCarousel(v57, v23:GetTheme());
    end;
    l_Players_0.PlayerRemoving:connect(function(v64) --[[ Line: 207 ]]
        -- upvalues: v34 (ref), v35 (ref), v19 (copy)
        if v34 and v64 ~= v35 then
            v19:RemovePlayerEntry(v64);
        end;
    end);
    local function _() --[[ Line: 213 ]] --[[ Name: CloseOtherOpenCoreGui ]]
        -- upvalues: v25 (copy), v24 (copy)
        if v25:isOpen() then
            v25:close();
        end;
        if v24.IsOpen then
            v24.OpenClose();
        end;
    end;
    OpenContextMenu = function(v66, v67) --[[ Line: 223 ]] --[[ Name: OpenContextMenu ]]
        -- upvalues: v33 (ref), v34 (ref), v1 (ref), v25 (copy), v24 (copy), v21 (copy), v19 (copy), v23 (copy)
        if v33 or v34 or not v1 then
            return;
        else
            v34 = true;
            if v25:isOpen() then
                v25:close();
            end;
            if v24.IsOpen then
                v24.OpenClose();
            end;
            BuildPlayerCarousel(v66, v67);
            v21:DisablePlayerMovement();
            BindMenuActions();
            SetSelectedPlayer(v66, true);
            v19:UpdateGuiTheme(v23:GetTheme());
            OpenMenu(v23:GetTheme());
            return;
        end;
    end;
    CloseContextMenu = function() --[[ Line: 241 ]] --[[ Name: CloseContextMenu ]]
        -- upvalues: l_GuiService_0 (copy), l_ContextActionService_0 (copy), v21 (copy), v39 (ref), l_TweenService_0 (copy), v32 (ref), v3 (copy), v34 (ref)
        l_GuiService_0.SelectedCoreObject = nil;
        l_ContextActionService_0:UnbindCoreAction("EscapeAvatarContextMenu");
        l_ContextActionService_0:UnbindCoreAction("SwitchPageAvatarContextMenu");
        v21:EnablePlayerMovement();
        if v39 then
            v39:disconnect();
        end;
        local v68 = l_TweenService_0:Create(v32, v3, {
            Position = UDim2.new(0.5, 0, 1, v32.AbsoluteSize.Y)
        });
        v68:Play();
        v68.Completed:wait();
        v32.Visible = false;
        SetSelectedPlayer(nil);
        v34 = false;
    end;
    v19:SetCloseMenuFunc(CloseContextMenu);
    v31:SetCloseMenuFunc(CloseContextMenu);
    local function _(v69, v70, v71) --[[ Line: 263 ]] --[[ Name: isPointInside ]]
        local v72 = false;
        if v69.X >= v70.X then
            v72 = false;
            if v69.X <= v71.X then
                v72 = false;
                if v69.Y >= v70.Y then
                    v72 = v69.Y <= v71.Y;
                end;
            end;
        end;
        return v72;
    end;
    PointInSwipeArea = function(v74) --[[ Line: 270 ]] --[[ Name: PointInSwipeArea ]]
        -- upvalues: v32 (ref)
        local l_AbsolutePosition_0 = v32.AbsolutePosition;
        local l_NameTag_0 = v32.Content:FindFirstChild("NameTag");
        local v77 = Vector2.new(l_AbsolutePosition_0.x + v32.AbsoluteSize.x, l_NameTag_0.AbsolutePosition.y + l_NameTag_0.AbsoluteSize.y);
        local v78 = false;
        if v74.X >= l_AbsolutePosition_0.X then
            v78 = false;
            if v74.X <= v77.X then
                v78 = false;
                if v74.Y >= l_AbsolutePosition_0.Y then
                    v78 = v74.Y <= v77.Y;
                end;
            end;
        end;
        return v78;
    end;
    LocalPlayerHasToolEquipped = function() --[[ Line: 279 ]] --[[ Name: LocalPlayerHasToolEquipped ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if not l_LocalPlayer_0.Character then
            return false;
        else
            for _, v80 in ipairs(l_LocalPlayer_0.Character:GetChildren()) do
                if v80:IsA("BackpackItem") then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    shouldIgnoreLocalCharacter = function() --[[ Line: 291 ]] --[[ Name: shouldIgnoreLocalCharacter ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if l_LocalPlayer_0.Character then
            local l_Head_0 = l_LocalPlayer_0.Character:FindFirstChild("Head");
            if l_Head_0 and l_Head_0:IsA("BasePart") then
                return l_Head_0.LocalTransparencyModifier >= 0.95;
            end;
        end;
    end;
    clickedOnPoint = function(v82) --[[ Line: 301 ]] --[[ Name: clickedOnPoint ]]
        -- upvalues: l_result_0 (ref), v40 (copy), l_LocalPlayer_0 (ref), v21 (copy), v0 (copy), v34 (ref)
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_CurrentCamera_0 then
            return;
        elseif LocalPlayerHasToolEquipped() then
            return;
        else
            local v84 = l_CurrentCamera_0:ScreenPointToRay(v82.X, v82.Y);
            if l_result_0 then
                v40.FilterDescendantsInstances = if shouldIgnoreLocalCharacter() then {
                    l_LocalPlayer_0.Character
                } else {};
                local v85 = workspace:Raycast(v84.Origin, v84.Direction * 100, v40);
                local v86 = if v85 then v21:FindPlayerFromPart(v85.Instance) else nil;
                if v86 and (v0 and v86 ~= l_LocalPlayer_0 or v86 ~= l_LocalPlayer_0 and v86.UserId > 0) then
                    if v34 then
                        SetSelectedPlayer(v86);
                        return;
                    else
                        OpenContextMenu(v86, v85.Position);
                        return;
                    end;
                elseif not v86 and v34 then
                    CloseContextMenu();
                    return;
                end;
            else
                v84 = Ray.new(v84.Origin, v84.Direction * 100);
                local v87 = nil;
                local v88 = nil;
                if shouldIgnoreLocalCharacter() then
                    local l_workspace_PartOnRay_0, v90 = workspace:FindPartOnRay(v84, l_LocalPlayer_0.Character, false, true);
                    v87 = l_workspace_PartOnRay_0;
                    v88 = v90;
                else
                    local l_workspace_PartOnRay_1, v92 = workspace:FindPartOnRay(v84, nil, false, true);
                    v87 = l_workspace_PartOnRay_1;
                    v88 = v92;
                end;
                local l_v21_PlayerFromPart_0 = v21:FindPlayerFromPart(v87);
                if l_v21_PlayerFromPart_0 and (v0 and l_v21_PlayerFromPart_0 ~= l_LocalPlayer_0 or l_v21_PlayerFromPart_0 ~= l_LocalPlayer_0 and l_v21_PlayerFromPart_0.UserId > 0) then
                    if v34 then
                        SetSelectedPlayer(l_v21_PlayerFromPart_0);
                        return;
                    else
                        OpenContextMenu(l_v21_PlayerFromPart_0, v88);
                        return;
                    end;
                elseif not l_v21_PlayerFromPart_0 and v34 then
                    CloseContextMenu();
                end;
            end;
            return;
        end;
    end;
    OnUserInput = function(v94, v95) --[[ Line: 346 ]] --[[ Name: OnUserInput ]]
        -- upvalues: v36 (ref), v37 (ref)
        if v95.UserInputState == Enum.UserInputState.Begin and v36 == nil then
            v36 = v95;
            v37 = v94;
            return;
        else
            if v36 == v95 and v95.UserInputState == Enum.UserInputState.Change then
                if (v94 - v37).magnitude > 5 then
                    v36 = nil;
                    v37 = nil;
                    return;
                end;
            elseif v95.UserInputState == Enum.UserInputState.End and v36 == v95 then
                v36 = nil;
                v37 = nil;
                clickedOnPoint(v94);
            end;
            return;
        end;
    end;
    OnMouseMoved = function(v96) --[[ Line: 362 ]] --[[ Name: OnMouseMoved ]]
        -- upvalues: v34 (ref), v36 (ref), v37 (ref)
        if not v34 and v36 and (v96 - v37).magnitude > 20 then
            v36 = nil;
            v37 = nil;
        end;
    end;
    trackTouchSwipeInput = function(v97) --[[ Line: 369 ]] --[[ Name: trackTouchSwipeInput ]]
        -- upvalues: v38 (ref)
        if v97.UserInputType == Enum.UserInputType.Touch then
            if not v38 and v97.UserInputState == Enum.UserInputState.Begin then
                if PointInSwipeArea(v97.Position) then
                    v38 = v97;
                    return;
                end;
            elseif v38 == v97 and v97.UserInputState == Enum.UserInputState.End then
                spawn(function() --[[ Line: 376 ]]
                    -- upvalues: v38 (ref)
                    v38 = nil;
                end);
            end;
        end;
    end;
    local function v100(v98, v99) --[[ Line: 383 ]] --[[ Name: functionProcessInput ]]
        -- upvalues: v36 (ref)
        trackTouchSwipeInput(v98);
        if v99 then
            if v98 == v36 then
                v36 = nil;
            end;
            return;
        elseif v98.UserInputType == Enum.UserInputType.MouseButton1 or v98.UserInputType == Enum.UserInputType.Touch then
            OnUserInput(Vector2.new(v98.Position.X, v98.Position.Y), v98);
            return;
        else
            if v98.UserInputType == Enum.UserInputType.MouseMovement then
                OnMouseMoved(Vector2.new(v98.Position.X, v98.Position.Y));
            end;
            return;
        end;
    end;
    l_UserInputService_0.InputBegan:Connect(v100);
    l_UserInputService_0.InputChanged:Connect(v100);
    l_UserInputService_0.InputEnded:Connect(v100);
    l_UserInputService_0.TouchSwipe:Connect(function(v101, _, v103) --[[ Line: 405 ]]
        -- upvalues: v34 (ref), v38 (ref), v19 (copy)
        if not v103 then
            return;
        elseif not v34 then
            return;
        elseif not v38 then
            return;
        else
            local v104 = 0;
            if v101 == Enum.SwipeDirection.Left then
                v104 = 1;
            elseif v101 == Enum.SwipeDirection.Right then
                v104 = -1;
            end;
            if v104 ~= 0 then
                v19:OffsetPlayerEntry(v104);
                SetSelectedPlayer(v19:GetSelectedPlayer());
            end;
            return;
        end;
    end);
    l_LocalPlayer_0.FriendStatusChanged:Connect(function(v105, v106) --[[ Line: 423 ]]
        -- upvalues: v35 (ref), v26 (copy), v31 (ref)
        if v105 and v105 == v35 then
            local v107 = v26:IsPlayerBlockedByUserId(v105.UserId);
            v31:UpdateFriendButton(v106, v107);
        end;
    end);
    v24.StateChanged.Event:Connect(function(v108) --[[ Line: 430 ]]
        -- upvalues: v34 (ref)
        if v108 and v34 then
            CloseContextMenu();
        end;
    end);
    v25.EmotesMenuToggled.Event:Connect(function(v109) --[[ Line: 436 ]]
        -- upvalues: v34 (ref)
        if v109 and v34 then
            CloseContextMenu();
        end;
    end);
    GetWorldPoint = function(v110) --[[ Line: 442 ]] --[[ Name: GetWorldPoint ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        if v110.Character then
            local l_HumanoidRootPart_0 = v110.Character:FindFirstChild("HumanoidRootPart");
            if l_HumanoidRootPart_0 then
                return l_HumanoidRootPart_0.Position;
            end;
        end;
        if v110 ~= l_LocalPlayer_0 then
            return GetWorldPoint(l_LocalPlayer_0);
        else
            return (Vector3.new(0, 0, 0, 0));
        end;
    end;
    l_StarterGui_0:RegisterGetCore("AvatarContextMenuTarget", function() --[[ Line: 456 ]]
        -- upvalues: v35 (ref)
        return v35;
    end);
    l_StarterGui_0:RegisterSetCore("AvatarContextMenuTarget", function(v112) --[[ Line: 461 ]]
        -- upvalues: v34 (ref), v33 (ref)
        local v113 = false;
        if typeof(v112) == "Instance" then
            v113 = v112:IsA("Player");
        end;
        if v113 then
            if v112.Parent ~= nil then
                if v34 or v33 then
                    SetSelectedPlayer(v112, true);
                    return;
                else
                    OpenContextMenu(v112, GetWorldPoint(v112));
                    return;
                end;
            else
                error("AvatarContextMenuTarget Player must be in the game");
                return;
            end;
        elseif v112 == nil then
            CloseContextMenu();
            return;
        else
            error("AvatarContextMenuTarget argument must be a Player or nil");
            return;
        end;
    end);
    local function v123() --[[ Line: 481 ]] --[[ Name: getClosestPlayer ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_Players_0 (copy)
        if not l_LocalPlayer_0.Character then
            return;
        else
            local l_HumanoidRootPart_1 = l_LocalPlayer_0.Character:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_1 then
                return;
            else
                local l_Position_0 = l_HumanoidRootPart_1.Position;
                local v116 = nil;
                local v117 = 1e999;
                local v118 = nil;
                local l_l_Players_0_Players_1 = l_Players_0:GetPlayers();
                for _, v121 in ipairs(l_l_Players_0_Players_1) do
                    if v121 ~= l_LocalPlayer_0 and v121.Character then
                        local l_HumanoidRootPart_2 = v121.Character:FindFirstChild("HumanoidRootPart");
                        if l_HumanoidRootPart_2 and (l_HumanoidRootPart_2.Position - l_Position_0).magnitude < v117 then
                            v116 = v121;
                            v117 = (l_HumanoidRootPart_2.Position - l_Position_0).magnitude;
                            v118 = l_HumanoidRootPart_2.Position;
                        end;
                    end;
                end;
                return v116, v118;
            end;
        end;
    end;
    l_ContextActionService_0:BindCoreAction("GamepadOpenAvatarContextMenu", function(_, v125, _) --[[ Line: 509 ]] --[[ Name: gamepadOpenMenu ]]
        -- upvalues: v1 (ref), l_GuiService_0 (copy), v34 (ref), v123 (copy)
        if not v1 then
            return Enum.ContextActionResult.Pass;
        elseif l_GuiService_0.SelectedCoreObject or l_GuiService_0.SelectedObject then
            return Enum.ContextActionResult.Pass;
        elseif v125 ~= Enum.UserInputState.Begin then
            return Enum.ContextActionResult.Sink;
        else
            if v34 then
                CloseContextMenu();
            else
                local v127, v128 = v123();
                if v127 then
                    OpenContextMenu(v127, v128);
                end;
            end;
            return Enum.ContextActionResult.Sink;
        end;
    end, false, Enum.KeyCode.DPadUp);
    return;
end;