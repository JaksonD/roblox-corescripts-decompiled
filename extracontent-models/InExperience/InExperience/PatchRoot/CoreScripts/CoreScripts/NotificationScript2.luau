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
local l_FFlagConnectionsToFriendsRename_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagConnectionsToFriendsRename;
local v30 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_game_EngineFeature_1 = game:GetEngineFeature("DeprecateOldGuiObjectProperties");
local function _(v32, v33) --[[ Line: 58 ]] --[[ Name: LocalizedGetString ]]
    -- upvalues: v30 (copy)
    pcall(function() --[[ Line: 59 ]]
        -- upvalues: v33 (ref), v30 (ref), v32 (copy)
        v33 = v30:FormatByKey(v32);
    end);
    return v33;
end;
local v35 = nil;
while not l_Players_0.LocalPlayer do
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
end;
v35 = l_Players_0.LocalPlayer;
local l_Parent_0 = script.Parent;
local v37 = {};
local v38 = {};
local v39 = {};
local v40 = {};
local l_Value_0 = l_GameSettings_0.SavedQualityLevel.Value;
local l_BindableEvent_0 = Instance.new("BindableEvent");
l_BindableEvent_0.Name = "SendNotificationInfo";
l_BindableEvent_0.Parent = l_RobloxGui_0;
local v43 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local v44 = true;
local v45 = true;
local v46 = require(l_RobloxGui_0.Modules.SocialUtil);
local v47 = require(l_RobloxGui_0.Modules.GameTranslator);
local v48 = require(l_CorePackages_0.Workspace.Packages.CachedPolicyService);
local v49 = 0.6 * l_GameSettings_0.PreferredTransparency;
local v50 = v43 and 72 or 48;
local v51 = v43 and 145 or 64;
local v52 = v43 and 450 or 200;
local v53 = v50 / 6;
local v54 = v43 and 42 or 18;
local v55 = v43 and 84 or 36;
local v56 = -v54;
local v57 = v43 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v58 = v43 and 72 or 28;
local v59 = v43 and 144 or 56;
local v60 = v43 and Enum.FontSize.Size36 or Enum.FontSize.Size14;
local v61 = v51 / 2;
local v62 = v53 / 2;
local v63 = v43 and Enum.FontSize.Size42 or Enum.FontSize.Size18;
local v64 = v43 and 42 or 18;
local v65 = v43 and 30 or 14;
local l_InOut_0 = Enum.EasingDirection.InOut;
local l_Sine_0 = Enum.EasingStyle.Sine;
local v68 = 5;
local v69 = {
    ACCEPTED = l_FFlagConnectionsToFriendsRename_0 and "InGame.NotificationScript2.Message.FriendRequestEvent.Accepted" or "InGame.NotificationScript2.Message.ConnectionRequestEvent.Accepted", 
    SENT = l_FFlagConnectionsToFriendsRename_0 and "InGame.NotificationScript2.Message.FriendRequestEvent.Sent" or "InGame.NotificationScript2.Message.ConnectionRequestEvent.Sent"
};
local function v76(v70, v71) --[[ Line: 133 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy), l_Logging_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v73 = l_Localization_0.new(l_RobloxLocaleId_0);
    v73:SetLocale(l_RobloxLocaleId_0);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 138 ]]
        -- upvalues: v73 (copy), v70 (copy), v71 (copy)
        return v73:Format(v70, v71);
    end);
    if l_status_0 then
        return l_result_0;
    else
        l_Logging_0.warn("Failed to translate string with key: " .. v70);
        return "";
    end;
end;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 148 ]]
    return (tonumber(settings():GetFVariable("FriendRequestNotificationThrottle")));
end);
if l_status_1 and l_result_1 ~= nil then
    v68 = l_result_1;
