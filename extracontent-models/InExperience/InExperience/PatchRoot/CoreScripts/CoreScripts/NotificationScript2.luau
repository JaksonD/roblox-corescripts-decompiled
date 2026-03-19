local l_BadgeService_0 = game:GetService("BadgeService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_PointsService_0 = game:GetService("PointsService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_TextService_0 = game:GetService("TextService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = game:GetService("UserInputService");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_VRService_0 = game:GetService("VRService");
local l_GroupService_0 = game:GetService("GroupService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v16 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_GameSettings_0 = UserSettings().GameSettings;
local v21 = require(l_RobloxGui_0.Modules.Flags.FFlagCoreScriptShowTeleportPrompt);
local v22 = require(l_RobloxGui_0.Modules.FriendingUtility);
local l_game_EngineFeature_0 = game:GetEngineFeature("ClientToastNotificationsEnabled");
local v24 = require(l_RobloxGui_0.Modules.Flags.GetFFlagClientToastNotificationsRedirect);
local v25 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFriendshipNotifsUseSendr);
local v26 = game:DefineFastFlag("NotificationsRenameFriendRequestToConnection", false);
local v27 = require(l_RobloxGui_0.Modules.shouldSaveScreenshotToAlbum);
local v28 = game:DefineFastFlag("FixOnBadgeAwardedError", false);
local v29 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local function _(v30, v31) --[[ Line: 54 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v29 (copy)
    pcall(function() --[[ Line: 55 ]]
        -- upvalues: v31 (ref), v29 (ref), v30 (copy)
        v31 = v29:FormatByKey(v30);
    end);
    return v31;
end;
local v33 = nil;
while not l_Players_0.LocalPlayer do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
v33 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v35 = {};
local v36 = {};
local v37 = {};
local v38 = {};
local l_Value_0 = l_GameSettings_0.SavedQualityLevel.Value;
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "SendNotificationInfo";
l_BindableEvent_0.Parent = l_RobloxGui_0;
local v41 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v42 = true;
local v43 = true;
local v44 = require(l_RobloxGui_0.Modules.SocialUtil);
local v45 = require(l_RobloxGui_0.Modules.GameTranslator);
local v46 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v47 = 0.6 * l_GameSettings_0.PreferredTransparency;
local v48 = v41 and 72 or 48;
local v49 = v41 and 145 or 64;
local v50 = v41 and 450 or 200;
local v51 = v48 / 6;
local v52 = v41 and 42 or 18;
local v53 = v41 and 84 or 36;
local v54 = -v52;
local v55 = v41 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v56 = v41 and 72 or 28;
local v57 = v41 and 144 or 56;
local v58 = v41 and Enum.FontSize.Size36 or Enum.FontSize.Size14;
local v59 = v49 / 2;
local v60 = v51 / 2;
local v61 = v41 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v62 = v41 and 42 or 18;
local v63 = v41 and 30 or 14;
local l_InOut_0 = Enum.EasingDirection.InOut;
local l_Sine_0 = Enum.EasingStyle.Sine;
local v66 = 5;
local v67 = {
    ACCEPTED = "InGame.NotificationScript2.Message.ConnectionRequestEvent.Accepted", 
    SENT = "InGame.NotificationScript2.Message.ConnectionRequestEvent.Sent"
};
local function v74(v68, v69) --[[ Line: 125 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), l_Logging_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v71 = l_Localization_0.new(l_RobloxLocaleId_0);
    v71:SetLocale(l_RobloxLocaleId_0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 130 ]]
        -- upvalues: v71 (copy), v68 (copy), v69 (copy)
        return v71:Format(v68, v69);
    end);
    if l_status_0 then
        return l_result_0;
    else
        l_Logging_0.warn("Failed to translate string with key: " .. v68);
        return "";
    end;
end;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 140 ]]
    return (tonumber(settings():GetFVariable("FriendRequestNotificationThrottle")));
end);
if l_status_1 and l_result_1 ~= nil then
    v66 = l_result_1;
