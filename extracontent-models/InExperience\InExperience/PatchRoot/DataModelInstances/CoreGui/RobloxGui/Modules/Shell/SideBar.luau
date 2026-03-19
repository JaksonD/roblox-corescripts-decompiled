local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
return function() --[[ Line: 24 ]]
    -- upvalues: l_Create_0 (copy), l_GlobalSettings_0 (copy), l_SoundManager_0 (copy), l_Analytics_0 (copy), l_ScreenManager_0 (copy), l_GuiService_0 (copy), l_Utility_0 (copy), l_ContextActionService_0 (copy)
    local v10 = {};
    local v11 = {};
    local v12 = nil;
    local v13 = false;
    local v14 = l_Create_0("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 4
    });
    local v15 = l_Create_0("Frame")({
        Name = "SideBarContainer", 
        Size = UDim2.new(0.3, 0, 1, 0), 
        Position = UDim2.new(1, 0, 0, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.OverlayColor, 
        ZIndex = 5, 
        Parent = v14
    });
    local v16 = l_Create_0("TextButton")({
        Name = "DummySelectionImage", 
        Size = UDim2.new(0, 0, 0, 0), 
        Visible = false; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v17 = l_Create_0("TextLabel")({
        Name = "Text", 
        Size = UDim2.new(1, -165, 1, -156), 
        Position = UDim2.new(0, 65, 0, 156), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = 6, 
        Text = "", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        TextWrapped = true
    });
    local function v19() --[[ Line: 81 ]] --[[ Name: recalcPositions ]]
        -- upvalues: v11 (copy)
        for v18 = 1, #v11 do
            v11[v18].Position = UDim2.new(0, 0, 0, 156 + 75 * (v18 - 1));
        end;
    end;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "ClosedEvent";
    v10.Closed = l_BindableEvent_0.Event;
    v10.GetAnalyticsInfo = function(_) --[[ Line: 94 ]] --[[ Name: GetAnalyticsInfo ]]
        -- upvalues: l_Analytics_0 (ref)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SideBarId")
        };
    end;
    v10.AddItem = function(_, v23, v24) --[[ Line: 98 ]] --[[ Name: AddItem ]]
        -- upvalues: l_Create_0 (ref), l_GlobalSettings_0 (ref), v16 (copy), v15 (copy), l_SoundManager_0 (ref), l_ScreenManager_0 (ref), v10 (copy), l_BindableEvent_0 (copy), v11 (copy), v19 (copy)
        local v25 = l_Create_0("TextButton")({
            Name = "SortButton", 
            Size = UDim2.new(1, 0, 0, 75), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
            BackgroundTransparency = 1, 
            ZIndex = 6, 
            Text = "", 
            SelectionImageObject = v16, 
            Parent = v15; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v26 = l_Create_0("TextLabel")({
            Name = "SortName", 
            Size = UDim2.new(1, -65, 1, 0), 
            Position = UDim2.new(0, 65, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v23, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.MediumFontSize, 
            ZIndex = 7, 
            Parent = v25
        });
        v25.MouseButton1Click:connect(function() --[[ Line: 128 ]]
            -- upvalues: l_SoundManager_0 (ref), l_ScreenManager_0 (ref), v10 (ref), l_BindableEvent_0 (ref), v24 (copy)
            l_SoundManager_0:Play("ButtonPress");
            l_ScreenManager_0:CloseCurrent(v10);
            l_BindableEvent_0:Fire();
            v24();
        end);
        v25.SelectionGained:connect(function() --[[ Line: 134 ]]
            -- upvalues: v25 (copy), v26 (copy), l_GlobalSettings_0 (ref)
            v25.BackgroundTransparency = 0;
            v26.TextColor3 = l_GlobalSettings_0.TextSelectedColor;
        end);
        v25.SelectionLost:connect(function() --[[ Line: 138 ]]
            -- upvalues: v25 (copy), v26 (copy), l_GlobalSettings_0 (ref)
            v25.BackgroundTransparency = 1;
            v26.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        end);
        v11[#v11 + 1] = v25;
        v19();
    end;
    v10.SetText = function(_, v28) --[[ Line: 147 ]] --[[ Name: SetText ]]
        -- upvalues: v17 (copy), v15 (copy)
        v17.Text = v28;
        v17.Parent = v15;
    end;
    v10.ResetText = function(_) --[[ Line: 152 ]] --[[ Name: ResetText ]]
        -- upvalues: v17 (copy)
        v17.Text = "";
        v17.Parent = nil;
    end;
    v10.RemoveAllItems = function(_) --[[ Line: 157 ]] --[[ Name: RemoveAllItems ]]
        -- upvalues: v10 (copy), v11 (copy)
        v10:ResetText();
        for v31, v32 in pairs(v11) do
            v32:Destroy();
            v11[v31] = nil;
        end;
    end;
    v10.SetSelectedObject = function(_, v34, v35) --[[ Line: 165 ]] --[[ Name: SetSelectedObject ]]
        -- upvalues: v11 (copy), v12 (ref), v13 (ref), l_GuiService_0 (ref)
        if #v11 > 0 then
            v12 = v34 and v11[v34] or v11[1];
            if v35 == true and v12 and v13 then
                l_GuiService_0.SelectedCoreObject = v12;
                return;
            end;
        else
            v12 = nil;
        end;
    end;
    v10.GetPriority = function(_) --[[ Line: 177 ]] --[[ Name: GetPriority ]]
        -- upvalues: l_GlobalSettings_0 (ref)
        return l_GlobalSettings_0.OverlayPriority;
    end;
    v10.Show = function(v37) --[[ Line: 181 ]] --[[ Name: Show ]]
        -- upvalues: v14 (copy), l_ScreenManager_0 (ref), l_Utility_0 (ref), l_GlobalSettings_0 (ref), v15 (copy), l_SoundManager_0 (ref)
        v14.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v37:GetPriority());
        local _ = l_Utility_0.PropertyTweener(v14, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0.25, l_Utility_0.EaseInOutQuad, true, nil);
        v15:TweenPosition(UDim2.new(1 - v15.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true);
        l_SoundManager_0:Play("SideMenuSlideIn");
    end;
    v10.Hide = function(_) --[[ Line: 190 ]] --[[ Name: Hide ]]
        -- upvalues: l_Utility_0 (ref), v14 (copy), v15 (copy)
        local _ = l_Utility_0.PropertyTweener(v14, "BackgroundTransparency", 0.3, 1, 0.25, l_Utility_0.EaseInOutQuad, true, function() --[[ Line: 192 ]]
            -- upvalues: v14 (ref)
            v14.Parent = nil;
        end);
        v15:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true);
    end;
    v10.IsFocused = function(_) --[[ Line: 198 ]] --[[ Name: IsFocused ]]
        -- upvalues: v13 (ref)
        return v13;
    end;
    v10.Focus = function(v42) --[[ Line: 202 ]] --[[ Name: Focus ]]
        -- upvalues: v13 (ref), l_GuiService_0 (ref), v15 (copy), v12 (ref), l_Utility_0 (ref), l_ContextActionService_0 (ref), l_ScreenManager_0 (ref), v10 (copy), l_BindableEvent_0 (copy)
        v13 = true;
        l_GuiService_0:AddSelectionParent("SideBar", v15);
        if v12 then
            l_Utility_0.SetSelectedCoreObject(v12);
        else
            v42:SetSelectedObject(1);
            l_Utility_0.SetSelectedCoreObject(v12);
        end;
        l_ContextActionService_0:BindCoreAction("CloseSideBar", function(_, v44, _) --[[ Line: 214 ]]
            -- upvalues: l_ScreenManager_0 (ref), v10 (ref), l_BindableEvent_0 (ref)
            if v44 == Enum.UserInputState.End then
                l_ScreenManager_0:CloseCurrent(v10);
                l_BindableEvent_0:Fire();
            end;
        end, false, Enum.KeyCode.ButtonB);
    end;
    v10.RemoveFocus = function(_) --[[ Line: 223 ]] --[[ Name: RemoveFocus ]]
        -- upvalues: v13 (ref), l_GuiService_0 (ref), l_ContextActionService_0 (ref), v12 (ref)
        v13 = false;
        l_GuiService_0:RemoveSelectionGroup("SideBar");
        l_ContextActionService_0:UnbindCoreAction("CloseSideBar");
        v12 = nil;
    end;
    return v10;
end;