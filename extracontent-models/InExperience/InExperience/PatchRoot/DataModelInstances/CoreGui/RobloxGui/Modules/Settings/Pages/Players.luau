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
local l_FFlagConnectionsToFriendsRename_0 = v36.FFlagConnectionsToFriendsRename;
local l_UserProfileStore_0 = v10.Stores.UserProfileStore;
local _, l_result_0 = pcall(function() --[[ Line: 71 ]]
    return game:GetService("PlatformFriendsService");
end);
local v47 = require(script.Parent.Parent.Theme);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v49 = UDim2.new(0.5, -10, 0, 52);
local _ = nil;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
while not l_LocalPlayer_0 do
    l_Players_0.ChildAdded:wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v52 = require(l_RobloxGui_0.Modules.Flags.GetFFlagVoiceChatUILogging);
local v53 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty);
local v54 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint);
local v55 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave);
local v56 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice);
local v57 = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false);
local v58 = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false);
local v59 = require(l_RobloxGui_0.Modules.Flags.isEngineTruncationEnabledForIngameSettings);
local l_game_EngineFeature_1 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled");
local v61 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true);
local v62 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false);
local v63 = game:DefineFastFlag("CorrectlyPositionMuteButton", false);
local v64 = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false);
local v65 = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200);
local v66 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton);
local v67 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false);
local v68 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local l_MuteStatusIcons_0 = l_default_0.MuteStatusIcons;
local l_PlayerMuteStatusIcons_0 = l_default_0.PlayerMuteStatusIcons;
return ((function() --[[ Line: 147 ]] --[[ Name: Initialize ]]
    -- upvalues: l_RobloxGui_0 (copy), l_game_EngineFeature_0 (copy), l_RbxAnalyticsService_0 (copy), l_LocalizationService_0 (copy), l_Localization_0 (copy), l_uiblox_0 (copy), v32 (copy), l_LocalPlayer_0 (ref), v17 (copy), v29 (copy), v47 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_Constants_0 (copy), v53 (copy), v26 (copy), v65 (copy), v56 (copy), v66 (copy), v58 (copy), l_GuiService_0 (copy), v28 (copy), v25 (copy), v23 (copy), l_MuteStatusIcons_0 (copy), v61 (copy), l_game_EngineFeature_1 (copy), l_default_0 (copy), v27 (copy), l_Create_0 (copy), v39 (copy), v40 (copy), v54 (copy), l_PlayerMuteStatusIcons_0 (copy), v19 (copy), v68 (copy), v49 (copy), v57 (copy), l_result_0 (copy), l_FFlagIEMFocusNavToButtons_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), v67 (copy), l_UserProfileStore_0 (copy), v59 (copy), v62 (copy), l_formatUsername_0 (copy), l_Players_0 (copy), l_UserInputService_0 (copy), l_RunService_0 (copy), v34 (copy), v35 (ref), l_GameInviteAnalytics_0 (copy), l_EventStream_0 (copy), l_Diag_0 (copy), l_SocialUtil_0 (copy), v52 (copy), v30 (copy), v63 (copy), v12 (copy), v64 (copy), v55 (copy), v14 (copy), v13 (copy), v31 (copy), v41 (copy)
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.PageListLayout.Padding = UDim.new(0, 16);
    l_NewPage_0.playSessionId = "";
    if l_game_EngineFeature_0 then
        l_NewPage_0.playSessionId = l_RbxAnalyticsService_0:GetPlaySessionId();
    end;
    local v72 = {};
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    if not v72[l_RobloxLocaleId_0] then
        v72[l_RobloxLocaleId_0] = l_Localization_0.new(l_RobloxLocaleId_0);
    end;
    l_NewPage_0.TabHeader.Name = "PlayersTab";
    local v74 = l_uiblox_0["icons/menu/friends"];
    l_NewPage_0.TabHeader.TabLabel.Icon.Text = v74.name;
    l_NewPage_0.TabHeader.TabLabel.Icon.FontFace = v32.Font[v74.variant];
    l_NewPage_0.TabHeader.TabLabel.Title.Text = "People";
    local function _(v75) --[[ Line: 173 ]] --[[ Name: getFriendStatus ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 174 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v75 (copy)
            return l_LocalPlayer_0:GetFriendStatus(v75);
        end);
        if l_status_1 then
            return l_result_1;
        else
            return Enum.FriendStatus.NotFriend;
        end;
    end;
    l_NewPage_0.Page.Name = "Players";
    local function _(v79) --[[ Line: 188 ]] --[[ Name: showRightSideButtons ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return v79 and v79 ~= l_LocalPlayer_0 and v79.UserId > 0 and l_LocalPlayer_0.UserId > 0;
    end;
    local function _() --[[ Line: 192 ]] --[[ Name: useOptimizedPortraitLayout ]]
        -- upvalues: v17 (ref)
        return v17:IsSmallTouchScreen() and v17:IsPortrait();
    end;
    local function _(v82) --[[ Line: 196 ]] --[[ Name: getIsBlocked ]]
        -- upvalues: v29 (ref)
        return v29:IsPlayerBlockedByUserId(v82.UserId);
    end;
    local function v93(v84, v85) --[[ Line: 200 ]] --[[ Name: createFriendStatusTextLabel ]]
        -- upvalues: v47 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v72 (copy), l_RobloxLocaleId_0 (copy), l_Constants_0 (ref), v53 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), v17 (ref)
        if v84 == nil then
            return nil;
        else
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.BackgroundTransparency = 1;
            local v87 = nil;
            local v88 = nil;
            if v84 == Enum.FriendStatus.Friend or v84 == Enum.FriendStatus.FriendRequestSent then
                v87 = Instance.new("TextButton");
                v87.BackgroundTransparency = 1;
                v87.FontSize = v47.fontSize(Enum.FontSize.Size24);
                v87.Font = v47.font(Enum.Font.SourceSans);
                v87.TextColor3 = Color3.new(1, 1, 1);
                v87.SelectionImageObject = l_Frame_0;
                if v84 == Enum.FriendStatus.Friend then
                    v87.Text = if l_FFlagConnectionsToFriendsRename_0 then v72[l_RobloxLocaleId_0]:Format(l_Constants_0.FriendLocalizedKey) else v72[l_RobloxLocaleId_0]:Format(l_Constants_0.ConnectionLocalizedKey);
                else
                    v87.Text = "Request Sent";
                end;
            elseif v84 == Enum.FriendStatus.Unknown or v84 == Enum.FriendStatus.NotFriend or v84 == Enum.FriendStatus.FriendRequestReceived then
                local function v89() --[[ Line: 229 ]]
                    -- upvalues: v87 (ref), v88 (ref), v53 (ref), l_FFlagConnectionsToFriendsRename_0 (ref), v72 (ref), l_RobloxLocaleId_0 (ref), l_Constants_0 (ref), l_LocalPlayer_0 (ref), v85 (copy), l_RbxAnalyticsService_0 (ref)
                    if v87 and v88 and v88.Text ~= "" then
                        v87.ImageTransparency = 1;
                        v88.Text = "";
                        if v53() then
                            v88.Text = if l_FFlagConnectionsToFriendsRename_0 then v72[l_RobloxLocaleId_0]:Format(l_Constants_0.AddFriendLocalizedKey) else v72[l_RobloxLocaleId_0]:Format(l_Constants_0.AddConnectionLocalizedKey);
                        end;
                        if l_LocalPlayer_0 and v85 then
                            l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                            l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                                category = "Game"
                            });
                            l_LocalPlayer_0:RequestFriendship(v85);
                        end;
                    end;
                end;
                local v90, v91 = v17:MakeStyledButton("FriendStatus", if l_FFlagConnectionsToFriendsRename_0 then v72[l_RobloxLocaleId_0]:Format(l_Constants_0.AddFriendLocalizedKey) else v72[l_RobloxLocaleId_0]:Format(l_Constants_0.AddConnectionLocalizedKey), UDim2.new(0, 182, 0, v47.ButtonHeight), v89);
                v87 = v90;
                v88 = v91;
                v88.ZIndex = 3;
                v88.Position = v88.Position + UDim2.new(0, 0, 0, 1);
            end;
            if v87 then
                v87.Name = "FriendStatus";
                v87.ZIndex = 3;
                local v92 = UDim2.new(0, 150, 0, v47.ButtonHeight);
                v87.Size = v92;
                v92 = UDim2.new(1, -198, 0, 7);
                v87.Position = v92;
                if v88 then
                    v92 = UDim2.new(0, 0, 0, 0);
                    v88.Position = v92;
                end;
            end;
            return v87;
        end;
    end;
    local function v105(v94, v95) --[[ Line: 277 ]] --[[ Name: createFriendStatusImageLabel ]]
        -- upvalues: v17 (ref), v47 (ref), l_LocalPlayer_0 (ref), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        if v94 == Enum.FriendStatus.Friend or v94 == Enum.FriendStatus.FriendRequestSent then
            local v96 = "icons/menu/friends";
            local v97 = 0;
            if v94 ~= Enum.FriendStatus.Friend then
                v96 = "icons/actions/friends/friendAdd";
                v97 = 0.5;
            end;
            local v98, _ = v17:MakeStyledImageButton("FriendStatus", v96, UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28));
            v98.Name = "FriendStatus";
            v98.Selectable = false;
            v98.FriendStatusTextLabel.TextTransparency = v97;
            return v98;
        elseif v94 == Enum.FriendStatus.Unknown or v94 == Enum.FriendStatus.NotFriend or v94 == Enum.FriendStatus.FriendRequestReceived then
            local v100 = nil;
            local v101 = nil;
            local function v102() --[[ Line: 303 ]]
                -- upvalues: v100 (ref), v101 (ref), l_LocalPlayer_0 (ref), v95 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
                if v100 and v101 and v100.ImageTransparency ~= 1 then
                    v100.ImageTransparency = 1;
                    v101.TextTransparency = 1;
                    if l_LocalPlayer_0 and v95 then
                        l_RbxAnalyticsService_0:ReportCounter("PlayersMenu-RequestFriendship");
                        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsRequestFriendContext, l_Constants_0.AnalyticsRequestFriendName, {
                            category = "Game"
                        });
                        l_LocalPlayer_0:RequestFriendship(v95);
                    end;
                end;
            end;
            local v103, v104 = v17:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v102);
            v100 = v103;
            v101 = v104;
            v100.Name = "FriendStatus";
            v100.Selectable = true;
            return v100;
        else
            return nil;
        end;
    end;
    local v106 = nil;
    local v107 = nil;
    local v108 = nil;
    local v109 = nil;
    local v110 = {};
    local v111 = v26.new(l_RbxAnalyticsService_0, "Players");
    local v112 = nil;
    local v113 = false;
    local v114 = nil;
    local v115 = {};
    local v116 = nil;
    local v117 = nil;
    v114 = function() --[[ Line: 348 ]]
        -- upvalues: l_NewPage_0 (copy), v65 (ref), v115 (ref)
        return l_NewPage_0.Page.AbsoluteSize.X < v65 * #v115;
    end;
    v112 = function() --[[ Line: 352 ]]
        -- upvalues: v115 (ref), v106 (ref), v107 (ref), v108 (ref), v56 (ref), v109 (ref), v113 (ref), v114 (ref), v116 (ref), v66 (ref), v117 (ref), v58 (ref)
        v115 = {};
        if v106 then
            table.insert(v115, v106);
        end;
        if v107 then
            table.insert(v115, v107);
        end;
        if v108 then
            table.insert(v115, v108);
        end;
        if v56() and v109 then
            table.insert(v115, v109);
        end;
        v113 = v114();
        if #v115 > 0 then
            local v118 = UDim2.new(1 / #v115, 0, 0, 52);
            local v119 = {
                Size = UDim2.new(1, (#v115 - 1) * -20, 0, 52), 
                AutomaticSize = Enum.AutomaticSize.None
            };
            local v120 = {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            };
            if v113 then
                v118 = UDim2.new(1, 0, 0, 52);
                v119 = {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                };
                v120 = {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 16)
                };
            end;
            local v121 = 1;
            for _, v123 in v115 do
                v123.Size = v118;
                v123.Parent = v116;
                v123.LayoutOrder = v121;
                v121 = v121 + 1;
            end;
            for v124, v125 in v120 do
                if v66() then
                    if v117 then
                        v117[v124] = v125;
                    end;
                else
                    v117[v124] = v125;
                end;
            end;
            for v126, v127 in v119 do
                if v66() then
                    if v116 then
                        v116[v126] = v127;
                    end;
                else
                    v116[v126] = v127;
                end;
            end;
            return;
        else
            if v58 then
                if v116 then
                    v116:Destroy();
                    v116 = nil;
                    return;
                end;
            else
                v116:Destroy();
                v116 = nil;
            end;
            return;
        end;
    end;
    local function _(v128) --[[ Line: 443 ]] --[[ Name: getDisplayNameLabel ]]
        if v128 and v128.Parent then
            return v128:FindFirstChild("DisplayNameLabel");
        else
            return nil;
        end;
    end;
    local function _(v130) --[[ Line: 450 ]] --[[ Name: getInExperienceCombinedName ]]
        if #v130 == 0 then
            return "";
        else
            local v131 = v130[1];
            if v131 == nil then
                return "";
            else
                local l_names_0 = v131.names;
                if l_names_0 == nil then
                    return "";
                else
                    return l_names_0.getInExperienceCombinedName(false);
                end;
            end;
        end;
    end;
    local function v143(v134, v135, v136, v137) --[[ Line: 465 ]] --[[ Name: resizeFriendButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v29 (ref), v105 (copy), v93 (copy), v17 (ref)
        local l_FriendStatus_0 = v134:FindFirstChild("FriendStatus");
        if l_FriendStatus_0 and v136 == v137 then
            return;
        else
            if l_FriendStatus_0 then
                l_FriendStatus_0:Destroy();
                l_FriendStatus_0 = nil;
            end;
            local v139 = nil;
            if v135 and v135 ~= l_LocalPlayer_0 and v135.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 174 ]]
                    -- upvalues: l_LocalPlayer_0 (ref), v135 (copy)
                    return l_LocalPlayer_0:GetFriendStatus(v135);
                end);
                v139 = if l_status_2 then l_result_2 else Enum.FriendStatus.NotFriend;
            end;
            if v29:IsPlayerBlockedByUserId(v135.UserId) == false then
                l_FriendStatus_0 = if v136 then v105(v139, v135) else v93(v139, v135);
            end;
            if l_FriendStatus_0 then
                l_FriendStatus_0.Name = "FriendStatus";
                l_FriendStatus_0.LayoutOrder = 5;
                l_FriendStatus_0.Selectable = true;
                local v142 = "utility-focus-state" .. "-friendstatuslabel-" .. v135.Name;
                v17:MakeFocusState(l_FriendStatus_0, v142);
                l_FriendStatus_0.Parent = v134;
            end;
            return;
        end;
    end;
    local function v149(v144, v145) --[[ Line: 499 ]] --[[ Name: friendStatusCreate ]]
        -- upvalues: l_GuiService_0 (ref), v106 (ref), v143 (copy), v17 (ref)
        local v146 = nil;
        if v144 then
            v146 = v144:FindFirstChild("RightSideButtons");
        end;
        if v146 then
            for _, v148 in pairs(v146:GetChildren()) do
                if v148 and v148.Name == "FriendStatus" then
                    if l_GuiService_0.SelectedCoreObject == v148 then
                        l_GuiService_0.SelectedCoreObject = v106;
                    end;
                    v148:Destroy();
                end;
            end;
            v143(v146, v145, v17:IsPortrait(), nil);
        end;
    end;
    l_LocalPlayer_0.FriendStatusChanged:connect(function(v150, _) --[[ Line: 521 ]]
        -- upvalues: l_NewPage_0 (copy), v149 (copy)
        if v150 then
            local l_FirstChild_0 = l_NewPage_0.Page:FindFirstChild("PlayerLabel" .. v150.Name);
            if l_FirstChild_0 then
                v149(l_FirstChild_0, v150);
            end;
        end;
    end);
    local v153 = nil;
    local v154 = nil;
    local v155 = v28.new(l_LocalPlayer_0.UserId, {
        EventStream = l_RbxAnalyticsService_0
    });
    local function v170(v156, v157, v158, _) --[[ Line: 534 ]] --[[ Name: createBlockButton ]]
        -- upvalues: v29 (ref), v153 (ref), v143 (copy), v154 (ref), l_GuiService_0 (ref), v25 (ref), v155 (copy), l_Constants_0 (ref), v17 (ref), v23 (ref), v47 (ref)
        local v160 = v29:IsPlayerBlockedByUserId(v157.UserId);
        local function _(v161) --[[ Line: 537 ]] --[[ Name: updateBlockButton ]]
            -- upvalues: v153 (ref), v156 (copy), v157 (copy), v158 (copy), v143 (ref), v154 (ref)
            local v162 = v153(v156, v157, v158, not v158);
            v143(v156, v157, v158, not v158);
            if v161 then
                v154(v162);
            end;
        end;
        local function v167() --[[ Line: 545 ]] --[[ Name: blockUser ]]
            -- upvalues: l_GuiService_0 (ref), v25 (ref), v157 (copy), v155 (ref), l_Constants_0 (ref), v153 (ref), v156 (copy), v158 (copy), v143 (ref), v154 (ref)
            local v164 = true;
            if l_GuiService_0.SelectedCoreObject == nil then
                v164 = l_GuiService_0.SelectedObject ~= nil;
            end;
            v25(v157, v155, l_Constants_0.AnalyticsInGameMenuName):andThen(function() --[[ Line: 547 ]]
                -- upvalues: v164 (copy), v153 (ref), v156 (ref), v157 (ref), v158 (ref), v143 (ref), v154 (ref)
                local l_v164_0 = v164;
                local v166 = v153(v156, v157, v158, not v158);
                v143(v156, v157, v158, not v158);
                if l_v164_0 then
                    v154(v166);
                end;
            end);
        end;
        local function v169() --[[ Line: 552 ]] --[[ Name: unBlockUser ]]
            -- upvalues: v29 (ref), v157 (copy), v155 (ref), v153 (ref), v156 (copy), v158 (copy), v143 (ref)
            if v29:UnblockPlayerAsync(v157) then
                v155:action("SettingsHub", "unblockUser", {
                    blockeeUserId = v157.UserId
                });
                local _ = v153(v156, v157, v158, not v158);
                v143(v156, v157, v158, not v158);
            end;
        end;
        if v160 then
            return v17:MakeStyledButton("BlockButton", v23:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, v47.ButtonHeight), v169);
        else
            return v17:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v167);
        end;
    end;
    v154 = function(v171) --[[ Line: 581 ]] --[[ Name: trySelection ]]
        -- upvalues: l_GuiService_0 (ref)
        if v171 and not v171.Selectable then
            l_GuiService_0:Select(v171);
            return;
        else
            l_GuiService_0.SelectedCoreObject = v171;
            return;
        end;
    end;
    v153 = function(v172, v173, v174, v175) --[[ Line: 589 ]] --[[ Name: resizeBlockButton ]]
        -- upvalues: l_LocalPlayer_0 (ref), v170 (copy), v17 (ref)
        local l_BlockButton_0 = v172:FindFirstChild("BlockButton");
        if l_BlockButton_0 and v174 == v175 then
            return l_BlockButton_0;
        else
            if l_BlockButton_0 then
                l_BlockButton_0:Destroy();
                l_BlockButton_0 = nil;
            end;
            if v173 and v173 ~= l_LocalPlayer_0 and v173.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                l_BlockButton_0 = v170(v172, v173, v174, v175);
            end;
            if l_BlockButton_0 then
                l_BlockButton_0.Name = "BlockButton";
                l_BlockButton_0.LayoutOrder = 4;
                l_BlockButton_0.Selectable = true;
                local v177 = "utility-focus-state" .. "-blockbutton-" .. v173.Name;
                v17:MakeFocusState(l_BlockButton_0, v177);
                l_BlockButton_0.Parent = v172;
            end;
            return l_BlockButton_0;
        end;
    end;
    local v178 = false;
    local v179 = false;
    local function v194(v180, v181) --[[ Line: 618 ]] --[[ Name: muteButtonUpdate ]]
        -- upvalues: l_MuteStatusIcons_0 (ref), v61 (ref), l_game_EngineFeature_1 (ref), l_default_0 (ref), v110 (copy), v17 (ref), v47 (ref), v111 (copy), v27 (ref)
        local v182 = nil;
        if v180 then
            v182 = v180:FindFirstChild("RightSideButtons");
        end;
        if not v182 then
            return;
        else
            local l_MuteStatusButton_0 = v182:FindFirstChild("MuteStatusButton");
            if v181 == nil then
                if l_MuteStatusButton_0 then
                    l_MuteStatusButton_0:Destroy();
                end;
                return;
            else
                local v184 = UDim2.fromOffset(36, 36);
                local v185 = UDim2.fromOffset(0, 0);
                local v186 = 0;
                local v187 = v181.isMuted and l_MuteStatusIcons_0.MicOff or l_MuteStatusIcons_0.MicOn;
                if v181.subscriptionFailed then
                    v187 = l_MuteStatusIcons_0.Error;
                    v184 = UDim2.fromOffset(36, 36);
                    v185 = UDim2.fromOffset(2, -2);
                    if v61 and l_game_EngineFeature_1 then
                        v186 = 0.5;
                    end;
                elseif v181.isMutedLocally then
                    v187 = l_MuteStatusIcons_0.MicDisabled;
                    v186 = 0.5;
                elseif not v181.subscriptionCompleted then
                    v187 = l_MuteStatusIcons_0.Loading;
                elseif v181.isSignalActive then
                    local v188 = math.floor(0.5 + 5 * math.random()) * 20;
                    v187 = l_default_0:GetIcon("Unmuted" .. tostring(v188), "SpeakerLight");
                end;
                if l_MuteStatusButton_0 then
                    local v189 = v110[v181.userId] or v182:FindFirstChild("MuteStatusImageLabel", true);
                    v189.Image = v187;
                    v189.Size = v184;
                    v189.ImageTransparency = v186;
                    return;
                else
                    if l_default_0.voiceUIVisible then
                        local v191, v192 = v17:MakeStyledImageButton("MuteStatus", v187, UDim2.fromOffset(v47.ButtonHeight, v47.ButtonHeight), v184, function() --[[ Line: 678 ]]
                            -- upvalues: l_default_0 (ref), v181 (copy), v111 (ref), v27 (ref), v61 (ref), l_game_EngineFeature_1 (ref)
                            local v190 = l_default_0.participants[tostring(v181.userId)];
                            if v190.subscriptionCompleted then
                                if v111 then
                                    v111:onToggleMutePlayer(v181.userId, not v190.isMutedLocally);
                                end;
                                l_default_0:ToggleMutePlayer(v181.userId, v27.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                                return;
                            else
                                if v190.subscriptionFailed then
                                    if v61 then
                                        if not l_game_EngineFeature_1 then
                                            l_default_0:SubscribeRetry(v181.userId);
                                            return;
                                        end;
                                    else
                                        l_default_0:SubscribeRetry(v181.userId);
                                    end;
                                end;
                                return;
                            end;
                        end);
                        v110[v181.userId] = v192;
                        v192.ZIndex = 3;
                        v192.Position = v192.Position + v185;
                        v192.ImageTransparency = v186;
                        local v193 = "utility-focus-state" .. "-mutestatusbutton-" .. v181.userId;
                        v17:MakeFocusState(v191, v193);
                        v191.Parent = v182;
                    end;
                    return;
                end;
            end;
        end;
    end;
    local v195 = l_Create_0("Frame")({
        Name = "ButtonsContainer", 
        Size = UDim2.new(1, 0, 0, v47.ButtonHeight), 
        BackgroundTransparency = 1, 
        Parent = l_NewPage_0.Page, 
        Visible = false
    });
    l_NewPage_0.ButtonsContainer = v195;
    if v39 and (v40 == 1 or v40 == 3) then
        v195.Parent = nil;
    end;
    l_Create_0("UIPadding")({
        PaddingBottom = UDim.new(0, 1), 
        PaddingTop = UDim.new(0, 1), 
        PaddingLeft = UDim.new(0, 1), 
        PaddingRight = UDim.new(0, 1), 
        Parent = v195
    });
    local function v196() --[[ Line: 735 ]]
        -- upvalues: v54 (ref), l_NewPage_0 (copy), v27 (ref)
        if v54() and l_NewPage_0.HubRef.leaveGameUpsellProp ~= v27.PHONE_UPSELL_VALUE_PROP.None then
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGameUpsellPage, nil, 1, true);
            return;
        else
            l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.LeaveGamePage, false, 1);
            return;
        end;
    end;
    local v197, v198 = v17:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -12, 1, 0), v196);
    v197.AnchorPoint = Vector2.new(0, 0);
    v197.Position = UDim2.new(0, 0, 0, 0);
    v198.Size = UDim2.new(1, -4, 1, 0);
    v198.Position = UDim2.new(0, 2, 0, 0);
    l_Create_0("UIListLayout")({
        FillDirection = Enum.FillDirection.Horizontal, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Parent = v197
    });
    l_Create_0("UIPadding")({
        PaddingLeft = UDim.new(0.025, 0), 
        Parent = v197
    });
    v198.Size = UDim2.new(0, 0, 1, 0);
    l_Create_0("UIFlexItem")({
        FlexMode = Enum.UIFlexMode.Grow, 
        Parent = v198
    });
    if not v39 or v40 == 0 then
        v197.Parent = v195;
    end;
    local function v199() --[[ Line: 778 ]]
        -- upvalues: l_NewPage_0 (copy)
        l_NewPage_0.HubRef:SwitchToPage(l_NewPage_0.HubRef.ResetCharacterPage, false, 1);
    end;
    local v200 = v72[l_RobloxLocaleId_0]:Format(l_Constants_0.RespawnLocalizedKey);
    local v201, v202 = v17:MakeStyledButton("ResetButton", v200, UDim2.new(0.3333333333333333, -12, 1, 0), v199);
    v201.AnchorPoint = Vector2.new(0.5, 0);
    v201.Position = UDim2.new(0.5, 0, 0, 0);
    v202.Size = UDim2.new(1, -4, 1, 0);
    v202.Position = UDim2.new(0, 2, 0, 0);
    if not v39 or v40 == 0 then
        v201.Parent = v195;
    end;
    local function v203() --[[ Line: 795 ]]
        -- upvalues: l_NewPage_0 (copy), l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref)
        l_NewPage_0.HubRef:SetVisibility(false);
        l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsResumeGameName, l_Constants_0.AnalyticsMenuActionName, {
            source = l_Constants_0.AnalyticsResumeButtonSource, 
            playsessionid = l_NewPage_0.playSessionId, 
            universeid = tostring(game.GameId)
        });
    end;
    local v204, v205 = v17:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -12, 1, 0), v203);
    v204.AnchorPoint = Vector2.new(1, 0);
    v204.Position = UDim2.new(1, 0, 0, 0);
    v205.Size = UDim2.new(1, -4, 1, 0);
    v205.Position = UDim2.new(0, 2, 0, 0);
    if not v39 or v40 == 0 then
        v204.Parent = v195;
    end;
    local function v209() --[[ Line: 822 ]] --[[ Name: pollImage ]]
        -- upvalues: l_default_0 (ref), l_PlayerMuteStatusIcons_0 (ref)
        local l_localMuted_0 = l_default_0.localMuted;
        local _ = nil;
        if l_localMuted_0 == nil then
            return l_PlayerMuteStatusIcons_0.Loading;
        elseif l_localMuted_0 then
            return l_PlayerMuteStatusIcons_0.MicOff;
        elseif l_default_0.isTalking then
            local v208 = math.floor(0.5 + 5 * math.random()) * 20;
            return (l_default_0:GetIcon("Unmuted" .. tostring(v208), "MicLight"));
        else
            return l_PlayerMuteStatusIcons_0.MicOn;
        end;
    end;
    local function _(v210, v211, v212, v213) --[[ Line: 839 ]] --[[ Name: updateButtonPosition ]]
        -- upvalues: v195 (copy)
        local l_v195_FirstChild_0 = v195:FindFirstChild(v210 .. "Button", true);
        if not l_v195_FirstChild_0 then
            return;
        else
            l_v195_FirstChild_0.Position = v211;
            l_v195_FirstChild_0.Size = v212;
            l_v195_FirstChild_0.AnchorPoint = v213;
            return;
        end;
    end;
    local function _() --[[ Line: 851 ]] --[[ Name: muteButtonReset ]]
        -- upvalues: v195 (copy)
        local l_v195_FirstChild_1 = v195:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v195_FirstChild_1 then
            l_v195_FirstChild_1:Destroy();
        end;
    end;
    local function v223() --[[ Line: 858 ]] --[[ Name: resetButtonRow ]]
        -- upvalues: v39 (ref), v40 (ref), v195 (copy)
        if not v39 or v40 == 0 then
            local v218 = UDim2.new(1, 0, 0, 0);
            local v219 = UDim2.new(0.3333333333333333, -12, 1, 0);
            local v220 = Vector2.new(1, 0);
            local l_v195_FirstChild_2 = v195:FindFirstChild("ResumeButtonButton", true);
            if l_v195_FirstChild_2 then
                l_v195_FirstChild_2.Position = v218;
                l_v195_FirstChild_2.Size = v219;
                l_v195_FirstChild_2.AnchorPoint = v220;
            end;
            v218 = UDim2.new(0.5, 0, 0, 0);
            v219 = UDim2.new(0.3333333333333333, -12, 1, 0);
            v220 = Vector2.new(0.5, 0);
            l_v195_FirstChild_2 = v195:FindFirstChild("ResetButtonButton", true);
            if l_v195_FirstChild_2 then
                l_v195_FirstChild_2.Position = v218;
                l_v195_FirstChild_2.Size = v219;
                l_v195_FirstChild_2.AnchorPoint = v220;
            end;
            v218 = UDim2.new(0, 0, 0, 0);
            v219 = UDim2.new(0.3333333333333333, -12, 1, 0);
            v220 = Vector2.new(0, 0);
            l_v195_FirstChild_2 = v195:FindFirstChild("LeaveButtonButton", true);
            if l_v195_FirstChild_2 then
                l_v195_FirstChild_2.Position = v218;
                l_v195_FirstChild_2.Size = v219;
                l_v195_FirstChild_2.AnchorPoint = v220;
            end;
        end;
        local l_v195_FirstChild_3 = v195:FindFirstChild("PlayerMuteButtonButton", true);
        if l_v195_FirstChild_3 then
            l_v195_FirstChild_3:Destroy();
        end;
    end;
    local function _() --[[ Line: 882 ]] --[[ Name: updateMuteSelfButtonIcon ]]
        -- upvalues: v66 (ref), v116 (ref), v209 (copy)
        local v224 = nil;
        if v66() then
            if v116 then
                v224 = v116:FindFirstChild("MuteSelfButtonImageLabel", true);
            end;
        else
            v224 = v116:FindFirstChild("MuteSelfButtonImageLabel", true);
        end;
        if not v224 then
            return;
        else
            v224.Image = v209();
            return;
        end;
    end;
    v17:OnResized(v195, function(_, v227) --[[ Line: 899 ]]
        -- upvalues: v17 (ref), v47 (ref), v195 (copy), v39 (ref), v40 (ref), v202 (copy), v198 (copy), v205 (copy)
        if (v227 or v17:IsSmallTouchScreen()) and not v47.AlwaysShowBottomBar() then
            local v228 = v227 and v47.textSize(18) or v47.textSize(24);
            if v47.UseBiggerText then
                v228 = v47.textSize(20);
            end;
            v195.Visible = not v47.EnableVerticalBottomBar;
            v195.Size = UDim2.new(1, 0, 0, v47.ButtonHeight);
            if not v39 or v40 == 0 then
                v202.TextSize = v228;
                v198.TextSize = v228;
                v205.TextSize = v228;
                return;
            end;
        else
            v195.Visible = false;
            v195.Size = UDim2.new(1, 0, 0, 0);
        end;
    end);
    local function v236(v229, v230) --[[ Line: 918 ]] --[[ Name: reportAbuseButtonCreate ]]
        -- upvalues: l_LocalPlayer_0 (ref), v19 (ref), v17 (ref), v47 (ref)
        local l_RightSideButtons_0 = v229:FindFirstChild("RightSideButtons");
        if l_RightSideButtons_0 then
            local l_ReportPlayer_0 = l_RightSideButtons_0:FindFirstChild("ReportPlayer");
            if l_ReportPlayer_0 then
                l_ReportPlayer_0:Destroy();
            end;
            if v230 and v230 ~= l_LocalPlayer_0 and v230.UserId > 0 and l_LocalPlayer_0.UserId > 0 then
                local function v233() --[[ Line: 927 ]]
                    -- upvalues: v19 (ref), v230 (copy)
                    v19:ReportPlayer(v230, "MenuPlayerList");
                end;
                local v234 = v17:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v233);
                v234.Name = "ReportPlayer";
                v234.Position = UDim2.new(1, -260, 0, 7);
                v234.LayoutOrder = 3;
                v234.Selectable = true;
                local v235 = "utility-focus-state" .. "-reportplayer-" .. v230.Name;
                v17:MakeFocusState(v234, v235);
                v234.Parent = l_RightSideButtons_0;
            end;
        end;
    end;
    local v237 = nil;
    local v238 = nil;
    local v239 = nil;
    local v240 = nil;
    local v241 = nil;
    local v242 = false;
    local v243 = nil;
    local function _() --[[ Line: 958 ]] --[[ Name: muteAllButtonRemove ]]
        -- upvalues: v107 (ref), v112 (ref)
        if v107 then
            v107.Visible = false;
            v107:Destroy();
            v107 = nil;
        end;
        v112();
    end;
    local function _() --[[ Line: 967 ]] --[[ Name: muteSelfButtonRemove ]]
        -- upvalues: v108 (ref), v243 (ref), v112 (ref)
        if v108 then
            v108.Visible = false;
            v108:Destroy();
            v108 = nil;
        end;
        if v243 then
            v243:Disconnect();
            v243 = nil;
        end;
        v112();
    end;
    local function _() --[[ Line: 980 ]] --[[ Name: joinVoiceButtonRemove ]]
        -- upvalues: v109 (ref), v112 (ref)
        if v109 then
            v109.Visible = false;
            v109:Destroy();
            v109 = nil;
        end;
        v112();
    end;
    local function v247() --[[ Line: 989 ]] --[[ Name: shouldShowJoinVoiceButton ]]
        -- upvalues: v56 (ref), v242 (ref), v68 (ref), l_default_0 (ref)
        return v56() and game:GetEngineFeature("VoiceChatSupported") and not v242 and not v68 and l_default_0:verifyUniverseAndPlaceCanUseVoice() and l_default_0:ShouldShowJoinVoiceOnDisconnect() and l_default_0:GetVoiceConnectCookie() == "" and l_default_0:HasSeamlessVoiceFeature("InitialJoinVoice");
    end;
    local function v255(v248, v249, v250) --[[ Line: 1000 ]] --[[ Name: createRow ]]
        -- upvalues: v47 (ref), l_Create_0 (ref)
        local v251 = Instance.new(v248);
        v251.Size = UDim2.new(1, 0, 0, 62);
        v251.Position = UDim2.new(0, 0, 0, 0);
        v251.ZIndex = 2;
        v251.BackgroundColor3 = v47.color("PlayerRowFrame");
        v251.BackgroundTransparency = v47.transparency("PlayerRowFrame");
        l_Create_0("UICorner")({
            CornerRadius = v47.DefaultCornerRadius, 
            Parent = v251
        });
        local v252 = nil;
        if v250 then
            v252 = Instance.new("TextLabel");
            v252.TextColor3 = Color3.new(1, 1, 1);
            v252.TextSize = 24;
        else
            v252 = Instance.new("ImageLabel");
        end;
        v252.Name = "Icon";
        v252.BackgroundTransparency = 1;
        v252.Size = UDim2.new(0, 36, 0, 36);
        v252.Position = UDim2.new(0, 12, 0, 12);
        v252.ZIndex = 3;
        v252.Parent = v251;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = "";
        l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left;
        l_TextLabel_0.Font = v47.font(Enum.Font.SourceSans, "DisplayName");
        l_TextLabel_0.FontSize = v249 and v47.fontSize(Enum.FontSize.Size36, "DisplayName") or v47.fontSize(Enum.FontSize.Size24, "DisplayName");
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.Position = v249 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0);
        l_TextLabel_0.Size = UDim2.new(0, 0, 0, 0);
        l_TextLabel_0.ZIndex = 3;
        l_TextLabel_0.Parent = v251;
        if v249 then
            local l_TextLabel_1 = Instance.new("TextLabel");
            l_TextLabel_1.Text = "";
            l_TextLabel_1.Name = "SecondRow";
            l_TextLabel_1.TextXAlignment = Enum.TextXAlignment.Left;
            l_TextLabel_1.Font = v47.font(Enum.Font.SourceSans);
            l_TextLabel_1.FontSize = v47.fontSize(Enum.FontSize.Size24, "Username");
            l_TextLabel_1.TextColor3 = Color3.fromRGB(162, 162, 162);
            l_TextLabel_1.BackgroundTransparency = 1;
            l_TextLabel_1.Position = UDim2.new(0, 60, 0.5, 12);
            l_TextLabel_1.Size = UDim2.new(0, 0, 0, 0);
            l_TextLabel_1.ZIndex = 3;
            l_TextLabel_1.Parent = v251;
        end;
        return v251;
    end;
    v237 = function() --[[ Line: 1059 ]]
        -- upvalues: v255 (copy), v242 (ref), v56 (ref), v247 (copy), v49 (ref), v47 (ref), v72 (copy), l_RobloxLocaleId_0 (copy), l_FFlagConnectionsToFriendsRename_0 (ref), l_Constants_0 (ref), l_uiblox_0 (ref), v32 (ref), v17 (ref)
        local v256 = v255("ImageButton", nil, true);
        v256.Size = UDim2.new(1, 0, 0, 52);
        local l_TextLabel_2 = v256.TextLabel;
        local l_Icon_0 = v256.Icon;
        if v242 or v56() and v247() then
            v256.Size = v49;
            l_TextLabel_2.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_2.TextTruncate = Enum.TextTruncate.AtEnd;
            v256.AnchorPoint = Vector2.new(0, 0);
        end;
        l_TextLabel_2.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_2.AutoLocalize = false;
        l_TextLabel_2.Text = v72[l_RobloxLocaleId_0]:Format(if l_FFlagConnectionsToFriendsRename_0 then l_Constants_0.InviteFriendsLocalizedKey else l_Constants_0.InviteConnectionsLocalizedKey);
        l_Icon_0.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_0.Position = UDim2.new(0, 18, 0.5, 0);
        local v259 = l_uiblox_0["icons/actions/friends/friendInvite"];
        local v260 = if v259 then l_uiblox_0["icons/actions/friends/friendInvite"] else v47.Images["icons/actions/friends/friendInvite"];
        if v260 then
            if v259 then
                l_Icon_0.Text = v260.name;
                l_Icon_0.FontFace = v32.Font[v260.variant];
            else
                l_Icon_0.Image = v260.Image;
                l_Icon_0.ImageRectOffset = v260.ImageRectOffset;
                l_Icon_0.ImageRectSize = v260.ImageRectSize;
            end;
        end;
        local function _(v261) --[[ Line: 1093 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v256 (copy)
            if v261 then
                v256.ImageTransparency = 0.65;
                return;
            else
                v256.ImageTransparency = 0.85;
                return;
            end;
        end;
        v256.InputBegan:Connect(function() --[[ Line: 1101 ]]
            -- upvalues: v256 (copy)
            v256.ImageTransparency = 0.65;
        end);
        v256.InputEnded:Connect(function() --[[ Line: 1104 ]]
            -- upvalues: v256 (copy)
            v256.ImageTransparency = 0.85;
        end);
        v256.Activated:Connect(function() --[[ Line: 1107 ]]
            -- upvalues: v256 (copy)
            v256.ImageTransparency = 0.85;
        end);
        v256.TouchPan:Connect(function(_, v264) --[[ Line: 1110 ]]
            -- upvalues: v256 (copy)
            if math.abs(v264.Y) > 20 then
                v256.ImageTransparency = 0.85;
            end;
        end);
        v256.SelectionGained:connect(function() --[[ Line: 1116 ]]
            -- upvalues: v256 (copy)
            v256.ImageTransparency = 0.65;
        end);
        v256.SelectionLost:connect(function() --[[ Line: 1119 ]]
            -- upvalues: v256 (copy)
            v256.ImageTransparency = 0.85;
        end);
        v256.SelectionImageObject = v256:Clone();
        v17:MakeFocusState(v256, "utility-focus-state-sharegame");
        return v256;
    end;
    v238 = function() --[[ Line: 1130 ]]
        -- upvalues: v255 (copy), v106 (ref), v47 (ref), v23 (ref), l_default_0 (ref), v17 (ref)
        local v265 = v255("ImageButton");
        v265.Size = UDim2.new(v106 and 0.5 or 1, -10, 0, 52);
        v265.Position = UDim2.new(1, 0, 0, 0);
        v265.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_3 = v265.TextLabel;
        local l_Icon_1 = v265.Icon;
        l_TextLabel_3.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_3.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_3.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_3.AutoLocalize = false;
        l_TextLabel_3.Text = v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
        l_Icon_1.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_1.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_1.Image = l_default_0:GetIcon("UnmuteAll", "Misc");
        l_Icon_1.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_1.Position = UDim2.new(0, 18, 0.5, 0);
        local function _(v268) --[[ Line: 1150 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v265 (copy)
            if v268 then
                v265.ImageTransparency = 0.65;
                return;
            else
                v265.ImageTransparency = 0.85;
                return;
            end;
        end;
        v265.InputBegan:Connect(function() --[[ Line: 1158 ]]
            -- upvalues: v265 (copy)
            v265.ImageTransparency = 0.65;
        end);
        v265.InputEnded:Connect(function() --[[ Line: 1161 ]]
            -- upvalues: v265 (copy)
            v265.ImageTransparency = 0.85;
        end);
        v265.Activated:Connect(function() --[[ Line: 1164 ]]
            -- upvalues: v265 (copy)
            v265.ImageTransparency = 0.85;
        end);
        v265.TouchPan:Connect(function(_, v271) --[[ Line: 1167 ]]
            -- upvalues: v265 (copy)
            if math.abs(v271.Y) > 20 then
                v265.ImageTransparency = 0.85;
            end;
        end);
        v265.SelectionGained:connect(function() --[[ Line: 1173 ]]
            -- upvalues: v265 (copy)
            v265.ImageTransparency = 0.65;
        end);
        v265.SelectionLost:connect(function() --[[ Line: 1176 ]]
            -- upvalues: v265 (copy)
            v265.ImageTransparency = 0.85;
        end);
        v265.SelectionImageObject = v265:Clone();
        v17:MakeFocusState(v265, "utility-focus-state-muteall");
        return v265;
    end;
    v239 = function() --[[ Line: 1187 ]]
        -- upvalues: v255 (copy), v47 (ref), v209 (copy), v17 (ref), v72 (copy), l_RobloxLocaleId_0 (copy), l_default_0 (ref), v243 (ref), v178 (ref), v66 (ref), v116 (ref), v111 (copy), v108 (ref)
        local v272 = v255("ImageButton");
        v272.Name = "MuteSelfButton";
        v272.Size = UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight);
        v272.Position = UDim2.new(1, 0, 0, 0);
        v272.AnchorPoint = Vector2.new(1, 0);
        local l_TextLabel_4 = v272.TextLabel;
        local l_Icon_2 = v272.Icon;
        l_TextLabel_4.Size = UDim2.new(1, -60, 0, 0);
        l_TextLabel_4.TextTruncate = Enum.TextTruncate.AtEnd;
        l_TextLabel_4.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
        l_TextLabel_4.AutoLocalize = false;
        l_Icon_2.Name = "MuteSelfButtonImageLabel";
        l_Icon_2.Size = UDim2.new(0, 32, 0, 32);
        l_Icon_2.Position = UDim2.new(0, 18, 0, 16);
        l_Icon_2.Image = v209();
        l_Icon_2.AnchorPoint = Vector2.new(0, 0.5);
        l_Icon_2.Position = UDim2.new(0, 18, 0.5, 0);
        local function _(v275) --[[ Line: 1208 ]] --[[ Name: setIsHighlighted ]]
            -- upvalues: v272 (copy)
            if v275 then
                v272.ImageTransparency = 0.65;
                return;
            else
                v272.ImageTransparency = 0.85;
                return;
            end;
        end;
        v272.InputBegan:Connect(function() --[[ Line: 1216 ]]
            -- upvalues: v272 (copy)
            v272.ImageTransparency = 0.65;
        end);
        v272.InputEnded:Connect(function() --[[ Line: 1219 ]]
            -- upvalues: v272 (copy)
            v272.ImageTransparency = 0.85;
        end);
        v272.Activated:Connect(function() --[[ Line: 1222 ]]
            -- upvalues: v272 (copy)
            v272.ImageTransparency = 0.85;
        end);
        v272.TouchPan:Connect(function(_, v278) --[[ Line: 1225 ]]
            -- upvalues: v272 (copy)
            if math.abs(v278.Y) > 20 then
                v272.ImageTransparency = 0.85;
            end;
        end);
        v272.SelectionGained:connect(function() --[[ Line: 1231 ]]
            -- upvalues: v272 (copy)
            v272.ImageTransparency = 0.65;
        end);
        v272.SelectionLost:connect(function() --[[ Line: 1234 ]]
            -- upvalues: v272 (copy)
            v272.ImageTransparency = 0.85;
        end);
        v272.SelectionImageObject = v272:Clone();
        v17:MakeFocusState(v272, "utility-focus-state-playermute");
        local function _(v279) --[[ Line: 1242 ]] --[[ Name: updatePlayerMuteText ]]
            -- upvalues: l_TextLabel_4 (copy), v72 (ref), l_RobloxLocaleId_0 (ref)
            local v280 = v279 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
            l_TextLabel_4.Text = v72[l_RobloxLocaleId_0]:Format(v280);
        end;
        local v282 = l_default_0.localMuted and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
        l_TextLabel_4.Text = v72[l_RobloxLocaleId_0]:Format(v282);
        v243 = l_default_0.muteChanged.Event:Connect(function(v283) --[[ Line: 1249 ]]
            -- upvalues: v178 (ref), v66 (ref), v116 (ref), v209 (ref), l_TextLabel_4 (copy), v72 (ref), l_RobloxLocaleId_0 (ref)
            v178 = v283;
            local v284 = nil;
            if v66() then
                if v116 then
                    v284 = v116:FindFirstChild("MuteSelfButtonImageLabel", true);
                end;
            else
                v284 = v116:FindFirstChild("MuteSelfButtonImageLabel", true);
            end;
            if v284 then
                v284.Image = v209();
            end;
            v284 = v283 and "CoreScripts.InGameMenu.QuickActions.UnmuteSelf" or "CoreScripts.InGameMenu.QuickActions.MuteSelf";
            l_TextLabel_4.Text = v72[l_RobloxLocaleId_0]:Format(v284);
        end);
        v272.Activated:Connect(function() --[[ Line: 1255 ]]
            -- upvalues: l_default_0 (ref), v111 (ref), v178 (ref)
            l_default_0:ToggleMic("InGameMenuPlayers");
            if v111 then
                v111:onToggleMuteSelf(v178);
            end;
        end);
        if v66() then
            return v272;
        else
            v108 = v272;
            return;
        end;
    end;
    local function _() --[[ Line: 1270 ]] --[[ Name: addMuteButtonExperience ]]
        -- upvalues: v68 (ref), v66 (ref), v108 (ref), v239 (ref)
        if v68 then
            return;
        elseif v66() then
            v108 = v239();
            return;
        else
            v239();
            return;
        end;
    end;
    if v56() then
        v240 = function() --[[ Line: 1283 ]]
            -- upvalues: v255 (copy), v49 (ref), v47 (ref), v57 (ref), v72 (copy), l_RobloxLocaleId_0 (copy), l_uiblox_0 (ref), v32 (ref), v17 (ref), l_default_0 (ref)
            local v286 = v255("ImageButton", nil, true);
            v286.Size = UDim2.new(1, 0, 0, 52);
            v286.Size = v49;
            v286.AnchorPoint = Vector2.new(0, 0);
            local l_TextLabel_5 = v286.TextLabel;
            l_TextLabel_5.Size = UDim2.new(1, -60, 0, 0);
            l_TextLabel_5.TextTruncate = Enum.TextTruncate.AtEnd;
            l_TextLabel_5.Font = v47.font(Enum.Font.SourceSansSemibold, "Semibold");
            l_TextLabel_5.AutoLocalize = false;
            if v57 then
                l_TextLabel_5.Text = v72[l_RobloxLocaleId_0]:Format("Feature.SettingsHub.Action.ConnectVoiceChat");
            else
                l_TextLabel_5.Text = "Connect Voice Chat";
            end;
            local l_Icon_3 = v286.Icon;
            l_Icon_3.AnchorPoint = Vector2.new(0, 0.5);
            l_Icon_3.Position = UDim2.new(0, 18, 0.5, 0);
            local v289 = l_uiblox_0["icons/controls/publicAudioJoin"];
            local v290 = if v289 then l_uiblox_0["icons/controls/publicAudioJoin"] else v47.Images["icons/controls/publicAudioJoin"];
            if v290 then
                if v289 then
                    l_Icon_3.Text = v290.name;
                    l_Icon_3.FontFace = v32.Font[v290.variant];
                else
                    l_Icon_3.Image = v290.Image;
                    l_Icon_3.ImageRectOffset = v290.ImageRectOffset;
                    l_Icon_3.ImageRectSize = v290.ImageRectSize;
                end;
            end;
            local function _(v291) --[[ Line: 1318 ]] --[[ Name: setIsHighlighted ]]
                -- upvalues: v286 (copy)
                if v291 then
                    v286.ImageTransparency = 0.65;
                    return;
                else
                    v286.ImageTransparency = 0.85;
                    return;
                end;
            end;
            v286.InputBegan:Connect(function() --[[ Line: 1326 ]]
                -- upvalues: v286 (copy)
                v286.ImageTransparency = 0.65;
            end);
            v286.InputEnded:Connect(function() --[[ Line: 1329 ]]
                -- upvalues: v286 (copy)
                v286.ImageTransparency = 0.85;
            end);
            v286.Activated:Connect(function() --[[ Line: 1332 ]]
                -- upvalues: v286 (copy)
                v286.ImageTransparency = 0.85;
            end);
            v286.TouchPan:Connect(function(_, v294) --[[ Line: 1335 ]]
                -- upvalues: v286 (copy)
                if math.abs(v294.Y) > 20 then
                    v286.ImageTransparency = 0.85;
                end;
            end);
            v286.SelectionGained:connect(function() --[[ Line: 1341 ]]
                -- upvalues: v286 (copy)
                v286.ImageTransparency = 0.65;
            end);
            v286.SelectionLost:connect(function() --[[ Line: 1344 ]]
                -- upvalues: v286 (copy)
                v286.ImageTransparency = 0.85;
            end);
            v286.SelectionImageObject = v286:Clone();
            v17:MakeFocusState(v286, "utility-focus-state-joinVoice");
            v286.Activated:Connect(function() --[[ Line: 1352 ]]
                -- upvalues: l_default_0 (ref)
                l_default_0:JoinVoice();
            end);
            return v286;
        end;
    end;
    local function _() --[[ Line: 1360 ]] --[[ Name: addJoinVoiceButton ]]
        -- upvalues: v247 (copy), v109 (ref), v240 (ref)
        if not v247() or v109 then
            return;
        else
            v109 = v240();
            return;
        end;
    end;
    local function _(v296) --[[ Line: 1368 ]] --[[ Name: createInspectButtonImage ]]
        -- upvalues: v17 (ref), v47 (ref)
        return (v17:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v296));
    end;
    local function v305(v298, v299, v300, v301) --[[ Line: 1379 ]] --[[ Name: resizeInspectButton ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (copy), l_GuiService_0 (ref), v17 (ref), v47 (ref)
        local l_Inspect_0 = v298:FindFirstChild("Inspect");
        if l_Inspect_0 and v300 == v301 then
            return;
        else
            if l_Inspect_0 then
                l_Inspect_0:Destroy();
            end;
            local function v303() --[[ Line: 1389 ]]
                -- upvalues: l_RbxAnalyticsService_0 (ref), l_Constants_0 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref), v299 (copy)
                l_RbxAnalyticsService_0:SetRBXEventStream(l_Constants_0.AnalyticsTargetName, l_Constants_0.AnalyticsExamineAvatarName, l_Constants_0.AnalyticsMenuActionName, {
                    playsessionid = l_NewPage_0.playSessionId, 
                    universeid = tostring(game.GameId)
                });
                l_GuiService_0:InspectPlayerFromUserIdWithCtx(v299.UserId, "escapeMenu");
                l_NewPage_0.HubRef:SetVisibility(false);
            end;
            l_Inspect_0 = v17:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, v47.ButtonHeight, 0, v47.ButtonHeight), UDim2.new(0, 28, 0, 28), v303);
            l_Inspect_0.Name = "Inspect";
            l_Inspect_0.LayoutOrder = 2;
            l_Inspect_0.Selectable = true;
            l_Inspect_0.Parent = v298;
            local v304 = "utility-focus-state" .. "-inspect-" .. v299.Name;
            v17:MakeFocusState(l_Inspect_0, v304);
            return;
        end;
    end;
    local function v314(v306, v307, v308) --[[ Line: 1412 ]] --[[ Name: resizePlatformName ]]
        -- upvalues: l_result_0 (ref), v17 (ref), v47 (ref), l_Create_0 (ref)
        local l_PlatformNameContainer_0 = v306:FindFirstChild("PlatformNameContainer");
        if l_PlatformNameContainer_0 then
            l_PlatformNameContainer_0:Destroy();
            l_PlatformNameContainer_0 = nil;
        end;
        if v307 == nil then
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
            l_PlatformNameContainer_0.Parent = v306;
            local v310 = nil;
            if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and l_result_0 and l_result_0:IsProfileEnabled() and v308 and v308 ~= "" then
                v310 = function() --[[ Line: 1445 ]]
                    -- upvalues: l_result_0 (ref), v308 (copy)
                    l_result_0:ShowProfile(v308);
                end;
            end;
            local v311, v312 = v17:MakeStyledButton("consoleNameContainer", v307, UDim2.new(0, 0, 0, v47.ButtonHeight), v310);
            v311.AnchorPoint = Vector2.new(0, 0.5);
            v311.Position = UDim2.fromScale(0, 0.5);
            v311.AutomaticSize = Enum.AutomaticSize.X;
            v311.Parent = l_PlatformNameContainer_0;
            v312.Size = UDim2.fromScale(0, 1);
            v312.AutoLocalize = false;
            v312.TextSize = v47.platformNameTextSize;
            v312.TextScaled = false;
            v312.TextWrapped = false;
            v312.AutomaticSize = Enum.AutomaticSize.X;
            local v313 = l_Create_0("ImageLabel")({
                Name = "iconLabel", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = v47.platformNameIconSize, 
                Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png", 
                ImageColor3 = Color3.new(1, 1, 1)
            });
            v313.Parent = v311;
            l_Create_0("UIListLayout")({
                Name = "PLatformNameUIListLayout", 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }).Parent = v311;
            v313.LayoutOrder = 1;
            v312.LayoutOrder = 2;
            l_Create_0("UIPadding")({
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                Parent = v311
            });
            return l_PlatformNameContainer_0;
        end;
    end;
    v241 = function() --[[ Line: 1507 ]]
        -- upvalues: v255 (copy), l_FFlagIEMFocusNavToButtons_0 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_OpenTypeSupport_0 (ref), l_GuiService_0 (ref)
        local v315 = v255("ImageLabel", true);
        v315.TextLabel.Name = "DisplayNameLabel";
        v315.SecondRow.Name = "NameLabel";
        if l_FFlagIEMFocusNavToButtons_0 then
            v315.Selectable = false;
            v315.SelectionGroup = true;
        end;
        if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then
            v315.NameLabel.OpenTypeFeatures = l_OpenTypeSupport_0:getUserNameStylisticAlternative();
        end;
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Name = "RightSideButtons";
        l_Frame_1.BackgroundTransparency = 1;
        l_Frame_1.ZIndex = 2;
        l_Frame_1.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_1.Size = UDim2.new(1, -12, 1, 0);
        l_Frame_1.Parent = v315;
        local function _(v317) --[[ Line: 1528 ]]
            -- upvalues: v315 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v315 then
                if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= v317 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                    v315.ImageTransparency = 0.65;
                    return;
                else
                    v315.ImageTransparency = 0.85;
                end;
            end;
        end;
        local v319 = nil;
        l_Frame_1.ChildAdded:connect(function(v320) --[[ Line: 1543 ]]
            -- upvalues: v319 (ref), v315 (copy), l_GuiService_0 (ref), l_Frame_1 (copy)
            if v320:IsA("GuiObject") then
                if v319 and v320 ~= v319 then
                    v319:Destroy();
                    v319 = nil;
                end;
                v320.SelectionGained:connect(function() --[[ Line: 1549 ]]
                    -- upvalues: v315 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    if v315 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= nil and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v315.ImageTransparency = 0.65;
                            return;
                        else
                            v315.ImageTransparency = 0.85;
                        end;
                    end;
                end);
                v320.SelectionLost:connect(function() --[[ Line: 1552 ]]
                    -- upvalues: v320 (copy), v315 (ref), l_GuiService_0 (ref), l_Frame_1 (ref)
                    local l_v320_0 = v320;
                    if v315 then
                        if l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject ~= l_v320_0 and l_GuiService_0.SelectedCoreObject.Parent == l_Frame_1 then
                            v315.ImageTransparency = 0.65;
                            return;
                        else
                            v315.ImageTransparency = 0.85;
                        end;
                    end;
                end);
            end;
        end);
        v319 = Instance.new("Frame");
        v319.Selectable = true;
        v319.Size = UDim2.new(1, 0, 1, 0);
        v319.BackgroundTransparency = 1;
        v319.SelectionImageObject = v319:Clone();
        v319.Parent = l_Frame_1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Name = "RightSideListLayout";
        l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
        l_UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Right;
        l_UIListLayout_0.VerticalAlignment = Enum.VerticalAlignment.Center;
        l_UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;
        l_UIListLayout_0.Padding = UDim.new(0, 12);
        l_UIListLayout_0.Parent = l_Frame_1;
        pcall(function() --[[ Line: 1574 ]]
            -- upvalues: v315 (copy)
            v315.NameLabel.Localize = false;
            v315.DisplayNameLabel.Localize = false;
        end);
        return v315;
    end;
    local function v374(v323, v324) --[[ Line: 1586 ]] --[[ Name: managePlayerNameCutoff ]]
        -- upvalues: v67 (ref), l_UserProfileStore_0 (ref), v59 (ref), v17 (ref), v62 (ref), l_formatUsername_0 (ref)
        local v325 = nil;
        local v326 = nil;
        local function v336(v327, v328, v329) --[[ Line: 1589 ]] --[[ Name: reportFlagChanged ]]
            -- upvalues: v325 (ref), v323 (copy), v324 (copy)
            if v328 == "AbsolutePosition" and v325 then
                local v330 = v327.AbsolutePosition.X - 20 - v323.NameLabel.AbsolutePosition.X;
                v323.NameLabel.Text = "@" .. v324.Name;
                v323.DisplayNameLabel.Text = v324.DisplayName;
                if v329 then
                    v323.DisplayNameLabel.Text = v329;
                end;
                local v331 = utf8.len(v324.DisplayName);
                if v329 then
                    v331 = utf8.len(v329);
                end;
                while v330 < v323.NameLabel.TextBounds.X and v331 > 0 do
                    if v329 then
                        local v332 = utf8.offset(v329, v331);
                        v323.NameLabel.Text = string.sub(v329, 1, v332) .. "...";
                    else
                        local v333 = utf8.offset(v324.DisplayName, v331);
                        v323.NameLabel.Text = string.sub(v324.DisplayName, 1, v333) .. "...";
                    end;
                    v331 = v331 - 1;
                end;
                local v334 = "@" .. v324.Name;
                local v335 = string.len(v334);
                while v330 < v323.NameLabel.TextBounds.X and v335 > 0 do
                    v323.NameLabel.Text = string.sub(v334, 1, v335) .. "...";
                    v335 = v335 - 1;
                end;
            end;
        end;
        local function v346(v337, _, _) --[[ Line: 1623 ]] --[[ Name: reportFlagChangedWithCombinedName ]]
            -- upvalues: v67 (ref), v324 (copy), v336 (copy), l_UserProfileStore_0 (ref), v323 (copy)
            if v67 and not v324.UserId then
                v336(v337, "AbsolutePosition");
                return;
            else
                l_UserProfileStore_0.get().fetchNamesByUserIds({
                    (tostring(v324.UserId))
                }, function(v340) --[[ Line: 1627 ]]
                    -- upvalues: v323 (ref), v336 (ref), v337 (copy), v324 (ref)
                    local l_v323_0 = v323;
                    local v342 = if l_v323_0 and l_v323_0.Parent then l_v323_0:FindFirstChild("DisplayNameLabel") else nil;
                    if v342 == nil then
                        return;
                    else
                        local l_data_0 = v340.data;
                        if #l_data_0 == 0 then
                            l_v323_0 = "";
                        else
                            local v344 = l_data_0[1];
                            if v344 == nil then
                                l_v323_0 = "";
                            else
                                local l_names_1 = v344.names;
                                l_v323_0 = l_names_1 == nil and "" or l_names_1.getInExperienceCombinedName(false);
                            end;
                        end;
                        if string.len(l_v323_0) > 0 and l_v323_0 ~= v342.Text then
                            v336(v337, "AbsolutePosition", l_v323_0);
                            return;
                        else
                            if v324.DisplayName ~= v342.Text then
                                v336(v337, "AbsolutePosition");
                            end;
                            return;
                        end;
                    end;
                end);
                return;
            end;
        end;
        if not v59() then
            v17:OnResized(v323.NameLabel, function(_, v348) --[[ Line: 1647 ]]
                -- upvalues: v325 (ref), v17 (ref), v326 (ref), v323 (copy), v346 (copy), v324 (copy), v67 (ref), l_UserProfileStore_0 (ref)
                if v325 ~= nil and v325 == v348 then
                    return;
                else
                    v348 = v348 and not (v17:IsSmallTouchScreen() and v17:IsPortrait());
                    v325 = v348;
                    if v348 then
                        if v326 == nil then
                            v326 = v323.RightSideButtons.ChildAdded:connect(function(v349) --[[ Line: 1656 ]]
                                -- upvalues: v346 (ref)
                                if v349.Name == "Inspect" then
                                    v349.Changed:connect(function(_) --[[ Line: 1658 ]]
                                        -- upvalues: v346 (ref), v349 (copy)
                                        v346(v349, "AbsolutePosition");
                                    end);
                                    v346(v349, "AbsolutePosition");
                                end;
                            end);
                        end;
                        local l_Inspect_1 = v323.RightSideButtons:FindFirstChild("Inspect");
                        if l_Inspect_1 then
                            l_Inspect_1.Changed:connect(function(v352) --[[ Line: 1667 ]]
                                -- upvalues: v346 (ref), l_Inspect_1 (copy)
                                v346(l_Inspect_1, v352);
                            end);
                            v346(l_Inspect_1, "AbsolutePosition");
                            return;
                        end;
                    elseif not v323:FindFirstChild("NameLabel") then
                        return;
                    else
                        v323.NameLabel.Text = "@" .. v324.Name;
                        if v67 and not v324.UserId then
                            v323.DisplayNameLabel.Text = v324.DisplayName;
                            return;
                        else
                            l_UserProfileStore_0.get().fetchNamesByUserIds({
                                (tostring(v324.UserId))
                            }, function(v353) --[[ Line: 1681 ]]
                                -- upvalues: v323 (ref), v324 (ref)
                                local l_v323_1 = v323;
                                local v355 = if l_v323_1 and l_v323_1.Parent then l_v323_1:FindFirstChild("DisplayNameLabel") else nil;
                                if v355 == nil then
                                    return;
                                else
                                    local l_data_1 = v353.data;
                                    if #l_data_1 == 0 then
                                        l_v323_1 = "";
                                    else
                                        local v357 = l_data_1[1];
                                        if v357 == nil then
                                            l_v323_1 = "";
                                        else
                                            local l_names_2 = v357.names;
                                            l_v323_1 = l_names_2 == nil and "" or l_names_2.getInExperienceCombinedName(false);
                                        end;
                                    end;
                                    if string.len(l_v323_1) > 0 and l_v323_1 ~= v355.Text then
                                        v355.Text = l_v323_1;
                                        return;
                                    else
                                        l_data_1 = v324.DisplayName;
                                        if l_data_1 ~= v355.Text then
                                            v355.Text = l_data_1;
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
        local function v362() --[[ Line: 1701 ]] --[[ Name: getNearestRightSideButtonXPosition ]]
            -- upvalues: v323 (copy)
            local v359 = nil;
            for _, v361 in pairs(v323.RightSideButtons:GetChildren()) do
                if v361:IsA("ImageButton") and (not v359 or v361.AbsolutePosition.X < v359) then
                    v359 = v361.AbsolutePosition.X;
                end;
            end;
            return v359;
        end;
        local v363 = nil;
        local function v372() --[[ Line: 1716 ]] --[[ Name: rightSideButtonsChanged ]]
            -- upvalues: v362 (copy), v363 (ref), v323 (copy), v62 (ref), l_formatUsername_0 (ref), v324 (copy), v67 (ref), l_UserProfileStore_0 (ref)
            local v364 = v362();
            if v364 == v363 then
                return;
            else
                v363 = v364;
                local v365 = nil;
                v365 = if v364 then UDim2.new(0, v364 - v323.NameLabel.AbsolutePosition.X - 20, 0, 0) else UDim2.new(1, -20, 0, 0);
                v323.NameLabel.Size = v365;
                v323.DisplayNameLabel.Size = v365;
                v323.NameLabel.Text = if v62 then l_formatUsername_0(v324.Name) else "@" .. v324.Name;
                if v67 and not v324.UserId then
                    v323.DisplayNameLabel.Text = v324.DisplayName;
                    return;
                else
                    l_UserProfileStore_0.get().fetchNamesByUserIds({
                        (tostring(v324.UserId))
                    }, function(v366) --[[ Line: 1746 ]]
                        -- upvalues: v323 (ref), v324 (ref)
                        local l_v323_2 = v323;
                        local v368 = if l_v323_2 and l_v323_2.Parent then l_v323_2:FindFirstChild("DisplayNameLabel") else nil;
                        if v368 == nil then
                            return;
                        else
                            local l_data_2 = v366.data;
                            if #l_data_2 == 0 then
                                l_v323_2 = "";
                            else
                                local v370 = l_data_2[1];
                                if v370 == nil then
                                    l_v323_2 = "";
                                else
                                    local l_names_3 = v370.names;
                                    l_v323_2 = l_names_3 == nil and "" or l_names_3.getInExperienceCombinedName(false);
                                end;
                            end;
                            if string.len(l_v323_2) > 0 and l_v323_2 ~= v368.Text then
                                v368.Text = l_v323_2;
                                return;
                            else
                                l_data_2 = v324.DisplayName;
                                if l_data_2 ~= v368.Text then
                                    v368.Text = l_data_2;
                                end;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            end;
        end;
        if v59() then
            v326 = v323.RightSideButtons.ChildAdded:connect(function(v373) --[[ Line: 1765 ]]
                -- upvalues: v372 (copy)
                v372();
                v373:GetPropertyChangedSignal("AbsolutePosition"):Connect(v372);
            end);
            v372();
        end;
    end;
    local function _() --[[ Line: 1774 ]] --[[ Name: canShareCurrentGame ]]
        -- upvalues: l_LocalPlayer_0 (ref)
        return l_LocalPlayer_0.UserId > 0;
    end;
    local v376 = nil;
    local v377 = {};
    local v378 = {};
    local v379 = false;
    local function v387() --[[ Line: 1784 ]] --[[ Name: updateAllMuteButtons ]]
        -- upvalues: v107 (ref), l_default_0 (ref), l_Players_0 (ref), v377 (copy), v194 (copy), v179 (ref), v23 (ref)
        if not v107 then
            return;
        elseif not l_default_0.voiceUIVisible then
            return;
        else
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            local v381 = true;
            for _, v383 in ipairs(l_l_Players_0_Players_0) do
                local v384 = v377[v383.Name];
                if v383 and v384 then
                    local v385 = l_default_0.participants[tostring(v383.UserId)];
                    if v385 and not v385.isMutedLocally then
                        v381 = false;
                    end;
                    v194(v384, v385);
                end;
            end;
            if v381 then
                v179 = true;
            else
                v179 = false;
            end;
            local v386 = v179 and v23:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
            if not v107 or not v107:FindFirstChild("TextLabel") then
                return;
            else
                v107.TextLabel.Text = v386;
                v107.Icon.Image = l_default_0:GetIcon(v179 and "MuteAll" or "UnmuteAll", "Misc");
                return;
            end;
        end;
    end;
    local function v393() --[[ Line: 1827 ]] --[[ Name: destroyAllUserMuteButtons ]]
        -- upvalues: l_Players_0 (ref), v377 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v106 (ref)
        for _, v389 in (l_Players_0:GetPlayers()) do
            local v390 = v377[v389.Name];
            if v390 then
                local l_RightSideButtons_1 = v390:FindFirstChild("RightSideButtons");
                if l_RightSideButtons_1 then
                    local l_MuteStatusButton_1 = l_RightSideButtons_1:FindFirstChild("MuteStatusButton");
                    if l_MuteStatusButton_1 then
                        if l_GuiService_0.SelectedCoreObject == l_MuteStatusButton_1 then
                            if l_UserInputService_0.GamepadEnabled then
                                l_GuiService_0.SelectedCoreObject = v106;
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
    local function v446(_) --[[ Line: 1850 ]]
        -- upvalues: l_FFlagIEMFocusNavToButtons_0 (ref), l_NewPage_0 (copy), v376 (ref), l_Players_0 (ref), v68 (ref), l_LocalPlayer_0 (ref), v17 (ref), v242 (ref), v107 (ref), l_default_0 (ref), v106 (ref), l_RunService_0 (ref), v116 (ref), l_Create_0 (ref), v117 (ref), v49 (ref), v34 (ref), v35 (ref), l_GameInviteAnalytics_0 (ref), l_EventStream_0 (ref), l_RbxAnalyticsService_0 (ref), l_Diag_0 (ref), v237 (ref), v56 (ref), v247 (copy), v109 (ref), v240 (ref), v112 (ref), l_GuiService_0 (ref), v377 (copy), v378 (copy), v241 (ref), v194 (copy), l_SocialUtil_0 (ref), v62 (ref), l_formatUsername_0 (ref), v59 (ref), v374 (copy), v149 (copy), v143 (copy), v153 (ref), v305 (copy), v236 (copy), v238 (ref), v179 (ref), v23 (ref), v52 (ref), v30 (ref), v111 (copy), v27 (ref), v387 (copy), v63 (ref), v67 (ref), v12 (ref), l_UserProfileStore_0 (ref), v314 (copy), v379 (ref), v66 (ref), v209 (copy), l_UserInputService_0 (ref), v64 (ref)
        if l_FFlagIEMFocusNavToButtons_0 then
            l_NewPage_0.LastSelectableObjects = {};
        end;
        v376 = l_Players_0:GetPlayers();
        if v68 then
            table.sort(v376, function(v395, v396) --[[ Line: 1857 ]]
                -- upvalues: l_LocalPlayer_0 (ref)
                local v397 = v395.Name:lower();
                local v398 = v396.Name:lower();
                if v395 == l_LocalPlayer_0 then
                    v397 = " ";
                end;
                if v396 == l_LocalPlayer_0 then
                    v398 = " ";
                end;
                return v397 < v398;
            end);
        else
            table.sort(v376, function(v399, v400) --[[ Line: 1870 ]]
                return v399.Name:lower() < v400.Name:lower();
            end);
        end;
        local v401 = 20;
        if v17:IsSmallTouchScreen() or v17:IsPortrait() then
            v401 = 85;
        end;
        local v402 = v242 and not v107 and l_default_0.voiceUIVisible;
        if (l_LocalPlayer_0.UserId > 0 and not v106 and not l_RunService_0:IsStudio() or v402) and not v116 then
            v116 = l_Create_0("Frame")({
                Name = "Holder", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Parent = l_NewPage_0.Page, 
                LayoutOrder = 1
            });
            v117 = l_Create_0("UIListLayout")({
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20), 
                Parent = v116
            });
        end;
        local function v403() --[[ Line: 1904 ]] --[[ Name: layoutMuteAll ]]
            -- upvalues: v116 (ref), l_Create_0 (ref), l_NewPage_0 (ref), v106 (ref), v49 (ref), v107 (ref)
            if not v116 then
                v116 = l_Create_0("Frame")({
                    Name = "Holder", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 52), 
                    Parent = l_NewPage_0.Page, 
                    LayoutOrder = 1
                });
            end;
            v106.Parent = v116;
            v106.Size = v49;
            v107.Parent = v116;
        end;
        local v404 = not l_RunService_0:IsStudio();
        if l_LocalPlayer_0.UserId > 0 and not v106 and v404 then
            local v405 = nil;
            v405 = if v34() then v35:withButtonName(v35.ButtonName.SettingsHub) else l_GameInviteAnalytics_0.new():withEventStream(l_EventStream_0.new(l_RbxAnalyticsService_0)):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.SettingsHub);
            v106 = v237();
            do
                local l_v405_0 = v405;
                v106.Activated:connect(function() --[[ Line: 1936 ]]
                    -- upvalues: l_v405_0 (ref), l_NewPage_0 (ref)
                    l_v405_0:inputShareGameEntryPoint();
                    l_NewPage_0.HubRef:InviteToGame();
                end);
                v106.LayoutOrder = 1;
                if v402 then
                    v106.Parent = v116;
                else
                    v106.Parent = l_NewPage_0.Page;
                end;
            end;
        end;
        if v56() and v247() then
            if v247() and not v109 then
                v109 = v240();
            end;
            v112();
        end;
        local l_l_GuiService_0_InspectMenuEnabled_0 = l_GuiService_0:GetInspectMenuEnabled();
        for v408 = 1, #v376 do
            local v409 = v376[v408];
            local v410 = nil;
            v410 = v377[v409.Name];
            do
                local l_v410_0 = v410;
                if v409 then
                    v378[v409.Name] = true;
                    if not l_v410_0 or not l_v410_0.Parent then
                        l_v410_0 = v241((v408 - 1) * 80 + v401);
                        l_v410_0.Parent = l_NewPage_0.Page;
                        v377[v409.Name] = l_v410_0;
                    end;
                    l_v410_0.Name = "PlayerLabel" .. v409.Name;
                    if v242 then
                        local v412 = l_default_0.participants[tostring(v409.UserId)];
                        v194(l_v410_0, v412);
                    end;
                    local v413 = l_SocialUtil_0.GetPlayerImage(math.max(1, v409.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail);
                    l_v410_0.Icon.Image = v413;
                    l_v410_0.NameLabel.Text = if v62 then l_formatUsername_0(v409.Name) else "@" .. v409.Name;
                    l_v410_0.ImageTransparency = 0.85;
                    l_v410_0.LayoutOrder = v408 + 1;
                    if v59() then
                        l_v410_0.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                        l_v410_0.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd;
                    end;
                    v374(l_v410_0, v409);
                    v149(l_v410_0, v409);
                    local v414 = nil;
                    do
                        local l_v414_0 = v414;
                        v17:OnResized(l_v410_0, function(_, v417) --[[ Line: 2006 ]]
                            -- upvalues: l_v410_0 (ref), v17 (ref), v143 (ref), v409 (copy), l_v414_0 (ref), v153 (ref), l_l_GuiService_0_InspectMenuEnabled_0 (copy), v305 (ref)
                            local l_RightSideButtons_2 = l_v410_0:FindFirstChild("RightSideButtons");
                            local l_DisplayNameLabel_0 = l_v410_0:FindFirstChild("DisplayNameLabel");
                            local l_NameLabel_0 = l_v410_0:FindFirstChild("NameLabel");
                            local v421 = l_RightSideButtons_2 and l_RightSideButtons_2:FindFirstChild("RightSideListLayout");
                            if v17:IsSmallTouchScreen() and v17:IsPortrait() then
                                l_v410_0.Size = UDim2.new(1, 0, 0, 105);
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
                                if v421 then
                                    v421.HorizontalAlignment = Enum.HorizontalAlignment.Left;
                                    v421.VerticalAlignment = Enum.VerticalAlignment.Bottom;
                                end;
                            else
                                l_v410_0.Size = UDim2.new(1, 0, 0, 62);
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
                                if v421 then
                                    v421.HorizontalAlignment = Enum.HorizontalAlignment.Right;
                                    v421.VerticalAlignment = Enum.VerticalAlignment.Center;
                                end;
                            end;
                            if l_RightSideButtons_2 then
                                v143(l_RightSideButtons_2, v409, v417, l_v414_0);
                                v153(l_RightSideButtons_2, v409, v417, l_v414_0);
                                if l_l_GuiService_0_InspectMenuEnabled_0 then
                                    v305(l_RightSideButtons_2, v409, v417, l_v414_0);
                                end;
                                l_v414_0 = v417;
                            end;
                        end);
                        v236(l_v410_0, v409);
                        if l_FFlagIEMFocusNavToButtons_0 and v408 == #v376 then
                            local l_RightSideButtons_3 = l_v410_0:FindFirstChild("RightSideButtons");
                            if l_RightSideButtons_3 then
                                for _, v424 in l_RightSideButtons_3:GetChildren() do
                                    if v424:IsA("ImageButton") then
                                        table.insert(l_NewPage_0.LastSelectableObjects, v424);
                                    end;
                                end;
                                l_NewPage_0.LastSelectableObjectsUpdated:fire();
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if v402 then
            v107 = v238();
            v107.Activated:connect(function() --[[ Line: 2094 ]]
                -- upvalues: v179 (ref), v23 (ref), v107 (ref), l_default_0 (ref), v52 (ref), v30 (ref), v111 (ref), v27 (ref), v387 (ref)
                v179 = not v179;
                local v425 = v179 and v23:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or v23:FormatByKey("Feature.SettingsHub.Action.MuteAll");
                v107.TextLabel.Text = v425;
                v107.Icon.Image = l_default_0:GetIcon(v179 and "MuteAll" or "UnmuteAll", "Misc");
                if v52() then
                    v30:debug("{} all players", v179 and "Muting" or "Unmuting");
                end;
                if v111 then
                    v111:onToggleMuteAll(v179);
                end;
                l_default_0:MuteAll(v179, v27.VOICE_CONTEXT_TYPE.IN_GAME_MENU);
                v387();
            end);
            v107.LayoutOrder = 1;
            if v63 then
                v403();
            else
                v107.Parent = v116;
            end;
            v112();
        end;
        local v426 = nil;
        v426 = if v67 then v12.List.filterMap(v376, function(v427) --[[ Line: 2124 ]]
            if not v427.UserId then
                return nil;
            else
                return (tostring(v427.UserId));
            end;
        end) else v12.List.filter(v376, function(v428) --[[ Line: 2132 ]]
            return (tostring(v428.UserId));
        end);
        for _, v430 in ipairs(v376) do
            v377[v430.Name].DisplayNameLabel.Text = v430.DisplayName;
        end;
        l_UserProfileStore_0.get().fetchNamesByUserIds(v426, function(v431) --[[ Line: 2141 ]]
            -- upvalues: v377 (ref), v314 (ref)
            for _, v433 in v431.data do
                local v434 = v377[v433.names.getUsername(false)];
                if v434 then
                    local v435 = v433.names.getInExperienceCombinedName(false);
                    if string.len(v435) > 0 and v435 ~= v434.DisplayNameLabel.Text then
                        v434.DisplayNameLabel.Text = v435;
                    end;
                    local l_RightSideButtons_4 = v434:FindFirstChild("RightSideButtons");
                    local v437 = nil;
                    if v433.names.getPlatformName(false) ~= "" then
                        v437 = v433.names.getPlatformName(false);
                    end;
                    if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
                        v314(l_RightSideButtons_4, v437, v433.getPlatformProfileId(false));
                    else
                        v314(l_RightSideButtons_4, v437);
                    end;
                end;
            end;
        end);
        local v438 = 0;
        if v242 and not v379 then
            v30:debug("Setting Up Playerlist Mic Update Renderstep Hook");
            l_RunService_0:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function() --[[ Line: 2173 ]]
                -- upvalues: v438 (ref), v387 (ref), v66 (ref), v116 (ref), v209 (ref)
                v438 = v438 + 1;
                if v438 % 3 == 0 then
                    v387();
                    local v439 = nil;
                    if v66() then
                        if v116 then
                            v439 = v116:FindFirstChild("MuteSelfButtonImageLabel", true);
                        end;
                    else
                        v439 = v116:FindFirstChild("MuteSelfButtonImageLabel", true);
                    end;
                    if not v439 then
                        return;
                    else
                        v439.Image = v209();
                    end;
                end;
            end);
            v379 = true;
        end;
        for v440, v441 in pairs(v377) do
            if not v378[v440] then
                v441:Destroy();
                v377[v440] = nil;
            end;
        end;
        if l_UserInputService_0.GamepadEnabled then
            if v66() then
                pcall(function() --[[ Line: 2193 ]]
                    -- upvalues: v64 (ref), l_NewPage_0 (ref), l_GuiService_0 (ref), v106 (ref)
                    if v64 then
                        if l_NewPage_0.Active then
                            l_GuiService_0.SelectedCoreObject = v106;
                            return;
                        end;
                    else
                        l_GuiService_0.SelectedCoreObject = v106;
                    end;
                end);
            else
                l_GuiService_0.SelectedCoreObject = v106;
            end;
        end;
        v17:OnResized("MenuPlayerListExtraPageSize", function(_, _) --[[ Line: 2207 ]]
            -- upvalues: v17 (ref), v376 (ref), l_NewPage_0 (ref)
            local v444 = 20;
            if v17:IsSmallTouchScreen() or v17:IsPortrait() then
                v444 = 85;
            end;
            local v445 = #v376 + 1;
            if v17:IsSmallTouchScreen() and v17:IsPortrait() then
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v444 + v445 * 123 - 5);
                return;
            else
                l_NewPage_0.Page.Size = UDim2.new(1, 0, 0, v444 + v445 * 80 - 5);
                return;
            end;
        end);
    end;
    local function v447() --[[ Line: 2223 ]]
        -- upvalues: v379 (ref), v30 (ref), l_RunService_0 (ref)
        if v379 then
            v30:debug("Unbinding Playerlist Mic Update Renderstep Hook");
            v379 = false;
            l_RunService_0:UnbindFromRenderStep("player-list-mute-update");
        end;
    end;
    if game:GetEngineFeature("VoiceChatSupported") and not v242 then
        l_default_0:asyncInit():andThen(function() --[[ Line: 2233 ]]
            -- upvalues: v242 (ref), l_default_0 (ref), v68 (ref), v66 (ref), v108 (ref), v239 (ref), v387 (copy), v110 (copy), v107 (ref), v112 (ref), v243 (ref), v56 (ref), v109 (ref), v446 (copy), v63 (ref), v195 (copy), v393 (copy), v223 (copy)
            v242 = true;
            l_default_0:SetupParticipantListeners();
            if not v68 then
                if v66() then
                    v108 = v239();
                else
                    v239();
                end;
            end;
            l_default_0.participantsUpdate.Event:Connect(function() --[[ Line: 2238 ]]
                -- upvalues: v387 (ref)
                v387();
            end);
            l_default_0.participantLeft.Event:Connect(function(_, v449) --[[ Line: 2241 ]]
                -- upvalues: v387 (ref), v110 (ref)
                v387();
                v110[v449] = nil;
            end);
            l_default_0:getService().StateChanged:Connect(function(_, v451) --[[ Line: 2246 ]]
                -- upvalues: v107 (ref), v112 (ref), v108 (ref), v243 (ref), v56 (ref), v109 (ref), v242 (ref), v446 (ref)
                if v451 == Enum.VoiceChatState.Ended then
                    if v107 then
                        v107.Visible = false;
                        v107:Destroy();
                        v107 = nil;
                    end;
                    v112();
                    if v108 then
                        v108.Visible = false;
                        v108:Destroy();
                        v108 = nil;
                    end;
                    if v243 then
                        v243:Disconnect();
                        v243 = nil;
                    end;
                    v112();
                    if v56() then
                        if v109 then
                            v109.Visible = false;
                            v109:Destroy();
                            v109 = nil;
                        end;
                        v112();
                    end;
                    v242 = false;
                    return;
                else
                    if v451 == Enum.VoiceChatState.Joined and v242 == false then
                        v242 = true;
                        if v56() then
                            if v109 then
                                v109.Visible = false;
                                v109:Destroy();
                                v109 = nil;
                            end;
                            v112();
                        end;
                        v446();
                    end;
                    return;
                end;
            end);
            if v63 and not v66() then
                v446();
            end;
            l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 2270 ]]
                -- upvalues: v66 (ref), v108 (ref), v68 (ref), v239 (ref), v195 (ref), v56 (ref), v109 (ref), v112 (ref), v446 (ref)
                if v66() then
                    if not v108 and not v68 then
                        if v66() then
                            v108 = v239();
                        else
                            v239();
                        end;
                    end;
                elseif not v195:FindFirstChild("MuteSelfButton", true) and not v68 then
                    if v66() then
                        v108 = v239();
                    else
                        v239();
                    end;
                end;
                if v56() then
                    if v109 then
                        v109.Visible = false;
                        v109:Destroy();
                        v109 = nil;
                    end;
                    v112();
                end;
                v446();
            end);
            l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 2285 ]]
                -- upvalues: v107 (ref), v112 (ref), v108 (ref), v243 (ref), v393 (ref), v446 (ref), v223 (ref)
                if v107 then
                    if v107 then
                        v107.Visible = false;
                        v107:Destroy();
                        v107 = nil;
                    end;
                    v112();
                end;
                if v108 then
                    v108.Visible = false;
                    v108:Destroy();
                    v108 = nil;
                end;
                if v243 then
                    v243:Disconnect();
                    v243 = nil;
                end;
                v112();
                v393();
                v446();
                v223();
            end);
            l_default_0.muteAllChanged.Event:Connect(function() --[[ Line: 2294 ]]
                -- upvalues: v387 (ref)
                v387();
            end);
        end):catch(function(_) --[[ Line: 2298 ]]
            -- upvalues: v52 (ref), v30 (ref)
            if v52() then
                v30:warning("Failed to init VoiceChatServiceManager");
            end;
        end);
    end;
    l_NewPage_0.Displayed.Event:connect(v446);
    l_NewPage_0.Hidden.Event:connect(v447);
    l_Players_0.PlayerRemoving:Connect(function(v453) --[[ Line: 2308 ]]
        -- upvalues: v378 (copy), v377 (copy), l_GuiService_0 (ref), l_UserInputService_0 (ref), v106 (ref), v55 (ref)
        v378[v453.Name] = nil;
        local v454 = v377[v453.Name];
        if not v454 then
            return;
        else
            local l_RightSideButtons_5 = v454:FindFirstChild("RightSideButtons");
            if not l_RightSideButtons_5 then
                return;
            else
                local l_FriendStatus_1 = l_RightSideButtons_5:FindFirstChild("FriendStatus");
                if l_FriendStatus_1 then
                    if l_GuiService_0.SelectedCoreObject == l_FriendStatus_1 then
                        if l_UserInputService_0.GamepadEnabled then
                            l_GuiService_0.SelectedCoreObject = v106;
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
                            l_GuiService_0.SelectedCoreObject = v106;
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
                            l_GuiService_0.SelectedCoreObject = v106;
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
                            l_GuiService_0.SelectedCoreObject = v106;
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
                if v55() then
                    v377[v453.Name] = nil;
                    v454:Destroy();
                end;
                return;
            end;
        end;
    end);
    local function v465() --[[ Line: 2385 ]] --[[ Name: removeInspectButtons ]]
        -- upvalues: v377 (copy), l_GuiService_0 (ref)
        for _, v462 in pairs(v377) do
            local l_RightSideButtons_6 = v462:FindFirstChild("RightSideButtons");
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
    l_GuiService_0.InspectMenuEnabledChangedSignal:Connect(function(v466) --[[ Line: 2402 ]]
        -- upvalues: v465 (copy)
        if not v466 then
            v465();
        end;
    end);
    l_NewPage_0.CreateMenuButtonsContainer = function(_) --[[ Line: 2408 ]] --[[ Name: CreateMenuButtonsContainer ]]
        -- upvalues: v40 (ref), l_NewPage_0 (copy), v14 (ref), v195 (copy), v13 (ref), v31 (ref)
        if v40 == 2 then
            if l_NewPage_0.buttonsContainerRoot then
                return;
            else
                l_NewPage_0.buttonsContainerRoot = v14.createRoot(v195);
                local l_ExperienceControlStore_0 = l_NewPage_0.HubRef:GetExperienceControlStore();
                l_NewPage_0.buttonsContainerRoot:render(v13.createElement(v31, {
                    onLeaveGame = l_ExperienceControlStore_0.onLeaveGame, 
                    onRespawn = l_ExperienceControlStore_0.onRespawn, 
                    onResume = l_ExperienceControlStore_0.onResume, 
                    setAddMenuKeyBindings = function() --[[ Line: 2420 ]] --[[ Name: setAddMenuKeyBindings ]]

                    end, 
                    setRemoveMenuKeyBindings = function() --[[ Line: 2421 ]] --[[ Name: setRemoveMenuKeyBindings ]]

                    end, 
                    getVisibility = function() --[[ Line: 2422 ]] --[[ Name: getVisibility ]]
                        return true;
                    end, 
                    getCanRespawn = l_ExperienceControlStore_0.getCanRespawn
                }));
            end;
        end;
    end;
    l_NewPage_0.UnmountMenuButtonsContainer = function(_) --[[ Line: 2430 ]] --[[ Name: UnmountMenuButtonsContainer ]]
        -- upvalues: v41 (ref), v40 (ref), l_NewPage_0 (copy)
        if v41 and v40 == 2 and l_NewPage_0.buttonsContainerRoot then
            l_NewPage_0.buttonsContainerRoot:unmount();
            l_NewPage_0.buttonsContainerRoot = nil;
        end;
    end;
    return l_NewPage_0;
end)());