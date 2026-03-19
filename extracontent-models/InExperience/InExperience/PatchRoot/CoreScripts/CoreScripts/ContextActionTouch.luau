local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_game_EngineFeature_0 = game:GetEngineFeature("FixCASGetButtonYielded");
local v5 = game:DefineFastFlag("FixCASMaxTouchButtons", false);
local _ = l_UserInputService_0.TouchEnabled;
local v7 = {};
local v8 = {};
local v9 = nil;
local v10 = nil;
local _ = {};
local v12 = {
    [1] = UDim2.new(0, 123, 0, 70), 
    [2] = UDim2.new(0, 30, 0, 60), 
    [3] = UDim2.new(0, 180, 0, 160), 
    [4] = UDim2.new(0, 85, 0, -25), 
    [5] = UDim2.new(0, 185, 0, -25), 
    [6] = UDim2.new(0, 185, 0, 260), 
    [7] = UDim2.new(0, 216, 0, 65)
};
local v13 = #v12;
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166756");
game:GetService("ContentProvider"):Preload("https://www.roblox.com/asset/?id=97166444");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v17 = require(l_RobloxGui_0.Modules.CoreUtility);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v19 = v17.waitForChildOfClass(l_LocalPlayer_0, "PlayerGui");
createContextActionGui = function() --[[ Line: 61 ]] --[[ Name: createContextActionGui ]]
    -- upvalues: v9 (ref), v10 (ref), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if not v9 then
        v9 = Instance.new("ScreenGui");
        v9.Name = "ContextActionGui";
        v9.ResetOnSpawn = false;
        v10 = Instance.new("Frame");
        v10.BackgroundTransparency = 1;
        v10.Size = UDim2.new(0.3, 0, 0.5, 0);
        v10.Position = UDim2.new(0.7, 0, 0.5, 0);
        v10.Name = "ContextButtonFrame";
        v10.Parent = v9;
        local function v22() --[[ Line: 73 ]]
            -- upvalues: v10 (ref), l_UserInputService_0 (ref), l_GuiService_0 (ref)
            local l_v10_0 = v10;
            local v21 = false;
            if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                v21 = l_GuiService_0.TouchControlsEnabled;
            end;
            l_v10_0.Visible = v21;
        end;
        l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(v22);
        l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(v22);
        local l_v10_1 = v10;
        local v24 = false;
        if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
            v24 = l_GuiService_0.TouchControlsEnabled;
        end;
        l_v10_1.Visible = v24;
    end;
end;
setButtonSizeAndPosition = function(v25) --[[ Line: 84 ]] --[[ Name: setButtonSizeAndPosition ]]
    local v26 = 55;
    local v27 = 10;
    if not (game:GetService("CoreGui").RobloxGui.AbsoluteSize.X < 600) then
        v26 = 85;
        v27 = 40;
    end;
    v25.Size = UDim2.new(0, v26, 0, v26);