end;
l_StarterGui_0:RegisterSetCore("PointsNotificationsActive", function(v77) --[[ Line: 147 ]]
    -- upvalues: v42 (ref)
    if type(v77) == "boolean" then
        v42 = v77;
    end;
end);
l_StarterGui_0:RegisterSetCore("BadgesNotificationsActive", function(v78) --[[ Line: 152 ]]
    -- upvalues: v43 (ref)
    if type(v78) == "boolean" then
        v43 = v78;
    end;
end);
l_StarterGui_0:RegisterGetCore("PointsNotificationsActive", function() --[[ Line: 158 ]]
    -- upvalues: v42 (ref)
    return v42;
end);
l_StarterGui_0:RegisterGetCore("BadgesNotificationsActive", function() --[[ Line: 161 ]]
    -- upvalues: v43 (ref)
    return v43;
end);
local function _(v79, v80, v81, v82) --[[ Line: 168 ]] --[[ Name: createFrame ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v79;
    l_Frame_0.Size = v80;
    l_Frame_0.Position = v81;
    l_Frame_0.BackgroundTransparency = v82;
    return l_Frame_0;
end;
local function v90(v85, v86) --[[ Line: 178 ]] --[[ Name: createTextButton ]]
    -- upvalues: v59 (copy), v47 (ref), v61 (copy), v60 (copy), v62 (copy), v63 (copy)
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = v85;
    l_TextButton_0.Size = UDim2.new(0.5, -1, 0, v59);
    l_TextButton_0.Position = v86;
    l_TextButton_0.BackgroundTransparency = v47;
    l_TextButton_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Font = Enum.Font.SourceSansBold;
    l_TextButton_0.FontSize = v61;
    l_TextButton_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextButton_0.TextTruncate = Enum.TextTruncate.AtEnd;
    l_TextButton_0.TextScaled = true;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.PaddingTop = UDim.new(0, v60 / 2);
    l_UIPadding_0.PaddingBottom = UDim.new(0, v60 / 2);
    l_UIPadding_0.PaddingLeft = UDim.new(0, v60);
    l_UIPadding_0.PaddingRight = UDim.new(0, v60);
    l_UIPadding_0.Parent = l_TextButton_0;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v62;
    l_UITextSizeConstraint_0.MinTextSize = v63;
    l_UITextSizeConstraint_0.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
local v91 = UDim2.new(0, v50, 0.42, 0);
local v92 = UDim2.new(1, -v50 - 4, 0.5, 0);
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "NotificationFrame";
l_Frame_1.Size = v91;
l_Frame_1.Position = v92;
l_Frame_1.BackgroundTransparency = 1;
local l_l_Frame_1_0 = l_Frame_1;
if v21 then
    l_l_Frame_1_0.ZIndex = 3;
else
    l_l_Frame_1_0.ZIndex = 2;
end;
l_l_Frame_1_0.Parent = l_Parent_0;
v92 = (function() --[[ Line: 220 ]] --[[ Name: createDefaultNotification ]]
    -- upvalues: v49 (copy), v47 (ref)
    local v95 = UDim2.new(1, 0, 0, v49);
    local v96 = UDim2.new(0, 0, 0, 0);
    local l_v47_0 = v47;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "Notification";
    l_Frame_2.Size = v95;
    l_Frame_2.Position = v96;
    l_Frame_2.BackgroundTransparency = l_v47_0;
    local l_l_Frame_2_0 = l_Frame_2;
    l_l_Frame_2_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_l_Frame_2_0.BorderSizePixel = 0;
    return l_l_Frame_2_0;
end)();
l_Frame_1 = Instance.new("TextLabel");
l_Frame_1.Name = "NotificationTitle";
l_Frame_1.Size = UDim2.new(1, -v51 * 2, 0, v52);
l_Frame_1.Position = UDim2.new(0, v51, 0.5, v54);
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.Font = Enum.Font.SourceSansBold;
l_Frame_1.FontSize = v55;
l_Frame_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Name = "NotificationText";
l_TextLabel_0.Size = UDim2.new(1, -v51 * 2, 0, v56);
l_TextLabel_0.Position = UDim2.new(0, v51, 0.5, 1);
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.Font = Enum.Font.SourceSans;
l_TextLabel_0.FontSize = v58;
l_TextLabel_0.TextColor3 = Color3.new(0.92, 0.92, 0.92);
l_TextLabel_0.TextWrap = true;
l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Name = "NotificationImage";
l_ImageLabel_0.Size = UDim2.new(0, v48, 0, v48);
l_ImageLabel_0.Position = UDim2.new(0, v51, 0, 0.5 * (v49 - v48));
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.Image = "";
local v102 = UDim2.new(0, 360, 0, 160);
local v103 = UDim2.new(0.5, -180, 0.5, -50);
local l_Frame_3 = Instance.new("Frame");
l_Frame_3.Name = "PopupFrame";
l_Frame_3.Size = v102;
l_Frame_3.Position = v103;
l_Frame_3.BackgroundTransparency = 0;
local l_l_Frame_3_0 = l_Frame_3;
l_l_Frame_3_0.Style = Enum.FrameStyle.DropShadow;
l_l_Frame_3_0.ZIndex = 4;
l_l_Frame_3_0.Visible = false;
l_l_Frame_3_0.Parent = l_Parent_0;
v102 = Instance.new("TextButton");
v102.Name = "PopupAcceptButton";
v102.Size = UDim2.new(0, 100, 0, 50);
v102.Position = UDim2.new(0.5, -102, 1, -58);
v102.Style = Enum.ButtonStyle.RobloxRoundButton;
v102.Font = Enum.Font.SourceSansBold;
v102.FontSize = Enum.FontSize.Size24;
v102.TextColor3 = Color3.new(1, 1, 1);
v102.Text = "Accept";
v102.ZIndex = 5;
v102.Parent = l_l_Frame_3_0;
v103 = v102:Clone();
v103.Name = "PopupDeclineButton";
v103.Position = UDim2.new(0.5, 2, 1, -58);
v103.Text = "Decline";
v103.Parent = l_l_Frame_3_0;
l_Frame_3 = v102:Clone();
l_Frame_3.Name = "PopupOKButton";
l_Frame_3.Position = UDim2.new(0.5, -50, 1, -58);
l_Frame_3.Text = "OK";
l_Frame_3.Visible = false;
l_Frame_3.Parent = l_l_Frame_3_0;
local l_TextLabel_1 = Instance.new("TextLabel");
l_TextLabel_1.Name = "PopupText";
l_TextLabel_1.Size = UDim2.new(1, -16, 0.8, 0);
l_TextLabel_1.Position = UDim2.new(0, 8, 0, 8);
l_TextLabel_1.BackgroundTransparency = 1;
l_TextLabel_1.Font = Enum.Font.SourceSansBold;
l_TextLabel_1.FontSize = Enum.FontSize.Size36;
l_TextLabel_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
l_TextLabel_1.TextWrap = true;
l_TextLabel_1.ZIndex = 5;
l_TextLabel_1.TextYAlignment = Enum.TextYAlignment.Top;
l_TextLabel_1.Text = "This is a popup";
l_TextLabel_1.Parent = l_l_Frame_3_0;
local v107 = nil;
local v108 = nil;
local function _(v109) --[[ Line: 305 ]] --[[ Name: getFriendImage ]]
    -- upvalues: v44 (copy)
    return v44.GetPlayerImage(v109, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
end;
local function v132(v111, v112, v113) --[[ Line: 316 ]] --[[ Name: createNotification ]]
    -- upvalues: v92 (copy), v49 (copy), l_Frame_1 (copy), l_TextLabel_0 (copy), l_TextService_0 (copy), v53 (copy), l_l_Frame_1_0 (copy), v57 (copy), v48 (copy), v51 (copy), l_ImageLabel_0 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy)
    local v114 = v92:Clone();
    v114.Position = UDim2.new(1, 4, 1, -v49 - 4);
    local v115 = l_Frame_1:Clone();
    v115.Text = v111;
    v115.Parent = v114;
    local v116 = l_TextLabel_0:Clone();
    v116.Text = v112;
    v116.Parent = v114;
    local v117 = false;
    local function v119() --[[ Line: 329 ]] --[[ Name: updateNotificationForMultiLineTitle ]]
        -- upvalues: v117 (ref), v115 (copy), l_TextService_0 (ref), v53 (ref), v116 (copy), v114 (copy)
        v117 = true;
        v115.TextWrapped = true;
        v115.TextTruncate = Enum.TextTruncate.AtEnd;
        local v118 = math.min(l_TextService_0:GetTextSize(v115.Text, v115.TextSize, v115.Font, Vector2.new(v115.AbsoluteSize.X, 1000)).Y - v115.Size.Y.Offset, v53 - v115.Size.Y.Offset);
        v115.Size = v115.Size + UDim2.new(0, 0, 0, v118);
        v115.Position = v115.Position - UDim2.new(0, 0, 0, v118 / 2);
        v116.Position = v116.Position + UDim2.new(0, 0, 0, v118 / 2);
        v114.Size = v114.Size + UDim2.new(0, 0, 0, v118);
    end;
    v114.Parent = l_l_Frame_1_0;
    if v113 == nil or v113 == "" then
        if not v115.TextFits then
            v117 = true;
            v119();
        end;
        if not v116.TextFits then
            local v120 = math.min(l_TextService_0:GetTextSize(v116.Text, v116.TextSize, v116.Font, Vector2.new(v116.AbsoluteSize.X, 1000)).Y - v116.Size.Y.Offset, v57 - v116.Size.Y.Offset);
            v116.Size = v116.Size + UDim2.new(0, 0, 0, v120);
            v115.Position = v115.Position - UDim2.new(0, 0, 0, v120 / 2);
            v116.Position = v116.Position - UDim2.new(0, 0, 0, v120 / 2);
            v114.Size = v114.Size + UDim2.new(0, 0, 0, v120);
        end;
    else
        local v121 = v48 + v51 * 2;
        local l_v51_0 = v51;
        local v123 = l_ImageLabel_0:Clone();
        v123.Image = v113;
        v123.Parent = v114;
        v115.Size = UDim2.new(1, -v121 - l_v51_0, 0, v115.Size.Y.Offset);
        v115.Position = UDim2.new(0, v121, v115.Position.Y.Scale, v115.Position.Y.Offset);
        v115.TextXAlignment = Enum.TextXAlignment.Left;
        v116.Size = UDim2.new(1, -v121 - l_v51_0, 0, v116.Size.Y.Offset);
        v116.Position = UDim2.new(0, v121, v116.Position.Y.Scale, v116.Position.Y.Offset);
        v116.TextXAlignment = Enum.TextXAlignment.Left;
        if not v115.TextFits then
            v119();
            local l_TextSize_0 = v116.TextSize;
            v116.Size = v116.Size - UDim2.new(0, 0, 0, l_TextSize_0);
            v115.Position = v115.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v116.Position = v116.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v114.Size = v114.Size - UDim2.new(0, 0, 0, l_TextSize_0 + 4);
        end;
        if not v116.TextFits then
            local v125 = nil;
            local l_Text_0 = v116.Text;
            for v127 = string.len(l_Text_0) - 1, 2, -1 do
                if string.sub(l_Text_0, v127, v127) == " " then
                    v116.Text = string.sub(l_Text_0, 1, v127 - 1);
                    if v116.TextFits then
                        v125 = string.sub(l_Text_0, v127 + 1);
                        break;
                    end;
                end;
            end;
            if v125 then
                local v128 = l_TextLabel_0:Clone();
                v128.TextXAlignment = Enum.TextXAlignment.Left;
                v128.Text = v125;
                v128.Name = "ExtraText";
                v128.TextTruncate = Enum.TextTruncate.AtEnd;
                v128.Parent = v114;
                local v129 = math.min(l_TextService_0:GetTextSize(v125, v128.TextSize, v128.Font, Vector2.new(v128.AbsoluteSize.X, 1000)).Y, v57 - v116.Size.Y.Offset);
                v128.Size = UDim2.new(v128.Size.X.Scale, v128.Size.X.Offset, 0, v129);
                v115.Position = v115.Position - UDim2.new(0, 0, 0, v129 / 2);
                v116.Position = v116.Position - UDim2.new(0, 0, 0, v129 / 2);
                v114.Size = v114.Size + UDim2.new(0, 0, 0, v129);
                v128.AnchorPoint = Vector2.new(0.5, 0);
                v128.Position = UDim2.new(0.5, 0, v116.Position.Y.Scale, v116.Position.Y.Offset + v116.AbsoluteSize.Y);
            else
                v116.Text = l_Text_0;
            end;
        end;
    end;
    if v117 and v116.TextFits then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v116.Text, v116.TextSize, v116.Font, Vector2.new(v116.AbsoluteSize.X, 1000));
        if l_l_TextService_0_TextSize_0.Y < v116.Size.Y.Offset then
            local v131 = v116.Size.Y.Offset - l_l_TextService_0_TextSize_0.Y;
            v116.Size = v116.Size - UDim2.new(0, 0, 0, v131);
            v115.Position = v115.Position + UDim2.new(0, 0, 0, v131 / 2);
            v116.Position = v116.Position + UDim2.new(0, 0, 0, v131 / 2);
            v114.Size = v114.Size - UDim2.new(0, 0, 0, v131);
        end;
    end;
    v114.Parent = nil;
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v114);
    return v114;
