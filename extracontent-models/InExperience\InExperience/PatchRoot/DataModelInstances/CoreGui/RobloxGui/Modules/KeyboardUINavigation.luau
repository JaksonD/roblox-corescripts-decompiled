local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_SendNotificationInfo_0 = l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("SendNotificationInfo");
local v7 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local v8 = nil;
local function _(v9, v10) --[[ Line: 18 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v7 (copy)
    pcall(function() --[[ Line: 19 ]]
        -- upvalues: v10 (ref), v7 (ref), v9 (copy)
        v10 = v7:FormatByKey(v9);
    end);
    return v10;
end;
local function v21(_, v13, v14) --[[ Line: 25 ]] --[[ Name: ScrollSelectedElement ]]
    -- upvalues: l_GuiService_0 (copy)
    if v13 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    else
        local l_SelectedObject_0 = l_GuiService_0.SelectedObject;
        if l_SelectedObject_0 == nil then
            return Enum.ContextActionResult.Pass;
        else
            local v16 = nil;
            if l_SelectedObject_0.ClassName == "ScrollingFrame" then
                v16 = l_SelectedObject_0;
            else
                local l_l_SelectedObject_0_FirstAncestorOfClass_0 = l_SelectedObject_0:FindFirstAncestorOfClass("ScrollingFrame");
                if l_l_SelectedObject_0_FirstAncestorOfClass_0 ~= nil then
                    v16 = l_l_SelectedObject_0_FirstAncestorOfClass_0;
                end;
            end;
            if v16 == nil then
                return Enum.ContextActionResult.Pass;
            else
                local v18 = 0;
                if v14.KeyCode == Enum.KeyCode.PageUp or v14.KeyCode == Enum.KeyCode.Home then
                    v18 = -100;
                elseif v14.KeyCode == Enum.KeyCode.PageDown or v14.KeyCode == Enum.KeyCode.End then
                    v18 = 100;
                end;
                local l_X_0 = v16.CanvasPosition.X;
                local l_Y_0 = v16.CanvasPosition.Y;
                if v14.KeyCode == Enum.KeyCode.PageUp or v14.KeyCode == Enum.KeyCode.PageDown then
                    l_Y_0 = math.max(0, (math.min(l_Y_0 + v18, v16.AbsoluteCanvasSize.Y)));
                elseif v14.KeyCode == Enum.KeyCode.Home or v14.KeyCode == Enum.KeyCode.End then
                    l_X_0 = math.max(0, (math.min(l_X_0 + v18, v16.AbsoluteCanvasSize.X)));
                end;
                v16.CanvasPosition = Vector2.new(l_X_0, l_Y_0);
                return Enum.ContextActionResult.Pass;
            end;
        end;
    end;
end;
local function v33(_, v23, _) --[[ Line: 73 ]] --[[ Name: EnableKeyboardNavigation ]]
    -- upvalues: l_GameSettings_0 (copy), l_GuiService_0 (copy), v8 (ref), l_Players_0 (copy), v7 (copy), l_SendNotificationInfo_0 (copy)
    if not l_GameSettings_0.UiNavigationKeyBindEnabled then
        return Enum.ContextActionResult.Pass;
    elseif v23 ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass;
    elseif not l_GuiService_0.AutoSelectGuiEnabled then
        return Enum.ContextActionResult.Pass;
    elseif l_GuiService_0.SelectedObject then
        l_GuiService_0.SelectedObject = nil;
        return Enum.ContextActionResult.Sink;
    else
        if v8 == nil then
            v8 = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        end;
        l_GuiService_0:Select(v8);
        if l_GuiService_0.SelectedObject then
            local v25 = nil;
            local l_pcall_0 = pcall;
            local v27 = "InGame.NotificationScript2.UINavigation.Title";
            local v28;
            do
                local l_v25_0 = v25;
                l_pcall_0(function() --[[ Line: 19 ]]
                    -- upvalues: l_v25_0 (ref), v7 (ref), v27 (copy)
                    l_v25_0 = v7:FormatByKey(v27);
                end);
                v28 = l_v25_0;
            end;
            l_pcall_0 = nil;
            local l_pcall_1 = pcall;
            local v31 = "InGame.NotificationScript2.UINavigation.Text";
            do
                local l_l_pcall_0_0 = l_pcall_0;
                l_pcall_1(function() --[[ Line: 19 ]]
                    -- upvalues: l_l_pcall_0_0 (ref), v7 (ref), v31 (copy)
                    l_l_pcall_0_0 = v7:FormatByKey(v31);
                end);
                v25 = l_l_pcall_0_0;
            end;
            l_SendNotificationInfo_0:Fire({
                Title = v28, 
                Text = v25, 
                Duration = 3
            });
        end;
        return Enum.ContextActionResult.Sink;
    end;
end;
local v34 = {};
v34.__index = v34;
v34.new = function() --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: v34 (copy), l_ContextActionService_0 (copy), v33 (copy), v21 (copy), l_GameSettings_0 (copy), l_GuiService_0 (copy)
    local v35 = setmetatable({}, v34);
    l_ContextActionService_0:BindAction("EnableKeyboardUINavigation", v33, false, Enum.KeyCode.BackSlash);
    l_ContextActionService_0:BindAction("ScrollSelectedElement", v21, false, Enum.KeyCode.PageUp, Enum.KeyCode.PageDown, Enum.KeyCode.Home, Enum.KeyCode.End);
    l_GameSettings_0:GetPropertyChangedSignal("UiNavigationKeyBindEnabled"):Connect(function() --[[ Line: 121 ]]
        -- upvalues: l_GameSettings_0 (ref), l_GuiService_0 (ref)
        if not l_GameSettings_0.UiNavigationKeyBindEnabled then
            l_GuiService_0.SelectedObject = nil;
        end;
    end);
    return v35;
end;
return v34.new();