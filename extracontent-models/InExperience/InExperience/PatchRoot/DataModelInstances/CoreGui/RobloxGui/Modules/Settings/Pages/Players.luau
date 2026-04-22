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
local l_FFlagIEMTabFocusNav_0 = v36.FFlagIEMTabFocusNav;
local v40 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons);
local v41 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local v42 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM);
local l_game_EngineFeature_0 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId");
local l_FFlagConnectionsToFriendsRename_0 = v36.FFlagConnectionsToFriendsRename;
local l_UserProfileStore_0 = v10.Stores.UserProfileStore;
local _, l_result_0 = pcall(function() --[[ Line: 72 ]]
    return game:GetService("PlatformFriendsService");
end);
local v48 = require(script.Parent.Parent.Theme);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v50 = UDim2.new(0.5, -10, 0, 52);
local _ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v53 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v54 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty);
local v55 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint);
local v56 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave);
local v57 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice);
local v58 = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false);
local v59 = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false);
local v60 = require(l_RobloxGui_0.Modules.Flags.isEngineTruncationEnabledForIngameSettings);
local l_game_EngineFeature_1 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled");
local v62 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true);
local v63 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local v64 = game:DefineFastFlag("CorrectlyPositionMuteButton", false);
local v65 = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false);
local v66 = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200);
local v67 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton);
local v68 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false);
local v69 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local l_MuteStatusIcons_0 = l_default_0.MuteStatusIcons;
local l_PlayerMuteStatusIcons_0 = l_default_0.PlayerMuteStatusIcons;
return ((function() --[[ Line: 148 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), l_uiblox_0 (copy), v32 (copy), l_LocalPlayer_0 (ref), v17 (copy), v29 (copy), v48 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_Constants_0 (copy), v54 (copy), v26 (copy), v66 (copy), v57 (copy), v67 (copy), v59 (copy), l_GuiService_0 (copy), v28 (copy), v25 (copy), v23 (copy), l_MuteStatusIcons_0 (copy), v62 (copy), l_game_EngineFeature_1 (copy), l_default_0 (copy), v27 (copy), l_Create_0 (copy), v40 (copy), v41 (copy), v55 (copy), l_FFlagIEMTabFocusNav_0 (copy), l_PlayerMuteStatusIcons_0 (copy), v19 (copy), v69 (copy), v50 (copy), v58 (copy), l_result_0 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v68 (copy), l_UserProfileStore_0 (copy), v60 (copy), v63 (copy), l_formatUsername_0 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), v34 (copy), v35 (ref), l_GameInviteAnalytics_0 (copy), l_EventStream_0 (copy), l_Diag_0 (copy), l_SocialUtil_0 (copy), v53 (copy), v30 (copy), v64 (copy), v12 (copy), v65 (copy), v56 (copy), v14 (copy), v13 (copy), v31 (copy), v42 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.PageListLayout.Padding = UDim.new(0, 16);
    l_NewPage_0.playSessionId = "";
    if l_game_EngineFeature_0 then
        l_NewPage_0.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v73 = {};
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if not v73[l_RobloxLocaleId_0] then
        v73[l_RobloxLocaleId_0] = l_Localization_0.new(l_RobloxLocaleId_0);
    end;
    l_NewPage_0.TabHeader.Name = "PlayersTab";
    local v75 = l_uiblox_0["icons/menu/friends"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v75.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v32.Font[v75.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "People";
    local function _(v76) --[[ Line: 174 ]] --[[ Name: getFriendStatus ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 175 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v76 (copy)
            return l_LocalPlayer_0:GetFriendStatus(v76);
        end);
        if l_status_1 then
            return l_result_1;
        else
            return Enum.FriendStatus.NotFriend;
        end;
    end;
    l_NewPage_0.Page.Name = "Players";
    local function _(v80) --[[ Line: 189 ]] --[[ Name: showRightSideButtons ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return v80 and v80 ~= l_LocalPlayer_0 and v80.UserId > 0 and l_LocalPlayer_0.UserId > 0;
    end;
    local function _() --[[ Line: 193 ]] --[[ Name: useOptimizedPortraitLayout ]]
        -- upvalues: v17 (ref)
        return v17:IsSmallTouchScreen() and v17:IsPortrait();
    end;
    local function _(v83) --[[ Line: 197 ]] --[[ Name: getIsBlocked ]]
        -- upvalues: v29 (ref)
        return v29:IsPlayerBlockedByUserId(v83.UserId);
    end;
    local function v94(v85, v86) --[[ Line: 201 ]] --[[ Name: createFriendStatusTextLabel ]]
        -- upvalues: v48 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v73 (copy), l_RobloxLocaleId_0 (copy), l_Constants_0 (ref), v54 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), v17 (ref)
        if v85 == nil then
            return nil;
        else
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            local v88 = nil;
            local v89 = nil;
            if v85 == Enum.FriendStatus.Friend or v85 == Enum.FriendStatus.FriendRequestSent then
                v88 = Instance.new("TextButton");
                v88.BackgroundTransparency = 1;
                v88.FontSize = v48.fontSize(Enum.FontSize.Size24);
                v88.Font = v48.font(Enum.Font.SourceSans);
                v88.TextColor3 = Color3.new(1, 1, 1);
                v88.SelectionImageObject = l_Frame_0;
                if v85 == Enum.FriendStatus.Friend then
                    v88.Text = if l_FFlagConnectionsToFriendsRename_0 then v73[l_RobloxLocaleId_0]:Format(l_Constants_0.FriendLocalizedKey) else v73[l_RobloxLocaleId_0]:Format(l_Constants_0.ConnectionLocalizedKey);
                else
                    v88.Text = "Request Sent";
                end;
            elseif v85 == Enum.FriendStatus.Unknown or v85 == Enum.FriendStatus.NotFriend or v85 == Enum.FriendStatus.FriendRequestReceived then
                local function v90() --[[ Line: 230 ]]
                    -- upvalues: v88 (ref), v89 (ref), v54 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v73 (ref), l_RobloxLocaleId_0 (ref), l_Constants_0 (ref), l_LocalPlayer_0 (ref), v86 (copy), l_RbxAnalyticsService_0 (ref)
                    if v88 and v89 and v89.Text ~= "" then
                        v88.ImageTransparency = 1;
                        v89.Text = "";
                        if v54() then
                            v89.Text = if l_FFlagConnectionsToFriendsRename_0 then v73[l_RobloxLocaleId_0]:Format(l_Constants_0.AddFriendLocalizedKey) else v73[l_RobloxLocaleId_0]:Format(l_Constants_0.AddConnectionLocalizedKey);
                        end;
                        if l_LocalPlayer_0 and v86 then
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                                category = "Game"
                            });
                            l_LocalPlayer_0:RequestFriendship(v86);
                        end;
                    end;
                end;
                local v91, v92 = v17:MakeStyledButton("FriendStatus", if l_FFlagConnectionsToFriendsRename_0 then v73[l_RobloxLocaleId_0]:Format(l_Constants_0.AddFriendLocalizedKey) else v73[l_RobloxLocaleId_0]:Format(l_Constants_0.AddConnectionLocalizedKey), UDim2.new(0, 182, 0, v48.ButtonHeight), v90);
                v88 = v91;
                v89 = v92;
                v89.ZIndex = 3;
                v89.Position = v89.Position + UDim2.new(0, 0, 0, 1);
            end;
            if v88 then
                v88.Name = "FriendStatus";
                v88.ZIndex = 3;
                local v93 = UDim2.new(0, 150, 0, v48.ButtonHeight);
                v88.Size = v93;
                v93 = UDim2.new(1, -198, 0, 7);
                v88.Position = v93;
                if v89 then
                    v93 = UDim2.new(0, 0, 0, 0);
                    v89.Position = v93;
                end;
            end;
            return v88;
        end;
    end;
    local function v106(v95, v96) --[[ Line: 278 ]] --[[ Name: createFriendStatusImageLabel ]]
        -- upvalues: v17 (ref), v48 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        if v95 == Enum.FriendStatus.Friend or v95 == Enum.FriendStatus.FriendRequestSent then
            local v97 = "icons/menu/friends";
            local v98 = 0;
            if v95 ~= Enum.FriendStatus.Friend then
                v97 = "icons/actions/friends/friendAdd";
                v98 = 0.5;
            end;
            local v99, _ = v17:MakeStyledImageButton("FriendStatus", v97, UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight), UDim2.new(0, 28, 0, 28));
            v99.Name = "FriendStatus";
            v99.Selectable = false;
            v99.FriendStatusTextLabel.TextTransparency = v98;
            return v99;
        elseif v95 == Enum.FriendStatus.Unknown or v95 == Enum.FriendStatus.NotFriend or v95 == Enum.FriendStatus.FriendRequestReceived then
            local v101 = nil;
            local v102 = nil;
            local function v103() --[[ Line: 304 ]]
                -- upvalues: v101 (ref), v102 (ref), l_LocalPlayer_0 (ref), v96 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
                if v101 and v102 and v101.ImageTransparency ~= 1 then
                    v101.ImageTransparency = 1;
                    v102.TextTransparency = 1;
                    if l_LocalPlayer_0 and v96 then
                        l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                            category = "Game"
                        });
                        l_LocalPlayer_0:RequestFriendship(v96);
                    end;
                end;
            end;
            local v104, v105 = v17:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight), UDim2.new(0, 28, 0, 28), v103);
            v101 = v104;
            v102 = v105;
            v101.Name = "FriendStatus";
            v101.Selectable = true;
            return v101;
        else
            return nil;
        end;
    end;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    local v110 = nil;
    local v111 = {};
    local v112 = v26.new(l_RbxAnalyticsService_0, "Players");
    local v113 = nil;
    local v114 = false;
    local v115 = nil;
    local v116 = {};
    local v117 = nil;
    local v118 = nil;
    v115 = function() --[[ Line: 349 ]]
        -- upvalues: l_NewPage_0 (copy), v66 (ref), v116 (ref)
        return l_NewPage_0.Page.AbsoluteSize.X < v66 * #v116;
    end;
    v113 = function() --[[ Line: 353 ]]
        -- upvalues: v116 (ref), v107 (ref), v108 (ref), v109 (ref), v57 (ref), v110 (ref), v114 (ref), v115 (ref), v117 (ref), v67 (ref), v118 (ref), v59 (ref)
        v116 = {};
        if v107 then
            table.insert(v116, v107);
        end;
        if v108 then
            table.insert(v116, v108);
        end;
        if v109 then
            table.insert(v116, v109);
        end;
        if v57() and v110 then
            table.insert(v116, v110);
        end;
        v114 = v115();
        if #v116 > 0 then
            local v119 = UDim2.new(1 / #v116, 0, 0, 52);
            local v120 = {
                Size = UDim2.new(1, (#v116 - 1) * -20, 0, 52), 
                AutomaticSize = Enum.AutomaticSize.None
            };
            local v121 = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            };
            if v114 then
                v119 = UDim2.new(1, 0, 0, 52);
                v120 = {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                v121 = {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 16)
                };
            end;
            local v122 = 1;
            for _, v124 in v116 do
                v124.Size = v119;
                v124.Parent = v117;
                v124.LayoutOrder = v122;
                v122 = v122 + 1;
            end;
            for v125, v126 in v121 do
                if v67() then
                    if v118 then
                        v118[v125] = v126;
                    end;
                else
                    v118[v125] = v126;
                end;
            end;
            for v127, v128 in v120 do
                if v67() then
                    if v117 then
                        v117[v127] = v128;
                    end;
                else
                    v117[v127] = v128;
                end;
            end;
            return;
        else
            if v59 then
                if v117 then
                    v117:Destroy();
                    v117 = nil;
                    return;
                end;
            else
                v117:Destroy();
                v117 = nil;
            end;
            return;
        end;
    end;
    local function _(v129) --[[ Line: 444 ]] --[[ Name: getDisplayNameLabel ]]
        if v129 and v129.Parent then
            return v129:FindFirstChild("DisplayNameLabel");
        else
            return nil;
        end;
    end;
    local function _(v131) --[[ Line: 451 ]] --[[ Name: getInExperienceCombinedName ]]
        if #v131 == 0 then
            return "";
        else
            local v132 = v131[1];
            if v132 == nil then
                return "";
            else
                local l_names_0 = v132.names;
                if l_names_0 == nil then
                    return "";
                else
                    return l_names_0.getInExperienceCombinedName(false);
                end;
            end;
        end;
    end;
    local function v144(v135, v136, v137, v138) --[[ Line: 466 ]] --[[ Name: resizeFriendButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v29 (ref), v106 (copy), v94 (copy), v17 (ref)
        local l_FriendStatus_0 = v135:FindFirstChild("FriendStatus");
        if l_FriendStatus_0 and v137 == v138 then
            return;
        else
            if l_FriendStatus_0 then
                l_FriendStatus_0:Destroy();
                l_FriendStatus_0 = nil;
            end;
            local v140 = nil;
            if v136 and v136 ~= l_LocalPlayer_0 and v136.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 175 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v136 (copy)
                    return l_LocalPlayer_0:GetFriendStatus(v136);
                end);
                v140 = if l_status_2 then l_result_2 else Enum.FriendStatus.NotFriend;
            end;
            if v29:IsPlayerBlockedByUserId(v136.UserId) == false then
                l_FriendStatus_0 = if v137 then v106(v140, v136) else v94(v140, v136);
            end;
            if l_FriendStatus_0 then
                l_FriendStatus_0.Name = "FriendStatus";
                l_FriendStatus_0.LayoutOrder = 5;
                l_FriendStatus_0.Selectable = true;
                local v143 = "utility-focus-state" .. "-friendstatuslabel-" .. v136.Name;
                v17:MakeFocusState(l_FriendStatus_0, v143);
                l_FriendStatus_0.Parent = v135;
            end;
            return;
        end;
    end;
    local function v150(v145, v146) --[[ Line: 500 ]] --[[ Name: friendStatusCreate ]]
        -- upvalues: l_GuiService_0 (ref), v107 (ref), v144 (copy), v17 (ref)
        local v147 = nil;
        if v145 then
            v147 = v145:FindFirstChild("RightSideButtons");
        end;
        if v147 then
            for _, v149 in pairs(v147:GetChildren()) do
                if v149 and v149.Name == "FriendStatus" then
                    if l_GuiService_0.SelectedCoreObject == v149 then
                        l_GuiService_0.SelectedCoreObject = v107;
                    end;
                    v149:Destroy();
                end;
            end;
            v144(v147, v146, v17:IsPortrait(), nil);
        end;
    end;
    l_LocalPlayer_0.FriendStatusChanged:connect(function(v151, _) --[[ Line: 522 ]]
        -- upvalues: l_NewPage_0 (copy), v150 (copy)
        if v151 then
            local l_FirstChild_0 = l_NewPage_0.Page:FindFirstChild("PlayerLabel" .. v151.Name);
            if l_FirstChild_0 then
                v150(l_FirstChild_0, v151);
            end;
        end;
    end);
    local v154 = nil;
    local v155 = nil;
    local v156 = v28.new(l_LocalPlayer_0.UserId, {
        EventStream = l_RbxAnalyticsService_0
    });
    local function v171(v157, v158, v159, _) --[[ Line: 535 ]] --[[ Name: createBlockButton ]]
        -- upvalues: v29 (ref), v154 (ref), v144 (copy), v155 (ref), l_GuiService_0 (ref), v25 (ref), v156 (copy), l_Constants_0 (ref), v17 (ref), v23 (ref), v48 (ref)
        local v161 = v29:IsPlayerBlockedByUserId(v158.UserId);
        local function _(v162) --[[ Line: 538 ]] --[[ Name: updateBlockButton ]]
            -- upvalues: v154 (ref), v157 (copy), v158 (copy), v159 (copy), v144 (ref), v155 (ref)
            local v163 = v154(v157, v158, v159, not v159);
            v144(v157, v158, v159, not v159);
            if v162 then
                v155(v163);
            end;
        end;
        local function v168() --[[ Line: 546 ]] --[[ Name: blockUser ]]
            -- upvalues: l_GuiService_0 (ref), v25 (ref), v158 (copy), v156 (ref), l_Constants_0 (ref), v154 (ref), v157 (copy), v159 (copy), v144 (ref), v155 (ref)
            local v165 = true;
            if l_GuiService_0.SelectedCoreObject == nil then
                v165 = l_GuiService_0.SelectedObject ~= nil;
            end;
            v25(v158, v156, l_Constants_0.AnalyticsInGameMenuName):andThen(function() --[[ Line: 548 ]]
                -- upvalues: v165 (copy), v154 (ref), v157 (ref), v158 (ref), v159 (ref), v144 (ref), v155 (ref)
                local l_v165_0 = v165;
                local v167 = v154(v157, v158, v159, not v159);
                v144(v157, v158, v159, not v159);
                if l_v165_0 then
                    v155(v167);
                end;
            end);
        end;
        local function v170() --[[ Line: 553 ]] --[[ Name: unBlockUser ]]
            -- upvalues: v29 (ref), v158 (copy), v156 (ref), v154 (ref), v157 (copy), v159 (copy), v144 (ref)
            if v29:UnblockPlayerAsync(v158) then
                v156:action("SettingsHub", "unblockUser", {
                    blockeeUserId = v158.UserId
                });
                local _ = v154(v157, v158, v159, not v159);
                v144(v157, v158, v159, not v159);
            end;
        end;
        if v161 then
            return v17:MakeStyledButton("BlockButton", v23:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, v48.ButtonHeight), v170);
        else
            return v17:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight), UDim2.new(0, 28, 0, 28), v168);
        end;
    end;
    v155 = function(v172) --[[ Line: 582 ]] --[[ Name: trySelection ]]
        -- upvalues: l_GuiService_0 (ref)
        if v172 and not v172.Selectable then
            l_GuiService_0:Select(v172);
            return;
        else
            l_GuiService_0.SelectedCoreObject = v172;
            return;
        end;
    end;
    v154 = function(v173, v174, v175, v176) --[[ Line: 590 ]] --[[ Name: resizeBlockButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v171 (copy), v17 (ref)
        local l_BlockButton_0 = v173:FindFirstChild("BlockButton");
        if l_BlockButton_0 and v175 == v176 then
            return l_BlockButton_0;
        else
            if l_BlockButton_0 then
                l_BlockButton_0:Destroy();
                l_BlockButton_0 = nil;
            end;
            if v174 and v174 ~= l_LocalPlayer_0 and v174.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                l_BlockButton_0 = v171(v173, v174, v175, v176);
            end;
            if l_BlockButton_0 then
                l_BlockButton_0.Name = "BlockButton";
                l_BlockButton_0.LayoutOrder = 4;
                l_BlockButton_0.Selectable = true;
                local v178 = "utility-focus-state" .. "-blockbutton-" .. v174.Name;
                v17:MakeFocusState(l_BlockButton_0, v178);
                l_BlockButton_0.Parent = v173;
            end;
            return l_BlockButton_0;
        end;
    end;
    local v179 = false;
    local v180 = false;
    local function v195(v181, v182) --[[ Line: 619 ]] --[[ Name: muteButtonUpdate ]]
        -- upvalues: l_MuteStatusIcons_0 (ref), v62 (ref), l_game_EngineFeature_1 (ref), l_default_0 (ref), v111 (copy), v17 (ref), v48 (ref), v112 (copy), v27 (ref)
        local v183 = nil;
        if v181 then
            v183 = v181:FindFirstChild("RightSideButtons");
        end;
        if not v183 then
            return;
        else
            local l_MuteStatusButton_0 = v183:FindFirstChild("MuteStatusButton");
            if v182 == nil then
                if l_MuteStatusButton_0 then
                    l_MuteStatusButton_0:Destroy();
                end;
                return;
            else
                local v185 = UDim2.fromOffset(36, 36);
                local v186 = UDim2.fromOffset(0, 0);
                local v187 = 0;
                local v188 = v182.isMuted and l_MuteStatusIcons_0.MicOff or l_MuteStatusIcons_0.MicOn;
                if v182.subscriptionFailed then
                    v188 = l_MuteStatusIcons_0.Error;
                    v185 = UDim2.fromOffset(36, 36);
                    v186 = UDim2.fromOffset(2, -2);
                    if v62 and l_game_EngineFeature_1 then
                        v187 = 0.5;
                    end;
                elseif v182.isMutedLocally then
                    v188 = l_MuteStatusIcons_0.MicDisabled;
                    v187 = 0.5;
                elseif not v182.subscriptionCompleted then
                    v188 = l_MuteStatusIcons_0.Loading;
                elseif v182.isSignalActive then
                    local v189 = math.floor(0.5 + 5 * math.random()) * 20;
                    v188 = l_default_0:GetIcon("Unmuted" .. tostring(v189), "SpeakerLight");
                end;
                if l_MuteStatusButton_0 then
                    local v190 = v111[v182.userId] or v183:FindFirstChild("MuteStatusImageLabel", true);
                    v190.Image = v188;
                    v190.Size = v185;
                    v190.ImageTransparency = v187;
                    return;
                else
                    if l_default_0.voiceUIVisible then
                        local v192, v193 = v17:MakeStyledImageButton("MuteStatus", v188, UDim2.fromOffset(v48.ButtonHeight, v48.ButtonHeight), v185, function() --[[ Line: 679 ]]
                            -- upvalues: l_default_0 (ref), v182 (copy), v112 (ref), v27 (ref), v62 (ref), l_game_EngineFeature_1 (ref)
                            local v191 = l_default_0.participants[tostring(v182.userId)];
                            if v191.subscriptionCompleted then
                                if v112 then
                                    v112:onToggleMutePlayer(v182.userId, not v191.isMutedLocally);
                                end;
                                l_default_0:ToggleMutePlayer(v182.userId, v27.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                                return;
                            else
                                if v191.subscriptionFailed then
                                    if v62 then
                                        if not l_game_EngineFeature_1 then
                                            l_default_0:SubscribeRetry(v182.userId);
                                            return;
                                        end;
                                    else
                                        l_default_0:SubscribeRetry(v182.userId);
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v111[v182.userId] = v193;
                        v193.ZIndex = 3;
                        v193.Position = v193.Position + v186;
                        v193.ImageTransparency = v187;
                        local v194 = "utility-focus-state" .. "-mutestatusbutton-" .. v182.userId;
                        v17:MakeFocusState(v192, v194);
                        v192.Parent = v183;
                    end;
                    return;
                end;
            end;
        end;
    end;
    local v196 = l_Create_0("Frame")({
        Name = "ButtonsContainer", 
        Size = UDim2.new(1, 0, 0, v48.ButtonHeight), 
        BackgroundTransparency = 1, 
        Parent = l_NewPage_0.Page, 
        Visible = false
    });
    l_NewPage_0.ButtonsContainer = v196;
    if v40 and (v41 == 1 or v41 == 3) then
        v196.Parent = nil;
    end;
    l_Create_0("UIPadding")({
        PaddingBottom = UDim.new(0, 1), 
        PaddingTop = UDim.new(0, 1), 
        PaddingLeft = UDim.new(0, 1), 
        PaddingRight = UDim.new(0, 1), 
        Parent = v196
    });
    local function v197() --[[ Line: 736 ]]
        -- upvalues: v55 (ref), l_NewPage_0 (copy), v27 (ref)
        if v55() and l_NewPage_0.HubRef.leaveGameUpsellProp ~= v27.PHONE_UPSELL_VALUE_PROP.None then
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGameUpsellPage, nil, 1, true);
            return;
        else
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGamePage, false, 1);
            return;
        end;
    end;
    local v198, v199 = v17:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -12, 1, 0), v197);
    v198.AnchorPoint = Vector2.new(0, 0);
    v198.Position = UDim2.new(0, 0, 0, 0);
    v199.Size = UDim2.new(1, -4, 1, 0);
    v199.Position = UDim2.new(0, 2, 0, 0);
    l_Create_0("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Parent = v198
    });
    l_Create_0("UIPadding")({
        PaddingLeft = UDim.new(0.025, 0), 
        Parent = v198
    });
    v199.Size = UDim2.new(0, 0, 1, 0);
    l_Create_0("UIFlexItem")({
        FlexMode = Enum.UIFlexMode.Grow, 
        Parent = v199
    });
    if not v40 or v41 == 0 then
        v198.Parent = v196;
    end;
    local function v200() --[[ Line: 779 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.ResetCharacterPage, false, 1);
    end;
    local v201 = v73[l_RobloxLocaleId_0]:Format(l_Constants_0.RespawnLocalizedKey);
    local v202, v203 = v17:MakeStyledButton("ResetButton", v201, UDim2.new(0.3333333333333333, -12, 1, 0), v200);
    v202.AnchorPoint = Vector2.new(0.5, 0);
    v202.Position = UDim2.new(0.5, 0, 0, 0);
    v203.Size = UDim2.new(1, -4, 1, 0);
    v203.Position = UDim2.new(0, 2, 0, 0);
    if not v40 or v41 == 0 then
        v202.Parent = v196;
    end;
    local function v204() --[[ Line: 796 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        l_NewPage_0.HubRef:SetVisibility(false);
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
            source = l_Constants_0.AnalyticsResumeButtonSource, 
            playsessionid = l_NewPage_0.playSessionId, 
            universeid = tostring(game.GameId)
        });
    end;
    local v205, v206 = v17:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -12, 1, 0), v204);
    v205.AnchorPoint = Vector2.new(1, 0);
    v205.Position = UDim2.new(1, 0, 0, 0);
    v206.Size = UDim2.new(1, -4, 1, 0);
    v206.Position = UDim2.new(0, 2, 0, 0);
    if not v40 or v41 == 0 then
        v205.Parent = v196;
        if l_FFlagIEMTabFocusNav_0 then
            l_NewPage_0.FirstSelectableObjects = {
                v205, 
                v202, 
                v198
            };
            l_NewPage_0.FirstSelectableObjectsUpdated:fire();
        end;
    end;
    local function v210() --[[ Line: 828 ]] --[[ Name: pollImage ]]
        -- upvalues: l_default_0 (ref), l_PlayerMuteStatusIcons_0 (ref)
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            return l_PlayerMuteStatusIcons_0.Loading;
        elseif l_localMuted_0 then
            return l_PlayerMuteStatusIcons_0.MicOff;
        elseif l_default_0.isTalking then
            local v209 = math.floor(0.5 + 5 * math.random()) * 20;
            return (l_default_0:GetIcon("Unmuted" .. tostring(v209), "MicLight"));
        else
            return l_PlayerMuteStatusIcons_0.MicOn;
        end;
    end;
    local function _(v211, v212, v213, v214) --[[ Line: 845 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v196 (copy)
        local l_v196_FirstChild_0 = v196:FindFirstChild(v211 .. "Button", true);
        if not l_v196_FirstChild_0 then
            return;
        else
            l_v196_FirstChild_0.Position = v212;
            l_v196_FirstChild_0.Size = v213;
            l_v196_FirstChild_0.AnchorPoint = v214;
            return;
        end;
    end;
    local function _() --[[ Line: 857 ]] --[[ Name: muteButtonReset ]]
        -- upvalues: v196 (copy)
        local l_v196_FirstChild_1 = v196:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v196_FirstChild_1 then
            l_v196_FirstChild_1:Destroy();
        end;
    end;
    local function v224() --[[ Line: 864 ]] --[[ Name: resetButtonRow ]]
        -- upvalues: v40 (ref), v41 (ref), v196 (copy)
        if not v40 or v41 == 0 then
            local v219 = UDim2.new(1, 0, 0, 0);
            local v220 = UDim2.new(0.3333333333333333, -12, 1, 0);
            local v221 = Vector2.new(1, 0);
            local l_v196_FirstChild_2 = v196:FindFirstChild("ResumeButtonButton", true);
            if l_v196_FirstChild_2 then
                l_v196_FirstChild_2.Position = v219;
                l_v196_FirstChild_2.Size = v220;
                l_v196_FirstChild_2.AnchorPoint = v221;
            end;
            v219 = UDim2.new(0.5, 0, 0, 0);
            v220 = UDim2.new(0.3333333333333333, -12, 1, 0);
            v221 = Vector2.new(0.5, 0);
            l_v196_FirstChild_2 = v196:FindFirstChild("ResetButtonButton", true);
            if l_v196_FirstChild_2 then
                l_v196_FirstChild_2.Position = v219;
                l_v196_FirstChild_2.Size = v220;
                l_v196_FirstChild_2.AnchorPoint = v221;
            end;
            v219 = UDim2.new(0, 0, 0, 0);
            v220 = UDim2.new(0.3333333333333333, -12, 1, 0);
            v221 = Vector2.new(0, 0);
            l_v196_FirstChild_2 = v196:FindFirstChild("LeaveButtonButton", true);
            if l_v196_FirstChild_2 then
                l_v196_FirstChild_2.Position = v219;
                l_v196_FirstChild_2.Size = v220;
                l_v196_FirstChild_2.AnchorPoint = v221;
            end;
        end;
        local l_v196_FirstChild_3 = v196:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v196_FirstChild_3 then
            l_v196_FirstChild_3:Destroy();
        end;
    end;
    local function _() --[[ Line: 888 ]] --[[ Name: updateMuteSelfButtonIcon ]]
        -- upvalues: v67 (ref), v117 (ref), v210 (copy)
        local v225 = nil;
        if v67() then
            if v117 then
                v225 = v117:FindFirstChild("MuteSelfButtonImageLabel", true);
            end;
        else
            v225 = v117:FindFirstChild("MuteSelfButtonImageLabel", true);
        end;
        if not v225 then
            return;
        else
            v225.Image = v210();
            return;
        end;
    end;
    v17:OnResized(v196, function(_, v228) --[[ Line: 905 ]]
        -- upvalues: v17 (ref), v48 (ref), v196 (copy), v40 (ref), v41 (ref), v203 (copy), v199 (copy), v206 (copy)
        if (v228 or v17:IsSmallTouchScreen()) and not v48.AlwaysShowBottomBar() then
            local v229 = v228 and v48.textSize(18) or v48.textSize(24);
            if v48.UseBiggerText then
                v229 = v48.textSize(20);
            end;
            v196.Visible = not v48.EnableVerticalBottomBar;
            v196.Size = UDim2.new(1, 0, 0, v48.ButtonHeight);
            if not v40 or v41 == 0 then
                v203.TextSize = v229;
                v199.TextSize = v229;
                v206.TextSize = v229;
                return;
            end;
        else
            v196.Visible = false;
            v196.Size = UDim2.new(1, 0, 0, 0);
        end;
    end);
    local function v237(v230, v231) --[[ Line: 924 ]] --[[ Name: reportAbuseButtonCreate ]]
        -- upvalues: l_LocalPlayer_0 (ref), v19 (ref), v17 (ref), v48 (ref)
        local l_RightSideButtons_0 = v230:FindFirstChild("RightSideButtons");
        if l_RightSideButtons_0 then
            local l_ReportPlayer_0 = l_RightSideButtons_0:FindFirstChild("ReportPlayer");
            if l_ReportPlayer_0 then
                l_ReportPlayer_0:Destroy();
            end;
            if v231 and v231 ~= l_LocalPlayer_0 and v231.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local function v234() --[[ Line: 933 ]]
                    -- upvalues: v19 (ref), v231 (copy)
                    v19:ReportPlayer(v231, "MenuPlayerList");
                end;
                local v235 = v17:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight), UDim2.new(0, 28, 0, 28), v234);
                v235.Name = "ReportPlayer";
                v235.Position = UDim2.new(1, -260, 0, 7);
                v235.LayoutOrder = 3;
                v235.Selectable = true;
                local v236 = "utility-focus-state" .. "-reportplayer-" .. v231.Name;
                v17:MakeFocusState(v235, v236);
                v235.Parent = l_RightSideButtons_0;
            end;
        end;
    end;
    local v238 = nil;
    local v239 = nil;
    local v240 = nil;
    local v241 = nil;
    local v242 = nil;
    local v243 = false;
    local v244 = nil;
    local function _() --[[ Line: 964 ]] --[[ Name: muteAllButtonRemove ]]
        -- upvalues: v108 (ref), v113 (ref)
        if v108 then
            v108.Visible = false;
            v108:Destroy();
            v108 = nil;
        end;
        v113();
    end;
    local function _() --[[ Line: 973 ]] --[[ Name: muteSelfButtonRemove ]]
        -- upvalues: v109 (ref), v244 (ref), v113 (ref)
        if v109 then
            v109.Visible = false;
            v109:Destroy();
            v109 = nil;
        end;
        if v244 then
            v244:Disconnect();
            v244 = nil;
        end;
        v113();
    end;
    local function _() --[[ Line: 986 ]] --[[ Name: joinVoiceButtonRemove ]]
        -- upvalues: v110 (ref), v113 (ref)
        if v110 then
            v110.Visible = false;
            v110:Destroy();
            v110 = nil;
        end;
        v113();
    end;
    local function v248() --[[ Line: 995 ]] --[[ Name: shouldShowJoinVoiceButton ]]
        -- upvalues: v57 (ref), v243 (ref), v69 (ref), l_default_0 (ref)
        return v57() and game:GetEngineFeature("VoiceChatSupported") and not v243 and not v69 and l_default_0:verifyUniverseAndPlaceCanUseVoice() and l_default_0:ShouldShowJoinVoiceOnDisconnect() and l_default_0:GetVoiceConnectCookie() == "" and l_default_0:HasSeamlessVoiceFeature("InitialJoinVoice");
    end;
    local function v256(v249, v250, v251) --[[ Line: 1006 ]] --[[ Name: createRow ]]
        -- upvalues: v48 (ref), l_Create_0 (ref)
        local v252 = Instance.new(v249);
        v252.Size = UDim2.new(1, 0, 0, 62);
        v252.Position = UDim2.new(0, 0, 0, 0);
        v252.ZIndex = 2;
        v252.BackgroundColor3 = v48.color("PlayerRowFrame");
        v252.BackgroundTransparency = v48.transparency("PlayerRowFrame");
        l_Create_0("UICorner")({
            CornerRadius = v48.DefaultCornerRadius, 
            Parent = v252
        });
        local v253 = nil;
        if v251 then
            v253 = Instance.new("TextLabel");
            v253.TextColor3 = Color3.new(1, 1, 1);
            v253.TextSize = 24;
        else
            v253 = Instance.new("ImageLabel");
        end;
        v253.Name = "Icon";
        v253.BackgroundTransparency = 1;
        v253.Size = UDim2.new(0, 36, 0, 36);
        v253.Position = UDim2.new(0, 12, 0, 12);
        v253.ZIndex = 3;
        v253.Parent = v252;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        l_TextLabel_0.Font = v48.font(Enum.Font.SourceSans, "DisplayName");
        l_TextLabel_0.FontSize = v250 and v48.fontSize(Enum.FontSize.Size36, "DisplayName") or v48.fontSize(Enum.FontSize.Size24, "DisplayName");
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.Position = v250 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0);
        l_TextLabel_0.Size = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.ZIndex = 3;
        l_TextLabel_0.Parent = v252;
        if v250 then
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Text = "";
            l_TextLabel_1.Name = "SecondRow";
            l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
            l_TextLabel_1.Font = v48.font(Enum.Font.SourceSans);
            l_TextLabel_1.FontSize = v48.fontSize(Enum.FontSize.Size24, "Username");
            l_TextLabel_1.TextColor3 = Color3.fromRGB(162, 162, 162);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.Position = UDim2.new(0, 60, 0.5, 12);
            l_TextLabel_1.Size = UDim2.new(0, 0, 0, 0);
            l_TextLabel_1.ZIndex = 3;
            l_TextLabel_1.Parent = v252;
        end;
        return v252;
    end;
    v238 = function() --[[ Line: 1065 ]]
        -- upvalues: v256 (copy), v243 (ref), v57 (ref), v248 (copy), v50 (ref), v48 (ref), v73 (copy), l_RobloxLocaleId_0 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), l_Constants_0 (ref), l_uiblox_0 (ref), v32 (ref), v17 (ref)
        local v257 = v256("ImageButton", nil, true);
        v257.Size = UDim2.new(1, 0, 0, 52);
        local l_TextLabel_2 = v257.TextLabel;
        local l_Icon_0 = v257.Icon;
        if v243 or v57() and v248() then
            v257.Size = v50;
            l_TextLabel_2.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd;
            v257.AnchorPoint = Vector2.new(0, 0);
        end;
        l_TextLabel_2.Font = v48.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_2.AutoLocalize = false;
        l_TextLabel_2.Text = v73[l_RobloxLocaleId_0]:Format(if l_FFlagConnectionsToFriendsRename_0 then l_Constants_0.InviteFriendsLocalizedKey else l_Constants_0.InviteConnectionsLocalizedKey);
        l_Icon_0.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_0.Position = UDim2.new(0, 18, 0.5, 0);
        local v260 = l_uiblox_0["icons/actions/friends/friendInvite"];
        local v261 = if v260 then l_uiblox_0["icons/actions/friends/friendInvite"] else v48.Images["icons/actions/friends/friendInvite"];
        if v261 then
            if v260 then
                l_Icon_0.Text = v261.name;
                l_Icon_0.FontFace = v32.Font[v261.variant];
            else
                l_Icon_0.Image = v261.Image;
                l_Icon_0.ImageRectOffset = v261.ImageRectOffset;
                l_Icon_0.ImageRectSize = v261.ImageRectSize;
            end;
        end;
        local function _(v262) --[[ Line: 1099 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v257 (copy)
            if v262 then
                v257.ImageTransparency = 0.65;
                return;
            else
                v257.ImageTransparency = 0.85;
                return;
            end;
        end;
        v257.InputBegan:Connect(function() --[[ Line: 1107 ]]
            -- upvalues: v257 (copy)
            v257.ImageTransparency = 0.65;
        end);
        v257.InputEnded:Connect(function() --[[ Line: 1110 ]]
            -- upvalues: v257 (copy)
            v257.ImageTransparency = 0.85;
        end);
        v257.Activated:Connect(function() --[[ Line: 1113 ]]
            -- upvalues: v257 (copy)
            v257.ImageTransparency = 0.85;
        end);
        v257.TouchPan:Connect(function(_, v265) --[[ Line: 1116 ]]
            -- upvalues: v257 (copy)
            if math.abs(v265.Y) > 20 then
                v257.ImageTransparency = 0.85;
            end;
        end);
        v257.SelectionGained:connect(function() --[[ Line: 1122 ]]
            -- upvalues: v257 (copy)
            v257.ImageTransparency = 0.65;
        end);
        v257.SelectionLost:connect(function() --[[ Line: 1125 ]]
            -- upvalues: v257 (copy)
            v257.ImageTransparency = 0.85;
        end);
        v257.SelectionImageObject = v257:Clone();
        v17:MakeFocusState(v257, "utility-focus-state-sharegame");
        return v257;
    end;
    v239 = function() --[[ Line: 1136 ]]
        -- upvalues: v256 (copy), v107 (ref), v48 (ref), v23 (ref), l_default_0 (ref), v17 (ref)
        local v266 = v256("ImageButton");
        v266.Size = UDim2.new(v107 and 0.5 or 1, -10, 0, 52);
        v266.Position = UDim2.new(1, 0, 0, 0);
        v266.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_3 = v266.TextLabel;
        local l_Icon_1 = v266.Icon;
        l_TextLabel_3.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_3.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_3.Font = v48.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_3.AutoLocalize = false;
        l_TextLabel_3.Text = v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
        l_Icon_1.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_1.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_1.Image = l_default_0:GetIcon("UnmuteAll", "Misc");
        l_Icon_1.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_1.Position = UDim2.new(0, 18, 0.5, 0);
        local function _(v269) --[[ Line: 1156 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v266 (copy)
            if v269 then
                v266.ImageTransparency = 0.65;
                return;
            else
                v266.ImageTransparency = 0.85;
                return;
            end;
        end;
        v266.InputBegan:Connect(function() --[[ Line: 1164 ]]
            -- upvalues: v266 (copy)
            v266.ImageTransparency = 0.65;
        end);
        v266.InputEnded:Connect(function() --[[ Line: 1167 ]]
            -- upvalues: v266 (copy)
            v266.ImageTransparency = 0.85;
        end);
        v266.Activated:Connect(function() --[[ Line: 1170 ]]
            -- upvalues: v266 (copy)
            v266.ImageTransparency = 0.85;
        end);
        v266.TouchPan:Connect(function(_, v272) --[[ Line: 1173 ]]
            -- upvalues: v266 (copy)
            if math.abs(v272.Y) > 20 then
                v266.ImageTransparency = 0.85;
            end;
        end);
        v266.SelectionGained:connect(function() --[[ Line: 1179 ]]
            -- upvalues: v266 (copy)
            v266.ImageTransparency = 0.65;
        end);
        v266.SelectionLost:connect(function() --[[ Line: 1182 ]]
            -- upvalues: v266 (copy)
            v266.ImageTransparency = 0.85;
        end);
        v266.SelectionImageObject = v266:Clone();
        v17:MakeFocusState(v266, "utility-focus-state-muteall");
        return v266;
    end;
    v240 = function() --[[ Line: 1193 ]]
        -- upvalues: v256 (copy), v48 (ref), v210 (copy), v17 (ref), v73 (copy), l_RobloxLocaleId_0 (copy), l_default_0 (ref), v244 (ref), v179 (ref), v67 (ref), v117 (ref), v112 (copy), v109 (ref)
        local v273 = v256("ImageButton");
        v273.Name = "MuteSelfButton";
        v273.Size = UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight);
        v273.Position = UDim2.new(1, 0, 0, 0);
        v273.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_4 = v273.TextLabel;
        local l_Icon_2 = v273.Icon;
        l_TextLabel_4.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_4.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_4.Font = v48.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_4.AutoLocalize = false;
        l_Icon_2.Name = "MuteSelfButtonImageLabel";
        l_Icon_2.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_2.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_2.Image = v210();
        l_Icon_2.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_2.Position = UDim2.new(0, 18, 0.5, 0);
        local function _(v276) --[[ Line: 1214 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v273 (copy)
            if v276 then
                v273.ImageTransparency = 0.65;
                return;
            else
                v273.ImageTransparency = 0.85;
                return;
            end;
        end;
        v273.InputBegan:Connect(function() --[[ Line: 1222 ]]
            -- upvalues: v273 (copy)
            v273.ImageTransparency = 0.65;
        end);
        v273.InputEnded:Connect(function() --[[ Line: 1225 ]]
            -- upvalues: v273 (copy)
            v273.ImageTransparency = 0.85;
        end);
        v273.Activated:Connect(function() --[[ Line: 1228 ]]
            -- upvalues: v273 (copy)
            v273.ImageTransparency = 0.85;
        end);
        v273.TouchPan:Connect(function(_, v279) --[[ Line: 1231 ]]
            -- upvalues: v273 (copy)
            if math.abs(v279.Y) > 20 then
                v273.ImageTransparency = 0.85;
            end;
        end);
        v273.SelectionGained:connect(function() --[[ Line: 1237 ]]
            -- upvalues: v273 (copy)
            v273.ImageTransparency = 0.65;
        end);
        v273.SelectionLost:connect(function() --[[ Line: 1240 ]]
            -- upvalues: v273 (copy)
            v273.ImageTransparency = 0.85;
        end);
        v273.SelectionImageObject = v273:Clone();
        v17:MakeFocusState(v273, "utility-focus-state-playermute");
        local function _(v280) --[[ Line: 1248 ]] --[[ Name: updatePlayerMuteText ]]
            -- upvalues: l_TextLabel_4 (copy), v73 (ref), l_RobloxLocaleId_0 (ref)
            local v281 = v280 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
            l_TextLabel_4.Text = v73[l_RobloxLocaleId_0]:Format(v281);
        end;
        local v283 = l_default_0.localMuted and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
        l_TextLabel_4.Text = v73[l_RobloxLocaleId_0]:Format(v283);
        v244 = l_default_0.muteChanged.Event:Connect(function(v284) --[[ Line: 1255 ]]
            -- upvalues: v179 (ref), v67 (ref), v117 (ref), v210 (ref), l_TextLabel_4 (copy), v73 (ref), l_RobloxLocaleId_0 (ref)
            v179 = v284;
            local v285 = nil;
            if v67() then
                if v117 then
                    v285 = v117:FindFirstChild("MuteSelfButtonImageLabel", true);
                end;
            else
                v285 = v117:FindFirstChild("MuteSelfButtonImageLabel", true);
            end;
            if v285 then
                v285.Image = v210();
            end;
            v285 = v284 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
            l_TextLabel_4.Text = v73[l_RobloxLocaleId_0]:Format(v285);
        end);
        v273.Activated:Connect(function() --[[ Line: 1261 ]]
            -- upvalues: l_default_0 (ref), v112 (ref), v179 (ref)
            l_default_0:ToggleMic("InGameMenuPlayers");
            if v112 then
                v112:onToggleMuteSelf(v179);
            end;
        end);
        if v67() then
            return v273;
        else
            v109 = v273;
            return;
        end;
    end;
    local function _() --[[ Line: 1276 ]] --[[ Name: addMuteButtonExperience ]]
        -- upvalues: v69 (ref), v67 (ref), v109 (ref), v240 (ref)
        if v69 then
            return;
        elseif v67() then
            v109 = v240();
            return;
        else
            v240();
            return;
        end;
    end;
    if v57() then
        v241 = function() --[[ Line: 1289 ]]
            -- upvalues: v256 (copy), v50 (ref), v48 (ref), v58 (ref), v73 (copy), l_RobloxLocaleId_0 (copy), l_uiblox_0 (ref), v32 (ref), v17 (ref), l_default_0 (ref)
            local v287 = v256("ImageButton", nil, true);
            v287.Size = UDim2.new(1, 0, 0, 52);
            v287.Size = v50;
            v287.AnchorPoint = Vector2.new(0, 0);
            local l_TextLabel_5 = v287.TextLabel;
            l_TextLabel_5.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_5.TextTruncate = Enum.TextTruncate.AtEnd;
            l_TextLabel_5.Font = v48.font(Enum.Font.SourceSansSemibold, "Semibold");
            l_TextLabel_5.AutoLocalize = false;
            if v58 then
                l_TextLabel_5.Text = v73[l_RobloxLocaleId_0]:Format("Feature.SettingsHub.Action.ConnectVoiceChat");
            else
                l_TextLabel_5.Text = "Connect Voice Chat";
            end;
            local l_Icon_3 = v287.Icon;
            l_Icon_3.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_3.Position = UDim2.new(0, 18, 0.5, 0);
            local v290 = l_uiblox_0["icons/controls/publicAudioJoin"];
            local v291 = if v290 then l_uiblox_0["icons/controls/publicAudioJoin"] else v48.Images["icons/controls/publicAudioJoin"];
            if v291 then
                if v290 then
                    l_Icon_3.Text = v291.name;
                    l_Icon_3.FontFace = v32.Font[v291.variant];
                else
                    l_Icon_3.Image = v291.Image;
                    l_Icon_3.ImageRectOffset = v291.ImageRectOffset;
                    l_Icon_3.ImageRectSize = v291.ImageRectSize;
                end;
            end;
            local function _(v292) --[[ Line: 1324 ]] --[[ Name: setIsHighlighted ]]
                -- upvalues: v287 (copy)
                if v292 then
                    v287.ImageTransparency = 0.65;
                    return;
                else
                    v287.ImageTransparency = 0.85;
                    return;
                end;
            end;
            v287.InputBegan:Connect(function() --[[ Line: 1332 ]]
                -- upvalues: v287 (copy)
                v287.ImageTransparency = 0.65;
            end);
            v287.InputEnded:Connect(function() --[[ Line: 1335 ]]
                -- upvalues: v287 (copy)
                v287.ImageTransparency = 0.85;
            end);
            v287.Activated:Connect(function() --[[ Line: 1338 ]]
                -- upvalues: v287 (copy)
                v287.ImageTransparency = 0.85;
            end);
            v287.TouchPan:Connect(function(_, v295) --[[ Line: 1341 ]]
                -- upvalues: v287 (copy)
                if math.abs(v295.Y) > 20 then
                    v287.ImageTransparency = 0.85;
                end;
            end);
            v287.SelectionGained:connect(function() --[[ Line: 1347 ]]
                -- upvalues: v287 (copy)
                v287.ImageTransparency = 0.65;
            end);
            v287.SelectionLost:connect(function() --[[ Line: 1350 ]]
                -- upvalues: v287 (copy)
                v287.ImageTransparency = 0.85;
            end);
            v287.SelectionImageObject = v287:Clone();
            v17:MakeFocusState(v287, "utility-focus-state-joinVoice");
            v287.Activated:Connect(function() --[[ Line: 1358 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:JoinVoice();
            end);
            return v287;
        end;
    end;
    local function _() --[[ Line: 1366 ]] --[[ Name: addJoinVoiceButton ]]
        -- upvalues: v248 (copy), v110 (ref), v241 (ref)
        if not v248() or v110 then
            return;
        else
            v110 = v241();
            return;
        end;
    end;
    local function _(v297) --[[ Line: 1374 ]] --[[ Name: createInspectButtonImage ]]
        -- upvalues: v17 (ref), v48 (ref)
        return (v17:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight), UDim2.new(0, 28, 0, 28), v297));
    end;
    local function v306(v299, v300, v301, v302) --[[ Line: 1385 ]] --[[ Name: resizeInspectButton ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), v17 (ref), v48 (ref)
        local l_Inspect_0 = v299:FindFirstChild("Inspect");
        if l_Inspect_0 and v301 == v302 then
            return;
        else
            if l_Inspect_0 then
                l_Inspect_0:Destroy();
            end;
            local function v304() --[[ Line: 1395 ]]
                -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref), v300 (copy)
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsExamineAvatarName, l_Constants_0.AnalyticsMenuActionName, {
                    playsessionid = l_NewPage_0.playSessionId, 
                    universeid = tostring(game.GameId)
                });
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v300.UserId, "escapeMenu");
                l_NewPage_0.HubRef:SetVisibility(false);
            end;
            l_Inspect_0 = v17:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v48.ButtonHeight, 0, v48.ButtonHeight), UDim2.new(0, 28, 0, 28), v304);
            l_Inspect_0.Name = "Inspect";
            l_Inspect_0.LayoutOrder = 2;
            l_Inspect_0.Selectable = true;
            l_Inspect_0.Parent = v299;
            local v305 = "utility-focus-state" .. "-inspect-" .. v300.Name;
            v17:MakeFocusState(l_Inspect_0, v305);
            return;
        end;
    end;
    local function v315(v307, v308, v309) --[[ Line: 1418 ]] --[[ Name: resizePlatformName ]]
        -- upvalues: l_result_0 (ref), v17 (ref), v48 (ref), l_Create_0 (ref)
        local l_PlatformNameContainer_0 = v307:FindFirstChild("PlatformNameContainer");
        if l_PlatformNameContainer_0 then
            l_PlatformNameContainer_0:Destroy();
            l_PlatformNameContainer_0 = nil;
        end;
        if v308 == nil then
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
            l_PlatformNameContainer_0.Parent = v307;
            local v311 = nil;
            if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v309 and v309 ~= "" then
                v311 = function() --[[ Line: 1451 ]]
                    -- upvalues: l_result_0 (ref), v309 (copy)
                    l_result_0:ShowProfile(v309);
                end;
            end;
            local v312, v313 = v17:MakeStyledButton("consoleNameContainer", v308, UDim2.new(0, 0, 0, v48.ButtonHeight), v311);
            v312.AnchorPoint = Vector2.new(0, 0.5);
            v312.Position = UDim2.fromScale(0, 0.5);
            v312.AutomaticSize = Enum.AutomaticSize.X;
            v312.Parent = l_PlatformNameContainer_0;
            v313.Size = UDim2.fromScale(0, 1);
            v313.AutoLocalize = false;
            v313.TextSize = v48.platformNameTextSize;
            v313.TextScaled = false;
            v313.TextWrapped = false;
            v313.AutomaticSize = Enum.AutomaticSize.X;
            local v314 = l_Create_0("ImageLabel")({
                Name = "iconLabel", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v48.platformNameIconSize, 
                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png", 
                ImageColor3 = Color3.new(1, 1, 1)
            });
            v314.Parent = v312;
            l_Create_0("UIListLayout")({
                Name = "PLatformNameUIListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }).Parent = v312;
            v314.LayoutOrder = 1;
            v313.LayoutOrder = 2;
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                Parent = v312
            });
            return l_PlatformNameContainer_0;
        end;
    end;
    v242 = function() --[[ Line: 1513 ]]
        -- upvalues: v256 (copy), l_FFlagIEMFocusNavToButtons_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_GuiService_0 (ref)
        local v316 = v256("ImageLabel", true);
        v316.TextLabel.Name = "DisplayNameLabel";
        v316.SecondRow.Name = "NameLabel";
        if l_FFlagIEMFocusNavToButtons_0 then
            v316.Selectable = false;
            v316.SelectionGroup = true;
        end;
        if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then
            v316.NameLabel.OpenTypeFeatures = l_OpenTypeSupport_0:getUserNameStylisticAlternative();
        end;
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "RightSideButtons";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.ZIndex = 2;
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_1.Size = UDim2.new(1, -12, 1, 0);
        l_Frame_1.Parent = v316;
        local function _(v318) --[[ Line: 1534 ]]
            -- upvalues: v316 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v316 then
                if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= v318 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                    v316.ImageTransparency = 0.65;
                    return;
                else
                    v316.ImageTransparency = 0.85;
                end;
            end;
        end;
        local v320 = nil;
        l_Frame_1.ChildAdded:connect(function(v321) --[[ Line: 1549 ]]
            -- upvalues: v320 (ref), v316 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v321:IsA("GuiObject") then
                if v320 and v321 ~= v320 then
                    v320:Destroy();
                    v320 = nil;
                end;
                v321.SelectionGained:connect(function() --[[ Line: 1555 ]]
                    -- upvalues: v316 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    if v316 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= nil and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v316.ImageTransparency = 0.65;
                            return;
                        else
                            v316.ImageTransparency = 0.85;
                        end;
                    end;
                end);
                v321.SelectionLost:connect(function() --[[ Line: 1558 ]]
                    -- upvalues: v321 (copy), v316 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    local l_v321_0 = v321;
                    if v316 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= l_v321_0 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v316.ImageTransparency = 0.65;
                            return;
                        else
                            v316.ImageTransparency = 0.85;
                        end;
                    end;
                end);
            end;
        end);
        v320 = Instance.new("Frame");
        v320.Selectable = true;
        v320.Size = UDim2.new(1, 0, 1, 0);
        v320.BackgroundTransparency = 1;
        v320.SelectionImageObject = v320:Clone();
        v320.Parent = l_Frame_1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Name = "RightSideListLayout";
        l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
        l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Right;
        l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = UDim.new(0, 12);
        l_UIListLayout_0.Parent = l_Frame_1;
        pcall(function() --[[ Line: 1580 ]]
            -- upvalues: v316 (copy)
            v316.NameLabel.Localize = false;
            v316.DisplayNameLabel.Localize = false;
        end);
        return v316;
    end;
    local function v375(v324, v325) --[[ Line: 1592 ]] --[[ Name: managePlayerNameCutoff ]]
        -- upvalues: v68 (ref), l_UserProfileStore_0 (ref), v60 (ref), v17 (ref), v63 (ref), l_formatUsername_0 (ref)
        local v326 = nil;
        local v327 = nil;
        local function v337(v328, v329, v330) --[[ Line: 1595 ]] --[[ Name: reportFlagChanged ]]
            -- upvalues: v326 (ref), v324 (copy), v325 (copy)
            if v329 == "AbsolutePosition" and v326 then
                local v331 = v328.AbsolutePosition.X - 20 - v324.NameLabel.AbsolutePosition.X;
                v324.NameLabel.Text = "@" .. v325.Name;
                v324.DisplayNameLabel.Text = v325.DisplayName;
                if v330 then
                    v324.DisplayNameLabel.Text = v330;
                end;
                local v332 = utf8.len(v325.DisplayName);
                if v330 then
                    v332 = utf8.len(v330);
                end;
                while v331 < v324.NameLabel.TextBounds.X and v332 > 0 do
                    if v330 then
                        local v333 = utf8.offset(v330, v332);
                        v324.NameLabel.Text = string.sub(v330, 1, v333) .. "...";
                    else
                        local v334 = utf8.offset(v325.DisplayName, v332);
                        v324.NameLabel.Text = string.sub(v325.DisplayName, 1, v334) .. "...";
                    end;
                    v332 = v332 - 1;
                end;
                local v335 = "@" .. v325.Name;
                local v336 = string.len(v335);
                while v331 < v324.NameLabel.TextBounds.X and v336 > 0 do
                    v324.NameLabel.Text = string.sub(v335, 1, v336) .. "...";
                    v336 = v336 - 1;
                end;
            end;
        end;
        local function v347(v338, _, _) --[[ Line: 1629 ]] --[[ Name: reportFlagChangedWithCombinedName ]]
            -- upvalues: v68 (ref), v325 (copy), v337 (copy), l_UserProfileStore_0 (ref), v324 (copy)
            if v68 and not v325.UserId then
                v337(v338, "AbsolutePosition");
                return;
            else
                l_UserProfileStore_0.get().fetchNamesByUserIds({
                    (tostring(v325.UserId))
                }, function(v341) --[[ Line: 1633 ]]
                    -- upvalues: v324 (ref), v337 (ref), v338 (copy), v325 (ref)
                    local l_v324_0 = v324;
                    local v343 = if l_v324_0 and l_v324_0.Parent then l_v324_0:FindFirstChild("DisplayNameLabel") else nil;
                    if v343 == nil then
                        return;
                    else
                        local l_data_0 = v341.data;
                        if #l_data_0 == 0 then
                            l_v324_0 = "";
                        else
                            local v345 = l_data_0[1];
                            if v345 == nil then
                                l_v324_0 = "";
                            else
                                local l_names_1 = v345.names;
                                l_v324_0 = l_names_1 == nil and "" or l_names_1.getInExperienceCombinedName(false);
                            end;
                        end;
                        if string.len(l_v324_0) > 0 and l_v324_0 ~= v343.Text then
                            v337(v338, "AbsolutePosition", l_v324_0);
                            return;
                        else
                            if v325.DisplayName ~= v343.Text then
                                v337(v338, "AbsolutePosition");
                            end;
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
        if not v60() then
            v17:OnResized(v324.NameLabel, function(_, v349) --[[ Line: 1653 ]]
                -- upvalues: v326 (ref), v17 (ref), v327 (ref), v324 (copy), v347 (copy), v325 (copy), v68 (ref), l_UserProfileStore_0 (ref)
                if v326 ~= nil and v326 == v349 then
                    return;
                else
                    v349 = v349 and not (v17:IsSmallTouchScreen() and v17:IsPortrait());
                    v326 = v349;
                    if v349 then
                        if v327 == nil then
                            v327 = v324.RightSideButtons.ChildAdded:connect(function(v350) --[[ Line: 1662 ]]
                                -- upvalues: v347 (ref)
                                if v350.Name == "Inspect" then
                                    v350.Changed:connect(function(_) --[[ Line: 1664 ]]
                                        -- upvalues: v347 (ref), v350 (copy)
                                        v347(v350, "AbsolutePosition");
                                    end);
                                    v347(v350, "AbsolutePosition");
                                end;
                            end);
                        end;
                        local l_Inspect_1 = v324.RightSideButtons:FindFirstChild("Inspect");
                        if l_Inspect_1 then
                            l_Inspect_1.Changed:connect(function(v353) --[[ Line: 1673 ]]
                                -- upvalues: v347 (ref), l_Inspect_1 (copy)
                                v347(l_Inspect_1, v353);
                            end);
                            v347(l_Inspect_1, "AbsolutePosition");
                            return;
                        end;
                    elseif not v324:FindFirstChild("NameLabel") then
                        return;
                    else
                        v324.NameLabel.Text = "@" .. v325.Name;
                        if v68 and not v325.UserId then
                            v324.DisplayNameLabel.Text = v325.DisplayName;
                            return;
                        else
                            l_UserProfileStore_0.get().fetchNamesByUserIds({
                                (tostring(v325.UserId))
                            }, function(v354) --[[ Line: 1687 ]]
                                -- upvalues: v324 (ref), v325 (ref)
                                local l_v324_1 = v324;
                                local v356 = if l_v324_1 and l_v324_1.Parent then l_v324_1:FindFirstChild("DisplayNameLabel") else nil;
                                if v356 == nil then
                                    return;
                                else
                                    local l_data_1 = v354.data;
                                    if #l_data_1 == 0 then
                                        l_v324_1 = "";
                                    else
                                        local v358 = l_data_1[1];
                                        if v358 == nil then
                                            l_v324_1 = "";
                                        else
                                            local l_names_2 = v358.names;
                                            l_v324_1 = l_names_2 == nil and "" or l_names_2.getInExperienceCombinedName(false);
                                        end;
                                    end;
                                    if string.len(l_v324_1) > 0 and l_v324_1 ~= v356.Text then
                                        v356.Text = l_v324_1;
                                        return;
                                    else
                                        l_data_1 = v325.DisplayName;
                                        if l_data_1 ~= v356.Text then
                                            v356.Text = l_data_1;
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
        local function v363() --[[ Line: 1707 ]] --[[ Name: getNearestRightSideButtonXPosition ]]
            -- upvalues: v324 (copy)
            local v360 = nil;
            for _, v362 in pairs(v324.RightSideButtons:GetChildren()) do
                if v362:IsA("ImageButton") and (not v360 or v362.AbsolutePosition.X < v360) then
                    v360 = v362.AbsolutePosition.X;
                end;
            end;
            return v360;
        end;
        local v364 = nil;
        local function v373() --[[ Line: 1722 ]] --[[ Name: rightSideButtonsChanged ]]
            -- upvalues: v363 (copy), v364 (ref), v324 (copy), v63 (ref), l_formatUsername_0 (ref), v325 (copy), v68 (ref), l_UserProfileStore_0 (ref)
            local v365 = v363();
            if v365 == v364 then
                return;
            else
                v364 = v365;
                local v366 = nil;
                v366 = if v365 then UDim2.new(0, v365 - v324.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0);
                v324.NameLabel.Size = v366;
                v324.DisplayNameLabel.Size = v366;
                v324.NameLabel.Text = if v63 then l_formatUsername_0(v325.Name) else "@" .. v325.Name;
                if v68 and not v325.UserId then
                    v324.DisplayNameLabel.Text = v325.DisplayName;
                    return;
                else
                    l_UserProfileStore_0.get().fetchNamesByUserIds({
                        (tostring(v325.UserId))
                    }, function(v367) --[[ Line: 1752 ]]
                        -- upvalues: v324 (ref), v325 (ref)
                        local l_v324_2 = v324;
                        local v369 = if l_v324_2 and l_v324_2.Parent then l_v324_2:FindFirstChild("DisplayNameLabel") else nil;
                        if v369 == nil then
                            return;
                        else
                            local l_data_2 = v367.data;
                            if #l_data_2 == 0 then
                                l_v324_2 = "";
                            else
                                local v371 = l_data_2[1];
                                if v371 == nil then
                                    l_v324_2 = "";
                                else
                                    local l_names_3 = v371.names;
                                    l_v324_2 = l_names_3 == nil and "" or l_names_3.getInExperienceCombinedName(false);
                                end;
                            end;
                            if string.len(l_v324_2) > 0 and l_v324_2 ~= v369.Text then
                                v369.Text = l_v324_2;
                                return;
                            else
                                l_data_2 = v325.DisplayName;
                                if l_data_2 ~= v369.Text then
                                    v369.Text = l_data_2;
                                end;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        if v60() then
            v327 = v324.RightSideButtons.ChildAdded:connect(function(v374) --[[ Line: 1771 ]]
                -- upvalues: v373 (copy)
                v373();
                v374:GetPropertyChangedSignal("AbsolutePosition"):Connect(v373);
            end);
            v373();
        end;
    end;
    local function _() --[[ Line: 1780 ]] --[[ Name: canShareCurrentGame ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return l_LocalPlayer_0.UserId > 0;
    end;
    local v377 = nil;
    local v378 = {};
    local v379 = {};
    local v380 = false;
    local function v388() --[[ Line: 1790 ]] --[[ Name: updateAllMuteButtons ]]
        -- upvalues: v108 (ref), l_default_0 (ref), l_Players_0 (ref), v378 (copy), v195 (copy), v180 (ref), v23 (ref)
        if not v108 then
            return;
        elseif not l_default_0.voiceUIVisible then
            return;
        else
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            local v382 = true;
            for _, v384 in ipairs(l_l_Players_0_Players_0) do
                local v385 = v378[v384.Name];
                if v384 and v385 then
                    local v386 = l_default_0.participants[tostring(v384.UserId)];
                    if v386 and not v386.isMutedLocally then
                        v382 = false;
                    end;
                    v195(v385, v386);
                end;
            end;
            if v382 then
                v180 = true;
            else
                v180 = false;
            end;
            local v387 = v180 and v23:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
            if not v108 or not v108:FindFirstChild("TextLabel") then
                return;
            else
                v108.TextLabel.Text = v387;
                v108.Icon.Image = l_default_0:GetIcon(v180 and "MuteAll" or "UnmuteAll", "Misc");
                return;
            end;
        end;
    end;
    local function v394() --[[ Line: 1833 ]] --[[ Name: destroyAllUserMuteButtons ]]
        -- upvalues: l_Players_0 (ref), v378 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v107 (ref)
        for _, v390 in (l_Players_0:GetPlayers()) do
            local v391 = v378[v390.Name];
            if v391 then
                local l_RightSideButtons_1 = v391:FindFirstChild("RightSideButtons");
                if l_RightSideButtons_1 then
                    local l_MuteStatusButton_1 = l_RightSideButtons_1:FindFirstChild("MuteStatusButton");
                    if l_MuteStatusButton_1 then
                        if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_1 then
                            if l_UserInputService_0.GamepadEnabled then
                                l_GuiService_0.SelectedCoreObject = v107;
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
    local function v450(_) --[[ Line: 1856 ]]
        -- upvalues: l_FFlagIEMFocusNavToButtons_0 (ref), l_NewPage_0 (copy), l_FFlagIEMTabFocusNav_0 (ref), v377 (ref), l_Players_0 (ref), v69 (ref), l_LocalPlayer_0 (ref), v17 (ref), v243 (ref), v108 (ref), l_default_0 (ref), v107 (ref), l_RunService_0 (ref), v117 (ref), l_Create_0 (ref), v118 (ref), v50 (ref), v34 (ref), v35 (ref), l_GameInviteAnalytics_0 (ref), l_EventStream_0 (ref), l_RbxAnalyticsService_0 (ref), l_Diag_0 (ref), v238 (ref), v57 (ref), v248 (copy), v110 (ref), v241 (ref), v113 (ref), l_GuiService_0 (ref), v378 (copy), v379 (copy), v242 (ref), v195 (copy), l_SocialUtil_0 (ref), v63 (ref), l_formatUsername_0 (ref), v60 (ref), v375 (copy), v150 (copy), v144 (copy), v154 (ref), v306 (copy), v237 (copy), v239 (ref), v180 (ref), v23 (ref), v53 (ref), v30 (ref), v112 (copy), v27 (ref), v388 (copy), v64 (ref), v68 (ref), v12 (ref), l_UserProfileStore_0 (ref), v315 (copy), v380 (ref), v67 (ref), v210 (copy), l_UserInputService_0 (ref), v65 (ref)
        if l_FFlagIEMFocusNavToButtons_0 then
            l_NewPage_0.LastSelectableObjects = {};
        end;
        if l_FFlagIEMTabFocusNav_0 and not l_NewPage_0.ButtonsContainer.Visible then
            l_NewPage_0.FirstSelectableObjects = {};
        end;
        v377 = l_Players_0:GetPlayers();
        if v69 then
            table.sort(v377, function(v396, v397) --[[ Line: 1866 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v398 = v396.Name:lower();
                local v399 = v397.Name:lower();
                if v396 == l_LocalPlayer_0 then
                    v398 = " ";
                end;
                if v397 == l_LocalPlayer_0 then
                    v399 = " ";
                end;
                return v398 < v399;
            end);
        else
            table.sort(v377, function(v400, v401) --[[ Line: 1879 ]]
                return v400.Name:lower() < v401.Name:lower();
            end);
        end;
        local v402 = 20;
        if v17:IsSmallTouchScreen() or v17:IsPortrait() then
            v402 = 85;
        end;
        local v403 = v243 and not v108 and l_default_0.voiceUIVisible;
        if (l_LocalPlayer_0.UserId > 0 and not v107 and not l_RunService_0:IsStudio() or v403) and not v117 then
            v117 = l_Create_0("Frame")({
                Name = "Holder", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Parent = l_NewPage_0.Page, 
                LayoutOrder = 1
            });
            v118 = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20), 
                Parent = v117
            });
        end;
        local function v404() --[[ Line: 1913 ]] --[[ Name: layoutMuteAll ]]
            -- upvalues: v117 (ref), l_Create_0 (ref), l_NewPage_0 (ref), v107 (ref), v50 (ref), v108 (ref)
            if not v117 then
                v117 = l_Create_0("Frame")({
                    Name = "Holder", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 52), 
                    Parent = l_NewPage_0.Page, 
                    LayoutOrder = 1
                });
            end;
            v107.Parent = v117;
            v107.Size = v50;
            v108.Parent = v117;
        end;
        local v405 = not l_RunService_0:IsStudio();
        if l_LocalPlayer_0.UserId > 0 and not v107 and v405 then
            local v406 = nil;
            v406 = if v34() then v35:withButtonName(v35.ButtonName.SettingsHub) else l_GameInviteAnalytics_0.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0)):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
            v107 = v238();
            do
                local l_v406_0 = v406;
                v107.Activated:connect(function() --[[ Line: 1945 ]]
                    -- upvalues: l_v406_0 (ref), l_NewPage_0 (ref)
                    l_v406_0:inputShareGameEntryPoint();
                    l_NewPage_0.HubRef:InviteToGame();
                end);
                v107.LayoutOrder = 1;
                if v403 then
                    v107.Parent = v117;
                else
                    v107.Parent = l_NewPage_0.Page;
                end;
            end;
        end;
        if v57() and v248() then
            if v248() and not v110 then
                v110 = v241();
            end;
            v113();
        end;
        local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
        for v409 = 1, #v377 do
            local v410 = v377[v409];
            local v411 = nil;
            v411 = v378[v410.Name];
            do
                local l_v411_0 = v411;
                if v410 then
                    v379[v410.Name] = true;
                    if not l_v411_0 or not l_v411_0.Parent then
                        l_v411_0 = v242((v409 - 1) * 80 + v402);
                        l_v411_0.Parent = l_NewPage_0.Page;
                        v378[v410.Name] = l_v411_0;
                    end;
                    l_v411_0.Name = "PlayerLabel" .. v410.Name;
                    if v243 then
                        local v413 = l_default_0.participants[tostring(v410.UserId)];
                        v195(l_v411_0, v413);
                    end;
                    local v414 = l_SocialUtil_0.GetPlayerImage(math.max(1, v410.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail);
                    l_v411_0.Icon.Image = v414;
                    l_v411_0.NameLabel.Text = if v63 then l_formatUsername_0(v410.Name) else "@" .. v410.Name;
                    l_v411_0.ImageTransparency = 0.85;
                    l_v411_0.LayoutOrder = v409 + 1;
                    if v60() then
                        l_v411_0.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_v411_0.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                    end;
                    v375(l_v411_0, v410);
                    v150(l_v411_0, v410);
                    local v415 = nil;
                    do
                        local l_v415_0 = v415;
                        v17:OnResized(l_v411_0, function(_, v418) --[[ Line: 2015 ]]
                            -- upvalues: l_v411_0 (ref), v17 (ref), v144 (ref), v410 (copy), l_v415_0 (ref), v154 (ref), l_l_GuiService_0_InspectMenuEnabled_0 (copy), v306 (ref)
                            local l_RightSideButtons_2 = l_v411_0:FindFirstChild("RightSideButtons");
                            local l_DisplayNameLabel_0 = l_v411_0:FindFirstChild("DisplayNameLabel");
                            local l_NameLabel_0 = l_v411_0:FindFirstChild("NameLabel");
                            local v422 = l_RightSideButtons_2 and l_RightSideButtons_2:FindFirstChild("RightSideListLayout");
                            if v17:IsSmallTouchScreen() and v17:IsPortrait() then
                                l_v411_0.Size = UDim2.new(1, 0, 0, 105);
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
                                if v422 then
                                    v422.HorizontalAlignment = Enum.HorizontalAlignment.Left;
                                    v422.VerticalAlignment = Enum.VerticalAlignment.Bottom;
                                end;
                            else
                                l_v411_0.Size = UDim2.new(1, 0, 0, 62);
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
                                if v422 then
                                    v422.HorizontalAlignment = Enum.HorizontalAlignment.Right;
                                    v422.VerticalAlignment = Enum.VerticalAlignment.Center;
                                end;
                            end;
                            if l_RightSideButtons_2 then
                                v144(l_RightSideButtons_2, v410, v418, l_v415_0);
                                v154(l_RightSideButtons_2, v410, v418, l_v415_0);
                                if l_l_GuiService_0_InspectMenuEnabled_0 then
                                    v306(l_RightSideButtons_2, v410, v418, l_v415_0);
                                end;
                                l_v415_0 = v418;
                            end;
                        end);
                        v237(l_v411_0, v410);
                        if l_FFlagIEMFocusNavToButtons_0 and v409 == #v377 then
                            local l_RightSideButtons_3 = l_v411_0:FindFirstChild("RightSideButtons");
                            if l_RightSideButtons_3 then
                                for _, v425 in l_RightSideButtons_3:GetChildren() do
                                    if v425:IsA("ImageButton") then
                                        table.insert(l_NewPage_0.LastSelectableObjects, v425);
                                    end;
                                end;
                                l_NewPage_0.LastSelectableObjectsUpdated:fire();
                            end;
                        end;
                        if l_FFlagIEMTabFocusNav_0 and v409 == 1 and #l_NewPage_0.FirstSelectableObjects == 0 then
                            local l_RightSideButtons_4 = l_v411_0:FindFirstChild("RightSideButtons");
                            if l_RightSideButtons_4 then
                                for _, v428 in l_RightSideButtons_4:GetChildren() do
                                    if v428:IsA("ImageButton") then
                                        table.insert(l_NewPage_0.FirstSelectableObjects, v428);
                                    end;
                                end;
                                l_NewPage_0.FirstSelectableObjectsUpdated:fire();
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if v403 then
            v108 = v239();
            v108.Activated:connect(function() --[[ Line: 2114 ]]
                -- upvalues: v180 (ref), v23 (ref), v108 (ref), l_default_0 (ref), v53 (ref), v30 (ref), v112 (ref), v27 (ref), v388 (ref)
                v180 = not v180;
                local v429 = v180 and v23:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
                v108.TextLabel.Text = v429;
                v108.Icon.Image = l_default_0:GetIcon(v180 and "MuteAll" or "UnmuteAll", "Misc");
                if v53() then
                    v30:debug("{} all players", v180 and "Muting" or "Unmuting");
                end;
                if v112 then
                    v112:onToggleMuteAll(v180);
                end;
                l_default_0:MuteAll(v180, v27.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v388();
            end);
            v108.LayoutOrder = 1;
            if v64 then
                v404();
            else
                v108.Parent = v117;
            end;
            v113();
        end;
        local v430 = nil;
        v430 = if v68 then v12.List.filterMap(v377, function(v431) --[[ Line: 2144 ]]
            if not v431.UserId then
                return nil;
            else
                return (tostring(v431.UserId));
            end;
        end) else v12.List.filter(v377, function(v432) --[[ Line: 2152 ]]
            return (tostring(v432.UserId));
        end);
        for _, v434 in ipairs(v377) do
            v378[v434.Name].DisplayNameLabel.Text = v434.DisplayName;
        end;
        l_UserProfileStore_0.get().fetchNamesByUserIds(v430, function(v435) --[[ Line: 2161 ]]
            -- upvalues: v378 (ref), v315 (ref)
            for _, v437 in v435.data do
                local v438 = v378[v437.names.getUsername(false)];
                if v438 then
                    local v439 = v437.names.getInExperienceCombinedName(false);
                    if string.len(v439) > 0 and v439 ~= v438.DisplayNameLabel.Text then
                        v438.DisplayNameLabel.Text = v439;
                    end;
                    local l_RightSideButtons_5 = v438:FindFirstChild("RightSideButtons");
                    local v441 = nil;
                    if v437.names.getPlatformName(false) ~= "" then
                        v441 = v437.names.getPlatformName(false);
                    end;
                    if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
                        v315(l_RightSideButtons_5, v441, v437.getPlatformProfileId(false));
                    else
                        v315(l_RightSideButtons_5, v441);
                    end;
                end;
            end;
        end);
        local v442 = 0;
        if v243 and not v380 then
            v30:debug("Setting Up Playerlist Mic Update Renderstep Hook");
            l_RunService_0:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function() --[[ Line: 2193 ]]
                -- upvalues: v442 (ref), v388 (ref), v67 (ref), v117 (ref), v210 (ref)
                v442 = v442 + 1;
                if v442 % 3 == 0 then
                    v388();
                    local v443 = nil;
                    if v67() then
                        if v117 then
                            v443 = v117:FindFirstChild("MuteSelfButtonImageLabel", true);
                        end;
                    else
                        v443 = v117:FindFirstChild("MuteSelfButtonImageLabel", true);
                    end;
                    if not v443 then
                        return;
                    else
                        v443.Image = v210();
                    end;
                end;
            end);
            v380 = true;
        end;
        for v444, v445 in pairs(v378) do
            if not v379[v444] then
                v445:Destroy();
                v378[v444] = nil;
            end;
        end;
        if l_UserInputService_0.GamepadEnabled and (not l_FFlagIEMTabFocusNav_0 or not l_GuiService_0.SelectedCoreObject) then
            if v67() then
                pcall(function() --[[ Line: 2213 ]]
                    -- upvalues: v65 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref), v107 (ref)
                    if v65 then
                        if l_NewPage_0.Active then
                            l_GuiService_0.SelectedCoreObject = v107;
                            return;
                        end;
                    else
                        l_GuiService_0.SelectedCoreObject = v107;
                    end;
                end);
            else
                l_GuiService_0.SelectedCoreObject = v107;
            end;
        end;
        v17:OnResized("MenuPlayerListExtraPageSize", function(_, _) --[[ Line: 2227 ]]
            -- upvalues: v17 (ref), v377 (ref), l_NewPage_0 (ref)
            local v448 = 20;
            if v17:IsSmallTouchScreen() or v17:IsPortrait() then
                v448 = 85;
            end;
            local v449 = #v377 + 1;
            if v17:IsSmallTouchScreen() and v17:IsPortrait() then
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v448 + v449 * 123 - 5);
                return;
            else
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v448 + v449 * 80 - 5);
                return;
            end;
        end);
    end;
    local function v451() --[[ Line: 2243 ]]
        -- upvalues: v380 (ref), v30 (ref), l_RunService_0 (ref)
        if v380 then
            v30:debug("Unbinding Playerlist Mic Update Renderstep Hook");
            v380 = false;
            l_RunService_0:UnbindFromRenderStep("player-list-mute-update");
        end;
    end;
    if game:GetEngineFeature("VoiceChatSupported") and not v243 then
        l_default_0:asyncInit():andThen(function() --[[ Line: 2253 ]]
            -- upvalues: v243 (ref), l_default_0 (ref), v69 (ref), v67 (ref), v109 (ref), v240 (ref), v388 (copy), v111 (copy), v108 (ref), v113 (ref), v244 (ref), v57 (ref), v110 (ref), v450 (copy), v64 (ref), v196 (copy), v394 (copy), v224 (copy)
            v243 = true;
            l_default_0:SetupParticipantListeners();
            if not v69 then
                if v67() then
                    v109 = v240();
                else
                    v240();
                end;
            end;
            l_default_0.participantsUpdate.Event:Connect(function() --[[ Line: 2258 ]]
                -- upvalues: v388 (ref)
                v388();
            end);
            l_default_0.participantLeft.Event:Connect(function(_, v453) --[[ Line: 2261 ]]
                -- upvalues: v388 (ref), v111 (ref)
                v388();
                v111[v453] = nil;
            end);
            l_default_0:getService().StateChanged:Connect(function(_, v455) --[[ Line: 2266 ]]
                -- upvalues: v108 (ref), v113 (ref), v109 (ref), v244 (ref), v57 (ref), v110 (ref), v243 (ref), v450 (ref)
                if v455 == Enum.VoiceChatState.Ended then
                    if v108 then
                        v108.Visible = false;
                        v108:Destroy();
                        v108 = nil;
                    end;
                    v113();
                    if v109 then
                        v109.Visible = false;
                        v109:Destroy();
                        v109 = nil;
                    end;
                    if v244 then
                        v244:Disconnect();
                        v244 = nil;
                    end;
                    v113();
                    if v57() then
                        if v110 then
                            v110.Visible = false;
                            v110:Destroy();
                            v110 = nil;
                        end;
                        v113();
                    end;
                    v243 = false;
                    return;
                else
                    if v455 == Enum.VoiceChatState.Joined and v243 == false then
                        v243 = true;
                        if v57() then
                            if v110 then
                                v110.Visible = false;
                                v110:Destroy();
                                v110 = nil;
                            end;
                            v113();
                        end;
                        v450();
                    end;
                    return;
                end;
            end);
            if v64 and not v67() then
                v450();
            end;
            l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 2290 ]]
                -- upvalues: v67 (ref), v109 (ref), v69 (ref), v240 (ref), v196 (ref), v57 (ref), v110 (ref), v113 (ref), v450 (ref)
                if v67() then
                    if not v109 and not v69 then
                        if v67() then
                            v109 = v240();
                        else
                            v240();
                        end;
                    end;
                elseif not v196:FindFirstChild("MuteSelfButton", true) and not v69 then
                    if v67() then
                        v109 = v240();
                    else
                        v240();
                    end;
                end;
                if v57() then
                    if v110 then
                        v110.Visible = false;
                        v110:Destroy();
                        v110 = nil;
                    end;
                    v113();
                end;
                v450();
            end);
            l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 2305 ]]
                -- upvalues: v108 (ref), v113 (ref), v109 (ref), v244 (ref), v394 (ref), v450 (ref), v224 (ref)
                if v108 then
                    if v108 then
                        v108.Visible = false;
                        v108:Destroy();
                        v108 = nil;
                    end;
                    v113();
                end;
                if v109 then
                    v109.Visible = false;
                    v109:Destroy();
                    v109 = nil;
                end;
                if v244 then
                    v244:Disconnect();
                    v244 = nil;
                end;
                v113();
                v394();
                v450();
                v224();
            end);
            l_default_0.muteAllChanged.Event:Connect(function() --[[ Line: 2314 ]]
                -- upvalues: v388 (ref)
                v388();
            end);
        end):catch(function(_) --[[ Line: 2318 ]]
            -- upvalues: v53 (ref), v30 (ref)
            if v53() then
                v30:warning("Failed to init VoiceChatServiceManager");
            end;
        end);
    end;
    l_NewPage_0.Displayed.Event:connect(v450);
    l_NewPage_0.Hidden.Event:connect(v451);
    l_Players_0.PlayerRemoving:Connect(function(v457) --[[ Line: 2328 ]]
        -- upvalues: v379 (copy), v378 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v107 (ref), v56 (ref)
        v379[v457.Name] = nil;
        local v458 = v378[v457.Name];
        if not v458 then
            return;
        else
            local l_RightSideButtons_6 = v458:FindFirstChild("RightSideButtons");
            if not l_RightSideButtons_6 then
                return;
            else
                local l_FriendStatus_1 = l_RightSideButtons_6:FindFirstChild("FriendStatus");
                if l_FriendStatus_1 then
                    if l_GuiService_0.SelectedCoreObject == l_FriendStatus_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v107;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_FriendStatus_1:Destroy();
                end;
                local l_ReportPlayer_1 = l_RightSideButtons_6:FindFirstChild("ReportPlayer");
                if l_ReportPlayer_1 then
                    if l_GuiService_0.SelectedCoreObject == l_ReportPlayer_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v107;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_ReportPlayer_1:Destroy();
                end;
                local l_MuteStatusButton_2 = l_RightSideButtons_6:FindFirstChild("MuteStatusButton");
                if l_MuteStatusButton_2 then
                    if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_2 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v107;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_MuteStatusButton_2:Destroy();
                end;
                local l_BlockButton_1 = l_RightSideButtons_6:FindFirstChild("BlockButton");
                if l_BlockButton_1 then
                    if l_GuiService_0.SelectedCoreObject == l_BlockButton_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v107;
                        else
                            l_GuiService_0.SelectedCoreObject = nil;
                        end;
                    end;
                    l_BlockButton_1:Destroy();
                end;
                local l_Inspect_2 = l_RightSideButtons_6:FindFirstChild("Inspect");
                if l_Inspect_2 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_2 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_2:Destroy();
                end;
                if v56() then
                    v378[v457.Name] = nil;
                    v458:Destroy();
                end;
                return;
            end;
        end;
    end);
    local function v469() --[[ Line: 2405 ]] --[[ Name: removeInspectButtons ]]
        -- upvalues: v378 (copy), l_GuiService_0 (ref)
        for _, v466 in pairs(v378) do
            local l_RightSideButtons_7 = v466:FindFirstChild("RightSideButtons");
            if l_RightSideButtons_7 then
                local l_Inspect_3 = l_RightSideButtons_7:FindFirstChild("Inspect");
                if l_Inspect_3 then
                    if l_GuiService_0.SelectedCoreObject == l_Inspect_3 then
                        l_GuiService_0.SelectedCoreObject = nil;
                    end;
                    l_Inspect_3:Destroy();
                end;
            end;
        end;
    end;
    l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v470) --[[ Line: 2422 ]]
        -- upvalues: v469 (copy)
        if not v470 then
            v469();
        end;
    end);
    l_NewPage_0.CreateMenuButtonsContainer = function(_) --[[ Line: 2428 ]] --[[ Name: CreateMenuButtonsContainer ]]
        -- upvalues: v41 (ref), l_NewPage_0 (copy), v14 (ref), v196 (copy), v13 (ref), v31 (ref)
        if v41 == 2 then
            if l_NewPage_0.buttonsContainerRoot then
                return;
            else
                l_NewPage_0.buttonsContainerRoot = v14.createRoot(v196);
                local l_ExperienceControlStore_0 = l_NewPage_0.HubRef:GetExperienceControlStore();
                l_NewPage_0.buttonsContainerRoot:render(v13.createElement(v31, {
                    onLeaveGame = l_ExperienceControlStore_0.onLeaveGame, 
                    onRespawn = l_ExperienceControlStore_0.onRespawn, 
                    onResume = l_ExperienceControlStore_0.onResume, 
                    setAddMenuKeyBindings = function() --[[ Line: 2440 ]] --[[ Name: setAddMenuKeyBindings ]]

                    end, 
                    setRemoveMenuKeyBindings = function() --[[ Line: 2441 ]] --[[ Name: setRemoveMenuKeyBindings ]]

                    end, 
                    getVisibility = function() --[[ Line: 2442 ]] --[[ Name: getVisibility ]]
                        return true;
                    end, 
                    getCanRespawn = l_ExperienceControlStore_0.getCanRespawn
                }));
            end;
        end;
    end;
    l_NewPage_0.UnmountMenuButtonsContainer = function(_) --[[ Line: 2450 ]] --[[ Name: UnmountMenuButtonsContainer ]]
        -- upvalues: v42 (ref), v41 (ref), l_NewPage_0 (copy)
        if v42 and v41 == 2 and l_NewPage_0.buttonsContainerRoot then
            l_NewPage_0.buttonsContainerRoot:unmount();
            l_NewPage_0.buttonsContainerRoot = nil;
        end;
    end;
    return l_NewPage_0;
end)());