end;
local function _(v133) --[[ Line: 485 ]] --[[ Name: findNotification ]]
    -- upvalues: v35 (copy)
    for v134 = 1, #v35 do
        if v35[v134] == v133 then
            return v134;
        end;
    end;
end;
local function v142() --[[ Line: 494 ]] --[[ Name: updateNotifications ]]
    -- upvalues: v35 (copy), v49 (copy), l_InOut_0 (copy), l_Sine_0 (copy)
    local v136 = 1;
    local v137 = 0;
    for v138 = #v35, 1, -1 do
        local v139 = v35[v138];
        if v139 then
            local l_Frame_4 = v139.Frame;
            if l_Frame_4 and l_Frame_4.Parent then
                if not v139.IsFriend or not ((v49 + 2) * 1.5) then
                    local _ = v49;
                end;
                v137 = v137 + (v139.IsFriend and l_Frame_4.Size.Y.Offset + (v49 + 2) * 0.5 or l_Frame_4.Size.Y.Offset);
                l_Frame_4:TweenPosition(UDim2.new(0, 0, 1, -v137 - v136 * 4), l_InOut_0, l_Sine_0, 0.35, true, function() --[[ Line: 513 ]]
                    -- upvalues: v139 (copy)
                    if v139.TweenOutCallback then
                        v139.TweenOutCallback();
                    end;
                end);
                v136 = v136 + 1;
            end;
        end;
    end;
