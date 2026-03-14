local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarContextMenu_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu");
local _ = require(l_AvatarContextMenu_0.ThemeHandler);
local v9 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.PlayerAdded:Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v11 = {};
v11.__index = v11;
v11.GetHeadshotForPlayer = function(_, v13) --[[ Line: 47 ]] --[[ Name: GetHeadshotForPlayer ]]
    return "rbxthumb://type=AvatarHeadShot&id=" .. v13.UserId .. "&w=150&h=150";
end;
v11.HasOrGettingHeadShot = function(v14, v15) --[[ Line: 51 ]] --[[ Name: HasOrGettingHeadShot ]]
    return v14.HeadShotUrlCache[v15] ~= nil;
end;
v11.FindPlayerFromPart = function(_, v17) --[[ Line: 55 ]] --[[ Name: FindPlayerFromPart ]]
    -- upvalues: l_Players_0 (copy)
    if v17 and v17.Parent then
        local l_v17_0 = v17;
        while l_v17_0 and not l_v17_0:IsA("Model") do
            l_v17_0 = l_v17_0.Parent;
        end;
        if l_v17_0 then
            return l_Players_0:GetPlayerFromCharacter(l_v17_0);
        end;
    end;
    return nil;
end;
v11.GetPlayerPosition = function(_, v20) --[[ Line: 68 ]] --[[ Name: GetPlayerPosition ]]
    if v20.Character then
        local l_HumanoidRootPart_0 = v20.Character:FindFirstChild("HumanoidRootPart");
        if l_HumanoidRootPart_0 then
            return l_HumanoidRootPart_0.Position;
        end;
    end;
    return nil;
end;
local v22 = true;
v11.DisablePlayerMovement = function(_) --[[ Line: 80 ]] --[[ Name: DisablePlayerMovement ]]
    -- upvalues: v22 (ref), l_ContextActionService_0 (copy)
    if not v22 then
        return;
    else
        v22 = false;
        l_ContextActionService_0:BindCoreActionAtPriority("AvatarContextMenuStopInput", function(_, v25) --[[ Line: 84 ]]
            if v25 == Enum.UserInputState.End then
                return Enum.ContextActionResult.Pass;
            else
                return Enum.ContextActionResult.Sink;
            end;
        end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4);
        return;
    end;
end;
v11.EnablePlayerMovement = function(_) --[[ Line: 101 ]] --[[ Name: EnablePlayerMovement ]]
    -- upvalues: v22 (ref), l_ContextActionService_0 (copy)
    if v22 then
        return;
    else
        v22 = true;
        l_ContextActionService_0:UnbindCoreAction("AvatarContextMenuStopInput");
        return;
    end;
end;
v11.GetFriendStatus = function(_, v28) --[[ Line: 108 ]] --[[ Name: GetFriendStatus ]]
    -- upvalues: l_LocalPlayer_0 (ref)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 109 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v28 (copy)
        return l_LocalPlayer_0:GetFriendStatus(v28);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return Enum.FriendStatus.NotFriend;
    end;
end;
local v31 = {};
coroutine.wrap(function() --[[ Line: 121 ]]
    -- upvalues: l_RobloxReplicatedStorage_0 (copy), v31 (copy)
    l_RobloxReplicatedStorage_0:WaitForChild("CanChatWith", 1e999).OnClientEvent:Connect(function(...) --[[ Line: 124 ]]
        -- upvalues: v31 (ref)
        local v32 = {
            ...
        };
        if #v32 == 1 then
            local v33 = v32[1];
            for v34, v35 in pairs(v33) do
                v31[v34] = v35;
            end;
            return;
        else
            if #v32 == 2 then
                v31[v32[1]] = v32[2];
            end;
            return;
        end;
    end);
end)();
v11.GetCanChatWith = function(_, v37) --[[ Line: 140 ]] --[[ Name: GetCanChatWith ]]
    -- upvalues: v9 (copy), v31 (copy)
    if v9:IsPlayerBlockedByUserId(v37.UserId) then
        return false;
    elseif v31[v37.UserId] ~= nil then
        return v31[v37.UserId];
    else
        return true;
    end;
