local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v10 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_formatUsername_0 = v10.Formatters.formatUsername;
local v12 = require(l_CorePackages_0.Packages.Cryo);
local v13 = require(l_CorePackages_0.Packages.React);
local v14 = require(l_CorePackages_0.Packages.ReactRoblox);
local l_OpenTypeSupport_0 = require(l_CorePackages_0.Packages.UIBlox).Utility.OpenTypeSupport;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local v17 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Create_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Create;
local v19 = require(l_RobloxGui_0.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage);
local l_SocialUtil_0 = require(l_RobloxGui_0.Modules:WaitForChild("SocialUtil"));
local l_Diag_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local v23 = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local v25 = require(script:FindFirstAncestor("Settings").onBlockButtonActivated);
local v26 = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics);
local v27 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v28 = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics);
local v29 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local v30 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v31 = require(l_RobloxGui_0.Modules.Settings.Components.MenuButtons.MenuButtonsContainer);
local v32 = require(l_CorePackages_0.Packages.BuilderIcons);
local l_uiblox_0 = v32.Migration.uiblox;
local v34 = require(l_RobloxGui_0.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v35 = nil;
if v34() then
    v35 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalyticsManager;
end;
local v36 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = v36.GetFFlagLuaAppEnableOpenTypeSupport;
local l_FFlagIEMFocusNavToButtons_0 = v36.FFlagIEMFocusNavToButtons;
local v39 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons);
local v40 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local v41 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_UserProfileStore_0 = v10.Stores.UserProfileStore;
local _, l_result_0 = pcall(function() --[[ Line: 70 ]]
    return game:GetService("PlatformFriendsService");
end);
local v46 = require(script.Parent.Parent.Theme);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v48 = UDim2.new(0.5, -10, 0, 52);
local _ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 113 ]]
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v53 = l_status_1 and l_result_1;
local v54 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v55 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty);
local v56 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint);
local v57 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave);
local v58 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice);
local v59 = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false);
local v60 = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false);
local v61 = require(l_RobloxGui_0.Modules.Flags.isEngineTruncationEnabledForIngameSettings);
local l_game_EngineFeature_1 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled");
local v63 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true);
local v64 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local v65 = game:DefineFastFlag("CorrectlyPositionMuteButton", false);
local v66 = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false);
local v67 = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200);
local v68 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton);
local v69 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false);
local v70 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local l_MuteStatusIcons_0 = l_default_0.MuteStatusIcons;
local l_PlayerMuteStatusIcons_0 = l_default_0.PlayerMuteStatusIcons;
return ((function() --[[ Line: 150 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), l_uiblox_0 (copy), v32 (copy), l_LocalPlayer_0 (ref), v17 (copy), v29 (copy), v46 (copy), l_Constants_0 (copy), v55 (copy), v26 (copy), v67 (copy), v58 (copy), v68 (copy), v60 (copy), l_GuiService_0 (copy), v28 (copy), v25 (copy), v23 (copy), l_MuteStatusIcons_0 (copy), v63 (copy), l_game_EngineFeature_1 (copy), l_default_0 (copy), v27 (copy), l_Create_0 (copy), v39 (copy), v40 (copy), v56 (copy), l_PlayerMuteStatusIcons_0 (copy), v53 (copy), v19 (copy), v70 (copy), v48 (copy), v59 (copy), l_result_0 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v69 (copy), l_UserProfileStore_0 (copy), v61 (copy), v64 (copy), l_formatUsername_0 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), v34 (copy), v35 (ref), l_GameInviteAnalytics_0 (copy), l_EventStream_0 (copy), l_Diag_0 (copy), l_SocialUtil_0 (copy), v54 (copy), v30 (copy), v65 (copy), v12 (copy), v66 (copy), v57 (copy), v14 (copy), v13 (copy), v31 (copy), v41 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.PageListLayout.Padding = UDim.new(0, 16);
    l_NewPage_0.playSessionId = "";
    if l_game_EngineFeature_0 then
        l_NewPage_0.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v74 = {};
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if not v74[l_RobloxLocaleId_0] then
        v74[l_RobloxLocaleId_0] = l_Localization_0.new(l_RobloxLocaleId_0);
    end;
    l_NewPage_0.TabHeader.Name = "PlayersTab";
    local v76 = l_uiblox_0["icons/menu/friends"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v76.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v32.Font[v76.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "People";
    local function _(v77) --[[ Line: 176 ]] --[[ Name: getFriendStatus ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 177 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v77 (copy)
            return l_LocalPlayer_0:GetFriendStatus(v77);
        end);
        if l_status_2 then
            return l_result_2;
        else
            return Enum.FriendStatus.NotFriend;
        end;
    end;
    l_NewPage_0.Page.Name = "Players";
    local function _(v81) --[[ Line: 191 ]] --[[ Name: showRightSideButtons ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return v81 and v81 ~= l_LocalPlayer_0 and v81.UserId > 0 and l_LocalPlayer_0.UserId > 0;
    end;
    local function _() --[[ Line: 195 ]] --[[ Name: useOptimizedPortraitLayout ]]
        -- upvalues: v17 (ref)
        return v17:IsSmallTouchScreen() and v17:IsPortrait();
    end;
    local function _(v84) --[[ Line: 199 ]] --[[ Name: getIsBlocked ]]
        -- upvalues: v29 (ref)
        return v29:IsPlayerBlockedByUserId(v84.UserId);
    end;
    local function v95(v86, v87) --[[ Line: 203 ]] --[[ Name: createFriendStatusTextLabel ]]
        -- upvalues: v46 (ref), v74 (copy), l_RobloxLocaleId_0 (copy), l_Constants_0 (ref), v55 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), v17 (ref)
        if v86 == nil then
            return nil;
        else
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            local v89 = nil;
            local v90 = nil;
            if v86 == Enum.FriendStatus.Friend or v86 == Enum.FriendStatus.FriendRequestSent then
                v89 = Instance.new("TextButton");
                v89.BackgroundTransparency = 1;
                v89.FontSize = v46.fontSize(Enum.FontSize.Size24);
                v89.Font = v46.font(Enum.Font.SourceSans);
                v89.TextColor3 = Color3.new(1, 1, 1);
                v89.SelectionImageObject = l_Frame_0;
                if v86 == Enum.FriendStatus.Friend then
                    v89.Text = v74[l_RobloxLocaleId_0]:Format(l_Constants_0.ConnectionLocalizedKey);
                else
                    v89.Text = "Request Sent";
                end;
            elseif v86 == Enum.FriendStatus.Unknown or v86 == Enum.FriendStatus.NotFriend or v86 == Enum.FriendStatus.FriendRequestReceived then
                local function v91() --[[ Line: 230 ]]
                    -- upvalues: v89 (ref), v90 (ref), v55 (ref), v74 (ref), l_RobloxLocaleId_0 (ref), l_Constants_0 (ref), l_LocalPlayer_0 (ref), v87 (copy), l_RbxAnalyticsService_0 (ref)
                    if v89 and v90 and v90.Text ~= "" then
                        v89.ImageTransparency = 1;
                        v90.Text = "";
                        if v55() then
                            v90.Text = v74[l_RobloxLocaleId_0]:Format(l_Constants_0.AddConnectionLocalizedKey);
                        end;
                        if l_LocalPlayer_0 and v87 then
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                                category = "Game"
                            });
                            l_LocalPlayer_0:RequestFriendship(v87);
                        end;
                    end;
                end;
                local v92, v93 = v17:MakeStyledButton("FriendStatus", v74[l_RobloxLocaleId_0]:Format(l_Constants_0.AddConnectionLocalizedKey), UDim2.new(0, 182, 0, v46.ButtonHeight), v91);
                v89 = v92;
                v90 = v93;
                v90.ZIndex = 3;
                v90.Position = v90.Position + UDim2.new(0, 0, 0, 1);
            end;
            if v89 then
                v89.Name = "FriendStatus";
                v89.ZIndex = 3;
                local v94 = UDim2.new(0, 150, 0, v46.ButtonHeight);
                v89.Size = v94;
                v94 = UDim2.new(1, -198, 0, 7);
                v89.Position = v94;
                if v90 then
                    v94 = UDim2.new(0, 0, 0, 0);
                    v90.Position = v94;
                end;
            end;
            return v89;
        end;
    end;
    local function v107(v96, v97) --[[ Line: 274 ]] --[[ Name: createFriendStatusImageLabel ]]
        -- upvalues: v17 (ref), v46 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        if v96 == Enum.FriendStatus.Friend or v96 == Enum.FriendStatus.FriendRequestSent then
            local v98 = "icons/menu/friends";
            local v99 = 0;
            if v96 ~= Enum.FriendStatus.Friend then
                v98 = "icons/actions/friends/friendAdd";
                v99 = 0.5;
            end;
            local v100, _ = v17:MakeStyledImageButton("FriendStatus", v98, UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight), UDim2.new(0, 28, 0, 28));
            v100.Name = "FriendStatus";
            v100.Selectable = false;
            v100.FriendStatusTextLabel.TextTransparency = v99;
            return v100;
        elseif v96 == Enum.FriendStatus.Unknown or v96 == Enum.FriendStatus.NotFriend or v96 == Enum.FriendStatus.FriendRequestReceived then
            local v102 = nil;
            local v103 = nil;
            local function v104() --[[ Line: 300 ]]
                -- upvalues: v102 (ref), v103 (ref), l_LocalPlayer_0 (ref), v97 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
                if v102 and v103 and v102.ImageTransparency ~= 1 then
                    v102.ImageTransparency = 1;
                    v103.TextTransparency = 1;
                    if l_LocalPlayer_0 and v97 then
                        l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                            category = "Game"
                        });
                        l_LocalPlayer_0:RequestFriendship(v97);
                    end;
                end;
            end;
            local v105, v106 = v17:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight), UDim2.new(0, 28, 0, 28), v104);
            v102 = v105;
            v103 = v106;
            v102.Name = "FriendStatus";
            v102.Selectable = true;
            return v102;
        else
            return nil;
        end;
    end;
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = nil;
    local v112 = {};
    local v113 = v26.new(l_RbxAnalyticsService_0, "Players");
    local v114 = nil;
    local v115 = false;
    local v116 = nil;
    local v117 = {};
    local v118 = nil;
    local v119 = nil;
    v116 = function() --[[ Line: 345 ]]
        -- upvalues: l_NewPage_0 (copy), v67 (ref), v117 (ref)
        return l_NewPage_0.Page.AbsoluteSize.X < v67 * #v117;
    end;
    v114 = function() --[[ Line: 349 ]]
        -- upvalues: v117 (ref), v108 (ref), v109 (ref), v110 (ref), v58 (ref), v111 (ref), v115 (ref), v116 (ref), v118 (ref), v68 (ref), v119 (ref), v60 (ref)
        v117 = {};
        if v108 then
            table.insert(v117, v108);
        end;
        if v109 then
            table.insert(v117, v109);
        end;
        if v110 then
            table.insert(v117, v110);
        end;
        if v58() and v111 then
            table.insert(v117, v111);
        end;
        v115 = v116();
        if #v117 > 0 then
            local v120 = UDim2.new(1 / #v117, 0, 0, 52);
            local v121 = {
                Size = UDim2.new(1, (#v117 - 1) * -20, 0, 52), 
                AutomaticSize = Enum.AutomaticSize.None
            };
            local v122 = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            };
            if v115 then
                v120 = UDim2.new(1, 0, 0, 52);
                v121 = {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                v122 = {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 16)
                };
            end;
            local v123 = 1;
            for _, v125 in v117 do
                v125.Size = v120;
                v125.Parent = v118;
                v125.LayoutOrder = v123;
                v123 = v123 + 1;
            end;
            for v126, v127 in v122 do
                if v68() then
                    if v119 then
                        v119[v126] = v127;
                    end;
                else
                    v119[v126] = v127;
                end;
            end;
            for v128, v129 in v121 do
                if v68() then
                    if v118 then
                        v118[v128] = v129;
                    end;
                else
                    v118[v128] = v129;
                end;
            end;
            return;
        else
            if v60 then
                if v118 then
                    v118:Destroy();
                    v118 = nil;
                    return;
                end;
            else
                v118:Destroy();
                v118 = nil;
            end;
            return;
        end;
    end;
    local function _(v130) --[[ Line: 440 ]] --[[ Name: getDisplayNameLabel ]]
        if v130 and v130.Parent then
            return v130:FindFirstChild("DisplayNameLabel");
        else
            return nil;
        end;
    end;
    local function _(v132) --[[ Line: 447 ]] --[[ Name: getInExperienceCombinedName ]]
        if #v132 == 0 then
            return "";
        else
            local v133 = v132[1];
            if v133 == nil then
                return "";
            else
                local l_names_0 = v133.names;
                if l_names_0 == nil then
                    return "";
                else
                    return l_names_0.getInExperienceCombinedName(false);
                end;
            end;
        end;
    end;
    local function v145(v136, v137, v138, v139) --[[ Line: 462 ]] --[[ Name: resizeFriendButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v29 (ref), v107 (copy), v95 (copy), v17 (ref)
        local l_FriendStatus_0 = v136:FindFirstChild("FriendStatus");
        if l_FriendStatus_0 and v138 == v139 then
            return;
        else
            if l_FriendStatus_0 then
                l_FriendStatus_0:Destroy();
                l_FriendStatus_0 = nil;
            end;
            local v141 = nil;
            if v137 and v137 ~= l_LocalPlayer_0 and v137.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local l_status_3, l_result_3 = pcall(function() --[[ Line: 177 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v137 (copy)
                    return l_LocalPlayer_0:GetFriendStatus(v137);
                end);
                v141 = if l_status_3 then l_result_3 else Enum.FriendStatus.NotFriend;
            end;
            if v29:IsPlayerBlockedByUserId(v137.UserId) == false then
                l_FriendStatus_0 = if v138 then v107(v141, v137) else v95(v141, v137);
            end;
            if l_FriendStatus_0 then
                l_FriendStatus_0.Name = "FriendStatus";
                l_FriendStatus_0.LayoutOrder = 5;
                l_FriendStatus_0.Selectable = true;
                local v144 = "utility-focus-state" .. "-friendstatuslabel-" .. v137.Name;
                v17:MakeFocusState(l_FriendStatus_0, v144);
                l_FriendStatus_0.Parent = v136;
            end;
            return;
        end;
    end;
    local function v151(v146, v147) --[[ Line: 496 ]] --[[ Name: friendStatusCreate ]]
        -- upvalues: l_GuiService_0 (ref), v108 (ref), v145 (copy), v17 (ref)
        local v148 = nil;
        if v146 then
            v148 = v146:FindFirstChild("RightSideButtons");
        end;
        if v148 then
            for _, v150 in pairs(v148:GetChildren()) do
                if v150 and v150.Name == "FriendStatus" then
                    if l_GuiService_0.SelectedCoreObject == v150 then
                        l_GuiService_0.SelectedCoreObject = v108;
                    end;
                    v150:Destroy();
                end;
            end;
            v145(v148, v147, v17:IsPortrait(), nil);
        end;
    end;
    l_LocalPlayer_0.FriendStatusChanged:connect(function(v152, _) --[[ Line: 518 ]]
        -- upvalues: l_NewPage_0 (copy), v151 (copy)
        if v152 then
            local l_FirstChild_0 = l_NewPage_0.Page:FindFirstChild("PlayerLabel" .. v152.Name);
            if l_FirstChild_0 then
                v151(l_FirstChild_0, v152);
            end;
        end;
    end);
    local v155 = nil;
    local v156 = nil;
    local v157 = v28.new(l_LocalPlayer_0.UserId, {
        EventStream = l_RbxAnalyticsService_0
    });
    local function v172(v158, v159, v160, _) --[[ Line: 531 ]] --[[ Name: createBlockButton ]]
        -- upvalues: v29 (ref), v155 (ref), v145 (copy), v156 (ref), l_GuiService_0 (ref), v25 (ref), v157 (copy), l_Constants_0 (ref), v17 (ref), v23 (ref), v46 (ref)
        local v162 = v29:IsPlayerBlockedByUserId(v159.UserId);
        local function _(v163) --[[ Line: 534 ]] --[[ Name: updateBlockButton ]]
            -- upvalues: v155 (ref), v158 (copy), v159 (copy), v160 (copy), v145 (ref), v156 (ref)
            local v164 = v155(v158, v159, v160, not v160);
            v145(v158, v159, v160, not v160);
            if v163 then
                v156(v164);
            end;
        end;
        local function v169() --[[ Line: 542 ]] --[[ Name: blockUser ]]
            -- upvalues: l_GuiService_0 (ref), v25 (ref), v159 (copy), v157 (ref), l_Constants_0 (ref), v155 (ref), v158 (copy), v160 (copy), v145 (ref), v156 (ref)
            local v166 = true;
            if l_GuiService_0.SelectedCoreObject == nil then
                v166 = l_GuiService_0.SelectedObject ~= nil;
            end;
            v25(v159, v157, l_Constants_0.AnalyticsInGameMenuName):andThen(function() --[[ Line: 544 ]]
                -- upvalues: v166 (copy), v155 (ref), v158 (ref), v159 (ref), v160 (ref), v145 (ref), v156 (ref)
                local l_v166_0 = v166;
                local v168 = v155(v158, v159, v160, not v160);
                v145(v158, v159, v160, not v160);
                if l_v166_0 then
                    v156(v168);
                end;
            end);
        end;
        local function v171() --[[ Line: 549 ]] --[[ Name: unBlockUser ]]
            -- upvalues: v29 (ref), v159 (copy), v157 (ref), v155 (ref), v158 (copy), v160 (copy), v145 (ref)
            if v29:UnblockPlayerAsync(v159) then
                v157:action("SettingsHub", "unblockUser", {
                    blockeeUserId = v159.UserId
                });
                local _ = v155(v158, v159, v160, not v160);
                v145(v158, v159, v160, not v160);
            end;
        end;
        if v162 then
            return v17:MakeStyledButton("BlockButton", v23:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, v46.ButtonHeight), v171);
        else
            return v17:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight), UDim2.new(0, 28, 0, 28), v169);
        end;
    end;
    v156 = function(v173) --[[ Line: 578 ]] --[[ Name: trySelection ]]
        -- upvalues: l_GuiService_0 (ref)
        if v173 and not v173.Selectable then
            l_GuiService_0:Select(v173);
            return;
        else
            l_GuiService_0.SelectedCoreObject = v173;
            return;
        end;
    end;
    v155 = function(v174, v175, v176, v177) --[[ Line: 586 ]] --[[ Name: resizeBlockButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v172 (copy), v17 (ref)
        local l_BlockButton_0 = v174:FindFirstChild("BlockButton");
        if l_BlockButton_0 and v176 == v177 then
            return l_BlockButton_0;
        else
            if l_BlockButton_0 then
                l_BlockButton_0:Destroy();
                l_BlockButton_0 = nil;
            end;
            if v175 and v175 ~= l_LocalPlayer_0 and v175.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                l_BlockButton_0 = v172(v174, v175, v176, v177);
            end;
            if l_BlockButton_0 then
                l_BlockButton_0.Name = "BlockButton";
                l_BlockButton_0.LayoutOrder = 4;
                l_BlockButton_0.Selectable = true;
                local v179 = "utility-focus-state" .. "-blockbutton-" .. v175.Name;
                v17:MakeFocusState(l_BlockButton_0, v179);
                l_BlockButton_0.Parent = v174;
            end;
            return l_BlockButton_0;
        end;
    end;
    local v180 = false;
    local v181 = false;
    local function v196(v182, v183) --[[ Line: 615 ]] --[[ Name: muteButtonUpdate ]]
        -- upvalues: l_MuteStatusIcons_0 (ref), v63 (ref), l_game_EngineFeature_1 (ref), l_default_0 (ref), v112 (copy), v17 (ref), v46 (ref), v113 (copy), v27 (ref)
        local v184 = nil;
        if v182 then
            v184 = v182:FindFirstChild("RightSideButtons");
        end;
        if not v184 then
            return;
        else
            local l_MuteStatusButton_0 = v184:FindFirstChild("MuteStatusButton");
            if v183 == nil then
                if l_MuteStatusButton_0 then
                    l_MuteStatusButton_0:Destroy();
                end;
                return;
            else
                local v186 = UDim2.fromOffset(36, 36);
                local v187 = UDim2.fromOffset(0, 0);
                local v188 = 0;
                local v189 = v183.isMuted and l_MuteStatusIcons_0.MicOff or l_MuteStatusIcons_0.MicOn;
                if v183.subscriptionFailed then
                    v189 = l_MuteStatusIcons_0.Error;
                    v186 = UDim2.fromOffset(36, 36);
                    v187 = UDim2.fromOffset(2, -2);
                    if v63 and l_game_EngineFeature_1 then
                        v188 = 0.5;
                    end;
                elseif v183.isMutedLocally then
                    v189 = l_MuteStatusIcons_0.MicDisabled;
                    v188 = 0.5;
                elseif not v183.subscriptionCompleted then
                    v189 = l_MuteStatusIcons_0.Loading;
                elseif v183.isSignalActive then
                    local v190 = math.floor(0.5 + 5 * math.random()) * 20;
                    v189 = l_default_0:GetIcon("Unmuted" .. tostring(v190), "SpeakerLight");
                end;
                if l_MuteStatusButton_0 then
                    local v191 = v112[v183.userId] or v184:FindFirstChild("MuteStatusImageLabel", true);
                    v191.Image = v189;
                    v191.Size = v186;
                    v191.ImageTransparency = v188;
                    return;
                else
                    if l_default_0.voiceUIVisible then
                        local v193, v194 = v17:MakeStyledImageButton("MuteStatus", v189, UDim2.fromOffset(v46.ButtonHeight, v46.ButtonHeight), v186, function() --[[ Line: 675 ]]
                            -- upvalues: l_default_0 (ref), v183 (copy), v113 (ref), v27 (ref), v63 (ref), l_game_EngineFeature_1 (ref)
                            local v192 = l_default_0.participants[tostring(v183.userId)];
                            if v192.subscriptionCompleted then
                                if v113 then
                                    v113:onToggleMutePlayer(v183.userId, not v192.isMutedLocally);
                                end;
                                l_default_0:ToggleMutePlayer(v183.userId, v27.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                                return;
                            else
                                if v192.subscriptionFailed then
                                    if v63 then
                                        if not l_game_EngineFeature_1 then
                                            l_default_0:SubscribeRetry(v183.userId);
                                            return;
                                        end;
                                    else
                                        l_default_0:SubscribeRetry(v183.userId);
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v112[v183.userId] = v194;
                        v194.ZIndex = 3;
                        v194.Position = v194.Position + v187;
                        v194.ImageTransparency = v188;
                        local v195 = "utility-focus-state" .. "-mutestatusbutton-" .. v183.userId;
                        v17:MakeFocusState(v193, v195);
                        v193.Parent = v184;
                    end;
                    return;
                end;
            end;
        end;
    end;
    local v197 = l_Create_0("Frame")({
        Name = "ButtonsContainer", 
        Size = UDim2.new(1, 0, 0, v46.ButtonHeight), 
        BackgroundTransparency = 1, 
        Parent = l_NewPage_0.Page, 
        Visible = false
    });
    l_NewPage_0.ButtonsContainer = v197;
    if v39 and (v40 == 1 or v40 == 3) then
        v197.Parent = nil;
    end;
    l_Create_0("UIPadding")({
        PaddingBottom = UDim.new(0, 1), 
        PaddingTop = UDim.new(0, 1), 
        PaddingLeft = UDim.new(0, 1), 
        PaddingRight = UDim.new(0, 1), 
        Parent = v197
    });
    local function v198() --[[ Line: 732 ]]
        -- upvalues: v56 (ref), l_NewPage_0 (copy), v27 (ref)
        if v56() and l_NewPage_0.HubRef.leaveGameUpsellProp ~= v27.PHONE_UPSELL_VALUE_PROP.None then
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGameUpsellPage, nil, 1, true);
            return;
        else
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGamePage, false, 1);
            return;
        end;
    end;
    local v199, v200 = v17:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -12, 1, 0), v198);
    v199.AnchorPoint = Vector2.new(0, 0);
    v199.Position = UDim2.new(0, 0, 0, 0);
    v200.Size = UDim2.new(1, -4, 1, 0);
    v200.Position = UDim2.new(0, 2, 0, 0);
    l_Create_0("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Parent = v199
    });
    l_Create_0("UIPadding")({
        PaddingLeft = UDim.new(0.025, 0), 
        Parent = v199
    });
    v200.Size = UDim2.new(0, 0, 1, 0);
    l_Create_0("UIFlexItem")({
        FlexMode = Enum.UIFlexMode.Grow, 
        Parent = v200
    });
    if not v39 or v40 == 0 then
        v199.Parent = v197;
    end;
    local function v201() --[[ Line: 775 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.ResetCharacterPage, false, 1);
    end;
    local v202 = v74[l_RobloxLocaleId_0]:Format(l_Constants_0.RespawnLocalizedKey);
    local v203, v204 = v17:MakeStyledButton("ResetButton", v202, UDim2.new(0.3333333333333333, -12, 1, 0), v201);
    v203.AnchorPoint = Vector2.new(0.5, 0);
    v203.Position = UDim2.new(0.5, 0, 0, 0);
    v204.Size = UDim2.new(1, -4, 1, 0);
    v204.Position = UDim2.new(0, 2, 0, 0);
    if not v39 or v40 == 0 then
        v203.Parent = v197;
    end;
    local function v205() --[[ Line: 792 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        l_NewPage_0.HubRef:SetVisibility(false);
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
            source = l_Constants_0.AnalyticsResumeButtonSource, 
            playsessionid = l_NewPage_0.playSessionId, 
            universeid = tostring(game.GameId)
        });
    end;
    local v206, v207 = v17:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -12, 1, 0), v205);
    v206.AnchorPoint = Vector2.new(1, 0);
    v206.Position = UDim2.new(1, 0, 0, 0);
    v207.Size = UDim2.new(1, -4, 1, 0);
    v207.Position = UDim2.new(0, 2, 0, 0);
    if not v39 or v40 == 0 then
        v206.Parent = v197;
    end;
    local function v211() --[[ Line: 819 ]] --[[ Name: pollImage ]]
        -- upvalues: l_default_0 (ref), l_PlayerMuteStatusIcons_0 (ref)
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            return l_PlayerMuteStatusIcons_0.Loading;
        elseif l_localMuted_0 then
            return l_PlayerMuteStatusIcons_0.MicOff;
        elseif l_default_0.isTalking then
            local v210 = math.floor(0.5 + 5 * math.random()) * 20;
            return (l_default_0:GetIcon("Unmuted" .. tostring(v210), "MicLight"));
        else
            return l_PlayerMuteStatusIcons_0.MicOn;
        end;
    end;
    local function _(v212, v213, v214, v215) --[[ Line: 836 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v197 (copy)
        local l_v197_FirstChild_0 = v197:FindFirstChild(v212 .. "Button", true);
        if not l_v197_FirstChild_0 then
            return;
        else
            l_v197_FirstChild_0.Position = v213;
            l_v197_FirstChild_0.Size = v214;
            l_v197_FirstChild_0.AnchorPoint = v215;
            return;
        end;
    end;
    local function _() --[[ Line: 848 ]] --[[ Name: muteButtonReset ]]
        -- upvalues: v197 (copy)
        local l_v197_FirstChild_1 = v197:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v197_FirstChild_1 then
            l_v197_FirstChild_1:Destroy();
        end;
    end;
    local function v225() --[[ Line: 855 ]] --[[ Name: resetButtonRow ]]
        -- upvalues: v39 (ref), v40 (ref), v197 (copy)
        if not v39 or v40 == 0 then
            local v220 = UDim2.new(1, 0, 0, 0);
            local v221 = UDim2.new(0.3333333333333333, -12, 1, 0);
            local v222 = Vector2.new(1, 0);
            local l_v197_FirstChild_2 = v197:FindFirstChild("ResumeButtonButton", true);
            if l_v197_FirstChild_2 then
                l_v197_FirstChild_2.Position = v220;
                l_v197_FirstChild_2.Size = v221;
                l_v197_FirstChild_2.AnchorPoint = v222;
            end;
            v220 = UDim2.new(0.5, 0, 0, 0);
            v221 = UDim2.new(0.3333333333333333, -12, 1, 0);
            v222 = Vector2.new(0.5, 0);
            l_v197_FirstChild_2 = v197:FindFirstChild("ResetButtonButton", true);
            if l_v197_FirstChild_2 then
                l_v197_FirstChild_2.Position = v220;
                l_v197_FirstChild_2.Size = v221;
                l_v197_FirstChild_2.AnchorPoint = v222;
            end;
            v220 = UDim2.new(0, 0, 0, 0);
            v221 = UDim2.new(0.3333333333333333, -12, 1, 0);
            v222 = Vector2.new(0, 0);
            l_v197_FirstChild_2 = v197:FindFirstChild("LeaveButtonButton", true);
            if l_v197_FirstChild_2 then
                l_v197_FirstChild_2.Position = v220;
                l_v197_FirstChild_2.Size = v221;
                l_v197_FirstChild_2.AnchorPoint = v222;
            end;
        end;
        local l_v197_FirstChild_3 = v197:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v197_FirstChild_3 then
            l_v197_FirstChild_3:Destroy();
        end;
    end;
    local function _() --[[ Line: 879 ]] --[[ Name: updateMuteSelfButtonIcon ]]
        -- upvalues: v68 (ref), v118 (ref), v211 (copy)
        local v226 = nil;
        if v68() then
            if v118 then
                v226 = v118:FindFirstChild("MuteSelfButtonImageLabel", true);
            end;
        else
            v226 = v118:FindFirstChild("MuteSelfButtonImageLabel", true);
        end;
        if not v226 then
            return;
        else
            v226.Image = v211();
            return;
        end;
    end;
    v17:OnResized(v197, function(_, v229) --[[ Line: 896 ]]
        -- upvalues: v17 (ref), v46 (ref), v197 (copy), v39 (ref), v40 (ref), v204 (copy), v200 (copy), v207 (copy)
        if (v229 or v17:IsSmallTouchScreen()) and not v46.AlwaysShowBottomBar() then
            local v230 = v229 and v46.textSize(18) or v46.textSize(24);
            if v46.UseBiggerText then
                v230 = v46.textSize(20);
            end;
            v197.Visible = not v46.EnableVerticalBottomBar;
            v197.Size = UDim2.new(1, 0, 0, v46.ButtonHeight);
            if not v39 or v40 == 0 then
                v204.TextSize = v230;
                v200.TextSize = v230;
                v207.TextSize = v230;
                return;
            end;
        else
            v197.Visible = false;
            v197.Size = UDim2.new(1, 0, 0, 0);
        end;
    end);
    if v53 then
        local function v232(v231) --[[ Line: 916 ]] --[[ Name: ApplyLocalizeTextSettingsToLabel ]]
            v231.AnchorPoint = Vector2.new(0.5, 0.5);
            v231.Position = UDim2.new(0.5, 0, 0.5, -3);
            v231.Size = UDim2.new(0.75, 0, 0.5, 0);
        end;
        if not v39 or v40 == 0 then
            v232(v200);
            v232(v204);
            v232(v204);
        end;
    end;
    local function v240(v233, v234) --[[ Line: 928 ]] --[[ Name: reportAbuseButtonCreate ]]
        -- upvalues: l_LocalPlayer_0 (ref), v19 (ref), v17 (ref), v46 (ref)
        local l_RightSideButtons_0 = v233:FindFirstChild("RightSideButtons");
        if l_RightSideButtons_0 then
            local l_ReportPlayer_0 = l_RightSideButtons_0:FindFirstChild("ReportPlayer");
            if l_ReportPlayer_0 then
                l_ReportPlayer_0:Destroy();
            end;
            if v234 and v234 ~= l_LocalPlayer_0 and v234.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local function v237() --[[ Line: 937 ]]
                    -- upvalues: v19 (ref), v234 (copy)
                    v19:ReportPlayer(v234, "MenuPlayerList");
                end;
                local v238 = v17:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight), UDim2.new(0, 28, 0, 28), v237);
                v238.Name = "ReportPlayer";
                v238.Position = UDim2.new(1, -260, 0, 7);
                v238.LayoutOrder = 3;
                v238.Selectable = true;
                local v239 = "utility-focus-state" .. "-reportplayer-" .. v234.Name;
                v17:MakeFocusState(v238, v239);
                v238.Parent = l_RightSideButtons_0;
            end;
        end;
    end;
    local v241 = nil;
    local v242 = nil;
    local v243 = nil;
    local v244 = nil;
    local v245 = nil;
    local v246 = false;
    local v247 = nil;
    local function _() --[[ Line: 968 ]] --[[ Name: muteAllButtonRemove ]]
        -- upvalues: v109 (ref), v114 (ref)
        if v109 then
            v109.Visible = false;
            v109:Destroy();
            v109 = nil;
        end;
        v114();
    end;
    local function _() --[[ Line: 977 ]] --[[ Name: muteSelfButtonRemove ]]
        -- upvalues: v110 (ref), v247 (ref), v114 (ref)
        if v110 then
            v110.Visible = false;
            v110:Destroy();
            v110 = nil;
        end;
        if v247 then
            v247:Disconnect();
            v247 = nil;
        end;
        v114();
    end;
    local function _() --[[ Line: 990 ]] --[[ Name: joinVoiceButtonRemove ]]
        -- upvalues: v111 (ref), v114 (ref)
        if v111 then
            v111.Visible = false;
            v111:Destroy();
            v111 = nil;
        end;
        v114();
    end;
    local function v251() --[[ Line: 999 ]] --[[ Name: shouldShowJoinVoiceButton ]]
        -- upvalues: v58 (ref), v246 (ref), v70 (ref), l_default_0 (ref)
        return v58() and game:GetEngineFeature("VoiceChatSupported") and not v246 and not v70 and l_default_0:verifyUniverseAndPlaceCanUseVoice() and l_default_0:ShouldShowJoinVoiceOnDisconnect() and l_default_0:GetVoiceConnectCookie() == "" and l_default_0:HasSeamlessVoiceFeature("InitialJoinVoice");
    end;
    local function v259(v252, v253, v254) --[[ Line: 1010 ]] --[[ Name: createRow ]]
        -- upvalues: v46 (ref), l_Create_0 (ref)
        local v255 = Instance.new(v252);
        v255.Size = UDim2.new(1, 0, 0, 62);
        v255.Position = UDim2.new(0, 0, 0, 0);
        v255.ZIndex = 2;
        v255.BackgroundColor3 = v46.color("PlayerRowFrame");
        v255.BackgroundTransparency = v46.transparency("PlayerRowFrame");
        l_Create_0("UICorner")({
            CornerRadius = v46.DefaultCornerRadius, 
            Parent = v255
        });
        local v256 = nil;
        if v254 then
            v256 = Instance.new("TextLabel");
            v256.TextColor3 = Color3.new(1, 1, 1);
            v256.TextSize = 24;
        else
            v256 = Instance.new("ImageLabel");
        end;
        v256.Name = "Icon";
        v256.BackgroundTransparency = 1;
        v256.Size = UDim2.new(0, 36, 0, 36);
        v256.Position = UDim2.new(0, 12, 0, 12);
        v256.ZIndex = 3;
        v256.Parent = v255;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        l_TextLabel_0.Font = v46.font(Enum.Font.SourceSans, "DisplayName");
        l_TextLabel_0.FontSize = v253 and v46.fontSize(Enum.FontSize.Size36, "DisplayName") or v46.fontSize(Enum.FontSize.Size24, "DisplayName");
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.Position = v253 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0);
        l_TextLabel_0.Size = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.ZIndex = 3;
        l_TextLabel_0.Parent = v255;
        if v253 then
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Text = "";
            l_TextLabel_1.Name = "SecondRow";
            l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
            l_TextLabel_1.Font = v46.font(Enum.Font.SourceSans);
            l_TextLabel_1.FontSize = v46.fontSize(Enum.FontSize.Size24, "Username");
            l_TextLabel_1.TextColor3 = Color3.fromRGB(162, 162, 162);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.Position = UDim2.new(0, 60, 0.5, 12);
            l_TextLabel_1.Size = UDim2.new(0, 0, 0, 0);
            l_TextLabel_1.ZIndex = 3;
            l_TextLabel_1.Parent = v255;
        end;
        return v255;
    end;
    v241 = function() --[[ Line: 1069 ]]
        -- upvalues: v259 (copy), v246 (ref), v58 (ref), v251 (copy), v48 (ref), v46 (ref), v74 (copy), l_RobloxLocaleId_0 (copy), l_Constants_0 (ref), l_uiblox_0 (ref), v32 (ref), v17 (ref)
        local v260 = v259("ImageButton", nil, true);
        v260.Size = UDim2.new(1, 0, 0, 52);
        local l_TextLabel_2 = v260.TextLabel;
        local l_Icon_0 = v260.Icon;
        if v246 or v58() and v251() then
            v260.Size = v48;
            l_TextLabel_2.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd;
            v260.AnchorPoint = Vector2.new(0, 0);
        end;
        l_TextLabel_2.Font = v46.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_2.AutoLocalize = false;
        l_TextLabel_2.Text = v74[l_RobloxLocaleId_0]:Format(l_Constants_0.InviteConnectionsLocalizedKey);
        l_Icon_0.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_0.Position = UDim2.new(0, 18, 0.5, 0);
        local v263 = l_uiblox_0["icons/actions/friends/friendInvite"];
        local v264 = if v263 then l_uiblox_0["icons/actions/friends/friendInvite"] else v46.Images["icons/actions/friends/friendInvite"];
        if v264 then
            if v263 then
                l_Icon_0.Text = v264.name;
                l_Icon_0.FontFace = v32.Font[v264.variant];
            else
                l_Icon_0.Image = v264.Image;
                l_Icon_0.ImageRectOffset = v264.ImageRectOffset;
                l_Icon_0.ImageRectSize = v264.ImageRectSize;
            end;
        end;
        local function _(v265) --[[ Line: 1103 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v260 (copy)
            if v265 then
                v260.ImageTransparency = 0.65;
                return;
            else
                v260.ImageTransparency = 0.85;
                return;
            end;
        end;
        v260.InputBegan:Connect(function() --[[ Line: 1111 ]]
            -- upvalues: v260 (copy)
            v260.ImageTransparency = 0.65;
        end);
        v260.InputEnded:Connect(function() --[[ Line: 1114 ]]
            -- upvalues: v260 (copy)
            v260.ImageTransparency = 0.85;
        end);
        v260.Activated:Connect(function() --[[ Line: 1117 ]]
            -- upvalues: v260 (copy)
            v260.ImageTransparency = 0.85;
        end);
        v260.TouchPan:Connect(function(_, v268) --[[ Line: 1120 ]]
            -- upvalues: v260 (copy)
            if math.abs(v268.Y) > 20 then
                v260.ImageTransparency = 0.85;
            end;
        end);
        v260.SelectionGained:connect(function() --[[ Line: 1126 ]]
            -- upvalues: v260 (copy)
            v260.ImageTransparency = 0.65;
        end);
        v260.SelectionLost:connect(function() --[[ Line: 1129 ]]
            -- upvalues: v260 (copy)
            v260.ImageTransparency = 0.85;
        end);
        v260.SelectionImageObject = v260:Clone();
        v17:MakeFocusState(v260, "utility-focus-state-sharegame");
        return v260;
    end;
    v242 = function() --[[ Line: 1140 ]]
        -- upvalues: v259 (copy), v108 (ref), v46 (ref), v23 (ref), l_default_0 (ref), v17 (ref)
        local v269 = v259("ImageButton");
        v269.Size = UDim2.new(v108 and 0.5 or 1, -10, 0, 52);
        v269.Position = UDim2.new(1, 0, 0, 0);
        v269.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_3 = v269.TextLabel;
        local l_Icon_1 = v269.Icon;
        l_TextLabel_3.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_3.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_3.Font = v46.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_3.AutoLocalize = false;
        l_TextLabel_3.Text = v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
        l_Icon_1.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_1.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_1.Image = l_default_0:GetIcon("UnmuteAll", "Misc");
        l_Icon_1.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_1.Position = UDim2.new(0, 18, 0.5, 0);
        local function _(v272) --[[ Line: 1160 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v269 (copy)
            if v272 then
                v269.ImageTransparency = 0.65;
                return;
            else
                v269.ImageTransparency = 0.85;
                return;
            end;
        end;
        v269.InputBegan:Connect(function() --[[ Line: 1168 ]]
            -- upvalues: v269 (copy)
            v269.ImageTransparency = 0.65;
        end);
        v269.InputEnded:Connect(function() --[[ Line: 1171 ]]
            -- upvalues: v269 (copy)
            v269.ImageTransparency = 0.85;
        end);
        v269.Activated:Connect(function() --[[ Line: 1174 ]]
            -- upvalues: v269 (copy)
            v269.ImageTransparency = 0.85;
        end);
        v269.TouchPan:Connect(function(_, v275) --[[ Line: 1177 ]]
            -- upvalues: v269 (copy)
            if math.abs(v275.Y) > 20 then
                v269.ImageTransparency = 0.85;
            end;
        end);
        v269.SelectionGained:connect(function() --[[ Line: 1183 ]]
            -- upvalues: v269 (copy)
            v269.ImageTransparency = 0.65;
        end);
        v269.SelectionLost:connect(function() --[[ Line: 1186 ]]
            -- upvalues: v269 (copy)
            v269.ImageTransparency = 0.85;
        end);
        v269.SelectionImageObject = v269:Clone();
        v17:MakeFocusState(v269, "utility-focus-state-muteall");
        return v269;
    end;
    v243 = function() --[[ Line: 1197 ]]
        -- upvalues: v259 (copy), v46 (ref), v211 (copy), v17 (ref), v74 (copy), l_RobloxLocaleId_0 (copy), l_default_0 (ref), v247 (ref), v180 (ref), v68 (ref), v118 (ref), v113 (copy), v110 (ref)
        local v276 = v259("ImageButton");
        v276.Name = "MuteSelfButton";
        v276.Size = UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight);
        v276.Position = UDim2.new(1, 0, 0, 0);
        v276.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_4 = v276.TextLabel;
        local l_Icon_2 = v276.Icon;
        l_TextLabel_4.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_4.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_4.Font = v46.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_4.AutoLocalize = false;
        l_Icon_2.Name = "MuteSelfButtonImageLabel";
        l_Icon_2.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_2.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_2.Image = v211();
        l_Icon_2.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_2.Position = UDim2.new(0, 18, 0.5, 0);
        local function _(v279) --[[ Line: 1218 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v276 (copy)
            if v279 then
                v276.ImageTransparency = 0.65;
                return;
            else
                v276.ImageTransparency = 0.85;
                return;
            end;
        end;
        v276.InputBegan:Connect(function() --[[ Line: 1226 ]]
            -- upvalues: v276 (copy)
            v276.ImageTransparency = 0.65;
        end);
        v276.InputEnded:Connect(function() --[[ Line: 1229 ]]
            -- upvalues: v276 (copy)
            v276.ImageTransparency = 0.85;
        end);
        v276.Activated:Connect(function() --[[ Line: 1232 ]]
            -- upvalues: v276 (copy)
            v276.ImageTransparency = 0.85;
        end);
        v276.TouchPan:Connect(function(_, v282) --[[ Line: 1235 ]]
            -- upvalues: v276 (copy)
            if math.abs(v282.Y) > 20 then
                v276.ImageTransparency = 0.85;
            end;
        end);
        v276.SelectionGained:connect(function() --[[ Line: 1241 ]]
            -- upvalues: v276 (copy)
            v276.ImageTransparency = 0.65;
        end);
        v276.SelectionLost:connect(function() --[[ Line: 1244 ]]
            -- upvalues: v276 (copy)
            v276.ImageTransparency = 0.85;
        end);
        v276.SelectionImageObject = v276:Clone();
        v17:MakeFocusState(v276, "utility-focus-state-playermute");
        local function _(v283) --[[ Line: 1252 ]] --[[ Name: updatePlayerMuteText ]]
            -- upvalues: l_TextLabel_4 (copy), v74 (ref), l_RobloxLocaleId_0 (ref)
            local v284 = v283 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
            l_TextLabel_4.Text = v74[l_RobloxLocaleId_0]:Format(v284);
        end;
        local v286 = l_default_0.localMuted and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
        l_TextLabel_4.Text = v74[l_RobloxLocaleId_0]:Format(v286);
        v247 = l_default_0.muteChanged.Event:Connect(function(v287) --[[ Line: 1259 ]]
            -- upvalues: v180 (ref), v68 (ref), v118 (ref), v211 (ref), l_TextLabel_4 (copy), v74 (ref), l_RobloxLocaleId_0 (ref)
            v180 = v287;
            local v288 = nil;
            if v68() then
                if v118 then
                    v288 = v118:FindFirstChild("MuteSelfButtonImageLabel", true);
                end;
            else
                v288 = v118:FindFirstChild("MuteSelfButtonImageLabel", true);
            end;
            if v288 then
                v288.Image = v211();
            end;
            v288 = v287 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
            l_TextLabel_4.Text = v74[l_RobloxLocaleId_0]:Format(v288);
        end);
        v276.Activated:Connect(function() --[[ Line: 1265 ]]
            -- upvalues: l_default_0 (ref), v113 (ref), v180 (ref)
            l_default_0:ToggleMic("InGameMenuPlayers");
            if v113 then
                v113:onToggleMuteSelf(v180);
            end;
        end);
        if v68() then
            return v276;
        else
            v110 = v276;
            return;
        end;
    end;
    local function _() --[[ Line: 1280 ]] --[[ Name: addMuteButtonExperience ]]
        -- upvalues: v70 (ref), v68 (ref), v110 (ref), v243 (ref)
        if v70 then
            return;
        elseif v68() then
            v110 = v243();
            return;
        else
            v243();
            return;
        end;
    end;
    if v58() then
        v244 = function() --[[ Line: 1293 ]]
            -- upvalues: v259 (copy), v48 (ref), v46 (ref), v59 (ref), v74 (copy), l_RobloxLocaleId_0 (copy), l_uiblox_0 (ref), v32 (ref), v17 (ref), l_default_0 (ref)
            local v290 = v259("ImageButton", nil, true);
            v290.Size = UDim2.new(1, 0, 0, 52);
            v290.Size = v48;
            v290.AnchorPoint = Vector2.new(0, 0);
            local l_TextLabel_5 = v290.TextLabel;
            l_TextLabel_5.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_5.TextTruncate = Enum.TextTruncate.AtEnd;
            l_TextLabel_5.Font = v46.font(Enum.Font.SourceSansSemibold, "Semibold");
            l_TextLabel_5.AutoLocalize = false;
            if v59 then
                l_TextLabel_5.Text = v74[l_RobloxLocaleId_0]:Format("Feature.SettingsHub.Action.ConnectVoiceChat");
            else
                l_TextLabel_5.Text = "Connect Voice Chat";
            end;
            local l_Icon_3 = v290.Icon;
            l_Icon_3.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_3.Position = UDim2.new(0, 18, 0.5, 0);
            local v293 = l_uiblox_0["icons/controls/publicAudioJoin"];
            local v294 = if v293 then l_uiblox_0["icons/controls/publicAudioJoin"] else v46.Images["icons/controls/publicAudioJoin"];
            if v294 then
                if v293 then
                    l_Icon_3.Text = v294.name;
                    l_Icon_3.FontFace = v32.Font[v294.variant];
                else
                    l_Icon_3.Image = v294.Image;
                    l_Icon_3.ImageRectOffset = v294.ImageRectOffset;
                    l_Icon_3.ImageRectSize = v294.ImageRectSize;
                end;
            end;
            local function _(v295) --[[ Line: 1328 ]] --[[ Name: setIsHighlighted ]]
                -- upvalues: v290 (copy)
                if v295 then
                    v290.ImageTransparency = 0.65;
                    return;
                else
                    v290.ImageTransparency = 0.85;
                    return;
                end;
            end;
            v290.InputBegan:Connect(function() --[[ Line: 1336 ]]
                -- upvalues: v290 (copy)
                v290.ImageTransparency = 0.65;
            end);
            v290.InputEnded:Connect(function() --[[ Line: 1339 ]]
                -- upvalues: v290 (copy)
                v290.ImageTransparency = 0.85;
            end);
            v290.Activated:Connect(function() --[[ Line: 1342 ]]
                -- upvalues: v290 (copy)
                v290.ImageTransparency = 0.85;
            end);
            v290.TouchPan:Connect(function(_, v298) --[[ Line: 1345 ]]
                -- upvalues: v290 (copy)
                if math.abs(v298.Y) > 20 then
                    v290.ImageTransparency = 0.85;
                end;
            end);
            v290.SelectionGained:connect(function() --[[ Line: 1351 ]]
                -- upvalues: v290 (copy)
                v290.ImageTransparency = 0.65;
            end);
            v290.SelectionLost:connect(function() --[[ Line: 1354 ]]
                -- upvalues: v290 (copy)
                v290.ImageTransparency = 0.85;
            end);
            v290.SelectionImageObject = v290:Clone();
            v17:MakeFocusState(v290, "utility-focus-state-joinVoice");
            v290.Activated:Connect(function() --[[ Line: 1362 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:JoinVoice();
            end);
            return v290;
        end;
    end;
    local function _() --[[ Line: 1370 ]] --[[ Name: addJoinVoiceButton ]]
        -- upvalues: v251 (copy), v111 (ref), v244 (ref)
        if not v251() or v111 then
            return;
        else
            v111 = v244();
            return;
        end;
    end;
    local function _(v300) --[[ Line: 1378 ]] --[[ Name: createInspectButtonImage ]]
        -- upvalues: v17 (ref), v46 (ref)
        return (v17:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight), UDim2.new(0, 28, 0, 28), v300));
    end;
    local function v309(v302, v303, v304, v305) --[[ Line: 1389 ]] --[[ Name: resizeInspectButton ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), v17 (ref), v46 (ref)
        local l_Inspect_0 = v302:FindFirstChild("Inspect");
        if l_Inspect_0 and v304 == v305 then
            return;
        else
            if l_Inspect_0 then
                l_Inspect_0:Destroy();
            end;
            local function v307() --[[ Line: 1399 ]]
                -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref), v303 (copy)
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsExamineAvatarName, l_Constants_0.AnalyticsMenuActionName, {
                    playsessionid = l_NewPage_0.playSessionId, 
                    universeid = tostring(game.GameId)
                });
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v303.UserId, "escapeMenu");
                l_NewPage_0.HubRef:SetVisibility(false);
            end;
            l_Inspect_0 = v17:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v46.ButtonHeight, 0, v46.ButtonHeight), UDim2.new(0, 28, 0, 28), v307);
            l_Inspect_0.Name = "Inspect";
            l_Inspect_0.LayoutOrder = 2;
            l_Inspect_0.Selectable = true;
            l_Inspect_0.Parent = v302;
            local v308 = "utility-focus-state" .. "-inspect-" .. v303.Name;
            v17:MakeFocusState(l_Inspect_0, v308);
            return;
        end;
    end;
    local function v318(v310, v311, v312) --[[ Line: 1422 ]] --[[ Name: resizePlatformName ]]
        -- upvalues: l_result_0 (ref), v17 (ref), v46 (ref), l_Create_0 (ref)
        local l_PlatformNameContainer_0 = v310:FindFirstChild("PlatformNameContainer");
        if l_PlatformNameContainer_0 then
            l_PlatformNameContainer_0:Destroy();
            l_PlatformNameContainer_0 = nil;
        end;
        if v311 == nil then
            return;
        else
            l_PlatformNameContainer_0 = Instance.new("Frame");
            l_PlatformNameContainer_0.Name = "PlatformNameContainer";
            l_PlatformNameContainer_0.BackgroundTransparency = 1;
            l_PlatformNameContainer_0.ZIndex = 3;
            l_PlatformNameContainer_0.Position = UDim2.new(0, 0, 0, 0);
            l_PlatformNameContainer_0.Size = UDim2.new(0, 0, 1, 0);
            l_PlatformNameContainer_0.AutomaticSize = Enum.AutomaticSize.X;
            l_PlatformNameContainer_0.Selectable = false;
            l_PlatformNameContainer_0.LayoutOrder = -1;
            l_PlatformNameContainer_0.Parent = v310;
            local v314 = nil;
            if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v312 and v312 ~= "" then
                v314 = function() --[[ Line: 1455 ]]
                    -- upvalues: l_result_0 (ref), v312 (copy)
                    l_result_0:ShowProfile(v312);
                end;
            end;
            local v315, v316 = v17:MakeStyledButton("consoleNameContainer", v311, UDim2.new(0, 0, 0, v46.ButtonHeight), v314);
            v315.AnchorPoint = Vector2.new(0, 0.5);
            v315.Position = UDim2.fromScale(0, 0.5);
            v315.AutomaticSize = Enum.AutomaticSize.X;
            v315.Parent = l_PlatformNameContainer_0;
            v316.Size = UDim2.fromScale(0, 1);
            v316.AutoLocalize = false;
            v316.TextSize = v46.platformNameTextSize;
            v316.TextScaled = false;
            v316.TextWrapped = false;
            v316.AutomaticSize = Enum.AutomaticSize.X;
            local v317 = l_Create_0("ImageLabel")({
                Name = "iconLabel", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v46.platformNameIconSize, 
                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png", 
                ImageColor3 = Color3.new(1, 1, 1)
            });
            v317.Parent = v315;
            l_Create_0("UIListLayout")({
                Name = "PLatformNameUIListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }).Parent = v315;
            v317.LayoutOrder = 1;
            v316.LayoutOrder = 2;
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                Parent = v315
            });
            return l_PlatformNameContainer_0;
        end;
    end;
    v245 = function() --[[ Line: 1517 ]]
        -- upvalues: v259 (copy), l_FFlagIEMFocusNavToButtons_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_GuiService_0 (ref)
        local v319 = v259("ImageLabel", true);
        v319.TextLabel.Name = "DisplayNameLabel";
        v319.SecondRow.Name = "NameLabel";
        if l_FFlagIEMFocusNavToButtons_0 then
            v319.Selectable = false;
            v319.SelectionGroup = true;
        end;
        if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then
            v319.NameLabel.OpenTypeFeatures = l_OpenTypeSupport_0:getUserNameStylisticAlternative();
        end;
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "RightSideButtons";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.ZIndex = 2;
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_1.Size = UDim2.new(1, -12, 1, 0);
        l_Frame_1.Parent = v319;
        local function _(v321) --[[ Line: 1538 ]]
            -- upvalues: v319 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v319 then
                if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= v321 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                    v319.ImageTransparency = 0.65;
                    return;
                else
                    v319.ImageTransparency = 0.85;
                end;
            end;
        end;
        local v323 = nil;
        l_Frame_1.ChildAdded:connect(function(v324) --[[ Line: 1553 ]]
            -- upvalues: v323 (ref), v319 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v324:IsA("GuiObject") then
                if v323 and v324 ~= v323 then
                    v323:Destroy();
                    v323 = nil;
                end;
                v324.SelectionGained:connect(function() --[[ Line: 1559 ]]
                    -- upvalues: v319 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    if v319 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= nil and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v319.ImageTransparency = 0.65;
                            return;
                        else
                            v319.ImageTransparency = 0.85;
                        end;
                    end;
                end);
                v324.SelectionLost:connect(function() --[[ Line: 1562 ]]
                    -- upvalues: v324 (copy), v319 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    local l_v324_0 = v324;
                    if v319 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= l_v324_0 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v319.ImageTransparency = 0.65;
                            return;
                        else
                            v319.ImageTransparency = 0.85;
                        end;
                    end;
                end);
            end;
        end);
        v323 = Instance.new("Frame");
        v323.Selectable = true;
        v323.Size = UDim2.new(1, 0, 1, 0);
        v323.BackgroundTransparency = 1;
        v323.SelectionImageObject = v323:Clone();
        v323.Parent = l_Frame_1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Name = "RightSideListLayout";
        l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
        l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Right;
        l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = UDim.new(0, 12);
        l_UIListLayout_0.Parent = l_Frame_1;
        pcall(function() --[[ Line: 1584 ]]
            -- upvalues: v319 (copy)
            v319.NameLabel.Localize = false;
            v319.DisplayNameLabel.Localize = false;
        end);
        return v319;
    end;
    local function v378(v327, v328) --[[ Line: 1596 ]] --[[ Name: managePlayerNameCutoff ]]
        -- upvalues: v69 (ref), l_UserProfileStore_0 (ref), v61 (ref), v17 (ref), v64 (ref), l_formatUsername_0 (ref)
        local v329 = nil;
        local v330 = nil;
        local function v340(v331, v332, v333) --[[ Line: 1599 ]] --[[ Name: reportFlagChanged ]]
            -- upvalues: v329 (ref), v327 (copy), v328 (copy)
            if v332 == "AbsolutePosition" and v329 then
                local v334 = v331.AbsolutePosition.X - 20 - v327.NameLabel.AbsolutePosition.X;
                v327.NameLabel.Text = "@" .. v328.Name;
                v327.DisplayNameLabel.Text = v328.DisplayName;
                if v333 then
                    v327.DisplayNameLabel.Text = v333;
                end;
                local v335 = utf8.len(v328.DisplayName);
                if v333 then
                    v335 = utf8.len(v333);
                end;
                while v334 < v327.NameLabel.TextBounds.X and v335 > 0 do
                    if v333 then
                        local v336 = utf8.offset(v333, v335);
                        v327.NameLabel.Text = string.sub(v333, 1, v336) .. "...";
                    else
                        local v337 = utf8.offset(v328.DisplayName, v335);
                        v327.NameLabel.Text = string.sub(v328.DisplayName, 1, v337) .. "...";
                    end;
                    v335 = v335 - 1;
                end;
                local v338 = "@" .. v328.Name;
                local v339 = string.len(v338);
                while v334 < v327.NameLabel.TextBounds.X and v339 > 0 do
                    v327.NameLabel.Text = string.sub(v338, 1, v339) .. "...";
                    v339 = v339 - 1;
                end;
            end;
        end;
        local function v350(v341, _, _) --[[ Line: 1633 ]] --[[ Name: reportFlagChangedWithCombinedName ]]
            -- upvalues: v69 (ref), v328 (copy), v340 (copy), l_UserProfileStore_0 (ref), v327 (copy)
            if v69 and not v328.UserId then
                v340(v341, "AbsolutePosition");
                return;
            else
                l_UserProfileStore_0.get().fetchNamesByUserIds({
                    (tostring(v328.UserId))
                }, function(v344) --[[ Line: 1637 ]]
                    -- upvalues: v327 (ref), v340 (ref), v341 (copy), v328 (ref)
                    local l_v327_0 = v327;
                    local v346 = if l_v327_0 and l_v327_0.Parent then l_v327_0:FindFirstChild("DisplayNameLabel") else nil;
                    if v346 == nil then
                        return;
                    else
                        local l_data_0 = v344.data;
                        if #l_data_0 == 0 then
                            l_v327_0 = "";
                        else
                            local v348 = l_data_0[1];
                            if v348 == nil then
                                l_v327_0 = "";
                            else
                                local l_names_1 = v348.names;
                                l_v327_0 = l_names_1 == nil and "" or l_names_1.getInExperienceCombinedName(false);
                            end;
                        end;
                        if string.len(l_v327_0) > 0 and l_v327_0 ~= v346.Text then
                            v340(v341, "AbsolutePosition", l_v327_0);
                            return;
                        else
                            if v328.DisplayName ~= v346.Text then
                                v340(v341, "AbsolutePosition");
                            end;
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
        if not v61() then
            v17:OnResized(v327.NameLabel, function(_, v352) --[[ Line: 1657 ]]
                -- upvalues: v329 (ref), v17 (ref), v330 (ref), v327 (copy), v350 (copy), v328 (copy), v69 (ref), l_UserProfileStore_0 (ref)
                if v329 ~= nil and v329 == v352 then
                    return;
                else
                    v352 = v352 and not (v17:IsSmallTouchScreen() and v17:IsPortrait());
                    v329 = v352;
                    if v352 then
                        if v330 == nil then
                            v330 = v327.RightSideButtons.ChildAdded:connect(function(v353) --[[ Line: 1666 ]]
                                -- upvalues: v350 (ref)
                                if v353.Name == "Inspect" then
                                    v353.Changed:connect(function(_) --[[ Line: 1668 ]]
                                        -- upvalues: v350 (ref), v353 (copy)
                                        v350(v353, "AbsolutePosition");
                                    end);
                                    v350(v353, "AbsolutePosition");
                                end;
                            end);
                        end;
                        local l_Inspect_1 = v327.RightSideButtons:FindFirstChild("Inspect");
                        if l_Inspect_1 then
                            l_Inspect_1.Changed:connect(function(v356) --[[ Line: 1677 ]]
                                -- upvalues: v350 (ref), l_Inspect_1 (copy)
                                v350(l_Inspect_1, v356);
                            end);
                            v350(l_Inspect_1, "AbsolutePosition");
                            return;
                        end;
                    elseif not v327:FindFirstChild("NameLabel") then
                        return;
                    else
                        v327.NameLabel.Text = "@" .. v328.Name;
                        if v69 and not v328.UserId then
                            v327.DisplayNameLabel.Text = v328.DisplayName;
                            return;
                        else
                            l_UserProfileStore_0.get().fetchNamesByUserIds({
                                (tostring(v328.UserId))
                            }, function(v357) --[[ Line: 1691 ]]
                                -- upvalues: v327 (ref), v328 (ref)
                                local l_v327_1 = v327;
                                local v359 = if l_v327_1 and l_v327_1.Parent then l_v327_1:FindFirstChild("DisplayNameLabel") else nil;
                                if v359 == nil then
                                    return;
                                else
                                    local l_data_1 = v357.data;
                                    if #l_data_1 == 0 then
                                        l_v327_1 = "";
                                    else
                                        local v361 = l_data_1[1];
                                        if v361 == nil then
                                            l_v327_1 = "";
                                        else
                                            local l_names_2 = v361.names;
                                            l_v327_1 = l_names_2 == nil and "" or l_names_2.getInExperienceCombinedName(false);
                                        end;
                                    end;
                                    if string.len(l_v327_1) > 0 and l_v327_1 ~= v359.Text then
                                        v359.Text = l_v327_1;
                                        return;
                                    else
                                        l_data_1 = v328.DisplayName;
                                        if l_data_1 ~= v359.Text then
                                            v359.Text = l_data_1;
                                        end;
                                        return;
                                    end;
                                end;
                            end);
                        end;
                    end;
                    return;
                end;
            end);
        end;
        local function v366() --[[ Line: 1711 ]] --[[ Name: getNearestRightSideButtonXPosition ]]
            -- upvalues: v327 (copy)
            local v363 = nil;
            for _, v365 in pairs(v327.RightSideButtons:GetChildren()) do
                if v365:IsA("ImageButton") and (not v363 or v365.AbsolutePosition.X < v363) then
                    v363 = v365.AbsolutePosition.X;
                end;
            end;
            return v363;
        end;
        local v367 = nil;
        local function v376() --[[ Line: 1726 ]] --[[ Name: rightSideButtonsChanged ]]
            -- upvalues: v366 (copy), v367 (ref), v327 (copy), v64 (ref), l_formatUsername_0 (ref), v328 (copy), v69 (ref), l_UserProfileStore_0 (ref)
            local v368 = v366();
            if v368 == v367 then
                return;
            else
                v367 = v368;
                local v369 = nil;
                v369 = if v368 then UDim2.new(0, v368 - v327.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0);
                v327.NameLabel.Size = v369;
                v327.DisplayNameLabel.Size = v369;
                v327.NameLabel.Text = if v64 then l_formatUsername_0(v328.Name) else "@" .. v328.Name;
                if v69 and not v328.UserId then
                    v327.DisplayNameLabel.Text = v328.DisplayName;
                    return;
                else
                    l_UserProfileStore_0.get().fetchNamesByUserIds({
                        (tostring(v328.UserId))
                    }, function(v370) --[[ Line: 1756 ]]
                        -- upvalues: v327 (ref), v328 (ref)
                        local l_v327_2 = v327;
                        local v372 = if l_v327_2 and l_v327_2.Parent then l_v327_2:FindFirstChild("DisplayNameLabel") else nil;
                        if v372 == nil then
                            return;
                        else
                            local l_data_2 = v370.data;
                            if #l_data_2 == 0 then
                                l_v327_2 = "";
                            else
                                local v374 = l_data_2[1];
                                if v374 == nil then
                                    l_v327_2 = "";
                                else
                                    local l_names_3 = v374.names;
                                    l_v327_2 = l_names_3 == nil and "" or l_names_3.getInExperienceCombinedName(false);
                                end;
                            end;
                            if string.len(l_v327_2) > 0 and l_v327_2 ~= v372.Text then
                                v372.Text = l_v327_2;
                                return;
                            else
                                l_data_2 = v328.DisplayName;
                                if l_data_2 ~= v372.Text then
                                    v372.Text = l_data_2;
                                end;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        if v61() then
            v330 = v327.RightSideButtons.ChildAdded:connect(function(v377) --[[ Line: 1775 ]]
                -- upvalues: v376 (copy)
                v376();
                v377:GetPropertyChangedSignal("AbsolutePosition"):Connect(v376);
            end);
            v376();
        end;
    end;
    local function _() --[[ Line: 1784 ]] --[[ Name: canShareCurrentGame ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return l_LocalPlayer_0.UserId > 0;
    end;
    local v380 = nil;
    local v381 = {};
    local v382 = {};
    local v383 = false;
    local function v391() --[[ Line: 1794 ]] --[[ Name: updateAllMuteButtons ]]
        -- upvalues: v109 (ref), l_default_0 (ref), l_Players_0 (ref), v381 (copy), v196 (copy), v181 (ref), v23 (ref)
        if not v109 then
            return;
        elseif not l_default_0.voiceUIVisible then
            return;
        else
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            local v385 = true;
            for _, v387 in ipairs(l_l_Players_0_Players_0) do
                local v388 = v381[v387.Name];
                if v387 and v388 then
                    local v389 = l_default_0.participants[tostring(v387.UserId)];
                    if v389 and not v389.isMutedLocally then
                        v385 = false;
                    end;
                    v196(v388, v389);
                end;
            end;
            if v385 then
                v181 = true;
            else
                v181 = false;
            end;
            local v390 = v181 and v23:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
            if not v109 or not v109:FindFirstChild("TextLabel") then
                return;
            else
                v109.TextLabel.Text = v390;
                v109.Icon.Image = l_default_0:GetIcon(v181 and "MuteAll" or "UnmuteAll", "Misc");
                return;
            end;
        end;
    end;
    local function v397() --[[ Line: 1837 ]] --[[ Name: destroyAllUserMuteButtons ]]
        -- upvalues: l_Players_0 (ref), v381 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v108 (ref)
        for _, v393 in (l_Players_0:GetPlayers()) do
            local v394 = v381[v393.Name];
            if v394 then
                local l_RightSideButtons_1 = v394:FindFirstChild("RightSideButtons");
                if l_RightSideButtons_1 then
                    local l_MuteStatusButton_1 = l_RightSideButtons_1:FindFirstChild("MuteStatusButton");
                    if l_MuteStatusButton_1 then
                        if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_1 then
                            if l_UserInputService_0.GamepadEnabled then
                                l_GuiService_0.SelectedCoreObject = v108;
                            else
                                l_GuiService_0.SelectedCoreObject = nil;
                            end;
                        end;
                        l_MuteStatusButton_1:Destroy();
                    end;
                end;
            end;
        end;
    end;
    local function v450(_) --[[ Line: 1860 ]]
        -- upvalues: l_FFlagIEMFocusNavToButtons_0 (ref), l_NewPage_0 (copy), v380 (ref), l_Players_0 (ref), v70 (ref), l_LocalPlayer_0 (ref), v17 (ref), v246 (ref), v109 (ref), l_default_0 (ref), v108 (ref), l_RunService_0 (ref), v118 (ref), l_Create_0 (ref), v119 (ref), v48 (ref), v34 (ref), v35 (ref), l_GameInviteAnalytics_0 (ref), l_EventStream_0 (ref), l_RbxAnalyticsService_0 (ref), l_Diag_0 (ref), v241 (ref), v58 (ref), v251 (copy), v111 (ref), v244 (ref), v114 (ref), l_GuiService_0 (ref), v381 (copy), v382 (copy), v245 (ref), v196 (copy), l_SocialUtil_0 (ref), v64 (ref), l_formatUsername_0 (ref), v61 (ref), v378 (copy), v151 (copy), v145 (copy), v155 (ref), v309 (copy), v240 (copy), v242 (ref), v181 (ref), v23 (ref), v54 (ref), v30 (ref), v113 (copy), v27 (ref), v391 (copy), v65 (ref), v69 (ref), v12 (ref), l_UserProfileStore_0 (ref), v318 (copy), v383 (ref), v68 (ref), v211 (copy), l_UserInputService_0 (ref), v66 (ref)
        if l_FFlagIEMFocusNavToButtons_0 then
            l_NewPage_0.LastSelectableObjects = {};
        end;
        v380 = l_Players_0:GetPlayers();
        if v70 then
            table.sort(v380, function(v399, v400) --[[ Line: 1867 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v401 = v399.Name:lower();
                local v402 = v400.Name:lower();
                if v399 == l_LocalPlayer_0 then
                    v401 = " ";
                end;
                if v400 == l_LocalPlayer_0 then
                    v402 = " ";
                end;
                return v401 < v402;
            end);
        else
            table.sort(v380, function(v403, v404) --[[ Line: 1880 ]]
                return v403.Name:lower() < v404.Name:lower();
            end);
        end;
        local v405 = 20;
        if v17:IsSmallTouchScreen() or v17:IsPortrait() then
            v405 = 85;
        end;
        local v406 = v246 and not v109 and l_default_0.voiceUIVisible;
        if (l_LocalPlayer_0.UserId > 0 and not v108 and not l_RunService_0:IsStudio() or v406) and not v118 then
            v118 = l_Create_0("Frame")({
                Name = "Holder", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Parent = l_NewPage_0.Page, 
                LayoutOrder = 1
            });
            v119 = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20), 
                Parent = v118
            });
        end;
        local function v407() --[[ Line: 1914 ]] --[[ Name: layoutMuteAll ]]
            -- upvalues: v118 (ref), l_Create_0 (ref), l_NewPage_0 (ref), v108 (ref), v48 (ref), v109 (ref)
            if not v118 then
                v118 = l_Create_0("Frame")({
                    Name = "Holder", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 52), 
                    Parent = l_NewPage_0.Page, 
                    LayoutOrder = 1
                });
            end;
            v108.Parent = v118;
            v108.Size = v48;
            v109.Parent = v118;
        end;
        local v408 = not l_RunService_0:IsStudio();
        if l_LocalPlayer_0.UserId > 0 and not v108 and v408 then
            local v409 = nil;
            v409 = if v34() then v35:withButtonName(v35.ButtonName.SettingsHub) else l_GameInviteAnalytics_0.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0)):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
            v108 = v241();
            do
                local l_v409_0 = v409;
                v108.Activated:connect(function() --[[ Line: 1946 ]]
                    -- upvalues: l_v409_0 (ref), l_NewPage_0 (ref)
                    l_v409_0:inputShareGameEntryPoint();
                    l_NewPage_0.HubRef:InviteToGame();
                end);
                v108.LayoutOrder = 1;
                if v406 then
                    v108.Parent = v118;
                else
                    v108.Parent = l_NewPage_0.Page;
                end;
            end;
        end;
        if v58() and v251() then
            if v251() and not v111 then
                v111 = v244();
            end;
            v114();
        end;
        local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
        for v412 = 1, #v380 do
            local v413 = v380[v412];
            local v414 = nil;
            v414 = v381[v413.Name];
            do
                local l_v414_0 = v414;
                if v413 then
                    v382[v413.Name] = true;
                    if not l_v414_0 or not l_v414_0.Parent then
                        l_v414_0 = v245((v412 - 1) * 80 + v405);
                        l_v414_0.Parent = l_NewPage_0.Page;
                        v381[v413.Name] = l_v414_0;
                    end;
                    l_v414_0.Name = "PlayerLabel" .. v413.Name;
                    if v246 then
                        local v416 = l_default_0.participants[tostring(v413.UserId)];
                        v196(l_v414_0, v416);
                    end;
                    local v417 = l_SocialUtil_0.GetPlayerImage(math.max(1, v413.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail);
                    l_v414_0.Icon.Image = v417;
                    l_v414_0.NameLabel.Text = if v64 then l_formatUsername_0(v413.Name) else "@" .. v413.Name;
                    l_v414_0.ImageTransparency = 0.85;
                    l_v414_0.LayoutOrder = v412 + 1;
                    if v61() then
                        l_v414_0.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_v414_0.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                    end;
                    v378(l_v414_0, v413);
                    v151(l_v414_0, v413);
                    local v418 = nil;
                    do
                        local l_v418_0 = v418;
                        v17:OnResized(l_v414_0, function(_, v421) --[[ Line: 2016 ]]
                            -- upvalues: l_v414_0 (ref), v17 (ref), v145 (ref), v413 (copy), l_v418_0 (ref), v155 (ref), l_l_GuiService_0_InspectMenuEnabled_0 (copy), v309 (ref)
                            local l_RightSideButtons_2 = l_v414_0:FindFirstChild("RightSideButtons");
                            local l_DisplayNameLabel_0 = l_v414_0:FindFirstChild("DisplayNameLabel");
                            local l_NameLabel_0 = l_v414_0:FindFirstChild("NameLabel");
                            local v425 = l_RightSideButtons_2 and l_RightSideButtons_2:FindFirstChild("RightSideListLayout");
                            if v17:IsSmallTouchScreen() and v17:IsPortrait() then
                                l_v414_0.Size = UDim2.new(1, 0, 0, 105);
                                if l_DisplayNameLabel_0 then
                                    if l_NameLabel_0 then
                                        l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.275, -10);
                                        l_NameLabel_0.Position = UDim2.new(0, 60, 0.275, 12);
                                    else
                                        l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.275, 0);
                                    end;
                                end;
                                if l_RightSideButtons_2 then
                                    l_RightSideButtons_2.Position = UDim2.new(0, 57, 0, -2);
                                    l_RightSideButtons_2.Size = UDim2.new(1, -12, 0.99, -8);
                                end;
                                if v425 then
                                    v425.HorizontalAlignment = Enum.HorizontalAlignment.Left;
                                    v425.VerticalAlignment = Enum.VerticalAlignment.Bottom;
                                end;
                            else
                                l_v414_0.Size = UDim2.new(1, 0, 0, 62);
                                if l_DisplayNameLabel_0 then
                                    if l_NameLabel_0 then
                                        l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.5, -10);
                                        l_NameLabel_0.Position = UDim2.new(0, 60, 0.5, 12);
                                    else
                                        l_DisplayNameLabel_0.Position = UDim2.new(0, 60, 0.5, 0);
                                    end;
                                end;
                                if l_RightSideButtons_2 then
                                    l_RightSideButtons_2.Position = UDim2.new(0, 0, 0, 0);
                                    l_RightSideButtons_2.Size = UDim2.new(1, -12, 1, 0);
                                end;
                                if v425 then
                                    v425.HorizontalAlignment = Enum.HorizontalAlignment.Right;
                                    v425.VerticalAlignment = Enum.VerticalAlignment.Center;
                                end;
                            end;
                            if l_RightSideButtons_2 then
                                v145(l_RightSideButtons_2, v413, v421, l_v418_0);
                                v155(l_RightSideButtons_2, v413, v421, l_v418_0);
                                if l_l_GuiService_0_InspectMenuEnabled_0 then
                                    v309(l_RightSideButtons_2, v413, v421, l_v418_0);
                                end;
                                l_v418_0 = v421;
                            end;
                        end);
                        v240(l_v414_0, v413);
                        if l_FFlagIEMFocusNavToButtons_0 and v412 == #v380 then
                            local l_RightSideButtons_3 = l_v414_0:FindFirstChild("RightSideButtons");
                            if l_RightSideButtons_3 then
                                for _, v428 in l_RightSideButtons_3:GetChildren() do
                                    if v428:IsA("ImageButton") then
                                        table.insert(l_NewPage_0.LastSelectableObjects, v428);
                                    end;
                                end;
                                l_NewPage_0.LastSelectableObjectsUpdated:fire();
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if v406 then
            v109 = v242();
            v109.Activated:connect(function() --[[ Line: 2104 ]]
                -- upvalues: v181 (ref), v23 (ref), v109 (ref), l_default_0 (ref), v54 (ref), v30 (ref), v113 (ref), v27 (ref), v391 (ref)
                v181 = not v181;
                local v429 = v181 and v23:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
                v109.TextLabel.Text = v429;
                v109.Icon.Image = l_default_0:GetIcon(v181 and "MuteAll" or "UnmuteAll", "Misc");
                if v54() then
                    v30:debug("{} all players", v181 and "Muting" or "Unmuting");
                end;
                if v113 then
                    v113:onToggleMuteAll(v181);
                end;
                l_default_0:MuteAll(v181, v27.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v391();
            end);
            v109.LayoutOrder = 1;
            if v65 then
                v407();
            else
                v109.Parent = v118;
            end;
            v114();
        end;
        local v430 = nil;
        v430 = if v69 then v12.List.filterMap(v380, function(v431) --[[ Line: 2134 ]]
            if not v431.UserId then
                return nil;
            else
                return (tostring(v431.UserId));
            end;
        end) else v12.List.filter(v380, function(v432) --[[ Line: 2142 ]]
            return (tostring(v432.UserId));
        end);
        for _, v434 in ipairs(v380) do
            v381[v434.Name].DisplayNameLabel.Text = v434.DisplayName;
        end;
        l_UserProfileStore_0.get().fetchNamesByUserIds(v430, function(v435) --[[ Line: 2151 ]]
            -- upvalues: v381 (ref), v318 (ref)
            for _, v437 in v435.data do
                local v438 = v381[v437.names.getUsername(false)];
                if v438 then
                    local v439 = v437.names.getInExperienceCombinedName(false);
                    if string.len(v439) > 0 and v439 ~= v438.DisplayNameLabel.Text then
                        v438.DisplayNameLabel.Text = v439;
                    end;
                    local l_RightSideButtons_4 = v438:FindFirstChild("RightSideButtons");
                    local v441 = nil;
                    if v437.names.getPlatformName(false) ~= "" then
                        v441 = v437.names.getPlatformName(false);
                    end;
                    if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
                        v318(l_RightSideButtons_4, v441, v437.getPlatformProfileId(false));
                    else
                        v318(l_RightSideButtons_4, v441);
                    end;
                end;
            end;
        end);
        local v442 = 0;
        if v246 and not v383 then
            v30:debug("Setting Up Playerlist Mic Update Renderstep Hook");
            l_RunService_0:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function() --[[ Line: 2183 ]]
                -- upvalues: v442 (ref), v391 (ref), v68 (ref), v118 (ref), v211 (ref)
                v442 = v442 + 1;
                if v442 % 3 == 0 then
                    v391();
                    local v443 = nil;
                    if v68() then
                        if v118 then
                            v443 = v118:FindFirstChild("MuteSelfButtonImageLabel", true);
                        end;
                    else
                        v443 = v118:FindFirstChild("MuteSelfButtonImageLabel", true);
                    end;
                    if not v443 then
                        return;
                    else
                        v443.Image = v211();
                    end;
                end;
            end);
            v383 = true;
        end;
        for v444, v445 in pairs(v381) do
            if not v382[v444] then
                v445:Destroy();
                v381[v444] = nil;
            end;
        end;
        if l_UserInputService_0.GamepadEnabled then
            if v68() then
                pcall(function() --[[ Line: 2203 ]]
                    -- upvalues: v66 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref), v108 (ref)
                    if v66 then
                        if l_NewPage_0.Active then
                            l_GuiService_0.SelectedCoreObject = v108;
                            return;
                        end;
                    else
                        l_GuiService_0.SelectedCoreObject = v108;
                    end;
                end);
            else
                l_GuiService_0.SelectedCoreObject = v108;
            end;
        end;
        v17:OnResized("MenuPlayerListExtraPageSize", function(_, _) --[[ Line: 2217 ]]
            -- upvalues: v17 (ref), v380 (ref), l_NewPage_0 (ref)
            local v448 = 20;
            if v17:IsSmallTouchScreen() or v17:IsPortrait() then
                v448 = 85;
            end;
            local v449 = #v380 + 1;
            if v17:IsSmallTouchScreen() and v17:IsPortrait() then
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v448 + v449 * 123 - 5);
                return;
            else
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v448 + v449 * 80 - 5);
                return;
            end;
        end);
    end;
    local function v451() --[[ Line: 2233 ]]
        -- upvalues: v383 (ref), v30 (ref), l_RunService_0 (ref)
        if v383 then
            v30:debug("Unbinding Playerlist Mic Update Renderstep Hook");
            v383 = false;
            l_RunService_0:UnbindFromRenderStep("player-list-mute-update");
        end;
    end;
    if game:GetEngineFeature("VoiceChatSupported") and not v246 then
        l_default_0:asyncInit():andThen(function() --[[ Line: 2243 ]]
            -- upvalues: v246 (ref), l_default_0 (ref), v70 (ref), v68 (ref), v110 (ref), v243 (ref), v391 (copy), v112 (copy), v109 (ref), v114 (ref), v247 (ref), v58 (ref), v111 (ref), v450 (copy), v65 (ref), v197 (copy), v397 (copy), v225 (copy)
            v246 = true;
            l_default_0:SetupParticipantListeners();
            if not v70 then
                if v68() then
                    v110 = v243();
                else
                    v243();
                end;
            end;
            l_default_0.participantsUpdate.Event:Connect(function() --[[ Line: 2248 ]]
                -- upvalues: v391 (ref)
                v391();
            end);
            l_default_0.participantLeft.Event:Connect(function(_, v453) --[[ Line: 2251 ]]
                -- upvalues: v391 (ref), v112 (ref)
                v391();
                v112[v453] = nil;
            end);
            l_default_0:getService().StateChanged:Connect(function(_, v455) --[[ Line: 2256 ]]
                -- upvalues: v109 (ref), v114 (ref), v110 (ref), v247 (ref), v58 (ref), v111 (ref), v246 (ref), v450 (ref)
                if v455 == Enum.VoiceChatState.Ended then
                    if v109 then
                        v109.Visible = false;
                        v109:Destroy();
                        v109 = nil;
                    end;
                    v114();
                    if v110 then
                        v110.Visible = false;
                        v110:Destroy();
                        v110 = nil;
                    end;
                    if v247 then
                        v247:Disconnect();
                        v247 = nil;
                    end;
                    v114();
                    if v58() then
                        if v111 then
                            v111.Visible = false;
                            v111:Destroy();
                            v111 = nil;
                        end;
                        v114();
                    end;
                    v246 = false;
                    return;
                else
                    if v455 == Enum.VoiceChatState.Joined and v246 == false then
                        v246 = true;
                        if v58() then
                            if v111 then
                                v111.Visible = false;
                                v111:Destroy();
                                v111 = nil;
                            end;
                            v114();
                        end;
                        v450();
                    end;
                    return;
                end;
            end);
            if v65 and not v68() then
                v450();
            end;
            l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 2280 ]]
                -- upvalues: v68 (ref), v110 (ref), v70 (ref), v243 (ref), v197 (ref), v58 (ref), v111 (ref), v114 (ref), v450 (ref)
                if v68() then
                    if not v110 and not v70 then
                        if v68() then
                            v110 = v243();
                        else
                            v243();
                        end;
                    end;
                elseif not v197:FindFirstChild("MuteSelfButton", true) and not v70 then
                    if v68() then
                        v110 = v243();
                    else
                        v243();
                    end;
                end;
                if v58() then
                    if v111 then
                        v111.Visible = false;
                        v111:Destroy();
                        v111 = nil;
                    end;
                    v114();
                end;
                v450();
            end);
            l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 2295 ]]
                -- upvalues: v109 (ref), v114 (ref), v110 (ref), v247 (ref), v397 (ref), v450 (ref), v225 (ref)
                if v109 then
                    if v109 then
                        v109.Visible = false;
                        v109:Destroy();
                        v109 = nil;
                    end;
                    v114();
                end;
                if v110 then
                    v110.Visible = false;
                    v110:Destroy();
                    v110 = nil;
                end;
                if v247 then
                    v247:Disconnect();
                    v247 = nil;
                end;
                v114();
                v397();
                v450();
                v225();
            end);
            l_default_0.muteAllChanged.Event:Connect(function() --[[ Line: 2304 ]]
                -- upvalues: v391 (ref)
                v391();
            end);
        end):catch(function(_) --[[ Line: 2308 ]]
            -- upvalues: v54 (ref), v30 (ref)
            if v54() then
                v30:warning("Failed to init VoiceChatServiceManager");
            end;
        end);
    end;
    l_NewPage_0.Displayed.Event:connect(v450);
    l_NewPage_0.Hidden.Event:connect(v451);
    l_Players_0.PlayerRemoving:Connect(function(v457) --[[ Line: 2318 ]]
        -- upvalues: v382 (copy), v381 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v108 (ref), v57 (ref)
        v382[v457.Name] = nil;
        local v458 = v381[v457.Name];
        if not v458 then
            return;
        else
            local l_RightSideButtons_5 = v458:FindFirstChild("RightSideButtons");
            if not l_RightSideButtons_5 then
                return;
            else
                local l_FriendStatus_1 = l_RightSideButtons_5:FindFirstChild("FriendStatus");
                if l_FriendStatus_1 then
                    if l_GuiService_0.SelectedCoreObject == l_FriendStatus_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v108;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_FriendStatus_1:Destroy();
                end;
                local l_ReportPlayer_1 = l_RightSideButtons_5:FindFirstChild("ReportPlayer");
                if l_ReportPlayer_1 then
                    if l_GuiService_0.SelectedCoreObject == l_ReportPlayer_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v108;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_ReportPlayer_1:Destroy();
                end;
                local l_MuteStatusButton_2 = l_RightSideButtons_5:FindFirstChild("MuteStatusButton");
                if l_MuteStatusButton_2 then
                    if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_2 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v108;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_MuteStatusButton_2:Destroy();
                end;
                local l_BlockButton_1 = l_RightSideButtons_5:FindFirstChild("BlockButton");
                if l_BlockButton_1 then
                    if l_GuiService_0.SelectedCoreObject == l_BlockButton_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v108;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_BlockButton_1:Destroy();
                end;
                local l_Inspect_2 = l_RightSideButtons_5:FindFirstChild("Inspect");
                if l_Inspect_2 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_2 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_2:Destroy();
                end;
                if v57() then
                    v381[v457.Name] = nil;
                    v458:Destroy();
                end;
                return;
            end;
        end;
    end);
    local function v469() --[[ Line: 2395 ]] --[[ Name: removeInspectButtons ]]
        -- upvalues: v381 (copy), l_GuiService_0 (ref)
        for _, v466 in pairs(v381) do
            local l_RightSideButtons_6 = v466:FindFirstChild("RightSideButtons");
            if l_RightSideButtons_6 then
                local l_Inspect_3 = l_RightSideButtons_6:FindFirstChild("Inspect");
                if l_Inspect_3 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_3 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_3:Destroy();
                end;
            end;
        end;
    end;
    l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v470) --[[ Line: 2412 ]]
        -- upvalues: v469 (copy)
        if not v470 then
            v469();
        end;
    end);
    l_NewPage_0.CreateMenuButtonsContainer = function(_) --[[ Line: 2418 ]] --[[ Name: CreateMenuButtonsContainer ]]
        -- upvalues: v40 (ref), l_NewPage_0 (copy), v14 (ref), v197 (copy), v13 (ref), v31 (ref)
        if v40 == 2 then
            if l_NewPage_0.buttonsContainerRoot then
                return;
            else
                l_NewPage_0.buttonsContainerRoot = v14.createRoot(v197);
                local l_ExperienceControlStore_0 = l_NewPage_0.HubRef:GetExperienceControlStore();
                l_NewPage_0.buttonsContainerRoot:render(v13.createElement(v31, {
                    onLeaveGame = l_ExperienceControlStore_0.onLeaveGame, 
                    onRespawn = l_ExperienceControlStore_0.onRespawn, 
                    onResume = l_ExperienceControlStore_0.onResume, 
                    setAddMenuKeyBindings = function() --[[ Line: 2430 ]] --[[ Name: setAddMenuKeyBindings ]]

                    end, 
                    setRemoveMenuKeyBindings = function() --[[ Line: 2431 ]] --[[ Name: setRemoveMenuKeyBindings ]]

                    end, 
                    getVisibility = function() --[[ Line: 2432 ]] --[[ Name: getVisibility ]]
                        return true;
                    end, 
                    getCanRespawn = l_ExperienceControlStore_0.getCanRespawn
                }));
            end;
        end;
    end;
    l_NewPage_0.UnmountMenuButtonsContainer = function(_) --[[ Line: 2440 ]] --[[ Name: UnmountMenuButtonsContainer ]]
        -- upvalues: v41 (ref), v40 (ref), l_NewPage_0 (copy)
        if v41 and v40 == 2 and l_NewPage_0.buttonsContainerRoot then
            l_NewPage_0.buttonsContainerRoot:unmount();
            l_NewPage_0.buttonsContainerRoot = nil;
        end;
    end;
    return l_NewPage_0;
end)());