end;
local v143 = 0;
v107 = function(v144) --[[ Line: 526 ]]
    -- upvalues: v35 (copy), v36 (copy), l_l_Frame_1_0 (copy), v108 (ref), v143 (ref), v142 (copy)
    spawn(function() --[[ Line: 527 ]]
        -- upvalues: v144 (copy), v35 (ref), v36 (ref), l_l_Frame_1_0 (ref), v108 (ref), v143 (ref), v142 (ref)
        v144.IsActive = true;
        local v145 = #v35;
        if v145 == 3 then
            v35[1].Duration = 0;
            v36[#v36 + 1] = v144;
            return;
        else
            v35[v145 + 1] = v144;
            v144.Frame.Parent = l_l_Frame_1_0;
            spawn(function() --[[ Line: 542 ]]
                -- upvalues: v144 (ref), v108 (ref)
                wait(0.7);
                while v144.Duration > 0 do
                    wait(0.2);
                    v144.Duration = v144.Duration - 0.2;
                end;
                v108(v144);
            end);
            while tick() - v143 < 0.35 do
                wait();
            end;
            v143 = tick();
            v142();
            return;
        end;
    end);
end;
v108 = function(v146) --[[ Line: 565 ]]
    -- upvalues: v35 (copy), l_InOut_0 (copy), l_Sine_0 (copy), v36 (copy), v107 (ref), v142 (copy)
    local v147 = false;
    if not v146 then
        return;
    else
        local l_v146_0 = v146;
        local v149;
        for v150 = 1, #v35 do
            if v35[v150] == l_v146_0 then
                v149 = v150;
                v147 = true;
            end;
            if v147 then
                break;
            end;
        end;
        if not v147 then
            v149 = nil;
        end;
        v147 = false;
        table.remove(v35, v149);
        l_v146_0 = v146.Frame;
        if l_v146_0 and l_v146_0.Parent then
            v146.IsActive = false;
            spawn(function() --[[ Line: 575 ]]
                -- upvalues: l_v146_0 (copy), l_InOut_0 (ref), l_Sine_0 (ref), v146 (ref)
                local function v151() --[[ Line: 581 ]] --[[ Name: doTweenOut ]]
                    -- upvalues: l_v146_0 (ref), l_InOut_0 (ref), l_Sine_0 (ref), v146 (ref)
                    if l_v146_0:IsDescendantOf(game) then
                        return l_v146_0:TweenPosition(UDim2.new(1, 0, 1, l_v146_0.Position.Y.Offset), l_InOut_0, l_Sine_0, 0.35, false, function() --[[ Line: 589 ]]
                            -- upvalues: l_v146_0 (ref), v146 (ref)
                            l_v146_0:Destroy();
                            v146 = nil;
                        end);
                    else
                        return false;
                    end;
                end;
                if not v151() then
                    v146.TweenOutCallback = v151;
                end;
            end);
        end;
        if #v36 > 0 then
            local v152 = v36[1];
            table.remove(v36, 1);
            v107(v152);
            if #v36 > 0 and v35[1] then
                v35[1].Duration = 0;
            end;
        else
            v142();
        end;
        return;
    end;
end;
local function _(v153) --[[ Line: 618 ]] --[[ Name: sendNotificationInfo ]]
    -- upvalues: l_BindableEvent_0 (copy)
    v153.Duration = v153.Duration or 5;
    l_BindableEvent_0:Fire(v153);
end;
local function _(v155, v156, v157) --[[ Line: 623 ]] --[[ Name: createNotificationButtonDetails ]]
    return {
        Text = v155, 
        ButtonType = v156, 
        OnActivated = function() --[[ Line: 627 ]] --[[ Name: OnActivated ]]
            -- upvalues: v157 (copy), v155 (copy)
            if v157 and type(v157) ~= "function" then
                pcall(function() --[[ Line: 629 ]]
                    -- upvalues: v157 (ref), v155 (ref)
                    v157:Invoke(v155);
                end);
                return;
            else
                if type(v157) == "function" then
                    v157(v155);
                end;
                return;
            end;
        end
    };
end;
local function v175(v159) --[[ Line: 639 ]] --[[ Name: onSendNotificationInfo ]]
    -- upvalues: l_VRService_0 (copy), l_game_EngineFeature_0 (copy), v24 (copy), v45 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy), v132 (copy), v90 (copy), v108 (ref), v59 (copy), v107 (ref)
    if l_VRService_0.VREnabled then
        return;
    else
        local l_Callback_0 = v159.Callback;
        local l_Button1Text_0 = v159.Button1Text;
        local l_Button2Text_0 = v159.Button2Text;
        if l_game_EngineFeature_0 and v24() then
            local v163 = {};
            if l_Button1Text_0 and l_Button1Text_0 ~= "" then
                local l_Primary_0 = Enum.NotificationButtonType.Primary;
                table.insert(v163, {
                    Text = l_Button1Text_0, 
                    ButtonType = l_Primary_0, 
                    OnActivated = function() --[[ Line: 627 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_Callback_0 (copy), l_Button1Text_0 (copy)
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function() --[[ Line: 629 ]]
                                -- upvalues: l_Callback_0 (ref), l_Button1Text_0 (ref)
                                l_Callback_0:Invoke(l_Button1Text_0);
                            end);
                            return;
                        else
                            if type(l_Callback_0) == "function" then
                                l_Callback_0(l_Button1Text_0);
                            end;
                            return;
                        end;
                    end
                });
            end;
            if l_Button2Text_0 and l_Button2Text_0 ~= "" then
                local l_Secondary_0 = Enum.NotificationButtonType.Secondary;
                table.insert(v163, {
                    Text = l_Button2Text_0, 
                    ButtonType = l_Secondary_0, 
                    OnActivated = function() --[[ Line: 627 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_Callback_0 (copy), l_Button2Text_0 (copy)
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function() --[[ Line: 629 ]]
                                -- upvalues: l_Callback_0 (ref), l_Button2Text_0 (ref)
                                l_Callback_0:Invoke(l_Button2Text_0);
                            end);
                            return;
                        else
                            if type(l_Callback_0) == "function" then
                                l_Callback_0(l_Button2Text_0);
                            end;
                            return;
                        end;
                    end
                });
            end;
            local v166 = {
                Title = if v159.Autolocalize then v45:TranslateGameText(l_CoreGui_0, v159.Title) else v159.Title, 
                Text = if v159.AutoLocalize then v45:TranslateGameText(l_CoreGui_0, v159.Text) else v159.Text, 
                Icon = v159.Image, 
                OnDisplay = v159.OnDisplay, 
                OnDismiss = v159.OnDismiss, 
                Buttons = v163
            };
            l_GuiService_0:SendNotification(v166);
            return;
        else
            local v167 = {};
            local v168 = nil;
            v168 = if v159.AutoLocalize then v132(v45:TranslateGameText(l_CoreGui_0, v159.Title), v45:TranslateGameText(l_CoreGui_0, v159.Text), v159.Image) else v132(v159.Title, v159.Text, v159.Image);
            local v169 = nil;
            if l_Button1Text_0 and l_Button1Text_0 ~= "" then
                v167.IsFriend = true;
                v169 = v90("Button1", UDim2.new(0, 0, 1, 2));
                if v159.AutoLocalize then
                    v45:TranslateAndRegister(v169, l_CoreGui_0, l_Button1Text_0);
                else
                    v169.Text = l_Button1Text_0;
                end;
                v169.Parent = v168;
                local v170 = nil;
                do
                    local l_v170_0 = v170;
                    l_v170_0 = v169.MouseButton1Click:connect(function() --[[ Line: 708 ]]
                        -- upvalues: l_v170_0 (ref), v108 (ref), v167 (copy), l_Callback_0 (copy), l_Button1Text_0 (copy)
                        if l_v170_0 then
                            l_v170_0:disconnect();
                            l_v170_0 = nil;
                            v108(v167);
                            if l_Callback_0 and type(l_Callback_0) ~= "function" then
                                pcall(function() --[[ Line: 714 ]]
                                    -- upvalues: l_Callback_0 (ref), l_Button1Text_0 (ref)
                                    l_Callback_0:Invoke(l_Button1Text_0);
                                end);
                                return;
                            elseif type(l_Callback_0) == "function" then
                                l_Callback_0(l_Button1Text_0);
                            end;
                        end;
                    end);
                end;
            end;
            local v172 = nil;
            if l_Button2Text_0 and l_Button2Text_0 ~= "" then
                v167.IsFriend = true;
                v172 = v90("Button2", UDim2.new(0.5, 1, 1, 2));
                if v159.AutoLocalize then
                    v45:TranslateAndRegister(v172, l_CoreGui_0, l_Button2Text_0);
                else
                    v172.Text = l_Button2Text_0;
                end;
                v172.Parent = v168;
                local v173 = nil;
                do
                    local l_v173_0 = v173;
                    l_v173_0 = v172.MouseButton1Click:connect(function() --[[ Line: 738 ]]
                        -- upvalues: l_v173_0 (ref), v108 (ref), v167 (copy), l_Callback_0 (copy), l_Button2Text_0 (copy), v159 (copy)
                        if l_v173_0 then
                            l_v173_0:disconnect();
                            l_v173_0 = nil;
                            v108(v167);
                            if l_Callback_0 and type(l_Callback_0) ~= "function" then
                                pcall(function() --[[ Line: 744 ]]
                                    -- upvalues: l_Callback_0 (ref), l_Button2Text_0 (ref)
                                    l_Callback_0:Invoke(l_Button2Text_0);
                                end);
                                return;
                            elseif type(l_Callback_0) == "function" then
                                l_Callback_0(v159.Button2Text);
                            end;
                        end;
                    end);
                end;
            elseif v169 then
                v169.Size = UDim2.new(1, 0, 0, v59);
            end;
            v167.Frame = v168;
            v167.Duration = v159.Duration;
            v107(v167);
            return;
        end;
    end;
end;
l_BindableEvent_0.Event:connect(v175);
l_StarterGui_0:RegisterSetCore("SendNotification", function(v176) --[[ Line: 765 ]] --[[ Name: createDeveloperNotification ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v24 (copy), l_BindableEvent_0 (copy)
    if type(v176) == "table" and type(v176.Title) == "string" and type(v176.Text) == "string" then
        local v177 = type(v176.Icon) == "string" and v176.Icon or "";
        local v178 = type(v176.Duration) == "number" and v176.Duration or 5;
        local v179 = typeof(v176.Callback) == "Instance" and v176.Callback:IsA("BindableFunction") and v176.Callback or nil;
        local v180 = nil;
        local v181 = nil;
        if l_game_EngineFeature_0 and v24() then
            v180 = type(v176.Button1) == "string" and v176.Button1 or nil;
            v181 = type(v176.Button2) == "string" and v176.Button2 or nil;
        else
            v180 = type(v176.Button1) == "string" and v176.Button1 or "";
            v181 = type(v176.Button2) == "string" and v176.Button2 or "";
        end;
        local v182 = true;
        if v176.AutoLocalize ~= nil then
            v182 = v176.AutoLocalize == true;
        end;
        local l_Title_0 = v176.Title;
        local l_Text_1 = v176.Text;
        local v185 = {
            GroupName = "Developer", 
            Title = l_Title_0, 
            Text = l_Text_1, 
            Image = v177, 
            Duration = v178, 
            Callback = v179, 
            Button1Text = v180, 
            Button2Text = v181, 
            AutoLocalize = v182
        };
        v185.Duration = v185.Duration or 5;
        l_BindableEvent_0:Fire(v185);
    end;
end);
local v186 = nil;
local v187 = {};
local l_v187_0 = v187 --[[ copy: 95 -> 104 ]];
v186 = function(v189) --[[ Line: 816 ]]
    -- upvalues: l_v187_0 (copy), v66 (ref)
    local v190 = l_v187_0[v189];
    if v190 and tick() < v190 then
        return true;
    else
        l_v187_0[v189] = tick() + v66;
        return false;
    end;
end;
v187 = function(v191) --[[ Line: 830 ]] --[[ Name: sendFriendNotification ]]
    -- upvalues: v186 (ref), v26 (copy), v16 (copy), v74 (copy), v67 (copy), v44 (copy), l_RbxAnalyticsService_0 (copy), v33 (ref), v37 (copy), l_BindableEvent_0 (copy)
    if v186(v191) then
        return;
    else
        local v192 = if v26 and v16.getAppFeaturePolicies().getRenameFriendsToConnections() then v74(v67.SENT) else "Sent you a friend request!";
        local v193 = {
            GroupName = "Friends", 
            Title = v191.DisplayName, 
            Text = v192, 
            DetailText = v191.DisplayName
        };
        local l_UserId_0 = v191.UserId;
        v193.Image = v44.GetPlayerImage(l_UserId_0, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
        v193.Duration = 8;
        v193.Callback = function(v195) --[[ Line: 851 ]] --[[ Name: Callback ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), v33 (ref), v191 (copy), v37 (ref)
            if v195 == "Accept" then
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "NotificationScript");
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-AcceptFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "AcceptFriendship", "NotificationScript");
                v33:RequestFriendship(v191);
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RevokeFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "NotificationScript");
                v33:RevokeFriendship(v191);
                v37[v191] = true;
                return;
            end;
        end;
        v193.Button1Text = "Accept";
        v193.Button2Text = "Decline";
        v193.OnDisplay = function() --[[ Line: 870 ]] --[[ Name: OnDisplay ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref)
            l_RbxAnalyticsService_0:ReportCounter("NotificationScript-FriendshipNotificationDisplayed");
            l_RbxAnalyticsService_0:TrackEvent("Game", "FriendshipNotificationDisplayed", "NotificationScript");
        end;
        v193.OnDismiss = function() --[[ Line: 874 ]] --[[ Name: OnDismiss ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref)
            l_RbxAnalyticsService_0:ReportCounter("NotificationScript-FriendshipNotificationDismissed");
            l_RbxAnalyticsService_0:TrackEvent("Game", "FriendshipNotificationDismissed", "NotificationScript");
        end;
        v193.Duration = v193.Duration or 5;
        l_BindableEvent_0:Fire(v193);
        return;
    end;
end;
local function v209(v196, v197, v198) --[[ Line: 881 ]] --[[ Name: onFriendRequestEvent ]]
    -- upvalues: v33 (ref), v26 (copy), v16 (copy), v74 (copy), v67 (copy), v22 (copy), v25 (copy), v29 (copy), v44 (copy), l_BindableEvent_0 (copy), v37 (copy), v187 (copy)
    if v196 ~= v33 and v197 ~= v33 then
        return;
    else
        local v199 = if v26 and v16.getAppFeaturePolicies().getRenameFriendsToConnections() then v74(v67.ACCEPTED) else "New Friend";
        local v200 = v16.getAppFeaturePolicies().getRequiresOSAFriendingEducation();
        local l_v22_FriendCountAsync_0 = v22:GetFriendCountAsync(v33.UserId);
        local v202 = true;
        if l_v22_FriendCountAsync_0 ~= 0 then
            v202 = l_v22_FriendCountAsync_0 == nil;
        end;
        if v196 == v33 then
            if v198 == Enum.FriendRequestEvent.Accept and not v25() then
                local v203 = v29:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", {
                    RBX_NAME = v197.Name
                });
                local v204 = {
                    GroupName = "Friends", 
                    Title = v199, 
                    Text = v197.Name, 
                    DetailText = v203
                };
                local l_UserId_1 = v197.UserId;
                v204.Image = v44.GetPlayerImage(l_UserId_1, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
                v204.Duration = 5;
                v204.Duration = v204.Duration or 5;
                l_BindableEvent_0:Fire(v204);
                return;
            end;
        elseif v197 == v33 then
            if v198 == Enum.FriendRequestEvent.Issue and not v25() then
                if v37[v196] then
                    return;
                elseif v200 and v202 then
                    return;
                else
                    v187(v196);
                    return;
                end;
            elseif v198 == Enum.FriendRequestEvent.Accept then
                local v206 = v29:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", {
                    RBX_NAME = v196.Name
                });
                local v207 = {
                    GroupName = "Friends", 
                    Title = v199, 
                    Text = v196.Name, 
                    DetailText = v206
                };
                local l_UserId_2 = v196.UserId;
                v207.Image = v44.GetPlayerImage(l_UserId_2, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
                v207.Duration = 5;
                v207.Duration = v207.Duration or 5;
                l_BindableEvent_0:Fire(v207);
            end;
        end;
        return;
    end;
end;
local function v218(v210, v211, _, _) --[[ Line: 941 ]] --[[ Name: onPointsAwarded ]]
    -- upvalues: v42 (ref), v33 (ref), v29 (copy), l_BindableEvent_0 (copy)
    if v42 and v210 == v33.UserId then
        local v214 = nil;
        local v215 = nil;
        local _ = nil;
        if v211 == 1 then
            v214 = "Point Awarded";
            v215 = v29:FormatByKey("InGame.NotificationScript2.onPointsAwarded.single", {
                RBX_NUMBER = tostring(v211)
            });
        elseif v211 > 0 then
            v214 = "Points Awarded";
            v215 = v29:FormatByKey("InGame.NotificationScript2.onPointsAwarded.multiple", {
                RBX_NUMBER = tostring(v211)
            });
        elseif v211 < 0 then
            v214 = "Points Lost";
            v215 = v29:FormatByKey("InGame.NotificationScript2.onPointsAwarded.negative", {
                RBX_NUMBER = tostring(v211)
            });
        else
            return;
        end;
        local v217 = {
            GroupName = "PlayerPoints", 
            Title = v214, 
            Text = v215, 
            DetailText = v215, 
            Image = "https://www.roblox.com/asset?id=206410433", 
            Duration = 5
        };
        v217.Duration = v217.Duration or 5;
        l_BindableEvent_0:Fire(v217);
    end;
end;
local function v236(v219, v220, v221) --[[ Line: 979 ]] --[[ Name: onBadgeAwarded ]]
    -- upvalues: v38 (copy), v43 (ref), v33 (ref), l_GroupService_0 (copy), l_Players_0 (copy), l_BadgeService_0 (copy), v28 (copy), v29 (copy), l_RbxAnalyticsService_0 (copy), l_BindableEvent_0 (copy)
    if not v38[v221] and v43 and v219 == v33.UserId then
        v38[v221] = true;
        local v222 = "";
        if game.CreatorType == Enum.CreatorType.Group then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 984 ]]
                -- upvalues: l_GroupService_0 (ref), v220 (copy)
                return l_GroupService_0:GetGroupInfoAsync(v220);
            end);
            if not l_status_2 then
                v222 = "";
            end;
            if l_result_2 then
                v222 = l_result_2.Name;
            end;
        elseif game.CreatorType == Enum.CreatorType.User then
            local v225 = nil;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 996 ]]
                -- upvalues: l_Players_0 (ref), v220 (copy)
                return l_Players_0:GetNameFromUserIdAsync(v220);
            end);
            v225 = l_status_3;
            v222 = l_result_3;
            if not v225 then
                v222 = "";
            end;
        end;
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 1004 ]]
            -- upvalues: l_BadgeService_0 (ref), v221 (copy)
            return l_BadgeService_0:GetBadgeInfoAsync(v221);
        end);
        if not l_status_4 then
            return;
        else
            if v28 and v222 == nil then
                v222 = "";
            end;
            local v230 = v29:FormatByKey("InGame.NotificationScript2.onBadgeAwardedDetail", {
                RBX_NAME = v33.Name, 
                CREATOR_NAME = v222, 
                BADGE_NAME = l_result_4.DisplayName
            });
            local v231 = nil;
            local l_pcall_0 = pcall;
            local v233 = "InGame.NotificationScript2.onBadgeAwardedTitle";
            local v234;
            do
                local l_v231_0 = v231;
                l_pcall_0(function() --[[ Line: 55 ]]
                    -- upvalues: l_v231_0 (ref), v29 (ref), v233 (copy)
                    l_v231_0 = v29:FormatByKey(v233);
                end);
                v234 = l_v231_0;
            end;
            v231 = {
                GroupName = "BadgeAwards", 
                Title = v234, 
                Text = v230, 
                DetailText = v230, 
                Image = "https://www.roblox.com/asset?id=206410289", 
                Duration = 5, 
                OnDisplay = function() --[[ Line: 1029 ]] --[[ Name: OnDisplay ]]
                    -- upvalues: l_RbxAnalyticsService_0 (ref)
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-BadgeAwardNotificationDisplayed");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "BadgeAwardNotificationDisplayed", "NotificationScript");
                end, 
                OnDismiss = function() --[[ Line: 1033 ]] --[[ Name: OnDismiss ]]
                    -- upvalues: l_RbxAnalyticsService_0 (ref)
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-BadgeAwardNotificationDismissed");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "BadgeAwardNotificationDismissed", "NotificationScript");
                end
            };
            v231.Duration = v231.Duration or 5;
            l_BindableEvent_0:Fire(v231);
        end;
    end;