end;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Image = "";
l_ImageLabel_0.BackgroundTransparency = 1;
local function v56(v39, v40, v41, v42) --[[ Line: 156 ]] --[[ Name: MakeDefaultButton ]]
    -- upvalues: l_ImageLabel_0 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = v39;
    l_ImageButton_0.Image = v42.ButtonImage;
    l_ImageButton_0.ScaleType = v42.ButtonImageScaleType;
    l_ImageButton_0.SliceCenter = v42.ButtonImageSliceCenter;
    l_ImageButton_0.BackgroundColor3 = v42.ButtonColor;
    l_ImageButton_0.BackgroundTransparency = v42.ButtonTransparency;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.Size = v40;
    l_ImageButton_0.ZIndex = 2;
    l_ImageButton_0.SelectionImageObject = l_ImageLabel_0;
    l_ImageButton_0.BorderSizePixel = 0;
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "Underline";
    l_Frame_0.BackgroundColor3 = v42.ButtonUnderlineColor;
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 1);
    l_Frame_0.BorderSizePixel = 0;
    l_Frame_0.Position = UDim2.new(0.5, 0, 1, 0);
    l_Frame_0.Size = UDim2.new(0.95, 0, 0, 1);
    l_Frame_0.Parent = l_ImageButton_0;
    if v41 then
        l_ImageButton_0.MouseButton1Click:Connect(function() --[[ Line: 181 ]]
            -- upvalues: v41 (copy), l_UserInputService_0 (ref)
            v41(l_UserInputService_0:GetLastInputType());
        end);
    end;
    local function _(v45) --[[ Line: 186 ]] --[[ Name: isPointerInput ]]
        local v46 = true;
        if v45.UserInputType ~= Enum.UserInputType.MouseMovement then
            v46 = v45.UserInputType == Enum.UserInputType.Touch;
        end;
        return v46;
    end;
    local function _() --[[ Line: 190 ]] --[[ Name: selectButton ]]
        -- upvalues: l_ImageButton_0 (copy), v42 (copy)
        l_ImageButton_0.BackgroundColor3 = v42.ButtonHoverColor;
        l_ImageButton_0.BackgroundTransparency = v42.ButtonHoverTransparency;
    end;
    local function _() --[[ Line: 195 ]] --[[ Name: deselectButton ]]
        -- upvalues: l_ImageButton_0 (copy), v42 (copy)
        l_ImageButton_0.BackgroundColor3 = v42.ButtonColor;
        l_ImageButton_0.BackgroundTransparency = v42.ButtonTransparency;
    end;
    l_ImageButton_0.InputBegan:Connect(function(v50) --[[ Line: 200 ]]
        -- upvalues: l_ImageButton_0 (copy), v42 (copy)
        if l_ImageButton_0.Selectable then
            local v51 = true;
            if v50.UserInputType ~= Enum.UserInputType.MouseMovement then
                v51 = v50.UserInputType == Enum.UserInputType.Touch;
            end;
            if v51 then
                l_ImageButton_0.BackgroundColor3 = v42.ButtonHoverColor;
                l_ImageButton_0.BackgroundTransparency = v42.ButtonHoverTransparency;
                v50:GetPropertyChangedSignal("UserInputState"):connect(function() --[[ Line: 203 ]]
                    -- upvalues: v50 (copy), l_ImageButton_0 (ref), v42 (ref)
                    if v50.UserInputState == Enum.UserInputState.End then
                        l_ImageButton_0.BackgroundColor3 = v42.ButtonColor;
                        l_ImageButton_0.BackgroundTransparency = v42.ButtonTransparency;
                    end;
                end);
            end;
        end;
    end);
    l_ImageButton_0.InputEnded:Connect(function(v52) --[[ Line: 210 ]]
        -- upvalues: l_ImageButton_0 (copy), l_GuiService_0 (ref), v42 (copy)
        if l_ImageButton_0.Selectable and l_GuiService_0.SelectedCoreObject ~= l_ImageButton_0 then
            local v53 = true;
            if v52.UserInputType ~= Enum.UserInputType.MouseMovement then
                v53 = v52.UserInputType == Enum.UserInputType.Touch;
            end;
            if v53 then
                l_ImageButton_0.BackgroundColor3 = v42.ButtonColor;
                l_ImageButton_0.BackgroundTransparency = v42.ButtonTransparency;
            end;
        end;
    end);
    l_ImageButton_0.SelectionGained:Connect(function() --[[ Line: 216 ]]
        -- upvalues: l_ImageButton_0 (copy), v42 (copy)
        l_ImageButton_0.BackgroundColor3 = v42.ButtonHoverColor;
        l_ImageButton_0.BackgroundTransparency = v42.ButtonHoverTransparency;
    end);
    l_ImageButton_0.SelectionLost:Connect(function() --[[ Line: 219 ]]
        -- upvalues: l_ImageButton_0 (copy), v42 (copy)
        l_ImageButton_0.BackgroundColor3 = v42.ButtonColor;
        l_ImageButton_0.BackgroundTransparency = v42.ButtonTransparency;
    end);
    local _ = l_GuiService_0.Changed:Connect(function(v54) --[[ Line: 223 ]]
        -- upvalues: l_GuiService_0 (ref), l_ImageButton_0 (copy), v42 (copy)
        if v54 ~= "SelectedCoreObject" then
            return;
        elseif l_GuiService_0.SelectedCoreObject == nil or l_GuiService_0.SelectedCoreObject ~= l_ImageButton_0 then
            l_ImageButton_0.BackgroundColor3 = v42.ButtonColor;
            l_ImageButton_0.BackgroundTransparency = v42.ButtonTransparency;
            return;
        else
            if l_ImageButton_0.Selectable then
                l_ImageButton_0.BackgroundColor3 = v42.ButtonHoverColor;
                l_ImageButton_0.BackgroundTransparency = v42.ButtonHoverTransparency;
            end;
            return;
        end;
    end);
    return l_ImageButton_0;