end;
l_StarterGui_0:RegisterSetCore("PointsNotificationsActive", function(v79) --[[ Line: 155 ]]
    -- upvalues: v44 (ref)
    if type(v79) == "boolean" then
        v44 = v79;
    end;
end);
l_StarterGui_0:RegisterSetCore("BadgesNotificationsActive", function(v80) --[[ Line: 160 ]]
    -- upvalues: v45 (ref)
    if type(v80) == "boolean" then
        v45 = v80;
    end;
end);
l_StarterGui_0:RegisterGetCore("PointsNotificationsActive", function() --[[ Line: 166 ]]
    -- upvalues: v44 (ref)
    return v44;
end);
l_StarterGui_0:RegisterGetCore("BadgesNotificationsActive", function() --[[ Line: 169 ]]
    -- upvalues: v45 (ref)
    return v45;
end);
local function _(v81, v82, v83, v84) --[[ Line: 176 ]] --[[ Name: createFrame ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = v81;
    l_Frame_0.Size = v82;
    l_Frame_0.Position = v83;
    l_Frame_0.BackgroundTransparency = v84;
    return l_Frame_0;
end;
local function v92(v87, v88) --[[ Line: 186 ]] --[[ Name: createTextButton ]]
    -- upvalues: v61 (copy), v49 (ref), v63 (copy), v62 (copy), v64 (copy), v65 (copy)
    local l_TextButton_0 = Instance.new("TextButton");
    l_TextButton_0.Name = v87;
    l_TextButton_0.Size = UDim2.new(0.5, -1, 0, v61);
    l_TextButton_0.Position = v88;
    l_TextButton_0.BackgroundTransparency = v49;
    l_TextButton_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_TextButton_0.BorderSizePixel = 0;
    l_TextButton_0.Font = Enum.Font.SourceSansBold;
    l_TextButton_0.FontSize = v63;
    l_TextButton_0.TextColor3 = Color3.new(1, 1, 1);
    l_TextButton_0.TextTruncate = Enum.TextTruncate.AtEnd;
    l_TextButton_0.TextScaled = true;
    local l_UIPadding_0 = Instance.new("UIPadding");
    l_UIPadding_0.PaddingTop = UDim.new(0, v62 / 2);
    l_UIPadding_0.PaddingBottom = UDim.new(0, v62 / 2);
    l_UIPadding_0.PaddingLeft = UDim.new(0, v62);
    l_UIPadding_0.PaddingRight = UDim.new(0, v62);
    l_UIPadding_0.Parent = l_TextButton_0;
    local l_UITextSizeConstraint_0 = Instance.new("UITextSizeConstraint");
    l_UITextSizeConstraint_0.MaxTextSize = v64;
    l_UITextSizeConstraint_0.MinTextSize = v65;
    l_UITextSizeConstraint_0.Parent = l_TextButton_0;
    return l_TextButton_0;
end;
local v93 = UDim2.new(0, v52, 0.42, 0);
local v94 = UDim2.new(1, -v52 - 4, 0.5, 0);
local l_Frame_1 = Instance.new("Frame");
l_Frame_1.Name = "NotificationFrame";
l_Frame_1.Size = v93;
l_Frame_1.Position = v94;
l_Frame_1.BackgroundTransparency = 1;
local l_l_Frame_1_0 = l_Frame_1;
if v21 then
    l_l_Frame_1_0.ZIndex = 3;
else
    l_l_Frame_1_0.ZIndex = 2;
end;
l_l_Frame_1_0.Parent = l_Parent_0;
v94 = (function() --[[ Line: 228 ]] --[[ Name: createDefaultNotification ]]
    -- upvalues: v51 (copy), v49 (ref)
    local v97 = UDim2.new(1, 0, 0, v51);
    local v98 = UDim2.new(0, 0, 0, 0);
    local l_v49_0 = v49;
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Name = "Notification";
    l_Frame_2.Size = v97;
    l_Frame_2.Position = v98;
    l_Frame_2.BackgroundTransparency = l_v49_0;
    local l_l_Frame_2_0 = l_Frame_2;
    l_l_Frame_2_0.BackgroundColor3 = Color3.new(0, 0, 0);
    l_l_Frame_2_0.BorderSizePixel = 0;
    return l_l_Frame_2_0;
end)();
l_Frame_1 = Instance.new("TextLabel");
l_Frame_1.Name = "NotificationTitle";
l_Frame_1.Size = UDim2.new(1, -v53 * 2, 0, v54);
l_Frame_1.Position = UDim2.new(0, v53, 0.5, v56);
l_Frame_1.BackgroundTransparency = 1;
l_Frame_1.Font = Enum.Font.SourceSansBold;
l_Frame_1.FontSize = v57;
l_Frame_1.TextColor3 = Color3.new(0.97, 0.97, 0.97);
local l_TextLabel_0 = Instance.new("TextLabel");
l_TextLabel_0.Name = "NotificationText";
l_TextLabel_0.Size = UDim2.new(1, -v53 * 2, 0, v58);
l_TextLabel_0.Position = UDim2.new(0, v53, 0.5, 1);
l_TextLabel_0.BackgroundTransparency = 1;
l_TextLabel_0.Font = Enum.Font.SourceSans;
l_TextLabel_0.FontSize = v60;
l_TextLabel_0.TextColor3 = Color3.new(0.92, 0.92, 0.92);
l_TextLabel_0.TextWrap = true;
l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Top;
local l_ImageLabel_0 = Instance.new("ImageLabel");
l_ImageLabel_0.Name = "NotificationImage";
l_ImageLabel_0.Size = UDim2.new(0, v50, 0, v50);
l_ImageLabel_0.Position = UDim2.new(0, v53, 0, 0.5 * (v51 - v50));
l_ImageLabel_0.BackgroundTransparency = 1;
l_ImageLabel_0.Image = "";
local v104 = UDim2.new(0, 360, 0, 160);
local v105 = UDim2.new(0.5, -180, 0.5, -50);
local l_Frame_3 = Instance.new("Frame");
l_Frame_3.Name = "PopupFrame";
l_Frame_3.Size = v104;
l_Frame_3.Position = v105;
l_Frame_3.BackgroundTransparency = 0;
local l_l_Frame_3_0 = l_Frame_3;
l_l_Frame_3_0.Style = Enum.FrameStyle.DropShadow;
l_l_Frame_3_0.ZIndex = 4;
l_l_Frame_3_0.Visible = false;
l_l_Frame_3_0.Parent = l_Parent_0;
v104 = Instance.new("TextButton");
v104.Name = "PopupAcceptButton";
v104.Size = UDim2.new(0, 100, 0, 50);
v104.Position = UDim2.new(0.5, -102, 1, -58);
v104.Style = Enum.ButtonStyle.RobloxRoundButton;
v104.Font = Enum.Font.SourceSansBold;
v104.FontSize = Enum.FontSize.Size24;
v104.TextColor3 = Color3.new(1, 1, 1);
v104.Text = "Accept";
v104.ZIndex = 5;
v104.Parent = l_l_Frame_3_0;
v105 = v104:Clone();
v105.Name = "PopupDeclineButton";
v105.Position = UDim2.new(0.5, 2, 1, -58);
v105.Text = "Decline";
v105.Parent = l_l_Frame_3_0;
l_Frame_3 = v104:Clone();
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
local v109 = nil;
local v110 = nil;
local function _(v111) --[[ Line: 313 ]] --[[ Name: getFriendImage ]]
    -- upvalues: v46 (copy)
    return v46.GetPlayerImage(v111, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
end;
local function v134(v113, v114, v115) --[[ Line: 324 ]] --[[ Name: createNotification ]]
    -- upvalues: v94 (copy), v51 (copy), l_Frame_1 (copy), l_TextLabel_0 (copy), l_TextService_0 (copy), v55 (copy), l_l_Frame_1_0 (copy), v59 (copy), v50 (copy), v53 (copy), l_ImageLabel_0 (copy), l_GuiService_0 (copy), l_HttpService_0 (copy)
    local v116 = v94:Clone();
    v116.Position = UDim2.new(1, 4, 1, -v51 - 4);
    local v117 = l_Frame_1:Clone();
    v117.Text = v113;
    v117.Parent = v116;
    local v118 = l_TextLabel_0:Clone();
    v118.Text = v114;
    v118.Parent = v116;
    local v119 = false;
    local function v121() --[[ Line: 337 ]] --[[ Name: updateNotificationForMultiLineTitle ]]
        -- upvalues: v119 (ref), v117 (copy), l_TextService_0 (ref), v55 (ref), v118 (copy), v116 (copy)
        v119 = true;
        v117.TextWrapped = true;
        v117.TextTruncate = Enum.TextTruncate.AtEnd;
        local v120 = math.min(l_TextService_0:GetTextSize(v117.Text, v117.TextSize, v117.Font, Vector2.new(v117.AbsoluteSize.X, 1000)).Y - v117.Size.Y.Offset, v55 - v117.Size.Y.Offset);
        v117.Size = v117.Size + UDim2.new(0, 0, 0, v120);
        v117.Position = v117.Position - UDim2.new(0, 0, 0, v120 / 2);
        v118.Position = v118.Position + UDim2.new(0, 0, 0, v120 / 2);
        v116.Size = v116.Size + UDim2.new(0, 0, 0, v120);
    end;
    v116.Parent = l_l_Frame_1_0;
    if v115 == nil or v115 == "" then
        if not v117.TextFits then
            v119 = true;
            v121();
        end;
        if not v118.TextFits then
            local v122 = math.min(l_TextService_0:GetTextSize(v118.Text, v118.TextSize, v118.Font, Vector2.new(v118.AbsoluteSize.X, 1000)).Y - v118.Size.Y.Offset, v59 - v118.Size.Y.Offset);
            v118.Size = v118.Size + UDim2.new(0, 0, 0, v122);
            v117.Position = v117.Position - UDim2.new(0, 0, 0, v122 / 2);
            v118.Position = v118.Position - UDim2.new(0, 0, 0, v122 / 2);
            v116.Size = v116.Size + UDim2.new(0, 0, 0, v122);
        end;
    else
        local v123 = v50 + v53 * 2;
        local l_v53_0 = v53;
        local v125 = l_ImageLabel_0:Clone();
        v125.Image = v115;
        v125.Parent = v116;
        v117.Size = UDim2.new(1, -v123 - l_v53_0, 0, v117.Size.Y.Offset);
        v117.Position = UDim2.new(0, v123, v117.Position.Y.Scale, v117.Position.Y.Offset);
        v117.TextXAlignment = Enum.TextXAlignment.Left;
        v118.Size = UDim2.new(1, -v123 - l_v53_0, 0, v118.Size.Y.Offset);
        v118.Position = UDim2.new(0, v123, v118.Position.Y.Scale, v118.Position.Y.Offset);
        v118.TextXAlignment = Enum.TextXAlignment.Left;
        if not v117.TextFits then
            v121();
            local l_TextSize_0 = v118.TextSize;
            v118.Size = v118.Size - UDim2.new(0, 0, 0, l_TextSize_0);
            v117.Position = v117.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v118.Position = v118.Position + UDim2.new(0, 0, 0, l_TextSize_0 / 2 - 2);
            v116.Size = v116.Size - UDim2.new(0, 0, 0, l_TextSize_0 + 4);
        end;
        if not v118.TextFits then
            local v127 = nil;
            local l_Text_0 = v118.Text;
            for v129 = string.len(l_Text_0) - 1, 2, -1 do
                if string.sub(l_Text_0, v129, v129) == " " then
                    v118.Text = string.sub(l_Text_0, 1, v129 - 1);
                    if v118.TextFits then
                        v127 = string.sub(l_Text_0, v129 + 1);
                        break;
                    end;
                end;
            end;
            if v127 then
                local v130 = l_TextLabel_0:Clone();
                v130.TextXAlignment = Enum.TextXAlignment.Left;
                v130.Text = v127;
                v130.Name = "ExtraText";
                v130.TextTruncate = Enum.TextTruncate.AtEnd;
                v130.Parent = v116;
                local v131 = math.min(l_TextService_0:GetTextSize(v127, v130.TextSize, v130.Font, Vector2.new(v130.AbsoluteSize.X, 1000)).Y, v59 - v118.Size.Y.Offset);
                v130.Size = UDim2.new(v130.Size.X.Scale, v130.Size.X.Offset, 0, v131);
                v117.Position = v117.Position - UDim2.new(0, 0, 0, v131 / 2);
                v118.Position = v118.Position - UDim2.new(0, 0, 0, v131 / 2);
                v116.Size = v116.Size + UDim2.new(0, 0, 0, v131);
                v130.AnchorPoint = Vector2.new(0.5, 0);
                v130.Position = UDim2.new(0.5, 0, v118.Position.Y.Scale, v118.Position.Y.Offset + v118.AbsoluteSize.Y);
            else
                v118.Text = l_Text_0;
            end;
        end;
    end;
    if v119 and v118.TextFits then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v118.Text, v118.TextSize, v118.Font, Vector2.new(v118.AbsoluteSize.X, 1000));
        if l_l_TextService_0_TextSize_0.Y < v118.Size.Y.Offset then
            local v133 = v118.Size.Y.Offset - l_l_TextService_0_TextSize_0.Y;
            v118.Size = v118.Size - UDim2.new(0, 0, 0, v133);
            v117.Position = v117.Position + UDim2.new(0, 0, 0, v133 / 2);
            v118.Position = v118.Position + UDim2.new(0, 0, 0, v133 / 2);
            v116.Size = v116.Size - UDim2.new(0, 0, 0, v133);
        end;
    end;
    v116.Parent = nil;
    l_GuiService_0:AddSelectionParent(l_HttpService_0:GenerateGUID(false), v116);
    return v116;
end;
local function _(v135) --[[ Line: 493 ]] --[[ Name: findNotification ]]
    -- upvalues: v37 (copy)
    for v136 = 1, #v37 do
        if v37[v136] == v135 then
            return v136;
        end;
    end;
end;
local function v144() --[[ Line: 502 ]] --[[ Name: updateNotifications ]]
    -- upvalues: v37 (copy), v51 (copy), l_game_EngineFeature_1 (copy), l_InOut_0 (copy), l_Sine_0 (copy)
    local v138 = 1;
    local v139 = 0;
    for v140 = #v37, 1, -1 do
        local v141 = v37[v140];
        if v141 then
            local l_Frame_4 = v141.Frame;
            if l_Frame_4 and l_Frame_4.Parent then
                if not v141.IsFriend or not ((v51 + 2) * 1.5) then
                    local _ = v51;
                end;
                v139 = v139 + (v141.IsFriend and l_Frame_4.Size.Y.Offset + (v51 + 2) * 0.5 or l_Frame_4.Size.Y.Offset);
                if l_game_EngineFeature_1 then
                    l_Frame_4:TweenPositionInternal(UDim2.new(0, 0, 1, -v139 - v138 * 4), l_InOut_0, l_Sine_0, 0.35, true, function() --[[ Line: 523 ]]
                        -- upvalues: v141 (copy)
                        if v141.TweenOutCallback then
                            v141.TweenOutCallback();
                        end;
                    end);
                else
                    l_Frame_4:TweenPosition(UDim2.new(0, 0, 1, -v139 - v138 * 4), l_InOut_0, l_Sine_0, 0.35, true, function() --[[ Line: 536 ]]
                        -- upvalues: v141 (copy)
                        if v141.TweenOutCallback then
                            v141.TweenOutCallback();
                        end;
                    end);
                end;
                v138 = v138 + 1;
            end;
        end;
    end;
end;
local v145 = 0;
v109 = function(v146) --[[ Line: 550 ]]
    -- upvalues: v37 (copy), v38 (copy), l_l_Frame_1_0 (copy), v110 (ref), v145 (ref), v144 (copy)
    spawn(function() --[[ Line: 551 ]]
        -- upvalues: v146 (copy), v37 (ref), v38 (ref), l_l_Frame_1_0 (ref), v110 (ref), v145 (ref), v144 (ref)
        v146.IsActive = true;
        local v147 = #v37;
        if v147 == 3 then
            v37[1].Duration = 0;
            v38[#v38 + 1] = v146;
            return;
        else
            v37[v147 + 1] = v146;
            v146.Frame.Parent = l_l_Frame_1_0;
            spawn(function() --[[ Line: 566 ]]
                -- upvalues: v146 (ref), v110 (ref)
                wait(0.7);
                while v146.Duration > 0 do
                    wait(0.2);
                    v146.Duration = v146.Duration - 0.2;
                end;
                v110(v146);
            end);
            while tick() - v145 < 0.35 do
                wait();
            end;
            v145 = tick();
            v144();
            return;
        end;
    end);
end;
v110 = function(v148) --[[ Line: 589 ]]
    -- upvalues: v37 (copy), l_game_EngineFeature_1 (copy), l_InOut_0 (copy), l_Sine_0 (copy), v38 (copy), v109 (ref), v144 (copy)
    local v149 = false;
    if not v148 then
        return;
    else
        local l_v148_0 = v148;
        local v151;
        for v152 = 1, #v37 do
            if v37[v152] == l_v148_0 then
                v151 = v152;
                v149 = true;
            end;
            if v149 then
                break;
            end;
        end;
        if not v149 then
            v151 = nil;
        end;
        v149 = false;
        table.remove(v37, v151);
        l_v148_0 = v148.Frame;
        if l_v148_0 and l_v148_0.Parent then
            v148.IsActive = false;
            spawn(function() --[[ Line: 599 ]]
                -- upvalues: l_v148_0 (copy), l_game_EngineFeature_1 (ref), l_InOut_0 (ref), l_Sine_0 (ref), v148 (ref)
                local function v153() --[[ Line: 605 ]] --[[ Name: doTweenOut ]]
                    -- upvalues: l_v148_0 (ref), l_game_EngineFeature_1 (ref), l_InOut_0 (ref), l_Sine_0 (ref), v148 (ref)
                    if l_v148_0:IsDescendantOf(game) then
                        if l_game_EngineFeature_1 then
                            return l_v148_0:TweenPositionInternal(UDim2.new(1, 0, 1, l_v148_0.Position.Y.Offset), l_InOut_0, l_Sine_0, 0.35, false, function() --[[ Line: 614 ]]
                                -- upvalues: l_v148_0 (ref), v148 (ref)
                                l_v148_0:Destroy();
                                v148 = nil;
                            end);
                        else
                            return l_v148_0:TweenPosition(UDim2.new(1, 0, 1, l_v148_0.Position.Y.Offset), l_InOut_0, l_Sine_0, 0.35, false, function() --[[ Line: 626 ]]
                                -- upvalues: l_v148_0 (ref), v148 (ref)
                                l_v148_0:Destroy();
                                v148 = nil;
                            end);
                        end;
                    else
                        return false;
                    end;
                end;
                if not v153() then
                    v148.TweenOutCallback = v153;
                end;
            end);
        end;
        if #v38 > 0 then
            local v154 = v38[1];
            table.remove(v38, 1);
            v109(v154);
            if #v38 > 0 and v37[1] then
                v37[1].Duration = 0;
            end;
        else
            v144();
        end;
        return;
    end;
end;
local function _(v155) --[[ Line: 656 ]] --[[ Name: sendNotificationInfo ]]
    -- upvalues: l_BindableEvent_0 (copy)
    v155.Duration = v155.Duration or 5;
    l_BindableEvent_0:Fire(v155);
end;
local function _(v157, v158, v159) --[[ Line: 661 ]] --[[ Name: createNotificationButtonDetails ]]
    return {
        Text = v157, 
        ButtonType = v158, 
        OnActivated = function() --[[ Line: 665 ]] --[[ Name: OnActivated ]]
            -- upvalues: v159 (copy), v157 (copy)
            if v159 and type(v159) ~= "function" then
                pcall(function() --[[ Line: 667 ]]
                    -- upvalues: v159 (ref), v157 (ref)
                    v159:Invoke(v157);
                end);
                return;
            else
                if type(v159) == "function" then
                    v159(v157);
                end;
                return;
            end;
        end
    };
end;
local function v177(v161) --[[ Line: 677 ]] --[[ Name: onSendNotificationInfo ]]
    -- upvalues: l_VRService_0 (copy), l_game_EngineFeature_0 (copy), v24 (copy), v47 (copy), l_CoreGui_0 (copy), l_GuiService_0 (copy), v134 (copy), v92 (copy), v110 (ref), v61 (copy), v109 (ref)
    if l_VRService_0.VREnabled then
        return;
    else
        local l_Callback_0 = v161.Callback;
        local l_Button1Text_0 = v161.Button1Text;
        local l_Button2Text_0 = v161.Button2Text;
        if l_game_EngineFeature_0 and v24() then
            local v165 = {};
            if l_Button1Text_0 and l_Button1Text_0 ~= "" then
                local l_Primary_0 = Enum.NotificationButtonType.Primary;
                table.insert(v165, {
                    Text = l_Button1Text_0, 
                    ButtonType = l_Primary_0, 
                    OnActivated = function() --[[ Line: 665 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_Callback_0 (copy), l_Button1Text_0 (copy)
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function() --[[ Line: 667 ]]
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
                table.insert(v165, {
                    Text = l_Button2Text_0, 
                    ButtonType = l_Secondary_0, 
                    OnActivated = function() --[[ Line: 665 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_Callback_0 (copy), l_Button2Text_0 (copy)
                        if l_Callback_0 and type(l_Callback_0) ~= "function" then
                            pcall(function() --[[ Line: 667 ]]
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
            local v168 = {
                Title = if v161.Autolocalize then v47:TranslateGameText(l_CoreGui_0, v161.Title) else v161.Title, 
                Text = if v161.AutoLocalize then v47:TranslateGameText(l_CoreGui_0, v161.Text) else v161.Text, 
                Icon = v161.Image, 
                OnDisplay = v161.OnDisplay, 
                OnDismiss = v161.OnDismiss, 
                Buttons = v165
            };
            l_GuiService_0:SendNotification(v168);
            return;
        else
            local v169 = {};
            local v170 = nil;
            v170 = if v161.AutoLocalize then v134(v47:TranslateGameText(l_CoreGui_0, v161.Title), v47:TranslateGameText(l_CoreGui_0, v161.Text), v161.Image) else v134(v161.Title, v161.Text, v161.Image);
            local v171 = nil;
            if l_Button1Text_0 and l_Button1Text_0 ~= "" then
                v169.IsFriend = true;
                v171 = v92("Button1", UDim2.new(0, 0, 1, 2));
                if v161.AutoLocalize then
                    v47:TranslateAndRegister(v171, l_CoreGui_0, l_Button1Text_0);
                else
                    v171.Text = l_Button1Text_0;
                end;
                v171.Parent = v170;
                local v172 = nil;
                do
                    local l_v172_0 = v172;
                    l_v172_0 = v171.MouseButton1Click:connect(function() --[[ Line: 746 ]]
                        -- upvalues: l_v172_0 (ref), v110 (ref), v169 (copy), l_Callback_0 (copy), l_Button1Text_0 (copy)
                        if l_v172_0 then
                            l_v172_0:disconnect();
                            l_v172_0 = nil;
                            v110(v169);
                            if l_Callback_0 and type(l_Callback_0) ~= "function" then
                                pcall(function() --[[ Line: 752 ]]
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
            local v174 = nil;
            if l_Button2Text_0 and l_Button2Text_0 ~= "" then
                v169.IsFriend = true;
                v174 = v92("Button2", UDim2.new(0.5, 1, 1, 2));
                if v161.AutoLocalize then
                    v47:TranslateAndRegister(v174, l_CoreGui_0, l_Button2Text_0);
                else
                    v174.Text = l_Button2Text_0;
                end;
                v174.Parent = v170;
                local v175 = nil;
                do
                    local l_v175_0 = v175;
                    l_v175_0 = v174.MouseButton1Click:connect(function() --[[ Line: 776 ]]
                        -- upvalues: l_v175_0 (ref), v110 (ref), v169 (copy), l_Callback_0 (copy), l_Button2Text_0 (copy), v161 (copy)
                        if l_v175_0 then
                            l_v175_0:disconnect();
                            l_v175_0 = nil;
                            v110(v169);
                            if l_Callback_0 and type(l_Callback_0) ~= "function" then
                                pcall(function() --[[ Line: 782 ]]
                                    -- upvalues: l_Callback_0 (ref), l_Button2Text_0 (ref)
                                    l_Callback_0:Invoke(l_Button2Text_0);
                                end);
                                return;
                            elseif type(l_Callback_0) == "function" then
                                l_Callback_0(v161.Button2Text);
                            end;
                        end;
                    end);
                end;
            elseif v171 then
                v171.Size = UDim2.new(1, 0, 0, v61);
            end;
            v169.Frame = v170;
            v169.Duration = v161.Duration;
            v109(v169);
            return;
        end;
    end;
end;
l_BindableEvent_0.Event:connect(v177);
l_StarterGui_0:RegisterSetCore("SendNotification", function(v178) --[[ Line: 803 ]] --[[ Name: createDeveloperNotification ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v24 (copy), l_BindableEvent_0 (copy)
    if type(v178) == "table" and type(v178.Title) == "string" and type(v178.Text) == "string" then
        local v179 = type(v178.Icon) == "string" and v178.Icon or "";
        local v180 = type(v178.Duration) == "number" and v178.Duration or 5;
        local v181 = typeof(v178.Callback) == "Instance" and v178.Callback:IsA("BindableFunction") and v178.Callback or nil;
        local v182 = nil;
        local v183 = nil;
        if l_game_EngineFeature_0 and v24() then
            v182 = type(v178.Button1) == "string" and v178.Button1 or nil;
            v183 = type(v178.Button2) == "string" and v178.Button2 or nil;
        else
            v182 = type(v178.Button1) == "string" and v178.Button1 or "";
            v183 = type(v178.Button2) == "string" and v178.Button2 or "";
        end;
        local v184 = true;
        if v178.AutoLocalize ~= nil then
            v184 = v178.AutoLocalize == true;
        end;
        local l_Title_0 = v178.Title;
        local l_Text_1 = v178.Text;
        local v187 = {
            GroupName = "Developer", 
            Title = l_Title_0, 
            Text = l_Text_1, 
            Image = v179, 
            Duration = v180, 
            Callback = v181, 
            Button1Text = v182, 
            Button2Text = v183, 
            AutoLocalize = v184
        };
        v187.Duration = v187.Duration or 5;
        l_BindableEvent_0:Fire(v187);
    end;
end);
local v188 = nil;
local v189 = {};
local l_v189_0 = v189 --[[ copy: 97 -> 106 ]];
v188 = function(v191) --[[ Line: 854 ]]
    -- upvalues: l_v189_0 (copy), v68 (ref)
    local v192 = l_v189_0[v191];
    if v192 and tick() < v192 then
        return true;
    else
        l_v189_0[v191] = tick() + v68;
        return false;
    end;
end;
v189 = function(v193) --[[ Line: 868 ]] --[[ Name: sendFriendNotification ]]
    -- upvalues: v188 (ref), v26 (copy), v16 (copy), v76 (copy), v69 (copy), v46 (copy), l_RbxAnalyticsService_0 (copy), v35 (ref), v39 (copy), l_BindableEvent_0 (copy)
    if v188(v193) then
        return;
    else
        local v194 = if v26 and v16.getAppFeaturePolicies().getRenameFriendsToConnections() then v76(v69.SENT) else "Sent you a friend request!";
        local v195 = {
            GroupName = "Friends", 
            Title = v193.DisplayName, 
            Text = v194, 
            DetailText = v193.DisplayName
        };
        local l_UserId_0 = v193.UserId;
        v195.Image = v46.GetPlayerImage(l_UserId_0, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
        v195.Duration = 8;
        v195.Callback = function(v197) --[[ Line: 889 ]] --[[ Name: Callback ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref), v35 (ref), v193 (copy), v39 (ref)
            if v197 == "Accept" then
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RequestFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RequestFriendship", "NotificationScript");
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-AcceptFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "AcceptFriendship", "NotificationScript");
                v35:RequestFriendship(v193);
                return;
            else
                l_RbxAnalyticsService_0:ReportCounter("NotificationScript-RevokeFriendship");
                l_RbxAnalyticsService_0:TrackEvent("Game", "RevokeFriendship", "NotificationScript");
                v35:RevokeFriendship(v193);
                v39[v193] = true;
                return;
            end;
        end;
        v195.Button1Text = "Accept";
        v195.Button2Text = "Decline";
        v195.OnDisplay = function() --[[ Line: 908 ]] --[[ Name: OnDisplay ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref)
            l_RbxAnalyticsService_0:ReportCounter("NotificationScript-FriendshipNotificationDisplayed");
            l_RbxAnalyticsService_0:TrackEvent("Game", "FriendshipNotificationDisplayed", "NotificationScript");
        end;
        v195.OnDismiss = function() --[[ Line: 912 ]] --[[ Name: OnDismiss ]]
            -- upvalues: l_RbxAnalyticsService_0 (ref)
            l_RbxAnalyticsService_0:ReportCounter("NotificationScript-FriendshipNotificationDismissed");
            l_RbxAnalyticsService_0:TrackEvent("Game", "FriendshipNotificationDismissed", "NotificationScript");
        end;
        v195.Duration = v195.Duration or 5;
        l_BindableEvent_0:Fire(v195);
        return;
    end;
end;
local function v211(v198, v199, v200) --[[ Line: 919 ]] --[[ Name: onFriendRequestEvent ]]
    -- upvalues: v35 (ref), v26 (copy), v16 (copy), v76 (copy), v69 (copy), v22 (copy), v25 (copy), v30 (copy), v46 (copy), l_BindableEvent_0 (copy), v39 (copy), v189 (copy)
    if v198 ~= v35 and v199 ~= v35 then
        return;
    else
        local v201 = if v26 and v16.getAppFeaturePolicies().getRenameFriendsToConnections() then v76(v69.ACCEPTED) else "New Friend";
        local v202 = v16.getAppFeaturePolicies().getRequiresOSAFriendingEducation();
        local l_v22_FriendCountAsync_0 = v22:GetFriendCountAsync(v35.UserId);
        local v204 = true;
        if l_v22_FriendCountAsync_0 ~= 0 then
            v204 = l_v22_FriendCountAsync_0 == nil;
        end;
        if v198 == v35 then
            if v200 == Enum.FriendRequestEvent.Accept and not v25() then
                local v205 = v30:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", {
                    RBX_NAME = v199.Name
                });
                local v206 = {
                    GroupName = "Friends", 
                    Title = v201, 
                    Text = v199.Name, 
                    DetailText = v205
                };
                local l_UserId_1 = v199.UserId;
                v206.Image = v46.GetPlayerImage(l_UserId_1, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
                v206.Duration = 5;
                v206.Duration = v206.Duration or 5;
                l_BindableEvent_0:Fire(v206);
                return;
            end;
        elseif v199 == v35 then
            if v200 == Enum.FriendRequestEvent.Issue and not v25() then
                if v39[v198] then
                    return;
                elseif v202 and v204 then
                    return;
                else
                    v189(v198);
                    return;
                end;
            elseif v200 == Enum.FriendRequestEvent.Accept then
                local v208 = v30:FormatByKey("InGame.NotificationScript2.FriendRequestEvent.Accept", {
                    RBX_NAME = v198.Name
                });
                local v209 = {
                    GroupName = "Friends", 
                    Title = v201, 
                    Text = v198.Name, 
                    DetailText = v208
                };
                local l_UserId_2 = v198.UserId;
                v209.Image = v46.GetPlayerImage(l_UserId_2, Enum.ThumbnailSize.Size48x48, Enum.ThumbnailType.HeadShot, 5);
                v209.Duration = 5;
                v209.Duration = v209.Duration or 5;
                l_BindableEvent_0:Fire(v209);
            end;
        end;
        return;
    end;
end;
local function v220(v212, v213, _, _) --[[ Line: 979 ]] --[[ Name: onPointsAwarded ]]
    -- upvalues: v44 (ref), v35 (ref), v30 (copy), l_BindableEvent_0 (copy)
    if v44 and v212 == v35.UserId then
        local v216 = nil;
        local v217 = nil;
        local _ = nil;
        if v213 == 1 then
            v216 = "Point Awarded";
            v217 = v30:FormatByKey("InGame.NotificationScript2.onPointsAwarded.single", {
                RBX_NUMBER = tostring(v213)
            });
        elseif v213 > 0 then
            v216 = "Points Awarded";
            v217 = v30:FormatByKey("InGame.NotificationScript2.onPointsAwarded.multiple", {
                RBX_NUMBER = tostring(v213)
            });
        elseif v213 < 0 then
            v216 = "Points Lost";
            v217 = v30:FormatByKey("InGame.NotificationScript2.onPointsAwarded.negative", {
                RBX_NUMBER = tostring(v213)
            });
        else
            return;
        end;
        local v219 = {
            GroupName = "PlayerPoints", 
            Title = v216, 
            Text = v217, 
            DetailText = v217, 
            Image = "https://www.roblox.com/asset?id=206410433", 
            Duration = 5
        };
        v219.Duration = v219.Duration or 5;
        l_BindableEvent_0:Fire(v219);
    end;
end;
local function v238(v221, v222, v223) --[[ Line: 1017 ]] --[[ Name: onBadgeAwarded ]]
    -- upvalues: v40 (copy), v45 (ref), v35 (ref), l_GroupService_0 (copy), l_Players_0 (copy), l_BadgeService_0 (copy), v28 (copy), v30 (copy), l_RbxAnalyticsService_0 (copy), l_BindableEvent_0 (copy)
    if not v40[v223] and v45 and v221 == v35.UserId then
        v40[v223] = true;
        local v224 = "";
        if game.CreatorType == Enum.CreatorType.Group then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 1022 ]]
                -- upvalues: l_GroupService_0 (ref), v222 (copy)
                return l_GroupService_0:GetGroupInfoAsync(v222);
            end);
            if not l_status_2 then
                v224 = "";
            end;
            if l_result_2 then
                v224 = l_result_2.Name;
            end;
        elseif game.CreatorType == Enum.CreatorType.User then
            local v227 = nil;
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 1034 ]]
                -- upvalues: l_Players_0 (ref), v222 (copy)
                return l_Players_0:GetNameFromUserIdAsync(v222);
            end);
            v227 = l_status_3;
            v224 = l_result_3;
            if not v227 then
                v224 = "";
            end;
        end;
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 1042 ]]
            -- upvalues: l_BadgeService_0 (ref), v223 (copy)
            return l_BadgeService_0:GetBadgeInfoAsync(v223);
        end);
        if not l_status_4 then
            return;
        else
            if v28 and v224 == nil then
                v224 = "";
            end;
            local v232 = v30:FormatByKey("InGame.NotificationScript2.onBadgeAwardedDetail", {
                RBX_NAME = v35.Name, 
                CREATOR_NAME = v224, 
                BADGE_NAME = l_result_4.DisplayName
            });
            local v233 = nil;
            local l_pcall_0 = pcall;
            local v235 = "InGame.NotificationScript2.onBadgeAwardedTitle";
            local v236;
            do
                local l_v233_0 = v233;
                l_pcall_0(function() --[[ Line: 59 ]]
                    -- upvalues: l_v233_0 (ref), v30 (ref), v235 (copy)
                    l_v233_0 = v30:FormatByKey(v235);
                end);
                v236 = l_v233_0;
            end;
            v233 = {
                GroupName = "BadgeAwards", 
                Title = v236, 
                Text = v232, 
                DetailText = v232, 
                Image = "https://www.roblox.com/asset?id=206410289", 
                Duration = 5, 
                OnDisplay = function() --[[ Line: 1067 ]] --[[ Name: OnDisplay ]]
                    -- upvalues: l_RbxAnalyticsService_0 (ref)
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-BadgeAwardNotificationDisplayed");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "BadgeAwardNotificationDisplayed", "NotificationScript");
                end, 
                OnDismiss = function() --[[ Line: 1071 ]] --[[ Name: OnDismiss ]]
                    -- upvalues: l_RbxAnalyticsService_0 (ref)
                    l_RbxAnalyticsService_0:ReportCounter("NotificationScript-BadgeAwardNotificationDismissed");
                    l_RbxAnalyticsService_0:TrackEvent("Game", "BadgeAwardNotificationDismissed", "NotificationScript");
                end
            };
            v233.Duration = v233.Duration or 5;
            l_BindableEvent_0:Fire(v233);
        end;
    end;
end;
onGameSettingsChanged = function(v239, v240) --[[ Line: 1079 ]] --[[ Name: onGameSettingsChanged ]]
    -- upvalues: l_GameSettings_0 (copy), l_Value_0 (ref), v30 (copy), l_BindableEvent_0 (copy)
    if v239 == "SavedQualityLevel" then
        local v241 = l_GameSettings_0.SavedQualityLevel.Value + v240;
        if v241 > 10 then
            v241 = 10;
        elseif v241 < 1 then
            v241 = 1;
        end;
        if v241 > 0 and v241 ~= l_Value_0 and l_GameSettings_0.SavedQualityLevel ~= Enum.SavedQualitySetting.Automatic then
            local v242 = ("%s to (%d)"):format(l_Value_0 < v241 and "Increased" or "Decreased", v241);
            v242 = if l_Value_0 < v241 then v30:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Increased", {
                RBX_NUMBER = tostring(v241)
            }) else v30:FormatByKey("InGame.NotificationScrip2.onCurrentGraphicsQualityLevelChanged.Decreased", {
                RBX_NUMBER = tostring(v241)
            });
            local v243 = {
                GroupName = "Graphics", 
                Title = "Graphics Quality", 
                Text = v242, 
                DetailText = v242, 
                Image = "", 
                Duration = 2
            };
            v243.Duration = v243.Duration or 5;
            l_BindableEvent_0:Fire(v243);
            l_Value_0 = v241;
        end;
    end;
end;
if not v48:IsSubjectToChinaPolicies() then
    l_BadgeService_0.OnBadgeAwarded:connect(v238);
end;
if not v43 then
    l_Players_0.FriendRequestEvent:connect(v211);
    l_PointsService_0.PointsAwarded:connect(v220);
    game.GraphicsQualityChangeRequest:Connect(function(_) --[[ Line: 1130 ]]
        onGameSettingsChanged("SavedQualityLevel", 0);
    end);
end;
if not v48:IsSubjectToChinaPolicies() then
    if not v27() then
        game.ScreenshotReady:Connect(function(_) --[[ Line: 1140 ]]
            -- upvalues: v30 (copy), l_BindableEvent_0 (copy)
            local v246 = v30:FormatByKey("InGame.NotificationScript2.Screenshot.Title");
            local v247 = v30:FormatByKey("InGame.NotificationScript2.Screenshot.Description");
            local v248 = v30:FormatByKey("InGame.NotificationScript2.Screenshot.ButtonText");
            local v250 = {
                Title = v246, 
                Text = v247, 
                Duration = 3, 
                Button1Text = v248, 
                Callback = function(v249) --[[ Line: 1150 ]] --[[ Name: Callback ]]
                    -- upvalues: v248 (copy)
                    if v249 == v248 then
                        game:OpenScreenshotsFolder();
                    end;
                end
            };
            v250.Duration = v250.Duration or 5;
            l_BindableEvent_0:Fire(v250);
        end);
    end;
    settings():GetService("GameSettings").VideoRecordingChangeRequest:Connect(function(v251) --[[ Line: 1160 ]]
        -- upvalues: v30 (copy), l_BindableEvent_0 (copy)
        if not v251 then
            local v252 = v30:FormatByKey("InGame.NotificationScript2.Video.Title");
            local v253 = v30:FormatByKey("InGame.NotificationScript2.Video.Description");
            local v254 = v30:FormatByKey("InGame.NotificationScript2.Video.ButtonText");
            local v256 = {
                Title = v252, 
                Text = v253, 
                Duration = 3, 
                Button1Text = v254, 
                Callback = function(v255) --[[ Line: 1171 ]] --[[ Name: Callback ]]
                    -- upvalues: v254 (copy)
                    if v255 == v254 then
                        game:OpenVideosFolder();
                    end;
                end
            };
            v256.Duration = v256.Duration or 5;
            l_BindableEvent_0:Fire(v256);
        end;
    end);
end;
l_GuiService_0.SendCoreUiNotification = function(v257, v258) --[[ Line: 1181 ]]
    -- upvalues: v134 (copy), l_Parent_0 (copy), l_game_EngineFeature_1 (copy), l_InOut_0 (copy), l_Sine_0 (copy)
    local v259 = v134(v257, v258, "");
    v259.BackgroundTransparency = 0.5;
    v259.Size = UDim2.new(0.5, 0, 0.1, 0);
    v259.Position = UDim2.new(0.25, 0, -0.1, 0);
    v259.NotificationTitle.FontSize = Enum.FontSize.Size36;
    v259.NotificationText.FontSize = Enum.FontSize.Size24;
    v259.Parent = l_Parent_0;
    if l_game_EngineFeature_1 then
        v259:TweenPositionInternal(UDim2.new(0.25, 0, 0, 0), l_InOut_0, l_Sine_0, 0.35, true);
    else
        v259:TweenPosition(UDim2.new(0.25, 0, 0, 0), l_InOut_0, l_Sine_0, 0.35, true);
    end;
    wait(5);
    if v259 then
        v259:Destroy();
    end;
end;
l_MarketplaceService_0.ClientLuaDialogRequested:connect(function(v260, v261, v262) --[[ Line: 1201 ]] --[[ Name: onClientLuaDialogRequested ]]
    -- upvalues: l_TextLabel_1 (copy), l_GuiService_0 (copy), l_l_Frame_3_0 (copy), v104 (copy), l_MarketplaceService_0 (copy), v105 (copy), l_Frame_3 (copy)
    l_TextLabel_1.Text = v260;
    local v263 = nil;
    local v264 = nil;
    local function _() --[[ Line: 1205 ]] --[[ Name: disconnectCns ]]
        -- upvalues: v263 (ref), v264 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref)
        if v263 then
            v263:disconnect();
        end;
        if v264 then
            v264:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
    end;
    v263 = v104.MouseButton1Click:connect(function() --[[ Line: 1217 ]]
        -- upvalues: v263 (ref), v264 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_MarketplaceService_0 (ref)
        if v263 then
            v263:disconnect();
        end;
        if v264 then
            v264:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(true);
    end);
    v264 = v105.MouseButton1Click:connect(function() --[[ Line: 1221 ]]
        -- upvalues: v263 (ref), v264 (ref), l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_MarketplaceService_0 (ref)
        if v263 then
            v263:disconnect();
        end;
        if v264 then
            v264:disconnect();
        end;
        l_GuiService_0:RemoveCenterDialog(l_l_Frame_3_0);
        l_l_Frame_3_0.Visible = false;
        l_MarketplaceService_0:SignalServerLuaDialogClosed(false);
    end);
    if not pcall(function() --[[ Line: 1226 ]]
        -- upvalues: l_GuiService_0 (ref), l_l_Frame_3_0 (ref), l_Frame_3 (ref), v104 (ref), v105 (ref), v261 (copy), v262 (copy)
        l_GuiService_0:AddCenterDialog(l_l_Frame_3_0, Enum.CenterDialogType.QuitDialog, function() --[[ Line: 1227 ]]
            -- upvalues: l_Frame_3 (ref), v104 (ref), v105 (ref), v261 (ref), v262 (ref), l_l_Frame_3_0 (ref)
            l_Frame_3.Visible = false;
            v104.Visible = true;
            v105.Visible = true;
            v104.Text = v261;
            v105.Text = v262;
            l_l_Frame_3_0.Visible = true;
        end, function() --[[ Line: 1234 ]]
            -- upvalues: l_l_Frame_3_0 (ref)
            l_l_Frame_3_0.Visible = false;
        end);
    end) then
        l_l_Frame_3_0.Visible = true;
        v104.Text = v261;
        v105.Text = v262;
    end;
    return true;
end);
local function v267() --[[ Line: 1249 ]] --[[ Name: onPreferredTransparencyChanged ]]
    -- upvalues: v49 (ref), l_GameSettings_0 (copy), v94 (copy), v37 (copy)
    v49 = 0.6 * l_GameSettings_0.PreferredTransparency;
    v94.BackgroundTransparency = v49;
    for v266 = 1, #v37 do
        v37[v266].Frame.BackgroundTransparency = v49;
    end;
end;
l_GameSettings_0:GetPropertyChangedSignal("PreferredTransparency"):connect(v267);
if v21 then
    local function v276() --[[ Line: 1260 ]] --[[ Name: onMenuTeleportAttemptNotification ]]
        -- upvalues: v30 (copy), v56 (copy), l_BindableEvent_0 (copy)
        local v268 = "Teleporting Paused";
        local l_pcall_1 = pcall;
        local v270 = "Feature.SettingsHub.Prompt.TeleportBlock.Title";
        local v271;
        do
            local l_v268_0 = v268;
            l_pcall_1(function() --[[ Line: 59 ]]
                -- upvalues: l_v268_0 (ref), v30 (ref), v270 (copy)
                l_v268_0 = v30:FormatByKey(v270);
            end);
            v271 = l_v268_0;
        end;
        l_pcall_1 = "Teleporting will resume upon menu close.";
        local l_pcall_2 = pcall;
        local v274 = "Feature.SettingsHub.Prompt.TeleportBlock.Subtitle";
        do
            local l_l_pcall_1_0 = l_pcall_1;
            l_pcall_2(function() --[[ Line: 59 ]]
                -- upvalues: l_l_pcall_1_0 (ref), v30 (ref), v274 (copy)
                l_l_pcall_1_0 = v30:FormatByKey(v274);
            end);
            v268 = l_l_pcall_1_0;
        end;
        l_pcall_1 = {
            GroupName = "Teleport", 
            Title = v271, 
            Text = v268, 
            Image = "http://www.roblox.com/asset/?id=10961494062", 
            Duration = 5, 
            BottomPadding = v56
        };
        l_pcall_1.Duration = l_pcall_1.Duration or 5;
        l_BindableEvent_0:Fire(l_pcall_1);
    end;
    local function _() --[[ Line: 1277 ]] --[[ Name: connectMenuTeleportAttemptEvent ]]
        -- upvalues: l_TeleportService_0 (copy), v276 (copy)
        l_TeleportService_0.MenuTeleportAttempt:Connect(function() --[[ Line: 1278 ]]
            -- upvalues: v276 (ref)
            v276();
        end);
    end;
    l_TeleportService_0.MenuTeleportAttempt:Connect(function() --[[ Line: 1278 ]]
        -- upvalues: v276 (copy)
        v276();
    end);
end;