end;
onGameSettingsChanged = function(v237, v238) --[[ Line: 1041 ]] --[[ Name: onGameSettingsChanged ]]
    -- upvalues: l_GameSettings_0 (copy), l_Value_0 (ref), v29 (copy), l_BindableEvent_0 (copy)
    if v237 == "SavedQualityLevel" then
        local v239 = l_GameSettings_0.SavedQualityLevel.Value + v238;
        if v239 > 10 then
            v239 = 10;
        elseif v239 < 1 then
            v239 = 1;
        end;
        if v239 > 0 and v239 ~= l_Value_0 and l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            local v240 = ("%s to (%d)"):format(l_Value_0 < v239 and "Increased" or "Decreased", v239);
            v240 = if l_Value_0 < v239 then v29:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", {
                RBX_NUMBER = tostring(v239)
            }) else v29:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", {
                RBX_NUMBER = tostring(v239)
            });
            local v241 = {
                GroupName = "Graphics", 
                Title = "Graphics Quality", 
                Text = v240, 
                DetailText = v240, 
                Image = "", 
                Duration = 2
            };
            v241.Duration = v241.Duration or 5;
            l_BindableEvent_0:Fire(v241);
            l_Value_0 = v239;
        end;
    end;
end;
if not v46:IsSubjectToChinaPolicies() then
    l_BadgeService_0.OnBadgeAwarded:connect(v236);