end;
contextActionButtonDown = function(v28, v29, v30) --[[ Line: 99 ]] --[[ Name: contextActionButtonDown ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v28.Image = "https://www.roblox.com/asset/?id=97166756";
    l_ContextActionService_0:CallFunction(v30, Enum.UserInputState.Begin, v29);
end;
contextActionButtonMoved = function(v31, v32, v33) --[[ Line: 104 ]] --[[ Name: contextActionButtonMoved ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v31.Image = "https://www.roblox.com/asset/?id=97166756";
    l_ContextActionService_0:CallFunction(v33, Enum.UserInputState.Change, v32);
end;
contextActionButtonUp = function(v34, v35, v36) --[[ Line: 109 ]] --[[ Name: contextActionButtonUp ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v34.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ContextActionService_0:CallFunction(v36, Enum.UserInputState.End, v35);
end;
contextActionButtonCancel = function(v37, v38, v39) --[[ Line: 114 ]] --[[ Name: contextActionButtonCancel ]]
    -- upvalues: l_ContextActionService_0 (copy)
    v37.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ContextActionService_0:CallFunction(v39, Enum.UserInputState.Cancel, v38);
end;
isSmallScreenDevice = function() --[[ Line: 119 ]] --[[ Name: isSmallScreenDevice ]]
    return game:GetService("GuiService"):GetScreenResolution().Y <= 320;
end;
createNewButton = function(v40, v41) --[[ Line: 124 ]] --[[ Name: createNewButton ]]
    -- upvalues: v10 (ref), l_UserInputService_0 (copy)
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "ContextActionButton";
    l_ImageButton_0.BackgroundTransparency = 1;
    l_ImageButton_0.Size = UDim2.new(0, 45, 0, 45);
    l_ImageButton_0.Active = true;
    if isSmallScreenDevice() then
        l_ImageButton_0.Size = UDim2.new(0, 35, 0, 35);
    end;
    l_ImageButton_0.Image = "https://www.roblox.com/asset/?id=97166444";
    l_ImageButton_0.Parent = v10;
    local v43 = nil;
    local v44 = false;
    l_UserInputService_0.InputEnded:connect(function(v45) --[[ Line: 151 ]]
        -- upvalues: v43 (ref), v44 (ref), l_ImageButton_0 (copy), v40 (copy)
        if v45.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v43 ~= v45 then
            return;
        else
            if v45.UserInputState == Enum.UserInputState.End and v44 then
                contextActionButtonCancel(l_ImageButton_0, v45, v40);
            end;
            v43 = nil;
            v44 = false;
            return;
        end;
    end);
    l_ImageButton_0.InputBegan:connect(function(v46) --[[ Line: 167 ]]
        -- upvalues: v43 (ref), v44 (ref), l_ImageButton_0 (copy), v40 (copy)
        if v46.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v46.UserInputState == Enum.UserInputState.Begin then
            v43 = v46;
            v44 = false;
            contextActionButtonDown(l_ImageButton_0, v46, v40);
            return;
        else
            if v46.UserInputState == Enum.UserInputState.Change then
                if v43 ~= v46 then
                    return;
                else
                    v44 = false;
                end;
            end;
            return;
        end;
    end);
    l_ImageButton_0.InputEnded:connect(function(v47) --[[ Line: 186 ]]
        -- upvalues: v43 (ref), v44 (ref), l_ImageButton_0 (copy), v40 (copy)
        if v47.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v43 ~= v47 then
            return;
        elseif v47.UserInputState == Enum.UserInputState.End then
            v43 = nil;
            v44 = false;
            contextActionButtonUp(l_ImageButton_0, v47, v40);
            return;
        else
            if v47.UserInputState == Enum.UserInputState.Change then
                v44 = true;
            end;
            return;
        end;
    end);
    l_ImageButton_0.InputChanged:connect(function(v48) --[[ Line: 205 ]]
        -- upvalues: v43 (ref), l_ImageButton_0 (copy), v40 (copy)
        if v48.UserInputType ~= Enum.UserInputType.Touch then
            return;
        elseif v43 ~= v48 then
            return;
        else
            contextActionButtonMoved(l_ImageButton_0, v48, v40);
            return;
        end;
    end);
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "ActionIcon";
    l_ImageLabel_0.Position = UDim2.new(0.175, 0, 0.175, 0);
    l_ImageLabel_0.Size = UDim2.new(0.65, 0, 0.65, 0);
    l_ImageLabel_0.BackgroundTransparency = 1;
    if v41.image and type(v41.image) == "string" then
        l_ImageLabel_0.Image = v41.image;
    end;
    l_ImageLabel_0.Parent = l_ImageButton_0;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "ActionTitle";
    l_TextLabel_0.Size = UDim2.new(1, 0, 1, 0);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.Font = Enum.Font.SourceSansBold;
    l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextLabel_0.TextStrokeTransparency = 0;
    l_TextLabel_0.FontSize = Enum.FontSize.Size18;
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.Text = "";
    if v41.title and type(v41.title) == "string" then
        l_TextLabel_0.Text = v41.title;
    end;
    l_TextLabel_0.Parent = l_ImageButton_0;
    return l_ImageButton_0;
end;
createButton = function(v51, v52) --[[ Line: 243 ]] --[[ Name: createButton ]]
    -- upvalues: v5 (copy), v8 (copy), v13 (copy), v7 (copy), v12 (copy), v10 (ref), v9 (ref), v19 (copy)
    local v53 = nil;
    if not v5 then
        v53 = createNewButton(v51, v52);
    end;
    local v54 = nil;
    for v55 = 1, #v8 do
        if v8[v55] == "empty" then
            v54 = v55;
            break;
        end;
    end;
    if not v54 then
        v54 = #v8 + 1;
    end;
    if v13 < v54 then
        if v5 then
            warn("Maximum of 7 allowed touch buttons, new touch button not created for " .. v51 .. ".");
        end;
        return;
    else
        if v5 then
            v53 = createNewButton(v51, v52);
        end;
        v8[v54] = v53;
        v7[v51].button = v53;
        v53.Position = v12[v54];
        v53.Parent = v10;
        if v9 and v9.Parent == nil then
            v9.Parent = v19;
            if not v10.Parent then
                v10.Parent = v9;
            end;
        end;
        return;
    end;
end;
removeAction = function(v56) --[[ Line: 286 ]] --[[ Name: removeAction ]]
    -- upvalues: v7 (copy), v8 (copy)
    if not v7[v56] then
        return;
    else
        local l_button_0 = v7[v56].button;
        if l_button_0 then
            l_button_0.Parent = nil;
            for v58 = 1, #v8 do
                if v8[v58] == l_button_0 then
                    v8[v58] = "empty";
                    break;
                end;
            end;
            l_button_0:Destroy();
        end;
        v7[v56] = nil;
        return;
    end;
end;
addAction = function(v59, v60, v61) --[[ Line: 307 ]] --[[ Name: addAction ]]
    -- upvalues: v7 (copy)
    if v7[v59] then
        removeAction(v59);
    end;
    v7[v59] = {
        v61
    };
    if v60 then
        createContextActionGui();
        createButton(v59, v61);
    end;
end;
l_ContextActionService_0.BoundActionChanged:connect(function(v62, v63, v64) --[[ Line: 319 ]]
    -- upvalues: v7 (copy)
    if v7[v62] and v64 then
        local l_button_1 = v7[v62].button;
        local v66 = v64[v63] or (not (v63 ~= "image" and v63 ~= "title") or v63 == "description") and "";
        if l_button_1 then
            if v63 == "image" then
                l_button_1.ActionIcon.Image = v66;
                return;
            elseif v63 == "title" then
                l_button_1.ActionTitle.Text = v66;
                return;
            elseif v63 == "description" then
                return;
            elseif v63 == "position" then
                l_button_1.Position = v66;
            end;
        end;
    end;
end);
l_ContextActionService_0.BoundActionAdded:connect(function(v67, v68, v69) --[[ Line: 341 ]]
    addAction(v67, v68, v69);
end);
l_ContextActionService_0.BoundActionRemoved:connect(function(v70, _) --[[ Line: 345 ]]
    removeAction(v70);
end);
l_ContextActionService_0.GetActionButtonEvent:connect(function(v72) --[[ Line: 349 ]]
    -- upvalues: v7 (copy), l_ContextActionService_0 (copy)
    if v7[v72] then
        l_ContextActionService_0:FireActionButtonFoundSignal(v72, v7[v72].button);
    end;
end);
local l_l_ContextActionService_0_AllBoundActionInfo_0 = l_ContextActionService_0:GetAllBoundActionInfo();
for v74, v75 in pairs(l_l_ContextActionService_0_AllBoundActionInfo_0) do
    addAction(v74, v75.createTouchButton, v75);
    if l_game_EngineFeature_0 and v7[v74] and v7[v74].button then
        l_ContextActionService_0:FireActionButtonFoundSignal(v74, v7[v74].button);
    end;
end;