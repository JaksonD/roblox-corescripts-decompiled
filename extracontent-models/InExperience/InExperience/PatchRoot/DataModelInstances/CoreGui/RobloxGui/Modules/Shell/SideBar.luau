local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_game_EngineFeature_0 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
return function() --[[ Line: 26 ]]
    -- upvalues: l_Create_0 (copy), l_GlobalSettings_0 (copy), l_SoundManager_0 (copy), l_Analytics_0 (copy), l_ScreenManager_0 (copy), l_GuiService_0 (copy), l_Utility_0 (copy), l_game_EngineFeature_0 (copy), l_ContextActionService_0 (copy)
    local v11 = {};
    local v12 = {};
    local v13 = nil;
    local v14 = false;
    local v15 = l_Create_0("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 4
    });
    local v16 = l_Create_0("Frame")({
        Name = "SideBarContainer", 
        Size = UDim2.new(0.3, 0, 1, 0), 
        Position = UDim2.new(1, 0, 0, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.OverlayColor, 
        ZIndex = 5, 
        Parent = v15
    });
    local v17 = l_Create_0("TextButton")({
        Name = "DummySelectionImage", 
        Size = UDim2.new(0, 0, 0, 0), 
        Visible = false; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v18 = l_Create_0("TextLabel")({
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
    local function v20() --[[ Line: 83 ]] --[[ Name: recalcPositions ]]
        -- upvalues: v12 (copy)
        for v19 = 1, #v12 do
            v12[v19].Position = UDim2.new(0, 0, 0, 156 + 75 * (v19 - 1));
        end;
    end;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "ClosedEvent";
    v11.Closed = l_BindableEvent_0.Event;
    v11.GetAnalyticsInfo = function(_) --[[ Line: 96 ]] --[[ Name: GetAnalyticsInfo ]]
        -- upvalues: l_Analytics_0 (ref)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("SideBarId")
        };
    end;
    v11.AddItem = function(_, v24, v25) --[[ Line: 100 ]] --[[ Name: AddItem ]]
        -- upvalues: l_Create_0 (ref), l_GlobalSettings_0 (ref), v17 (copy), v16 (copy), l_SoundManager_0 (ref), l_ScreenManager_0 (ref), v11 (copy), l_BindableEvent_0 (copy), v12 (copy), v20 (copy)
        local v26 = l_Create_0("TextButton")({
            Name = "SortButton", 
            Size = UDim2.new(1, 0, 0, 75), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_GlobalSettings_0.BlueButtonColor, 
            BackgroundTransparency = 1, 
            ZIndex = 6, 
            Text = "", 
            SelectionImageObject = v17, 
            Parent = v16; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v27 = l_Create_0("TextLabel")({
            Name = "SortName", 
            Size = UDim2.new(1, -65, 1, 0), 
            Position = UDim2.new(0, 65, 0, 0), 
            BackgroundTransparency = 1, 
            Text = v24, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.MediumFontSize, 
            ZIndex = 7, 
            Parent = v26
        });
        v26.MouseButton1Click:connect(function() --[[ Line: 130 ]]
            -- upvalues: l_SoundManager_0 (ref), l_ScreenManager_0 (ref), v11 (ref), l_BindableEvent_0 (ref), v25 (copy)
            l_SoundManager_0:Play("ButtonPress");
            l_ScreenManager_0:CloseCurrent(v11);
            l_BindableEvent_0:Fire();
            v25();
        end);
        v26.SelectionGained:connect(function() --[[ Line: 136 ]]
            -- upvalues: v26 (copy), v27 (copy), l_GlobalSettings_0 (ref)
            v26.BackgroundTransparency = 0;
            v27.TextColor3 = l_GlobalSettings_0.TextSelectedColor;
        end);
        v26.SelectionLost:connect(function() --[[ Line: 140 ]]
            -- upvalues: v26 (copy), v27 (copy), l_GlobalSettings_0 (ref)
            v26.BackgroundTransparency = 1;
            v27.TextColor3 = l_GlobalSettings_0.WhiteTextColor;
        end);
        v12[#v12 + 1] = v26;
        v20();
    end;
    v11.SetText = function(_, v29) --[[ Line: 149 ]] --[[ Name: SetText ]]
        -- upvalues: v18 (copy), v16 (copy)
        v18.Text = v29;
        v18.Parent = v16;
    end;
    v11.ResetText = function(_) --[[ Line: 154 ]] --[[ Name: ResetText ]]
        -- upvalues: v18 (copy)
        v18.Text = "";
        v18.Parent = nil;
    end;
    v11.RemoveAllItems = function(_) --[[ Line: 159 ]] --[[ Name: RemoveAllItems ]]
        -- upvalues: v11 (copy), v12 (copy)
        v11:ResetText();
        for v32, v33 in pairs(v12) do
            v33:Destroy();
            v12[v32] = nil;
        end;
    end;
    v11.SetSelectedObject = function(_, v35, v36) --[[ Line: 167 ]] --[[ Name: SetSelectedObject ]]
        -- upvalues: v12 (copy), v13 (ref), v14 (ref), l_GuiService_0 (ref)
        if #v12 > 0 then
            v13 = v35 and v12[v35] or v12[1];
            if v36 == true and v13 and v14 then
                l_GuiService_0.SelectedCoreObject = v13;
                return;
            end;
        else
            v13 = nil;
        end;
    end;
    v11.GetPriority = function(_) --[[ Line: 179 ]] --[[ Name: GetPriority ]]
        -- upvalues: l_GlobalSettings_0 (ref)
        return l_GlobalSettings_0.OverlayPriority;
    end;
    v11.Show = function(v38) --[[ Line: 183 ]] --[[ Name: Show ]]
        -- upvalues: v15 (copy), l_ScreenManager_0 (ref), l_Utility_0 (ref), l_GlobalSettings_0 (ref), l_game_EngineFeature_0 (ref), v16 (copy), l_SoundManager_0 (ref)
        v15.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v38:GetPriority());
        local _ = l_Utility_0.PropertyTweener(v15, "BackgroundTransparency", 1, l_GlobalSettings_0.ModalBackgroundTransparency, 0.25, l_Utility_0.EaseInOutQuad, true, nil);
        if l_game_EngineFeature_0 then
            v16:TweenPositionInternal(UDim2.new(1 - v16.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true, nil);
        else
            v16:TweenPosition(UDim2.new(1 - v16.Size.X.Scale, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true);
        end;
        l_SoundManager_0:Play("SideMenuSlideIn");
    end;
    v11.Hide = function(_) --[[ Line: 197 ]] --[[ Name: Hide ]]
        -- upvalues: l_Utility_0 (ref), v15 (copy), l_game_EngineFeature_0 (ref), v16 (copy)
        local _ = l_Utility_0.PropertyTweener(v15, "BackgroundTransparency", 0.3, 1, 0.25, l_Utility_0.EaseInOutQuad, true, function() --[[ Line: 199 ]]
            -- upvalues: v15 (ref)
            v15.Parent = nil;
        end);
        if l_game_EngineFeature_0 then
            v16:TweenPositionInternal(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true);
            return;
        else
            v16:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.25, true);
            return;
        end;
    end;
    v11.IsFocused = function(_) --[[ Line: 209 ]] --[[ Name: IsFocused ]]
        -- upvalues: v14 (ref)
        return v14;
    end;
    v11.Focus = function(v43) --[[ Line: 213 ]] --[[ Name: Focus ]]
        -- upvalues: v14 (ref), l_GuiService_0 (ref), v16 (copy), v13 (ref), l_Utility_0 (ref), l_ContextActionService_0 (ref), l_ScreenManager_0 (ref), v11 (copy), l_BindableEvent_0 (copy)
        v14 = true;
        l_GuiService_0:AddSelectionParent("SideBar", v16);
        if v13 then
            l_Utility_0.SetSelectedCoreObject(v13);
        else
            v43:SetSelectedObject(1);
            l_Utility_0.SetSelectedCoreObject(v13);
        end;
        l_ContextActionService_0:BindCoreAction("CloseSideBar", function(_, v45, _) --[[ Line: 225 ]]
            -- upvalues: l_ScreenManager_0 (ref), v11 (ref), l_BindableEvent_0 (ref)
            if v45 == Enum.UserInputState.End then
                l_ScreenManager_0:CloseCurrent(v11);
                l_BindableEvent_0:Fire();
            end;
        end, false, Enum.KeyCode.ButtonB);
    end;
    v11.RemoveFocus = function(_) --[[ Line: 234 ]] --[[ Name: RemoveFocus ]]
        -- upvalues: v14 (ref), l_GuiService_0 (ref), l_ContextActionService_0 (ref), v13 (ref)
        v14 = false;
        l_GuiService_0:RemoveSelectionGroup("SideBar");
        l_ContextActionService_0:UnbindCoreAction("CloseSideBar");
        v13 = nil;
    end;
    return v11;
end;