end;
if not v41 then
    l_Players_0.FriendRequestEvent:connect(v209);
    l_PointsService_0.PointsAwarded:connect(v218);
    game.GraphicsQualityChangeRequest:Connect(function(_) --[[ Line: 1092 ]]
        onGameSettingsChanged("SavedQualityLevel", 0);
    end);
end;
if not v46:IsSubjectToChinaPolicies() then
    if not v27() then
        game.ScreenshotReady:Connect(function(_) --[[ Line: 1102 ]]
            -- upvalues: v29 (copy), l_BindableEvent_0 (copy)
            local v244 = v29:FormatByKey("InGame.NotificationScript2.Screenshot.Title");
            local v245 = v29:FormatByKey("InGame.NotificationScript2.Screenshot.Description");
            local v246 = v29:FormatByKey("InGame.NotificationScript2.Screenshot.ButtonText");
            local v248 = {
                Title = v244, 
                Text = v245, 
                Duration = 3, 
                Button1Text = v246, 
                Callback = function(v247) --[[ Line: 1112 ]] --[[ Name: Callback ]]
                    -- upvalues: v246 (copy)
                    if v247 == v246 then
                        game:OpenScreenshotsFolder();
                    end;
                end
            };
            v248.Duration = v248.Duration or 5;
            l_BindableEvent_0:Fire(v248);
        end);
    end;
    settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(v249) --[[ Line: 1122 ]]
        -- upvalues: v29 (copy), l_BindableEvent_0 (copy)
        if not v249 then
            local v250 = v29:FormatByKey("InGame.NotificationScript2.Video.Title");
            local v251 = v29:FormatByKey("InGame.NotificationScript2.Video.Description");
            local v252 = v29:FormatByKey("InGame.NotificationScript2.Video.ButtonText");
            local v254 = {
                Title = v250, 
                Text = v251, 
                Duration = 3, 
                Button1Text = v252, 
                Callback = function(v253) --[[ Line: 1133 ]] --[[ Name: Callback ]]
                    -- upvalues: v252 (copy)
                    if v253 == v252 then
                        game:OpenVideosFolder();
                    end;
                end
            };
            v254.Duration = v254.Duration or 5;
            l_BindableEvent_0:Fire(v254);
        end;
    end);