end;
local function v57() --[[ Line: 239 ]] --[[ Name: getViewportSize ]]
    while not workspace.CurrentCamera do
        workspace.Changed:Wait();
    end;
    assert(workspace.CurrentCamera, "");
    while workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
        workspace.CurrentCamera.Changed:Wait();
    end;
    return workspace.CurrentCamera.ViewportSize;
end;
local function _() --[[ Line: 255 ]] --[[ Name: isSmallTouchScreen ]]
    -- upvalues: v57 (copy), l_UserInputService_0 (copy)
    local v58 = v57();
    return l_UserInputService_0.TouchEnabled and (v58.Y < 500 or v58.X < 700);
end;
v11.MakeStyledButton = function(_, v61, v62, v63, v64, v65) --[[ Line: 260 ]] --[[ Name: MakeStyledButton ]]
    -- upvalues: v56 (copy), v57 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    local v66 = v56(v61, v63, v64, v65);
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = v61 .. "TextLabel";
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.BorderSizePixel = 0;
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, -8);
    l_TextLabel_0.Position = UDim2.new(0, 0, 0, 0);
    l_TextLabel_0.TextColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_0.Font = v65.Font;
    l_TextLabel_0.TextSize = 24 * v65.TextScale;
    local v68 = v57();
    if l_UserInputService_0.TouchEnabled and (v68.Y < 500 or v68.X < 700) then
        l_TextLabel_0.TextSize = 18 * v65.TextScale;
    elseif l_GuiService_0:IsTenFootInterface() then
        l_TextLabel_0.TextSize = 36 * v65.TextScale;
    end;
    l_TextLabel_0.Text = v62;
    l_TextLabel_0.TextScaled = true;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.ZIndex = 2;
    l_TextLabel_0.Parent = v66;
    Instance.new("UITextSizeConstraint", l_TextLabel_0).MaxTextSize = l_TextLabel_0.TextSize;
    return v66, l_TextLabel_0;
end;
v11.new = function() --[[ Line: 290 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    return (setmetatable({}, v11));
end;
return v11.new();