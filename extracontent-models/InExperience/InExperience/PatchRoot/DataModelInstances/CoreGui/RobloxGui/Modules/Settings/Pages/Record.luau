local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_VRService_0 = game:GetService("VRService");
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums;
local l_EventNames_0 = require(l_CorePackages_0.Workspace.Packages.CapturesInExperience).Analytics.EventNames;
local v9 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v10 = require(l_RobloxGui_0.Modules.Settings.Theme);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v12 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v12.Migration.uiblox;
local v14 = nil;
local l_Contexts_0 = l_Enums_0.Contexts;
local l_EventTypes_0 = l_Enums_0.EventTypes;
v14 = (function() --[[ Line: 37 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_uiblox_0 (copy), v12 (copy), l_VRService_0 (copy), v10 (copy), l_Create_0 (copy), l_TextService_0 (copy), v9 (copy), l_RbxAnalyticsService_0 (copy), l_Contexts_0 (copy), l_EventTypes_0 (copy), l_EventNames_0 (copy), l_CoreGui_0 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    local v18 = false;
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "RecordingEvent";
    l_NewPage_0.RecordingChanged = l_BindableEvent_0.Event;
    l_NewPage_0.IsRecording = function(_) --[[ Line: 45 ]] --[[ Name: IsRecording ]]
        -- upvalues: v18 (ref)
        return v18;
    end;
    local v21 = l_uiblox_0["icons/controls/screenrecord"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v21.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v12.Font[v21.variant];
    l_NewPage_0.TabHeader.Name = "RecordTab";
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "Record";
    local function v22() --[[ Line: 55 ]] --[[ Name: onVREnabled ]]
        -- upvalues: l_NewPage_0 (copy), l_VRService_0 (ref)
        l_NewPage_0.TabHeader.Visible = not l_VRService_0.VREnabled;
    end;
    l_NewPage_0.TabHeader.Visible = not l_VRService_0.VREnabled;
    l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v22);
    l_NewPage_0.Page.Name = "Record";
    local function v38(v23, v24, v25, v26, v27) --[[ Line: 64 ]] --[[ Name: makeTextLabel ]]
        -- upvalues: v10 (ref), l_Create_0 (ref), l_TextService_0 (ref)
        local v28 = 10;
        local v29 = 0;
        local v30 = 10;
        local v31 = v10.textSize(24);
        local v32 = v10.font(Enum.Font.SourceSans);
        if v25 then
            v28 = 10;
            v29 = 0;
            v30 = 0;
            v31 = v10.textSize(36);
            v32 = v10.font(Enum.Font.SourceSansBold, "Bold");
        end;
        local v33 = l_Create_0("Frame")({
            Name = v23 .. "Container", 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            LayoutOrder = v27, 
            Parent = v26
        });
        local v34 = l_Create_0("TextLabel")({
            Name = v23, 
            BackgroundTransparency = 1, 
            Text = v24, 
            TextWrapped = true, 
            Font = v32, 
            TextSize = v31, 
            TextColor3 = Color3.new(1, 1, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Position = UDim2.new(0, v28, 0, 0), 
            Size = UDim2.new(1, -(v28 + v29), 1, 0), 
            ZIndex = 2, 
            Parent = v33
        });
        local function v37(v35) --[[ Line: 96 ]] --[[ Name: onResized ]]
            -- upvalues: l_TextService_0 (ref), v24 (copy), v34 (copy), v26 (copy), v28 (ref), v29 (ref), v33 (copy), v30 (ref)
            if v35 == "AbsoluteSize" then
                local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v24, v34.TextSize, v34.Font, Vector2.new(v26.AbsoluteSize.X - v28 - v29, 10000));
                v33.Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_0.Y + v30);
            end;
        end;
        v37("AbsoluteSize");
        v26.Changed:connect(v37);
        return v34, v33;
    end;
    l_NewPage_0.SetHub = function(_, v40) --[[ Line: 110 ]] --[[ Name: SetHub ]]
        -- upvalues: l_NewPage_0 (copy), v38 (copy), v9 (ref), l_RbxAnalyticsService_0 (ref), l_Contexts_0 (ref), l_EventTypes_0 (ref), v18 (ref), l_EventNames_0 (ref), l_BindableEvent_0 (copy), l_CoreGui_0 (ref)
        l_NewPage_0.HubRef = v40;
        local function v41() --[[ Line: 114 ]]
            -- upvalues: l_NewPage_0 (ref)
            l_NewPage_0.HubRef:SetVisibility(false, true);
        end;
        local _ = v38("ScreenshotTitle", "Screenshot", true, l_NewPage_0.Page, 1);
        local _ = v38("ScreenshotBody", "By clicking the 'Take Screenshot' button, the menu will close and take a screenshot and save it to your computer.", false, l_NewPage_0.Page, 2);
        local l_l_NewPage_0_0 = l_NewPage_0;
        local l_l_NewPage_0_1 = l_NewPage_0;
        local v46, v47 = v9:AddButtonRow(l_NewPage_0, "ScreenshotButton", "Take Screenshot", UDim2.new(0, 300, 0, 44), v41);
        l_l_NewPage_0_0.ScreenshotButtonRow = v46;
        l_l_NewPage_0_1.ScreenshotButton = v47;
        l_NewPage_0.ScreenshotButtonRow.LayoutOrder = 3;
        l_l_NewPage_0_0 = v38("VideoTitle", "Video", true, l_NewPage_0.Page, 4);
        l_l_NewPage_0_1 = v38("VideoBody", "By clicking the 'Record Video' button, the menu will close and start recording your screen.", false, l_NewPage_0.Page, 5);
        v46, v47 = v9:AddButtonRow(l_NewPage_0, "RecordButton", "Record Video", UDim2.new(0, 300, 0, 44), v41);
        v46.LayoutOrder = 6;
        v47.MouseButton1Click:connect(function() --[[ Line: 130 ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), l_Contexts_0 (ref), l_EventTypes_0 (ref), v18 (ref), l_EventNames_0 (ref), l_BindableEvent_0 (ref)
            l_RbxAnalyticsService_0:SendEventDeferred("mobile", l_Contexts_0.Captures, l_EventTypes_0.ButtonClick, {
                btn = if not v18 then l_EventNames_0.CapturesLegacyVideoRecordActivated else l_EventNames_0.CapturesLegacyVideoRecordDeactivated
            });
            l_BindableEvent_0:Fire(not v18);
        end);
        local l_FirstChild_0 = settings():FindFirstChild("Game Options");
        if l_FirstChild_0 then
            l_FirstChild_0.VideoRecordingChangeRequest:connect(function(v49) --[[ Line: 142 ]]
                -- upvalues: v18 (ref), v47 (copy)
                v18 = v49;
                if v49 then
                    v47.RecordButtonTextLabel.Text = "Stop Recording";
                    return;
                else
                    v47.RecordButtonTextLabel.Text = "Record Video";
                    return;
                end;
            end);
        end;
        v47.Activated:Connect(function() --[[ Line: 152 ]]
            -- upvalues: l_CoreGui_0 (ref)
            l_CoreGui_0:ToggleRecording();
        end);
        l_NewPage_0.ScreenshotButton.Activated:Connect(function() --[[ Line: 155 ]]
            -- upvalues: l_CoreGui_0 (ref)
            l_CoreGui_0:TakeScreenshot();
        end);
        l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, 400);
    end;
    return l_NewPage_0;
end)();
v14.Displayed.Event:connect(function(v50) --[[ Line: 169 ]]
    -- upvalues: l_GuiService_0 (copy), v14 (ref)
    if v50 then
        l_GuiService_0.SelectedCoreObject = v14.ScreenshotButton;
    end;
end);
return v14;