end;
l_GuiService_0.SendCoreUiNotification = function(v255, v256) --[[ Line: 1143 ]]
    -- upvalues: v132 (copy), l_Parent_0 (copy), l_InOut_0 (copy), l_Sine_0 (copy)
    local v257 = v132(v255, v256, "");
    v257.BackgroundTransparency = 0.5;
    v257.Size = UDim2.new(0.5, 0, 0.1, 0);
    v257.Position = UDim2.new(0.25, 0, -0.1, 0);
    v257.NotificationTitle.FontSize = Enum.FontSize.Size36;
    v257.NotificationText.FontSize = Enum.FontSize.Size24;
    v257.Parent = l_Parent_0;
    v257:TweenPosition(UDim2.new(0.25, 0, 0, 0), l_InOut_0, l_Sine_0, 0.35, true);
    wait(5);
    if v257 then
        v257:Destroy();
    end;
end;
l_MarketplaceService_0.ClientLuaDialogRequested:connect(function(v258, v259, v260) --[[ Line: 1159 ]] --[[ Name: onClientLuaDialogRequested ]]
    -- upvalues: l_TextLabel_1 (copy), l_GuiService_0 (copy), l_l_Frame_3_0 (copy), v102 (copy), l_MarketplaceService_0 (copy), v103 (copy), l_Frame_3 (copy)
    l_TextLabel_1.Text = v258;
    local v261 = nil;
    local v262 = nil;
    local function _() --[[ Line: 1163 ]] --[[ Name: disconnectCns ]]
        -- upvalues: v261 (ref), v262 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref)
        if v261 then
            v261:disconnect();
        end;
        if v262 then
            v262:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
    end;
    v261 = v102.MouseButton1Click:connect(function() --[[ Line: 1175 ]]
        -- upvalues: v261 (ref), v262 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_MarketplaceService_0 (ref)
        if v261 then
            v261:disconnect();
        end;
        if v262 then
            v262:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(true);
    end);
    v262 = v103.MouseButton1Click:connect(function() --[[ Line: 1179 ]]
        -- upvalues: v261 (ref), v262 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_MarketplaceService_0 (ref)
        if v261 then
            v261:disconnect();
        end;
        if v262 then
            v262:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(false);
    end);
    if not pcall(function() --[[ Line: 1184 ]]
        -- upvalues: l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_Frame_3 (ref), v102 (ref), v103 (ref), v259 (copy), v260 (copy)
        l_GuiService_0:AddCenterDialog(l_l_Frame_3_0, Enum.CenterDialogType.QuitDialog, function() --[[ Line: 1185 ]]
            -- upvalues: l_Frame_3 (ref), v102 (ref), v103 (ref), v259 (ref), v260 (ref), l_l_Frame_3_0 (ref)
            l_Frame_3.Visible = false;
            v102.Visible = true;
            v103.Visible = true;
            v102.Text = v259;
            v103.Text = v260;
            l_l_Frame_3_0.Visible = true;
        end, function() --[[ Line: 1192 ]]
            -- upvalues: l_l_Frame_3_0 (ref)
            l_l_Frame_3_0.Visible = false;
        end);
    end) then
        l_l_Frame_3_0.Visible = true;
        v102.Text = v259;
        v103.Text = v260;
    end;
    return true;
end);
local function v265() --[[ Line: 1207 ]] --[[ Name: onPreferredTransparencyChanged ]]
    -- upvalues: v47 (ref), l_GameSettings_0 (copy), v92 (copy), v35 (copy)
    v47 = 0.6 * l_GameSettings_0.PreferredTransparency;
    v92.BackgroundTransparency = v47;
    for v264 = 1, #v35 do
        v35[v264].Frame.BackgroundTransparency = v47;
    end;
end;
l_GameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(v265);
if v21 then
    local function v274() --[[ Line: 1218 ]] --[[ Name: onMenuTeleportAttemptNotification ]]
        -- upvalues: v29 (copy), v54 (copy), l_BindableEvent_0 (copy)
        local v266 = "Teleporting Paused";
        local l_pcall_1 = pcall;
        local v268 = "Feature.SettingsHub.Prompt.TeleportBlock.Title";
        local v269;
        do
            local l_v266_0 = v266;
            l_pcall_1(function() --[[ Line: 55 ]]
                -- upvalues: l_v266_0 (ref), v29 (ref), v268 (copy)
                l_v266_0 = v29:FormatByKey(v268);
            end);
            v269 = l_v266_0;
        end;
        l_pcall_1 = "Teleporting will resume upon menu close.";
        local l_pcall_2 = pcall;
        local v272 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle";
        do
            local l_l_pcall_1_0 = l_pcall_1;
            l_pcall_2(function() --[[ Line: 55 ]]
                -- upvalues: l_l_pcall_1_0 (ref), v29 (ref), v272 (copy)
                l_l_pcall_1_0 = v29:FormatByKey(v272);
            end);
            v266 = l_l_pcall_1_0;
        end;
        l_pcall_1 = {
            GroupName = "Teleport", 
            Title = v269, 
            Text = v266, 
            Image = "http://www.roblox.com/asset/?id=10961494062", 
            Duration = 5, 
            BottomPadding = v54
        };
        l_pcall_1.Duration = l_pcall_1.Duration or 5;
        l_BindableEvent_0:Fire(l_pcall_1);
    end;
    local function _() --[[ Line: 1235 ]] --[[ Name: connectMenuTeleportAttemptEvent ]]
        -- upvalues: l_TeleportService_0 (copy), v274 (copy)
        l_TeleportService_0.MenuTeleportAttempt:Connect(function() --[[ Line: 1236 ]]
            -- upvalues: v274 (ref)
            v274();
        end);
    end;
    l_TeleportService_0.MenuTeleportAttempt:Connect(function() --[[ Line: 1236 ]]
        -- upvalues: v274 (copy)
        v274();
    end);
end;