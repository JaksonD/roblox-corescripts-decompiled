local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")
local default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default

RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")

local UserProfiles = require(CorePackages.Workspace.Packages.UserProfiles)
local formatUsername = UserProfiles.Formatters.formatUsername
local Cryo = require(CorePackages.Packages.Cryo)
local React = require(CorePackages.Packages.React)
local ReactRoblox = require(CorePackages.Packages.ReactRoblox)
local OpenTypeSupport = require(CorePackages.Packages.UIBlox).Utility.OpenTypeSupport
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local Utility = require(RobloxGui.Modules.Settings.Utility)
local Create = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local ReportAbuseMenuNewContainerPage = require(RobloxGui.Modules.Settings.Pages.ReportAbuseMenuNewContainerPage)
local SocialUtil = require(RobloxGui.Modules:WaitForChild("SocialUtil"))
local Diag = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.Diag
local EventStream = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local RobloxTranslator = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GameInviteAnalytics = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalytics
local onBlockButtonActivated = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local VoiceAnalytics = require(script:FindFirstAncestor("Settings").Analytics.VoiceAnalytics)
local Constants = require(RobloxGui.Modules.VoiceChat.Constants)
local BlockingAnalytics = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local BlockingUtility = require(CorePackages.Workspace.Packages.BlockingUtility)
local v31 = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local MenuButtonsContainer = require(RobloxGui.Modules.Settings.Components.MenuButtons.MenuButtonsContainer)
local BuilderIcons = require(CorePackages.Packages.BuilderIcons)
local uiblox = BuilderIcons.Migration.uiblox
local GetFFlagLuaInExperienceCoreScriptsGameInviteUnification = require(RobloxGui.Modules.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local GameInviteAnalyticsManager = nil

if GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then
	GameInviteAnalyticsManager = require(CorePackages.Workspace.Packages.GameInvite).GameInviteAnalyticsManager
end

local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagLuaAppEnableOpenTypeSupport = SharedFlags.GetFFlagLuaAppEnableOpenTypeSupport
local FFlagIEMFocusNavToButtons = SharedFlags.FFlagIEMFocusNavToButtons
local FFlagIEMTabFocusNav = SharedFlags.FFlagIEMTabFocusNav
local FFlagRelocateMobileMenuButtons = require(RobloxGui.Modules.Settings.Flags.FFlagRelocateMobileMenuButtons)
local FIntRelocateMobileMenuButtonsVariant = require(RobloxGui.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant)
local FFlagMenuButtonsMountWithIEM = require(RobloxGui.Modules.Settings.Flags.FFlagMenuButtonsMountWithIEM)
local EngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local FFlagConnectionsToFriendsRename = SharedFlags.FFlagConnectionsToFriendsRename
local UserProfileStore = UserProfiles.Stores.UserProfileStore
local _, result = pcall(function() -- line: 72
	return game:GetService("PlatformFriendsService")
end)
local Theme = require(script.Parent.Parent.Theme)
local Constants2 = require(RobloxGui.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local uDim2 = UDim2.new(0.5, -10, 0, 52)
local LocalPlayer = Players.LocalPlayer

while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end

local GetFFlagVoiceChatUILogging = require(RobloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
local GetFFlagDefaultFriendingLabelTextNonEmpty = require(RobloxGui.Modules.Settings.Flags.GetFFlagDefaultFriendingLabelTextNonEmpty)
local GetFFlagEnableLeaveGameUpsellEntrypoint = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableLeaveGameUpsellEntrypoint)
local GetFFlagDestroyPlayerCardOnLeave = require(RobloxGui.Modules.Settings.Flags.GetFFlagDestroyPlayerCardOnLeave)
local GetFFlagEnableConsoleJoinVoice = require(RobloxGui.Modules.Settings.Flags.GetFFlagEnableConsoleJoinVoice)
local v58 = game:DefineFastFlag("EnableConsoleJoinVoiceTranslation", false)
local v59 = game:DefineFastFlag("CheckButtonFrameBeforeDestroy", false)
local isEngineTruncationEnabledForIngameSettings = require(RobloxGui.Modules.Flags.isEngineTruncationEnabledForIngameSettings)
local EngineFeature2 = game:GetEngineFeature("VoiceChatMultistreamSubscriptionsEnabled")
local v62 = game:DefineFastFlag("LuaFlagVoiceChatDisableSubscribeRetryForMultistream", true)
local v63 = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false)
local v64 = game:DefineFastFlag("CorrectlyPositionMuteButton", false)
local v65 = game:DefineFastFlag("OnlyCaptureFocusIfOnPlayerPage", false)
local v66 = game:DefineFastInt("SettingsHubPlayersButtonsResponsiveThreshold", 200)
local GetFFlagCleanupMuteSelfButton = require(RobloxGui.Modules.Settings.Flags.GetFFlagCleanupMuteSelfButton)
local v68 = game:DefineFastFlag("CheckForNilUserIdOnPlayerList", false)
local v69 = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local MuteStatusIcons = default.MuteStatusIcons
local PlayerMuteStatusIcons = default.PlayerMuteStatusIcons

return ((function() --[[ Initialize ]] -- line: 148
	-- upvalues: RobloxGui (copy), EngineFeature (copy), RbxAnalyticsService (copy), LocalizationService (copy), Localization (copy), uiblox (copy), BuilderIcons (copy), LocalPlayer (ref), Utility (copy), BlockingUtility (copy), Theme (copy), FFlagConnectionsToFriendsRename (copy), Constants2 (copy), GetFFlagDefaultFriendingLabelTextNonEmpty (copy), VoiceAnalytics (copy), v66 (copy), GetFFlagEnableConsoleJoinVoice (copy), GetFFlagCleanupMuteSelfButton (copy), v59 (copy), GuiService (copy), BlockingAnalytics (copy), onBlockButtonActivated (copy), RobloxTranslator (copy), MuteStatusIcons (copy), v62 (copy), EngineFeature2 (copy), default (copy), Constants (copy), Create (copy), FFlagRelocateMobileMenuButtons (copy), FIntRelocateMobileMenuButtonsVariant (copy), GetFFlagEnableLeaveGameUpsellEntrypoint (copy), FFlagIEMTabFocusNav (copy), PlayerMuteStatusIcons (copy), ReportAbuseMenuNewContainerPage (copy), v69 (copy), uDim2 (copy), v58 (copy), result (copy), FFlagIEMFocusNavToButtons (copy), GetFFlagLuaAppEnableOpenTypeSupport (copy), OpenTypeSupport (copy), v68 (copy), UserProfileStore (copy), isEngineTruncationEnabledForIngameSettings (copy), v63 (copy), formatUsername (copy), Players (copy), UserInputService (copy), RunService (copy), GetFFlagLuaInExperienceCoreScriptsGameInviteUnification (copy), GameInviteAnalyticsManager (ref), GameInviteAnalytics (copy), EventStream (copy), Diag (copy), SocialUtil (copy), GetFFlagVoiceChatUILogging (copy), v31 (copy), v64 (copy), Cryo (copy), v65 (copy), GetFFlagDestroyPlayerCardOnLeave (copy), ReactRoblox (copy), React (copy), MenuButtonsContainer (copy), FFlagMenuButtonsMountWithIEM (copy)
	local v72 = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()

	v72.PageListLayout.Padding = UDim.new(0, 16)
	v72.playSessionId = ""

	if EngineFeature then
		v72.playSessionId = RbxAnalyticsService:GetPlaySessionId()
	end

	local t1 = {}
	local RobloxLocaleId = LocalizationService.RobloxLocaleId

	if not t1[RobloxLocaleId] then
		t1[RobloxLocaleId] = Localization.new(RobloxLocaleId)
	end

	v72.TabHeader.Name = "PlayersTab"

	local v75 = uiblox["icons/menu/friends"]

	v72.TabHeader.TabLabel.Icon.Text = v75.name
	v72.TabHeader.TabLabel.Icon.FontFace = BuilderIcons.Font[v75.variant]
	v72.TabHeader.TabLabel.Title.Text = "People"
	v72.Page.Name = "Players"

	local function createFriendStatusTextLabel(p1, p2) -- line: 201
		-- upvalues: Theme (copy), FFlagConnectionsToFriendsRename (copy), t1 (copy), RobloxLocaleId (copy), Constants2 (copy), GetFFlagDefaultFriendingLabelTextNonEmpty (copy), LocalPlayer (ref), RbxAnalyticsService (copy), Utility (copy)
		if p1 == nil then
			return nil
		end

		local Frame = Instance.new("Frame")

		Frame.BackgroundTransparency = 1

		local TextButton = nil
		local u139 = nil

		if p1 == Enum.FriendStatus.Friend or p1 == Enum.FriendStatus.FriendRequestSent then
			TextButton = Instance.new("TextButton")
			TextButton.BackgroundTransparency = 1
			TextButton.FontSize = Theme.fontSize(Enum.FontSize.Size24)
			TextButton.Font = Theme.font(Enum.Font.SourceSans)
			TextButton.TextColor3 = Color3.new(1, 1, 1)
			TextButton.SelectionImageObject = Frame

			if p1 == Enum.FriendStatus.Friend then
				TextButton.Text = if not FFlagConnectionsToFriendsRename then t1[RobloxLocaleId]:Format(Constants2.ConnectionLocalizedKey) else t1[RobloxLocaleId]:Format(Constants2.FriendLocalizedKey)
			else
				TextButton.Text = "Request Sent"
			end
		elseif p1 == Enum.FriendStatus.Unknown or p1 == Enum.FriendStatus.NotFriend or p1 == Enum.FriendStatus.FriendRequestReceived then
			local v140, v141 = Utility:MakeStyledButton("FriendStatus", if not FFlagConnectionsToFriendsRename then t1[RobloxLocaleId]:Format(Constants2.AddConnectionLocalizedKey) else t1[RobloxLocaleId]:Format(Constants2.AddFriendLocalizedKey), UDim2.new(0, 182, 0, Theme.ButtonHeight), function() -- line: 230
				-- upvalues: TextButton (ref), u139 (ref), GetFFlagDefaultFriendingLabelTextNonEmpty (copy), FFlagConnectionsToFriendsRename (copy), t1 (copy), RobloxLocaleId (copy), Constants2 (copy), LocalPlayer (ref), p2 (copy), RbxAnalyticsService (copy)
				if TextButton and (u139 and u139.Text ~= "") then
					TextButton.ImageTransparency = 1
					u139.Text = ""

					if GetFFlagDefaultFriendingLabelTextNonEmpty() then
						u139.Text = if not FFlagConnectionsToFriendsRename then t1[RobloxLocaleId]:Format(Constants2.AddConnectionLocalizedKey) else t1[RobloxLocaleId]:Format(Constants2.AddFriendLocalizedKey)
					end

					if LocalPlayer and p2 then
						RbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						RbxAnalyticsService:SetRBXEventStream(Constants2.AnalyticsTargetName, Constants2.AnalyticsRequestFriendContext, Constants2.AnalyticsRequestFriendName, {
							category = "Game"
						})
						LocalPlayer:RequestFriendship(p2)
					end
				end
			end)

			TextButton = v140
			u139 = v141
			u139.ZIndex = 3
			u139.Position = u139.Position + UDim2.new(0, 0, 0, 1)
		end

		if TextButton then
			TextButton.Name = "FriendStatus"
			TextButton.ZIndex = 3
			TextButton.Size = UDim2.new(0, 150, 0, Theme.ButtonHeight)
			TextButton.Position = UDim2.new(1, -198, 0, 7)

			if u139 then
				u139.Position = UDim2.new(0, 0, 0, 0)
			end
		end

		return TextButton
	end
	local function createFriendStatusImageLabel(p3, p4) -- line: 278
		-- upvalues: Utility (copy), Theme (copy), LocalPlayer (ref), RbxAnalyticsService (copy), Constants2 (copy)
		if p3 == Enum.FriendStatus.Friend or p3 == Enum.FriendStatus.FriendRequestSent then
			local s1 = "icons/menu/friends"
			local n1 = 0

			if p3 ~= Enum.FriendStatus.Friend then
				s1 = "icons/actions/friends/friendAdd"
				n1 = 0.5
			end

			local v146, _ = Utility:MakeStyledImageButton("FriendStatus", s1, UDim2.new(0, Theme.ButtonHeight, 0, Theme.ButtonHeight), UDim2.new(0, 28, 0, 28))

			v146.Name = "FriendStatus"
			v146.Selectable = false
			v146.FriendStatusTextLabel.TextTransparency = n1

			return v146
		end

		if p3 == Enum.FriendStatus.Unknown or p3 == Enum.FriendStatus.NotFriend or p3 == Enum.FriendStatus.FriendRequestReceived then
			local u148 = nil
			local u149 = nil
			local v150, v151 = Utility:MakeStyledImageButton("FriendStatus", "icons/actions/friends/friendAdd", UDim2.new(0, Theme.ButtonHeight, 0, Theme.ButtonHeight), UDim2.new(0, 28, 0, 28), function() -- line: 304
				-- upvalues: u148 (ref), u149 (ref), LocalPlayer (ref), p4 (copy), RbxAnalyticsService (copy), Constants2 (copy)
				if u148 and (u149 and u148.ImageTransparency ~= 1) then
					u148.ImageTransparency = 1
					u149.TextTransparency = 1

					if LocalPlayer and p4 then
						RbxAnalyticsService:ReportCounter("PlayersMenu-RequestFriendship")
						RbxAnalyticsService:SetRBXEventStream(Constants2.AnalyticsTargetName, Constants2.AnalyticsRequestFriendContext, Constants2.AnalyticsRequestFriendName, {
							category = "Game"
						})
						LocalPlayer:RequestFriendship(p4)
					end
				end
			end)

			u148 = v150
			u149 = v151
			u148.Name = "FriendStatus"
			u148.Selectable = true

			return u148
		end

		return nil
	end

	local u78 = nil
	local u79 = nil
	local u80 = nil
	local u81 = nil
	local t2 = {}
	local v83 = VoiceAnalytics.new(RbxAnalyticsService, "Players")
	local u84 = false
	local t3 = {}
	local u86 = nil
	local u87 = nil

	local function u88() -- line: 349
		-- upvalues: v72 (copy), v66 (copy), t3 (ref)
		return v72.Page.AbsoluteSize.X < v66 * #t3
	end
	local function u89() -- line: 353
		-- upvalues: t3 (ref), u78 (ref), u79 (ref), u80 (ref), GetFFlagEnableConsoleJoinVoice (copy), u81 (ref), u84 (ref), u88 (ref), u86 (ref), GetFFlagCleanupMuteSelfButton (copy), u87 (ref), v59 (copy)
		t3 = {}

		if u78 then
			table.insert(t3, u78)
		end

		if u79 then
			table.insert(t3, u79)
		end

		if u80 then
			table.insert(t3, u80)
		end

		if GetFFlagEnableConsoleJoinVoice() and u81 then
			table.insert(t3, u81)
		end

		u84 = u88()

		if #t3 > 0 then
			local uDim2_2 = UDim2.new(1 / #t3, 0, 0, 52)
			local t4 = {
				Size = UDim2.new(1, (#t3 - 1) * -20, 0, 52),
				AutomaticSize = Enum.AutomaticSize.None
			}
			local t5 = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20)
			}

			if u84 then
				uDim2_2 = UDim2.new(1, 0, 0, 52)
				t4 = {
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}
				t5 = {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 16)
				}
			end

			local n2 = 1

			for _, v157 in t3 do
				v157.Size = uDim2_2
				v157.Parent = u86
				v157.LayoutOrder = n2
				n2 += 1
			end

			for v158, v159 in t5 do
				if GetFFlagCleanupMuteSelfButton() then
					if u87 then
						u87[v158] = v159
					end
				else
					u87[v158] = v159
				end
			end

			for v160, v161 in t4 do
				if GetFFlagCleanupMuteSelfButton() then
					if u86 then
						u86[v160] = v161
					end
				else
					u86[v160] = v161
				end
			end

			return
		end

		if v59 then
			if u86 then
				u86:Destroy()
				u86 = nil

				return
			end
		else
			u86:Destroy()
			u86 = nil
		end
	end
	local function resizeFriendButton(p5, p6, p7, p8) -- line: 466
		-- upvalues: LocalPlayer (ref), BlockingUtility (copy), createFriendStatusImageLabel (copy), createFriendStatusTextLabel (copy), Utility (copy)
		local FriendStatus = p5:FindFirstChild("FriendStatus")

		if FriendStatus and p7 == p8 then
			return
		end

		if FriendStatus then
			FriendStatus:Destroy()
			FriendStatus = nil
		end

		local v171 = nil

		if p6 and (p6 ~= LocalPlayer and (p6.UserId > 0 and LocalPlayer.UserId > 0)) then
			local ok, result2 = pcall(function() -- line: 175
				-- upvalues: LocalPlayer (ref), p6 (copy)
				return LocalPlayer:GetFriendStatus(p6)
			end)

			v171 = if not ok then Enum.FriendStatus.NotFriend else result2
		end

		if BlockingUtility:IsPlayerBlockedByUserId(p6.UserId) == false then
			FriendStatus = if not p7 then createFriendStatusTextLabel(v171, p6) else createFriendStatusImageLabel(v171, p6)
		end

		if FriendStatus then
			FriendStatus.Name = "FriendStatus"
			FriendStatus.LayoutOrder = 5
			FriendStatus.Selectable = true

			local v174 = "utility-focus-state" .. "-friendstatuslabel-" .. p6.Name

			Utility:MakeFocusState(FriendStatus, v174)
			FriendStatus.Parent = p5
		end
	end
	local function friendStatusCreate(p9, p10) -- line: 500
		-- upvalues: GuiService (copy), u78 (ref), resizeFriendButton (copy), Utility (copy)
		local RightSideButtons = nil

		if p9 then
			RightSideButtons = p9:FindFirstChild("RightSideButtons")
		end

		if RightSideButtons then
			for _, v in pairs(RightSideButtons:GetChildren()) do
				if v and v.Name == "FriendStatus" then
					if v == GuiService.SelectedCoreObject then
						GuiService.SelectedCoreObject = u78
					end

					v:Destroy()
				end
			end

			resizeFriendButton(RightSideButtons, p10, Utility:IsPortrait(), nil)
		end
	end

	LocalPlayer.FriendStatusChanged:connect(function(p11, _) -- line: 522
		-- upvalues: v72 (copy), friendStatusCreate (copy)
		if p11 then
			local v182 = v72.Page:FindFirstChild("PlayerLabel" .. p11.Name)

			if v182 then
				friendStatusCreate(v182, p11)
			end
		end
	end)

	local resizeBlockButton = nil
	local trySelection = nil
	local v94 = BlockingAnalytics.new(LocalPlayer.UserId, {
		EventStream = RbxAnalyticsService
	})

	local function createBlockButton(p13, p14, p15, _) -- line: 535
		-- upvalues: BlockingUtility (copy), resizeBlockButton (ref), resizeFriendButton (copy), trySelection (ref), GuiService (copy), onBlockButtonActivated (copy), v94 (copy), Constants2 (copy), Utility (copy), RobloxTranslator (copy), Theme (copy)
		if BlockingUtility:IsPlayerBlockedByUserId(p14.UserId) then
			return Utility:MakeStyledButton("BlockButton", RobloxTranslator:FormatByKey("Feature.SettingsHub.Action.Unblock"), UDim2.new(0, 110, 0, Theme.ButtonHeight), function() --[[ unBlockUser ]] -- line: 553
				-- upvalues: BlockingUtility (copy), p14 (copy), v94 (copy), resizeBlockButton (ref), p13 (copy), p15 (copy), resizeFriendButton (copy)
				if BlockingUtility:UnblockPlayerAsync(p14) then
					v94:action("SettingsHub", "unblockUser", {
						blockeeUserId = p14.UserId
					})
					resizeBlockButton(p13, p14, p15, not p15)
					resizeFriendButton(p13, p14, p15, not p15)
				end
			end)
		end

		return Utility:MakeStyledImageButton("BlockButton", "icons/actions/block", UDim2.new(0, Theme.ButtonHeight, 0, Theme.ButtonHeight), UDim2.new(0, 28, 0, 28), function() --[[ blockUser ]] -- line: 546
			-- upvalues: GuiService (copy), onBlockButtonActivated (copy), p14 (copy), v94 (copy), Constants2 (copy), resizeBlockButton (ref), p13 (copy), p15 (copy), resizeFriendButton (copy), trySelection (ref)
			local v348 = GuiService.SelectedCoreObject ~= nil or GuiService.SelectedObject ~= nil

			onBlockButtonActivated(p14, v94, Constants2.AnalyticsInGameMenuName):andThen(function() -- line: 548
				-- upvalues: v348 (copy), resizeBlockButton (ref), p13 (copy), p14 (copy), p15 (copy), resizeFriendButton (copy), trySelection (ref)
				local v422 = v348
				local v423 = resizeBlockButton(p13, p14, p15, not p15)

				resizeFriendButton(p13, p14, p15, not p15)

				if v422 then
					trySelection(v423)
				end
			end)
		end)
	end

	function trySelection(p17) -- line: 582
		-- upvalues: GuiService (copy)
		if p17 and not p17.Selectable then
			GuiService:Select(p17)

			return
		end

		GuiService.SelectedCoreObject = p17
	end
	function resizeBlockButton(p18, p19, p20, p21) -- line: 590
		-- upvalues: LocalPlayer (ref), createBlockButton (copy), Utility (copy)
		local BlockButton = p18:FindFirstChild("BlockButton")

		if BlockButton and p20 == p21 then
			return BlockButton
		end

		if BlockButton then
			BlockButton:Destroy()
			BlockButton = nil
		end

		if p19 and (p19 ~= LocalPlayer and (p19.UserId > 0 and LocalPlayer.UserId > 0)) then
			BlockButton = createBlockButton(p18, p19, p20, p21)
		end

		if BlockButton then
			BlockButton.Name = "BlockButton"
			BlockButton.LayoutOrder = 4
			BlockButton.Selectable = true

			local v193 = "utility-focus-state" .. "-blockbutton-" .. p19.Name

			Utility:MakeFocusState(BlockButton, v193)
			BlockButton.Parent = p18
		end

		return BlockButton
	end

	local u96 = false
	local u97 = false

	local function muteButtonUpdate(p22, p23) -- line: 619
		-- upvalues: MuteStatusIcons (copy), v62 (copy), EngineFeature2 (copy), default (copy), t2 (copy), Utility (copy), Theme (copy), v83 (copy), Constants (copy)
		local RightSideButtons = nil

		if p22 then
			RightSideButtons = p22:FindFirstChild("RightSideButtons")
		end

		if not RightSideButtons then
			return
		end

		local MuteStatusButton = RightSideButtons:FindFirstChild("MuteStatusButton")

		if p23 == nil then
			if MuteStatusButton then
				MuteStatusButton:Destroy()
			end

			return
		end

		local uDim2_3 = UDim2.fromOffset(36, 36)
		local uDim2_4 = UDim2.fromOffset(0, 0)
		local n3 = 0
		local v201 = p23.isMuted and MuteStatusIcons.MicOff or MuteStatusIcons.MicOn

		if p23.subscriptionFailed then
			v201 = MuteStatusIcons.Error
			uDim2_3 = UDim2.fromOffset(36, 36)
			uDim2_4 = UDim2.fromOffset(2, -2)

			if v62 and EngineFeature2 then
				n3 = 0.5
			end
		elseif p23.isMutedLocally then
			v201 = MuteStatusIcons.MicDisabled
			n3 = 0.5
		elseif not p23.subscriptionCompleted then
			v201 = MuteStatusIcons.Loading
		elseif p23.isSignalActive then
			local v202 = math.floor(0.5 + 5 * math.random()) * 20

			v201 = default:GetIcon("Unmuted" .. tostring(v202), "SpeakerLight")
		end

		if MuteStatusButton then
			local v203 = t2[p23.userId] or RightSideButtons:FindFirstChild("MuteStatusImageLabel", true)

			v203.Image = v201
			v203.Size = uDim2_3
			v203.ImageTransparency = n3

			return
		end

		if default.voiceUIVisible then
			local v204, v205 = Utility:MakeStyledImageButton("MuteStatus", v201, UDim2.fromOffset(Theme.ButtonHeight, Theme.ButtonHeight), uDim2_3, function() -- line: 679
				-- upvalues: default (copy), p23 (copy), v83 (copy), Constants (copy), v62 (copy), EngineFeature2 (copy)
				local v349 = default.participants[tostring(p23.userId)]

				if v349.subscriptionCompleted then
					if v83 then
						v83:onToggleMutePlayer(p23.userId, not v349.isMutedLocally)
					end

					default:ToggleMutePlayer(p23.userId, Constants.VOICE_CONTEXT_TYPE.IN_GAME_MENU)

					return
				end

				if v349.subscriptionFailed then
					if v62 then
						if not EngineFeature2 then
							default:SubscribeRetry(p23.userId)

							return
						end
					else
						default:SubscribeRetry(p23.userId)
					end
				end
			end)

			t2[p23.userId] = v205
			v205.ZIndex = 3
			v205.Position = v205.Position + uDim2_4
			v205.ImageTransparency = n3

			local v206 = "utility-focus-state" .. "-mutestatusbutton-" .. p23.userId

			Utility:MakeFocusState(v204, v206)
			v204.Parent = RightSideButtons
		end
	end

	local v99 = Create("Frame")({
		Name = "ButtonsContainer",
		Size = UDim2.new(1, 0, 0, Theme.ButtonHeight),
		BackgroundTransparency = 1,
		Parent = v72.Page,
		Visible = false
	})

	v72.ButtonsContainer = v99

	if FFlagRelocateMobileMenuButtons and (FIntRelocateMobileMenuButtonsVariant == 1 or FIntRelocateMobileMenuButtonsVariant == 3) then
		v99.Parent = nil
	end

	Create("UIPadding")({
		PaddingBottom = UDim.new(0, 1),
		PaddingTop = UDim.new(0, 1),
		PaddingLeft = UDim.new(0, 1),
		PaddingRight = UDim.new(0, 1),
		Parent = v99
	})

	local v100, v101 = Utility:MakeStyledButton("LeaveButton", "Leave", UDim2.new(0.3333333333333333, -12, 1, 0), function() -- line: 736
		-- upvalues: GetFFlagEnableLeaveGameUpsellEntrypoint (copy), v72 (copy), Constants (copy)
		if GetFFlagEnableLeaveGameUpsellEntrypoint() and v72.HubRef.leaveGameUpsellProp ~= Constants.PHONE_UPSELL_VALUE_PROP.None then
			v72.HubRef:SwitchToPage(v72.HubRef.LeaveGameUpsellPage, nil, 1, true)

			return
		end

		v72.HubRef:SwitchToPage(v72.HubRef.LeaveGamePage, false, 1)
	end)

	v100.AnchorPoint = Vector2.new(0, 0)
	v100.Position = UDim2.new(0, 0, 0, 0)
	v101.Size = UDim2.new(1, -4, 1, 0)
	v101.Position = UDim2.new(0, 2, 0, 0)
	Create("UIListLayout")({
		FillDirection = Enum.FillDirection.Horizontal,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Parent = v100
	})
	Create("UIPadding")({
		PaddingLeft = UDim.new(0.025, 0),
		Parent = v100
	})
	v101.Size = UDim2.new(0, 0, 1, 0)
	Create("UIFlexItem")({
		FlexMode = Enum.UIFlexMode.Grow,
		Parent = v101
	})

	if not FFlagRelocateMobileMenuButtons or FIntRelocateMobileMenuButtonsVariant == 0 then
		v100.Parent = v99
	end

	local v102 = t1[RobloxLocaleId]:Format(Constants2.RespawnLocalizedKey)
	local v103, v104 = Utility:MakeStyledButton("ResetButton", v102, UDim2.new(0.3333333333333333, -12, 1, 0), function() -- line: 779
		-- upvalues: v72 (copy)
		v72.HubRef:SwitchToPage(v72.HubRef.ResetCharacterPage, false, 1)
	end)

	v103.AnchorPoint = Vector2.new(0.5, 0)
	v103.Position = UDim2.new(0.5, 0, 0, 0)
	v104.Size = UDim2.new(1, -4, 1, 0)
	v104.Position = UDim2.new(0, 2, 0, 0)

	if not FFlagRelocateMobileMenuButtons or FIntRelocateMobileMenuButtonsVariant == 0 then
		v103.Parent = v99
	end

	local v105, v106 = Utility:MakeStyledButton("ResumeButton", "Resume", UDim2.new(0.3333333333333333, -12, 1, 0), function() -- line: 796
		-- upvalues: v72 (copy), RbxAnalyticsService (copy), Constants2 (copy)
		v72.HubRef:SetVisibility(false)
		RbxAnalyticsService:SetRBXEventStream(Constants2.AnalyticsTargetName, Constants2.AnalyticsResumeGameName, Constants2.AnalyticsMenuActionName, {
			source = Constants2.AnalyticsResumeButtonSource,
			playsessionid = v72.playSessionId,
			universeid = tostring(game.GameId)
		})
	end)

	v105.AnchorPoint = Vector2.new(1, 0)
	v105.Position = UDim2.new(1, 0, 0, 0)
	v106.Size = UDim2.new(1, -4, 1, 0)
	v106.Position = UDim2.new(0, 2, 0, 0)

	if not FFlagRelocateMobileMenuButtons or FIntRelocateMobileMenuButtonsVariant == 0 then
		v105.Parent = v99

		if FFlagIEMTabFocusNav then
			v72.FirstSelectableObjects = {
				v105,
				v103,
				v100
			}
			v72.FirstSelectableObjectsUpdated:fire()
		end
	end

	local function pollImage() -- line: 828
		-- upvalues: default (copy), PlayerMuteStatusIcons (copy)
		local localMuted = default.localMuted

		if localMuted == nil then
			return PlayerMuteStatusIcons.Loading
		end

		if localMuted then
			return PlayerMuteStatusIcons.MicOff
		end

		if default.isTalking then
			local v208 = math.floor(0.5 + 5 * math.random()) * 20

			return (default:GetIcon("Unmuted" .. tostring(v208), "MicLight"))
		end

		return PlayerMuteStatusIcons.MicOn
	end
	local function resetButtonRow() -- line: 864
		-- upvalues: FFlagRelocateMobileMenuButtons (copy), FIntRelocateMobileMenuButtonsVariant (copy), v99 (copy)
		if not FFlagRelocateMobileMenuButtons or FIntRelocateMobileMenuButtonsVariant == 0 then
			local uDim2_5 = UDim2.new(1, 0, 0, 0)
			local uDim2_6 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local vector2 = Vector2.new(1, 0)
			local ResumeButtonButton = v99:FindFirstChild("ResumeButtonButton", true)

			if ResumeButtonButton then
				ResumeButtonButton.Position = uDim2_5
				ResumeButtonButton.Size = uDim2_6
				ResumeButtonButton.AnchorPoint = vector2
			end

			local uDim2_7 = UDim2.new(0.5, 0, 0, 0)
			local uDim2_8 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local vector2_2 = Vector2.new(0.5, 0)
			local ResetButtonButton = v99:FindFirstChild("ResetButtonButton", true)

			if ResetButtonButton then
				ResetButtonButton.Position = uDim2_7
				ResetButtonButton.Size = uDim2_8
				ResetButtonButton.AnchorPoint = vector2_2
			end

			local uDim2_9 = UDim2.new(0, 0, 0, 0)
			local uDim2_10 = UDim2.new(0.3333333333333333, -12, 1, 0)
			local vector2_3 = Vector2.new(0, 0)
			local LeaveButtonButton = v99:FindFirstChild("LeaveButtonButton", true)

			if LeaveButtonButton then
				LeaveButtonButton.Position = uDim2_9
				LeaveButtonButton.Size = uDim2_10
				LeaveButtonButton.AnchorPoint = vector2_3
			end
		end

		local PlayerMuteButtonButton = v99:FindFirstChild("PlayerMuteButtonButton", true)

		if PlayerMuteButtonButton then
			PlayerMuteButtonButton:Destroy()
		end
	end

	Utility:OnResized(v99, function(_, p25) -- line: 905
		-- upvalues: Utility (copy), Theme (copy), v99 (copy), FFlagRelocateMobileMenuButtons (copy), FIntRelocateMobileMenuButtonsVariant (copy), v104 (copy), v101 (copy), v106 (copy)
		if (p25 or Utility:IsSmallTouchScreen()) and not Theme.AlwaysShowBottomBar() then
			local v231 = p25 and Theme.textSize(18) or Theme.textSize(24)

			v99.Visible = true
			v99.Size = UDim2.new(1, 0, 0, Theme.ButtonHeight)

			if not FFlagRelocateMobileMenuButtons or FIntRelocateMobileMenuButtonsVariant == 0 then
				v104.TextSize = v231
				v101.TextSize = v231
				v106.TextSize = v231

				return
			end
		else
			v99.Visible = false
			v99.Size = UDim2.new(1, 0, 0, 0)
		end
	end)

	local function reportAbuseButtonCreate(p26, p27) -- line: 921
		-- upvalues: LocalPlayer (ref), ReportAbuseMenuNewContainerPage (copy), Utility (copy), Theme (copy)
		local RightSideButtons = p26:FindFirstChild("RightSideButtons")

		if RightSideButtons then
			local ReportPlayer = RightSideButtons:FindFirstChild("ReportPlayer")

			if ReportPlayer then
				ReportPlayer:Destroy()
			end

			if p27 and (p27 ~= LocalPlayer and (p27.UserId > 0 and LocalPlayer.UserId > 0)) then
				local v236 = Utility:MakeStyledImageButton("ReportPlayer", "icons/actions/feedback", UDim2.new(0, Theme.ButtonHeight, 0, Theme.ButtonHeight), UDim2.new(0, 28, 0, 28), function() -- line: 930
					-- upvalues: ReportAbuseMenuNewContainerPage (copy), p27 (copy)
					ReportAbuseMenuNewContainerPage:ReportPlayer(p27, "MenuPlayerList")
				end)

				v236.Name = "ReportPlayer"
				v236.Position = UDim2.new(1, -260, 0, 7)
				v236.LayoutOrder = 3
				v236.Selectable = true

				local v237 = "utility-focus-state" .. "-reportplayer-" .. p27.Name

				Utility:MakeFocusState(v236, v237)
				v236.Parent = RightSideButtons
			end
		end
	end

	local u110 = nil
	local u111 = false
	local connection = nil

	local function shouldShowJoinVoiceButton() -- line: 992
		-- upvalues: GetFFlagEnableConsoleJoinVoice (copy), u111 (ref), v69 (copy), default (copy)
		return GetFFlagEnableConsoleJoinVoice() and (game:GetEngineFeature("VoiceChatSupported") and (not u111 and (not v69 and (default:verifyUniverseAndPlaceCanUseVoice() and (default:ShouldShowJoinVoiceOnDisconnect() and (default:GetVoiceConnectCookie() == "" and default:HasSeamlessVoiceFeature("InitialJoinVoice")))))))
	end
	local function createRow(p28, p29, b1: boolean?) -- line: 1003
		-- upvalues: Theme (copy), Create (copy)
		local v241 = Instance.new(p28)

		v241.Size = UDim2.new(1, 0, 0, 62)
		v241.Position = UDim2.new(0, 0, 0, 0)
		v241.ZIndex = 2
		v241.BackgroundColor3 = Theme.color("PlayerRowFrame")
		v241.BackgroundTransparency = Theme.transparency("PlayerRowFrame")
		Create("UICorner")({
			CornerRadius = Theme.DefaultCornerRadius,
			Parent = v241
		})

		local TextLabel

		if b1 then
			TextLabel = Instance.new("TextLabel")
			TextLabel.TextColor3 = Color3.new(1, 1, 1)
			TextLabel.TextSize = 24
		else
			TextLabel = Instance.new("ImageLabel")
		end

		TextLabel.Name = "Icon"
		TextLabel.BackgroundTransparency = 1
		TextLabel.Size = UDim2.new(0, 36, 0, 36)
		TextLabel.Position = UDim2.new(0, 12, 0, 12)
		TextLabel.ZIndex = 3
		TextLabel.Parent = v241

		local TextLabel2 = Instance.new("TextLabel")

		TextLabel2.Text = ""
		TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel2.Font = Theme.font(Enum.Font.SourceSans, "DisplayName")
		TextLabel2.FontSize = p29 and Theme.fontSize(Enum.FontSize.Size36, "DisplayName") or Theme.fontSize(Enum.FontSize.Size24, "DisplayName")
		TextLabel2.TextColor3 = Color3.new(1, 1, 1)
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.Position = p29 and UDim2.new(0, 60, 0.5, -10) or UDim2.new(0, 60, 0.5, 0)
		TextLabel2.Size = UDim2.new(0, 0, 0, 0)
		TextLabel2.ZIndex = 3
		TextLabel2.Parent = v241

		if p29 then
			local TextLabel3 = Instance.new("TextLabel")

			TextLabel3.Text = ""
			TextLabel3.Name = "SecondRow"
			TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
			TextLabel3.Font = Theme.font(Enum.Font.SourceSans)
			TextLabel3.FontSize = Theme.fontSize(Enum.FontSize.Size24, "Username")
			TextLabel3.TextColor3 = Color3.fromRGB(162, 162, 162)
			TextLabel3.BackgroundTransparency = 1
			TextLabel3.Position = UDim2.new(0, 60, 0.5, 12)
			TextLabel3.Size = UDim2.new(0, 0, 0, 0)
			TextLabel3.ZIndex = 3
			TextLabel3.Parent = v241
		end

		return v241
	end
	local function u115() -- line: 1062
		-- upvalues: createRow (copy), u111 (ref), GetFFlagEnableConsoleJoinVoice (copy), shouldShowJoinVoiceButton (copy), uDim2 (copy), Theme (copy), t1 (copy), RobloxLocaleId (copy), FFlagConnectionsToFriendsRename (copy), Constants2 (copy), uiblox (copy), BuilderIcons (copy), Utility (copy)
		local v245 = createRow("ImageButton", nil, true)

		v245.Size = UDim2.new(1, 0, 0, 52)

		local TextLabel = v245.TextLabel
		local Icon = v245.Icon

		if u111 or GetFFlagEnableConsoleJoinVoice() and shouldShowJoinVoiceButton() then
			v245.Size = uDim2
			TextLabel.Size = UDim2.new(1, -60, 0, 0)
			TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
			v245.AnchorPoint = Vector2.new(0, 0)
		end

		TextLabel.Font = Theme.font(Enum.Font.SourceSansSemibold, "Semibold")
		TextLabel.AutoLocalize = false
		TextLabel.Text = t1[RobloxLocaleId]:Format(if not FFlagConnectionsToFriendsRename then Constants2.InviteConnectionsLocalizedKey else Constants2.InviteFriendsLocalizedKey)
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.Position = UDim2.new(0, 18, 0.5, 0)

		local v248 = uiblox["icons/actions/friends/friendInvite"]
		local v249 = if not v248 then Theme.Images["icons/actions/friends/friendInvite"] else uiblox["icons/actions/friends/friendInvite"]

		if v249 then
			if v248 then
				Icon.Text = v249.name
				Icon.FontFace = BuilderIcons.Font[v249.variant]
			else
				Icon.Image = v249.Image
				Icon.ImageRectOffset = v249.ImageRectOffset
				Icon.ImageRectSize = v249.ImageRectSize
			end
		end

		v245.InputBegan:Connect(function() -- line: 1104
			-- upvalues: v245 (copy)
			v245.ImageTransparency = 0.65
		end)
		v245.InputEnded:Connect(function() -- line: 1107
			-- upvalues: v245 (copy)
			v245.ImageTransparency = 0.85
		end)
		v245.Activated:Connect(function() -- line: 1110
			-- upvalues: v245 (copy)
			v245.ImageTransparency = 0.85
		end)
		v245.TouchPan:Connect(function(_, p31) -- line: 1113
			-- upvalues: v245 (copy)
			if math.abs(p31.Y) > 20 then
				v245.ImageTransparency = 0.85
			end
		end)
		v245.SelectionGained:connect(function() -- line: 1119
			-- upvalues: v245 (copy)
			v245.ImageTransparency = 0.65
		end)
		v245.SelectionLost:connect(function() -- line: 1122
			-- upvalues: v245 (copy)
			v245.ImageTransparency = 0.85
		end)
		v245.SelectionImageObject = v245:Clone()
		Utility:MakeFocusState(v245, "utility-focus-state-sharegame")

		return v245
	end
	local function u116() -- line: 1133
		-- upvalues: createRow (copy), u78 (ref), Theme (copy), RobloxTranslator (copy), default (copy), Utility (copy)
		local v250 = createRow("ImageButton")

		v250.Size = UDim2.new(not u78 and 1 or 0.5, -10, 0, 52)
		v250.Position = UDim2.new(1, 0, 0, 0)
		v250.AnchorPoint = Vector2.new(1, 0)

		local TextLabel = v250.TextLabel
		local Icon = v250.Icon

		TextLabel.Size = UDim2.new(1, -60, 0, 0)
		TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
		TextLabel.Font = Theme.font(Enum.Font.SourceSansSemibold, "Semibold")
		TextLabel.AutoLocalize = false
		TextLabel.Text = RobloxTranslator:FormatByKey("Feature.SettingsHub.Action.MuteAll")
		Icon.Size = UDim2.new(0, 32, 0, 32)
		Icon.Position = UDim2.new(0, 18, 0, 16)
		Icon.Image = default:GetIcon("UnmuteAll", "Misc")
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.Position = UDim2.new(0, 18, 0.5, 0)
		v250.InputBegan:Connect(function() -- line: 1161
			-- upvalues: v250 (copy)
			v250.ImageTransparency = 0.65
		end)
		v250.InputEnded:Connect(function() -- line: 1164
			-- upvalues: v250 (copy)
			v250.ImageTransparency = 0.85
		end)
		v250.Activated:Connect(function() -- line: 1167
			-- upvalues: v250 (copy)
			v250.ImageTransparency = 0.85
		end)
		v250.TouchPan:Connect(function(_, p33) -- line: 1170
			-- upvalues: v250 (copy)
			if math.abs(p33.Y) > 20 then
				v250.ImageTransparency = 0.85
			end
		end)
		v250.SelectionGained:connect(function() -- line: 1176
			-- upvalues: v250 (copy)
			v250.ImageTransparency = 0.65
		end)
		v250.SelectionLost:connect(function() -- line: 1179
			-- upvalues: v250 (copy)
			v250.ImageTransparency = 0.85
		end)
		v250.SelectionImageObject = v250:Clone()
		Utility:MakeFocusState(v250, "utility-focus-state-muteall")

		return v250
	end
	local function u117() -- line: 1190
		-- upvalues: createRow (copy), Theme (copy), pollImage (copy), Utility (copy), t1 (copy), RobloxLocaleId (copy), default (copy), connection (ref), u96 (ref), GetFFlagCleanupMuteSelfButton (copy), u86 (ref), v83 (copy), u80 (ref)
		local v253 = createRow("ImageButton")

		v253.Name = "MuteSelfButton"
		v253.Size = UDim2.new(0, Theme.ButtonHeight, 0, Theme.ButtonHeight)
		v253.Position = UDim2.new(1, 0, 0, 0)
		v253.AnchorPoint = Vector2.new(1, 0)

		local TextLabel = v253.TextLabel
		local Icon = v253.Icon

		TextLabel.Size = UDim2.new(1, -60, 0, 0)
		TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
		TextLabel.Font = Theme.font(Enum.Font.SourceSansSemibold, "Semibold")
		TextLabel.AutoLocalize = false
		Icon.Name = "MuteSelfButtonImageLabel"
		Icon.Size = UDim2.new(0, 32, 0, 32)
		Icon.Position = UDim2.new(0, 18, 0, 16)
		Icon.Image = pollImage()
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.Position = UDim2.new(0, 18, 0.5, 0)
		v253.InputBegan:Connect(function() -- line: 1219
			-- upvalues: v253 (copy)
			v253.ImageTransparency = 0.65
		end)
		v253.InputEnded:Connect(function() -- line: 1222
			-- upvalues: v253 (copy)
			v253.ImageTransparency = 0.85
		end)
		v253.Activated:Connect(function() -- line: 1225
			-- upvalues: v253 (copy)
			v253.ImageTransparency = 0.85
		end)
		v253.TouchPan:Connect(function(_, p35) -- line: 1228
			-- upvalues: v253 (copy)
			if math.abs(p35.Y) > 20 then
				v253.ImageTransparency = 0.85
			end
		end)
		v253.SelectionGained:connect(function() -- line: 1234
			-- upvalues: v253 (copy)
			v253.ImageTransparency = 0.65
		end)
		v253.SelectionLost:connect(function() -- line: 1237
			-- upvalues: v253 (copy)
			v253.ImageTransparency = 0.85
		end)
		v253.SelectionImageObject = v253:Clone()
		Utility:MakeFocusState(v253, "utility-focus-state-playermute")

		local v256 = not default.localMuted and "CoreScripts.InGameMenu.QuickActions.MuteSelf" or "CoreScripts.InGameMenu.QuickActions.UnmuteSelf"

		TextLabel.Text = t1[RobloxLocaleId]:Format(v256)
		connection = default.muteChanged.Event:Connect(function(p36) -- line: 1252
			-- upvalues: u96 (ref), GetFFlagCleanupMuteSelfButton (copy), u86 (ref), pollImage (copy), TextLabel (copy), t1 (copy), RobloxLocaleId (copy)
			u96 = p36

			local MuteSelfButtonImageLabel = nil

			if GetFFlagCleanupMuteSelfButton() then
				if u86 then
					MuteSelfButtonImageLabel = u86:FindFirstChild("MuteSelfButtonImageLabel", true)
				end
			else
				MuteSelfButtonImageLabel = u86:FindFirstChild("MuteSelfButtonImageLabel", true)
			end

			if MuteSelfButtonImageLabel then
				MuteSelfButtonImageLabel.Image = pollImage()
			end

			local v363 = not p36 and "CoreScripts.InGameMenu.QuickActions.MuteSelf" or "CoreScripts.InGameMenu.QuickActions.UnmuteSelf"

			TextLabel.Text = t1[RobloxLocaleId]:Format(v363)
		end)
		v253.Activated:Connect(function() -- line: 1258
			-- upvalues: default (copy), v83 (copy), u96 (ref)
			default:ToggleMic("InGameMenuPlayers")

			if v83 then
				v83:onToggleMuteSelf(u96)
			end
		end)

		if GetFFlagCleanupMuteSelfButton() then
			return v253
		end

		u80 = v253
	end

	if GetFFlagEnableConsoleJoinVoice() then
		function u110() -- line: 1286
			-- upvalues: createRow (copy), uDim2 (copy), Theme (copy), v58 (copy), t1 (copy), RobloxLocaleId (copy), uiblox (copy), BuilderIcons (copy), Utility (copy), default (copy)
			local v257 = createRow("ImageButton", nil, true)

			v257.Size = UDim2.new(1, 0, 0, 52)
			v257.Size = uDim2
			v257.AnchorPoint = Vector2.new(0, 0)

			local TextLabel = v257.TextLabel

			TextLabel.Size = UDim2.new(1, -60, 0, 0)
			TextLabel.TextTruncate = Enum.TextTruncate.AtEnd
			TextLabel.Font = Theme.font(Enum.Font.SourceSansSemibold, "Semibold")
			TextLabel.AutoLocalize = false

			if v58 then
				TextLabel.Text = t1[RobloxLocaleId]:Format("Feature.SettingsHub.Action.ConnectVoiceChat")
			else
				TextLabel.Text = "Connect Voice Chat"
			end

			local Icon = v257.Icon

			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.Position = UDim2.new(0, 18, 0.5, 0)

			local v260 = uiblox["icons/controls/publicAudioJoin"]
			local v261 = if not v260 then Theme.Images["icons/controls/publicAudioJoin"] else uiblox["icons/controls/publicAudioJoin"]

			if v261 then
				if v260 then
					Icon.Text = v261.name
					Icon.FontFace = BuilderIcons.Font[v261.variant]
				else
					Icon.Image = v261.Image
					Icon.ImageRectOffset = v261.ImageRectOffset
					Icon.ImageRectSize = v261.ImageRectSize
				end
			end

			v257.InputBegan:Connect(function() -- line: 1329
				-- upvalues: v257 (copy)
				v257.ImageTransparency = 0.65
			end)
			v257.InputEnded:Connect(function() -- line: 1332
				-- upvalues: v257 (copy)
				v257.ImageTransparency = 0.85
			end)
			v257.Activated:Connect(function() -- line: 1335
				-- upvalues: v257 (copy)
				v257.ImageTransparency = 0.85
			end)
			v257.TouchPan:Connect(function(_, p38) -- line: 1338
				-- upvalues: v257 (copy)
				if math.abs(p38.Y) > 20 then
					v257.ImageTransparency = 0.85
				end
			end)
			v257.SelectionGained:connect(function() -- line: 1344
				-- upvalues: v257 (copy)
				v257.ImageTransparency = 0.65
			end)
			v257.SelectionLost:connect(function() -- line: 1347
				-- upvalues: v257 (copy)
				v257.ImageTransparency = 0.85
			end)
			v257.SelectionImageObject = v257:Clone()
			Utility:MakeFocusState(v257, "utility-focus-state-joinVoice")
			v257.Activated:Connect(function() -- line: 1355
				-- upvalues: default (copy)
				default:JoinVoice()
			end)

			return v257
		end
	end

	local function resizeInspectButton(p39, p40, p41, p42) -- line: 1382
		-- upvalues: RbxAnalyticsService (copy), Constants2 (copy), v72 (copy), GuiService (copy), Utility (copy), Theme (copy)
		local Inspect = p39:FindFirstChild("Inspect")

		if Inspect and p41 == p42 then
			return
		end

		if Inspect then
			Inspect:Destroy()
		end

		local v268 = Utility:MakeStyledImageButton("InspectButton", "icons/actions/zoomIn", UDim2.new(0, Theme.ButtonHeight, 0, Theme.ButtonHeight), UDim2.new(0, 28, 0, 28), function() -- line: 1392
			-- upvalues: RbxAnalyticsService (copy), Constants2 (copy), v72 (copy), GuiService (copy), p40 (copy)
			RbxAnalyticsService:SetRBXEventStream(Constants2.AnalyticsTargetName, Constants2.AnalyticsExamineAvatarName, Constants2.AnalyticsMenuActionName, {
				playsessionid = v72.playSessionId,
				universeid = tostring(game.GameId)
			})
			GuiService:InspectPlayerFromUserIdWithCtx(p40.UserId, "escapeMenu")
			v72.HubRef:SetVisibility(false)
		end)

		v268.Name = "Inspect"
		v268.LayoutOrder = 2
		v268.Selectable = true
		v268.Parent = p39

		local v269 = "utility-focus-state" .. "-inspect-" .. p40.Name

		Utility:MakeFocusState(v268, v269)
	end
	local function resizePlatformName(p43, p44, p45) -- line: 1415
		-- upvalues: result (copy), Utility (copy), Theme (copy), Create (copy)
		local PlatformNameContainer = p43:FindFirstChild("PlatformNameContainer")

		if PlatformNameContainer then
			PlatformNameContainer:Destroy()
		end

		if p44 == nil then
			return
		end

		local Frame = Instance.new("Frame")

		Frame.Name = "PlatformNameContainer"
		Frame.BackgroundTransparency = 1
		Frame.ZIndex = 3
		Frame.Position = UDim2.new(0, 0, 0, 0)
		Frame.Size = UDim2.new(0, 0, 1, 0)
		Frame.AutomaticSize = Enum.AutomaticSize.X
		Frame.Selectable = false
		Frame.LayoutOrder = -1
		Frame.Parent = p43

		local v275 = nil

		if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") and result and result:IsProfileEnabled() and p45 and p45 ~= "" then
			function v275() -- line: 1448
				-- upvalues: result (copy), p45 (copy)
				result:ShowProfile(p45)
			end
		end

		local v276, v277 = Utility:MakeStyledButton("consoleNameContainer", p44, UDim2.new(0, 0, 0, Theme.ButtonHeight), v275)

		v276.AnchorPoint = Vector2.new(0, 0.5)
		v276.Position = UDim2.fromScale(0, 0.5)
		v276.AutomaticSize = Enum.AutomaticSize.X
		v276.Parent = Frame
		v277.Size = UDim2.fromScale(0, 1)
		v277.AutoLocalize = false
		v277.TextSize = Theme.platformNameTextSize
		v277.TextScaled = false
		v277.TextWrapped = false
		v277.AutomaticSize = Enum.AutomaticSize.X

		local v278 = Create("ImageLabel")({
			Name = "iconLabel",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = Theme.platformNameIconSize,
			Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
			ImageColor3 = Color3.new(1, 1, 1)
		})

		v278.Parent = v276
		Create("UIListLayout")({
			Name = "PLatformNameUIListLayout",
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}).Parent = v276
		v278.LayoutOrder = 1
		v277.LayoutOrder = 2
		Create("UIPadding")({
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			Parent = v276
		})

		return Frame
	end
	local function u120() -- line: 1510
		-- upvalues: createRow (copy), FFlagIEMFocusNavToButtons (copy), GetFFlagLuaAppEnableOpenTypeSupport (copy), OpenTypeSupport (copy), GuiService (copy)
		local v279 = createRow("ImageLabel", true)

		v279.TextLabel.Name = "DisplayNameLabel"
		v279.SecondRow.Name = "NameLabel"

		if FFlagIEMFocusNavToButtons then
			v279.Selectable = false
			v279.SelectionGroup = true
		end

		if GetFFlagLuaAppEnableOpenTypeSupport() then
			v279.NameLabel.OpenTypeFeatures = OpenTypeSupport:getUserNameStylisticAlternative()
		end

		local Frame = Instance.new("Frame")

		Frame.Name = "RightSideButtons"
		Frame.BackgroundTransparency = 1
		Frame.ZIndex = 2
		Frame.Position = UDim2.new(0, 0, 0, 0)
		Frame.Size = UDim2.new(1, -12, 1, 0)
		Frame.Parent = v279

		local u281 = nil

		Frame.ChildAdded:connect(function(p46) -- line: 1546
			-- upvalues: u281 (ref), v279 (copy), GuiService (copy), Frame (copy)
			if p46:IsA("GuiObject") then
				if u281 and p46 ~= u281 then
					u281:Destroy()
					u281 = nil
				end

				p46.SelectionGained:connect(function() -- line: 1552
					-- upvalues: v279 (copy), GuiService (copy), Frame (copy)
					if v279 then
						if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject ~= nil and GuiService.SelectedCoreObject.Parent == Frame then
							v279.ImageTransparency = 0.65

							return
						end

						v279.ImageTransparency = 0.85
					end
				end)
				p46.SelectionLost:connect(function() -- line: 1555
					-- upvalues: p46 (copy), v279 (copy), GuiService (copy), Frame (copy)
					local v424 = p46

					if v279 then
						if GuiService.SelectedCoreObject and v424 ~= GuiService.SelectedCoreObject and GuiService.SelectedCoreObject.Parent == Frame then
							v279.ImageTransparency = 0.65

							return
						end

						v279.ImageTransparency = 0.85
					end
				end)
			end
		end)
		u281 = Instance.new("Frame")
		u281.Selectable = true
		u281.Size = UDim2.new(1, 0, 1, 0)
		u281.BackgroundTransparency = 1
		u281.SelectionImageObject = u281:Clone()
		u281.Parent = Frame

		local UIListLayout = Instance.new("UIListLayout")

		UIListLayout.Name = "RightSideListLayout"
		UIListLayout.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 12)
		UIListLayout.Parent = Frame
		pcall(function() -- line: 1577
			-- upvalues: v279 (copy)
			v279.NameLabel.Localize = false
			v279.DisplayNameLabel.Localize = false
		end)

		return v279
	end
	local function managePlayerNameCutoff(p47, p48) -- line: 1589
		-- upvalues: v68 (copy), UserProfileStore (copy), isEngineTruncationEnabledForIngameSettings (copy), Utility (copy), v63 (copy), formatUsername (copy)
		local u285 = nil
		local u286 = nil

		local function reportFlagChanged(p49, p50, p51) -- line: 1592
			-- upvalues: u285 (ref), p47 (copy), p48 (copy)
			if p50 == "AbsolutePosition" and u285 then
				local v372 = p49.AbsolutePosition.X - 20 - p47.NameLabel.AbsolutePosition.X

				p47.NameLabel.Text = "@" .. p48.Name
				p47.DisplayNameLabel.Text = p48.DisplayName

				if p51 then
					p47.DisplayNameLabel.Text = p51
				end

				local v373 = utf8.len(p48.DisplayName)

				if p51 then
					v373 = utf8.len(p51)
				end

				while v372 < p47.NameLabel.TextBounds.X and v373 > 0 do
					if p51 then
						local v374 = utf8.offset(p51, v373)

						p47.NameLabel.Text = string.sub(p51, 1, v374) .. "..."
					else
						local v375 = utf8.offset(p48.DisplayName, v373)

						p47.NameLabel.Text = string.sub(p48.DisplayName, 1, v375) .. "..."
					end

					v373 -= 1
				end

				local v376 = "@" .. p48.Name
				local v377 = string.len(v376)

				while v372 < p47.NameLabel.TextBounds.X and v377 > 0 do
					p47.NameLabel.Text = string.sub(v376, 1, v377) .. "..."
					v377 -= 1
				end
			end
		end
		local function reportFlagChangedWithCombinedName(p52, _, _) -- line: 1626
			-- upvalues: v68 (copy), p48 (copy), reportFlagChanged (copy), UserProfileStore (copy), p47 (copy)
			if v68 and not p48.UserId then
				reportFlagChanged(p52, "AbsolutePosition")

				return
			end

			UserProfileStore.get().fetchNamesByUserIds({ (tostring(p48.UserId)) }, function(p55) -- line: 1630
				-- upvalues: p47 (copy), reportFlagChanged (copy), p52 (copy), p48 (copy)
				local v426 = p47
				local v427 = if not v426 or not v426.Parent then nil else v426:FindFirstChild("DisplayNameLabel")

				if v427 == nil then
					return
				end

				local data = p55.data
				local s2

				if #data == 0 then
					s2 = ""
				else
					local v430 = data[1]

					if v430 == nil then
						s2 = ""
					else
						local names = v430.names

						s2 = if names ~= nil then names.getInExperienceCombinedName(false) else ""
					end
				end

				if string.len(s2) > 0 and s2 ~= v427.Text then
					reportFlagChanged(p52, "AbsolutePosition", s2)

					return
				end

				if p48.DisplayName ~= v427.Text then
					reportFlagChanged(p52, "AbsolutePosition")
				end
			end)
		end

		if not isEngineTruncationEnabledForIngameSettings() then
			Utility:OnResized(p47.NameLabel, function(_, p57) -- line: 1650
				-- upvalues: u285 (ref), Utility (copy), u286 (ref), p47 (copy), reportFlagChangedWithCombinedName (copy), p48 (copy), v68 (copy), UserProfileStore (copy)
				if u285 ~= nil and p57 == u285 then
					return
				end

				local v383 = p57 and not (Utility:IsSmallTouchScreen() and Utility:IsPortrait())

				u285 = v383

				if v383 then
					if u286 == nil then
						u286 = p47.RightSideButtons.ChildAdded:connect(function(p58) -- line: 1659
							-- upvalues: reportFlagChangedWithCombinedName (copy)
							if p58.Name == "Inspect" then
								p58.Changed:connect(function(_) -- line: 1661
									-- upvalues: reportFlagChangedWithCombinedName (copy), p58 (copy)
									reportFlagChangedWithCombinedName(p58, "AbsolutePosition")
								end)
								reportFlagChangedWithCombinedName(p58, "AbsolutePosition")
							end
						end)
					end

					local Inspect = p47.RightSideButtons:FindFirstChild("Inspect")

					if Inspect then
						Inspect.Changed:connect(function(p60) -- line: 1670
							-- upvalues: reportFlagChangedWithCombinedName (copy), Inspect (copy)
							reportFlagChangedWithCombinedName(Inspect, p60)
						end)
						reportFlagChangedWithCombinedName(Inspect, "AbsolutePosition")

						return
					end
				else
					if not p47:FindFirstChild("NameLabel") then
						return
					end

					p47.NameLabel.Text = "@" .. p48.Name

					if v68 and not p48.UserId then
						p47.DisplayNameLabel.Text = p48.DisplayName

						return
					end

					UserProfileStore.get().fetchNamesByUserIds({ (tostring(p48.UserId)) }, function(p61) -- line: 1684
						-- upvalues: p47 (copy), p48 (copy)
						local v435 = p47
						local v436 = if not v435 or not v435.Parent then nil else v435:FindFirstChild("DisplayNameLabel")

						if v436 == nil then
							return
						end

						local data = p61.data
						local s3

						if #data == 0 then
							s3 = ""
						else
							local v439 = data[1]

							if v439 == nil then
								s3 = ""
							else
								local names = v439.names

								s3 = if names ~= nil then names.getInExperienceCombinedName(false) else ""
							end
						end

						if string.len(s3) > 0 and s3 ~= v436.Text then
							v436.Text = s3

							return
						end

						local DisplayName = p48.DisplayName

						if DisplayName ~= v436.Text then
							v436.Text = DisplayName
						end
					end)
				end
			end)
		end

		local function getNearestRightSideButtonXPosition() -- line: 1704
			-- upvalues: p47 (copy)
			local AbsolutePositionX = nil

			for _, v in pairs(p47.RightSideButtons:GetChildren()) do
				if v:IsA("ImageButton") and (not AbsolutePositionX or AbsolutePositionX > v.AbsolutePosition.X) then
					AbsolutePositionX = v.AbsolutePosition.X
				end
			end

			return AbsolutePositionX
		end

		local u290 = nil

		local function rightSideButtonsChanged() -- line: 1719
			-- upvalues: getNearestRightSideButtonXPosition (copy), u290 (ref), p47 (copy), v63 (copy), formatUsername (copy), p48 (copy), v68 (copy), UserProfileStore (copy)
			local v388 = getNearestRightSideButtonXPosition()

			if v388 == u290 then
				return
			end

			u290 = v388

			local v389 = if not v388 then UDim2.new(1, -20, 0, 0) else UDim2.new(0, v388 - p47.NameLabel.AbsolutePosition.X - 20, 0, 0)

			p47.NameLabel.Size = v389
			p47.DisplayNameLabel.Size = v389
			p47.NameLabel.Text = if not v63 then "@" .. p48.Name else formatUsername(p48.Name)

			if v68 and not p48.UserId then
				p47.DisplayNameLabel.Text = p48.DisplayName

				return
			end

			UserProfileStore.get().fetchNamesByUserIds({ (tostring(p48.UserId)) }, function(p62) -- line: 1749
				-- upvalues: p47 (copy), p48 (copy)
				local v443 = p47
				local v444 = if not v443 or not v443.Parent then nil else v443:FindFirstChild("DisplayNameLabel")

				if v444 == nil then
					return
				end

				local data = p62.data
				local s4

				if #data == 0 then
					s4 = ""
				else
					local v447 = data[1]

					if v447 == nil then
						s4 = ""
					else
						local names = v447.names

						s4 = if names ~= nil then names.getInExperienceCombinedName(false) else ""
					end
				end

				if string.len(s4) > 0 and s4 ~= v444.Text then
					v444.Text = s4

					return
				end

				local DisplayName = p48.DisplayName

				if DisplayName ~= v444.Text then
					v444.Text = DisplayName
				end
			end)
		end

		if isEngineTruncationEnabledForIngameSettings() then
			u286 = p47.RightSideButtons.ChildAdded:connect(function(p63) -- line: 1768
				-- upvalues: rightSideButtonsChanged (copy)
				rightSideButtonsChanged()
				p63:GetPropertyChangedSignal("AbsolutePosition"):Connect(rightSideButtonsChanged)
			end)
			rightSideButtonsChanged()
		end
	end

	local players = nil
	local t6 = {}
	local t7 = {}
	local u125 = false

	local function updateAllMuteButtons() -- line: 1787
		-- upvalues: u79 (ref), default (copy), Players (copy), t6 (copy), muteButtonUpdate (copy), u97 (ref), RobloxTranslator (copy)
		if not u79 then
			return
		end

		if not default.voiceUIVisible then
			return
		end

		local players2 = Players:GetPlayers()
		local v293 = true

		for _, v in ipairs(players2) do
			local v296 = t6[v.Name]

			if v and v296 then
				local v297 = default.participants[tostring(v.UserId)]

				if v297 and not v297.isMutedLocally then
					v293 = false
				end

				muteButtonUpdate(v296, v297)
			end
		end

		if v293 then
			u97 = true
		else
			u97 = false
		end

		local v298 = u97 and RobloxTranslator:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or RobloxTranslator:FormatByKey("Feature.SettingsHub.Action.MuteAll")

		if not u79 or not u79:FindFirstChild("TextLabel") then
			return
		end

		u79.TextLabel.Text = v298
		u79.Icon.Image = default:GetIcon(not u97 and "UnmuteAll" or "MuteAll", "Misc")
	end
	local function destroyAllUserMuteButtons() -- line: 1830
		-- upvalues: Players (copy), t6 (copy), GuiService (copy), UserInputService (copy), u78 (ref)
		for _, v300 in (Players:GetPlayers()) do
			local v301 = t6[v300.Name]

			if v301 then
				local RightSideButtons = v301:FindFirstChild("RightSideButtons")

				if RightSideButtons then
					local MuteStatusButton = RightSideButtons:FindFirstChild("MuteStatusButton")

					if MuteStatusButton then
						if MuteStatusButton == GuiService.SelectedCoreObject then
							if UserInputService.GamepadEnabled then
								GuiService.SelectedCoreObject = u78
							else
								GuiService.SelectedCoreObject = nil
							end
						end

						MuteStatusButton:Destroy()
					end
				end
			end
		end
	end
	local function v128(_) -- line: 1853
		-- upvalues: FFlagIEMFocusNavToButtons (copy), v72 (copy), FFlagIEMTabFocusNav (copy), players (ref), Players (copy), v69 (copy), LocalPlayer (ref), Utility (copy), u111 (ref), u79 (ref), default (copy), u78 (ref), RunService (copy), u86 (ref), Create (copy), u87 (ref), uDim2 (copy), GetFFlagLuaInExperienceCoreScriptsGameInviteUnification (copy), GameInviteAnalyticsManager (ref), GameInviteAnalytics (copy), EventStream (copy), RbxAnalyticsService (copy), Diag (copy), u115 (ref), GetFFlagEnableConsoleJoinVoice (copy), shouldShowJoinVoiceButton (copy), u81 (ref), u110 (ref), u89 (ref), GuiService (copy), t6 (copy), t7 (copy), u120 (ref), muteButtonUpdate (copy), SocialUtil (copy), v63 (copy), formatUsername (copy), isEngineTruncationEnabledForIngameSettings (copy), managePlayerNameCutoff (copy), friendStatusCreate (copy), resizeFriendButton (copy), resizeBlockButton (ref), resizeInspectButton (copy), reportAbuseButtonCreate (copy), u116 (ref), u97 (ref), RobloxTranslator (copy), GetFFlagVoiceChatUILogging (copy), v31 (copy), v83 (copy), Constants (copy), updateAllMuteButtons (copy), v64 (copy), v68 (copy), Cryo (copy), UserProfileStore (copy), resizePlatformName (copy), u125 (ref), GetFFlagCleanupMuteSelfButton (copy), pollImage (copy), UserInputService (copy), v65 (copy)
		if FFlagIEMFocusNavToButtons then
			v72.LastSelectableObjects = {}
		end

		if FFlagIEMTabFocusNav and not v72.ButtonsContainer.Visible then
			v72.FirstSelectableObjects = {}
		end

		players = Players:GetPlayers()

		if v69 then
			table.sort(players, function(p65, p66) -- line: 1863
				-- upvalues: LocalPlayer (ref)
				local v393 = p65.Name:lower()
				local v394 = p66.Name:lower()

				if p65 == LocalPlayer then
					v393 = " "
				end

				if p66 == LocalPlayer then
					v394 = " "
				end

				return v393 < v394
			end)
		else
			table.sort(players, function(p67, p68) -- line: 1876
				return p67.Name:lower() < p68.Name:lower()
			end)
		end

		local n4 = 20

		if Utility:IsSmallTouchScreen() or Utility:IsPortrait() then
			n4 = 85
		end

		local v306 = u111 and (not u79 and default.voiceUIVisible)
		local v307 = LocalPlayer.UserId > 0 and (not u78 and not RunService:IsStudio())

		if (v307 or v306) and not u86 then
			u86 = Create("Frame")({
				Name = "Holder",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = v72.Page,
				LayoutOrder = 1
			})
			u87 = Create("UIListLayout")({
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 20),
				Parent = u86
			})
		end

		local v308 = RunService:IsStudio()

		if LocalPlayer.UserId > 0 and not u78 and not v308 then
			local u309 = if not GetFFlagLuaInExperienceCoreScriptsGameInviteUnification() then GameInviteAnalytics.new():withEventStream(EventStream.new(RbxAnalyticsService)):withDiag(Diag.new(RbxAnalyticsService)):withButtonName(GameInviteAnalytics.ButtonName.SettingsHub) else GameInviteAnalyticsManager:withButtonName(GameInviteAnalyticsManager.ButtonName.SettingsHub)

			u78 = u115()
			u78.Activated:connect(function() -- line: 1942
				-- upvalues: u309 (ref), v72 (copy)
				u309:inputShareGameEntryPoint()
				v72.HubRef:InviteToGame()
			end)
			u78.LayoutOrder = 1

			if v306 then
				u78.Parent = u86
			else
				u78.Parent = v72.Page
			end
		end

		if GetFFlagEnableConsoleJoinVoice() and shouldShowJoinVoiceButton() then
			if shouldShowJoinVoiceButton() and not u81 then
				u81 = u110()
			end

			u89()
		end

		if FFlagIEMTabFocusNav then
			if v306 then
				table.insert(v72.FirstSelectableObjects, u79)
			end

			if v307 then
				table.insert(v72.FirstSelectableObjects, u78)
			end

			if v306 or v307 then
				v72.FirstSelectableObjectsUpdated:fire()
			end
		end

		local InspectMenuEnabled = GuiService:GetInspectMenuEnabled()

		for i = 1, #players do
			local v312 = players[i]
			local u313 = t6[v312.Name]

			if v312 then
				t7[v312.Name] = true

				if not u313 or not u313.Parent then
					u313 = u120((i - 1) * 80 + n4)
					u313.Parent = v72.Page
					t6[v312.Name] = u313
				end

				u313.Name = "PlayerLabel" .. v312.Name

				if u111 then
					local v314 = default.participants[tostring(v312.UserId)]

					muteButtonUpdate(u313, v314)
				end

				local v315 = SocialUtil.GetPlayerImage(math.max(1, v312.UserId), Enum.ThumbnailSize.Size100x100, Enum.ThumbnailType.AvatarThumbnail)

				u313.Icon.Image = v315
				u313.NameLabel.Text = if not v63 then "@" .. v312.Name else formatUsername(v312.Name)
				u313.ImageTransparency = 0.85
				u313.LayoutOrder = i + 1

				if isEngineTruncationEnabledForIngameSettings() then
					u313.NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
					u313.DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
				end

				managePlayerNameCutoff(u313, v312)
				friendStatusCreate(u313, v312)

				local u316 = nil

				Utility:OnResized(u313, function(_, p70) -- line: 2024
					-- upvalues: u313 (ref), Utility (copy), resizeFriendButton (copy), v312 (copy), u316 (ref), resizeBlockButton (ref), InspectMenuEnabled (copy), resizeInspectButton (copy)
					local RightSideButtons = u313:FindFirstChild("RightSideButtons")
					local DisplayNameLabel = u313:FindFirstChild("DisplayNameLabel")
					local NameLabel = u313:FindFirstChild("NameLabel")
					local v402 = RightSideButtons and RightSideButtons:FindFirstChild("RightSideListLayout")

					if Utility:IsSmallTouchScreen() and Utility:IsPortrait() then
						u313.Size = UDim2.new(1, 0, 0, 105)

						if DisplayNameLabel then
							if NameLabel then
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.275, -10)
								NameLabel.Position = UDim2.new(0, 60, 0.275, 12)
							else
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.275, 0)
							end
						end

						if RightSideButtons then
							RightSideButtons.Position = UDim2.new(0, 57, 0, -2)
							RightSideButtons.Size = UDim2.new(1, -12, 0.99, -8)
						end

						if v402 then
							v402.HorizontalAlignment = Enum.HorizontalAlignment.Left
							v402.VerticalAlignment = Enum.VerticalAlignment.Bottom
						end
					else
						u313.Size = UDim2.new(1, 0, 0, 62)

						if DisplayNameLabel then
							if NameLabel then
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.5, -10)
								NameLabel.Position = UDim2.new(0, 60, 0.5, 12)
							else
								DisplayNameLabel.Position = UDim2.new(0, 60, 0.5, 0)
							end
						end

						if RightSideButtons then
							RightSideButtons.Position = UDim2.new(0, 0, 0, 0)
							RightSideButtons.Size = UDim2.new(1, -12, 1, 0)
						end

						if v402 then
							v402.HorizontalAlignment = Enum.HorizontalAlignment.Right
							v402.VerticalAlignment = Enum.VerticalAlignment.Center
						end
					end

					if RightSideButtons then
						resizeFriendButton(RightSideButtons, v312, p70, u316)
						resizeBlockButton(RightSideButtons, v312, p70, u316)

						if InspectMenuEnabled then
							resizeInspectButton(RightSideButtons, v312, p70, u316)
						end

						u316 = p70
					end
				end)
				reportAbuseButtonCreate(u313, v312)

				if FFlagIEMFocusNavToButtons and i == #players then
					local RightSideButtons = u313:FindFirstChild("RightSideButtons")

					if RightSideButtons then
						for _, v319 in RightSideButtons:GetChildren() do
							if v319:IsA("ImageButton") then
								table.insert(v72.LastSelectableObjects, v319)
							end
						end

						v72.LastSelectableObjectsUpdated:fire()
					end
				end

				if FFlagIEMTabFocusNav and i == 1 and #v72.FirstSelectableObjects == 0 then
					local RightSideButtons = u313:FindFirstChild("RightSideButtons")

					if RightSideButtons then
						for _, v322 in RightSideButtons:GetChildren() do
							if v322:IsA("ImageButton") then
								table.insert(v72.FirstSelectableObjects, v322)
							end
						end

						v72.FirstSelectableObjectsUpdated:fire()
					end
				end
			end
		end

		if v306 then
			u79 = u116()
			u79.Activated:connect(function() -- line: 2123
				-- upvalues: u97 (ref), RobloxTranslator (copy), u79 (ref), default (copy), GetFFlagVoiceChatUILogging (copy), v31 (copy), v83 (copy), Constants (copy), updateAllMuteButtons (copy)
				u97 = not u97

				local v403 = u97 and RobloxTranslator:FormatByKey("Feature.SettingsHub.Action.UnmuteAll") or RobloxTranslator:FormatByKey("Feature.SettingsHub.Action.MuteAll")

				u79.TextLabel.Text = v403
				u79.Icon.Image = default:GetIcon(not u97 and "UnmuteAll" or "MuteAll", "Misc")

				if GetFFlagVoiceChatUILogging() then
					v31:debug("{} all players", not u97 and "Unmuting" or "Muting")
				end

				if v83 then
					v83:onToggleMuteAll(u97)
				end

				default:MuteAll(u97, Constants.VOICE_CONTEXT_TYPE.IN_GAME_MENU)
				updateAllMuteButtons()
			end)
			u79.LayoutOrder = 1

			if v64 then
				(function() --[[ layoutMuteAll ]] -- line: 1910
					-- upvalues: u86 (ref), Create (copy), v72 (copy), u78 (ref), uDim2 (copy), u79 (ref)
					if not u86 then
						u86 = Create("Frame")({
							Name = "Holder",
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 52),
							Parent = v72.Page,
							LayoutOrder = 1
						})
					end

					u78.Parent = u86
					u78.Size = uDim2
					u79.Parent = u86
				end)()
			else
				u79.Parent = u86
			end

			u89()
		end

		local v323 = if not v68 then Cryo.List.filter(players, function(p71) -- line: 2161
			return (tostring(p71.UserId))
		end) else Cryo.List.filterMap(players, function(p72) -- line: 2153
			if not p72.UserId then
				return nil
			end

			return (tostring(p72.UserId))
		end)

		for _, v in ipairs(players) do
			t6[v.Name].DisplayNameLabel.Text = v.DisplayName
		end

		UserProfileStore.get().fetchNamesByUserIds(v323, function(p73) -- line: 2170
			-- upvalues: t6 (copy), resizePlatformName (copy)
			for _, v408 in p73.data do
				local v409 = t6[v408.names.getUsername(false)]

				if v409 then
					local v410 = v408.names.getInExperienceCombinedName(false)

					if string.len(v410) > 0 and v410 ~= v409.DisplayNameLabel.Text then
						v409.DisplayNameLabel.Text = v410
					end

					local RightSideButtons = v409:FindFirstChild("RightSideButtons")
					local v412 = nil

					if v408.names.getPlatformName(false) ~= "" then
						v412 = v408.names.getPlatformName(false)
					end

					if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then
						resizePlatformName(RightSideButtons, v412, v408.getPlatformProfileId(false))
					else
						resizePlatformName(RightSideButtons, v412)
					end
				end
			end
		end)

		local n5 = 0

		if u111 and not u125 then
			v31:debug("Setting Up Playerlist Mic Update Renderstep Hook")
			RunService:BindToRenderStep("player-list-mute-update", Enum.RenderPriority.Last.Value, function() -- line: 2202
				-- upvalues: n5 (ref), updateAllMuteButtons (copy), GetFFlagCleanupMuteSelfButton (copy), u86 (ref), pollImage (copy)
				n5 += 1

				if n5 % 3 == 0 then
					updateAllMuteButtons()

					local MuteSelfButtonImageLabel = nil

					if GetFFlagCleanupMuteSelfButton() then
						if u86 then
							MuteSelfButtonImageLabel = u86:FindFirstChild("MuteSelfButtonImageLabel", true)
						end
					else
						MuteSelfButtonImageLabel = u86:FindFirstChild("MuteSelfButtonImageLabel", true)
					end

					if not MuteSelfButtonImageLabel then
						return
					end

					MuteSelfButtonImageLabel.Image = pollImage()
				end
			end)
			u125 = true
		end

		for k, v in pairs(t6) do
			if not t7[k] then
				v:Destroy()
				t6[k] = nil
			end
		end

		if UserInputService.GamepadEnabled and (not FFlagIEMTabFocusNav or not GuiService.SelectedCoreObject) then
			if GetFFlagCleanupMuteSelfButton() then
				pcall(function() -- line: 2222
					-- upvalues: v65 (copy), v72 (copy), GuiService (copy), u78 (ref)
					if v65 then
						if v72.Active then
							GuiService.SelectedCoreObject = u78

							return
						end
					else
						GuiService.SelectedCoreObject = u78
					end
				end)
			else
				GuiService.SelectedCoreObject = u78
			end
		end

		Utility:OnResized("MenuPlayerListExtraPageSize", function(_, _) -- line: 2236
			-- upvalues: Utility (copy), players (ref), v72 (copy)
			local n6 = 20

			if Utility:IsSmallTouchScreen() or Utility:IsPortrait() then
				n6 = 85
			end

			local v417 = #players + 1

			if Utility:IsSmallTouchScreen() and Utility:IsPortrait() then
				v72.Page.Size = UDim2.new(1, 0, 0, n6 + v417 * 123 - 5)

				return
			end

			v72.Page.Size = UDim2.new(1, 0, 0, n6 + v417 * 80 - 5)
		end)
	end

	if game:GetEngineFeature("VoiceChatSupported") and not u111 then
		default:asyncInit():andThen(function() -- line: 2262
			-- upvalues: u111 (ref), default (copy), v69 (copy), GetFFlagCleanupMuteSelfButton (copy), u80 (ref), u117 (ref), updateAllMuteButtons (copy), t2 (copy), u79 (ref), u89 (ref), connection (ref), GetFFlagEnableConsoleJoinVoice (copy), u81 (ref), v128 (copy), v64 (copy), v99 (copy), destroyAllUserMuteButtons (copy), resetButtonRow (copy)
			u111 = true
			default:SetupParticipantListeners()

			if not v69 then
				if GetFFlagCleanupMuteSelfButton() then
					u80 = u117()
				else
					u117()
				end
			end

			default.participantsUpdate.Event:Connect(function() -- line: 2267
				-- upvalues: updateAllMuteButtons (copy)
				updateAllMuteButtons()
			end)
			default.participantLeft.Event:Connect(function(_, p77) -- line: 2270
				-- upvalues: updateAllMuteButtons (copy), t2 (copy)
				updateAllMuteButtons()
				t2[p77] = nil
			end)
			default:getService().StateChanged:Connect(function(_, newState) -- line: 2275
				-- upvalues: u79 (ref), u89 (ref), u80 (ref), connection (ref), GetFFlagEnableConsoleJoinVoice (copy), u81 (ref), u111 (ref), v128 (copy)
				if newState == Enum.VoiceChatState.Ended then
					if u79 then
						u79.Visible = false
						u79:Destroy()
						u79 = nil
					end

					u89()

					if u80 then
						u80.Visible = false
						u80:Destroy()
						u80 = nil
					end

					if connection then
						connection:Disconnect()
						connection = nil
					end

					u89()

					if GetFFlagEnableConsoleJoinVoice() then
						if u81 then
							u81.Visible = false
							u81:Destroy()
							u81 = nil
						end

						u89()
					end

					u111 = false

					return
				end

				if newState == Enum.VoiceChatState.Joined and u111 == false then
					u111 = true

					if GetFFlagEnableConsoleJoinVoice() then
						if u81 then
							u81.Visible = false
							u81:Destroy()
							u81 = nil
						end

						u89()
					end

					v128()
				end
			end)

			if v64 and not GetFFlagCleanupMuteSelfButton() then
				v128()
			end

			default.showVoiceUI.Event:Connect(function() -- line: 2299
				-- upvalues: GetFFlagCleanupMuteSelfButton (copy), u80 (ref), v69 (copy), u117 (ref), v99 (copy), GetFFlagEnableConsoleJoinVoice (copy), u81 (ref), u89 (ref), v128 (copy)
				if GetFFlagCleanupMuteSelfButton() then
					if not u80 and not v69 then
						if GetFFlagCleanupMuteSelfButton() then
							u80 = u117()
						else
							u117()
						end
					end
				elseif not v99:FindFirstChild("MuteSelfButton", true) and not v69 then
					if GetFFlagCleanupMuteSelfButton() then
						u80 = u117()
					else
						u117()
					end
				end

				if GetFFlagEnableConsoleJoinVoice() then
					if u81 then
						u81.Visible = false
						u81:Destroy()
						u81 = nil
					end

					u89()
				end

				v128()
			end)
			default.hideVoiceUI.Event:Connect(function() -- line: 2314
				-- upvalues: u79 (ref), u89 (ref), u80 (ref), connection (ref), destroyAllUserMuteButtons (copy), v128 (copy), resetButtonRow (copy)
				if u79 then
					if u79 then
						u79.Visible = false
						u79:Destroy()
						u79 = nil
					end

					u89()
				end

				if u80 then
					u80.Visible = false
					u80:Destroy()
					u80 = nil
				end

				if connection then
					connection:Disconnect()
					connection = nil
				end

				u89()
				destroyAllUserMuteButtons()
				v128()
				resetButtonRow()
			end)
			default.muteAllChanged.Event:Connect(function() -- line: 2323
				-- upvalues: updateAllMuteButtons (copy)
				updateAllMuteButtons()
			end)
		end):catch(function(_) -- line: 2327
			-- upvalues: GetFFlagVoiceChatUILogging (copy), v31 (copy)
			if GetFFlagVoiceChatUILogging() then
				v31:warning("Failed to init VoiceChatServiceManager")
			end
		end)
	end

	v72.Displayed.Event:connect(v128)
	v72.Hidden.Event:connect(function() -- line: 2252
		-- upvalues: u125 (ref), v31 (copy), RunService (copy)
		if u125 then
			v31:debug("Unbinding Playerlist Mic Update Renderstep Hook")
			u125 = false
			RunService:UnbindFromRenderStep("player-list-mute-update")
		end
	end)
	Players.PlayerRemoving:Connect(function(player) -- line: 2337
		-- upvalues: t7 (copy), t6 (copy), GuiService (copy), UserInputService (copy), u78 (ref), GetFFlagDestroyPlayerCardOnLeave (copy)
		t7[player.Name] = nil

		local v331 = t6[player.Name]

		if not v331 then
			return
		end

		local RightSideButtons = v331:FindFirstChild("RightSideButtons")

		if not RightSideButtons then
			return
		end

		local FriendStatus = RightSideButtons:FindFirstChild("FriendStatus")

		if FriendStatus then
			if FriendStatus == GuiService.SelectedCoreObject then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = u78
				else
					GuiService.SelectedCoreObject = nil
				end
			end

			FriendStatus:Destroy()
		end

		local ReportPlayer = RightSideButtons:FindFirstChild("ReportPlayer")

		if ReportPlayer then
			if ReportPlayer == GuiService.SelectedCoreObject then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = u78
				else
					GuiService.SelectedCoreObject = nil
				end
			end

			ReportPlayer:Destroy()
		end

		local MuteStatusButton = RightSideButtons:FindFirstChild("MuteStatusButton")

		if MuteStatusButton then
			if MuteStatusButton == GuiService.SelectedCoreObject then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = u78
				else
					GuiService.SelectedCoreObject = nil
				end
			end

			MuteStatusButton:Destroy()
		end

		local BlockButton = RightSideButtons:FindFirstChild("BlockButton")

		if BlockButton then
			if BlockButton == GuiService.SelectedCoreObject then
				if UserInputService.GamepadEnabled then
					GuiService.SelectedCoreObject = u78
				else
					GuiService.SelectedCoreObject = nil
				end
			end

			BlockButton:Destroy()
		end

		local Inspect = RightSideButtons:FindFirstChild("Inspect")

		if Inspect then
			if Inspect == GuiService.SelectedCoreObject then
				GuiService.SelectedCoreObject = nil
			end

			Inspect:Destroy()
		end

		if GetFFlagDestroyPlayerCardOnLeave() then
			t6[player.Name] = nil
			v331:Destroy()
		end
	end)

	local function removeInspectButtons() -- line: 2414
		-- upvalues: t6 (copy), GuiService (copy)
		for _, v in pairs(t6) do
			local RightSideButtons = v:FindFirstChild("RightSideButtons")

			if RightSideButtons then
				local Inspect = RightSideButtons:FindFirstChild("Inspect")

				if Inspect then
					if Inspect == GuiService.SelectedCoreObject then
						GuiService.SelectedCoreObject = nil
					end

					Inspect:Destroy()
				end
			end
		end
	end

	GuiService.InspectMenuEnabledChangedSignal:Connect(function(p80) -- line: 2431
		-- upvalues: removeInspectButtons (copy)
		if not p80 then
			removeInspectButtons()
		end
	end)

	function v72.CreateMenuButtonsContainer(_) -- line: 2437
		-- upvalues: FIntRelocateMobileMenuButtonsVariant (copy), v72 (copy), ReactRoblox (copy), v99 (copy), React (copy), MenuButtonsContainer (copy)
		if FIntRelocateMobileMenuButtonsVariant == 2 then
			if v72.buttonsContainerRoot then
				return
			end

			v72.buttonsContainerRoot = ReactRoblox.createRoot(v99)

			local ExperienceControlStore = v72.HubRef:GetExperienceControlStore()

			v72.buttonsContainerRoot:render(React.createElement(MenuButtonsContainer, {
				onLeaveGame = ExperienceControlStore.onLeaveGame,
				onRespawn = ExperienceControlStore.onRespawn,
				onResume = ExperienceControlStore.onResume,
				setAddMenuKeyBindings = function() --[[ setAddMenuKeyBindings ]] -- line: 2449
				end,
				setRemoveMenuKeyBindings = function() --[[ setRemoveMenuKeyBindings ]] -- line: 2450
				end,
				getVisibility = function() --[[ getVisibility ]] -- line: 2451
					return true
				end,
				getCanRespawn = ExperienceControlStore.getCanRespawn
			}))
		end
	end
	function v72.UnmountMenuButtonsContainer(_) -- line: 2459
		-- upvalues: FFlagMenuButtonsMountWithIEM (copy), FIntRelocateMobileMenuButtonsVariant (copy), v72 (copy)
		if FFlagMenuButtonsMountWithIEM and (FIntRelocateMobileMenuButtonsVariant == 2 and v72.buttonsContainerRoot) then
			v72.buttonsContainerRoot:unmount()
			v72.buttonsContainerRoot = nil
		end
	end

	return v72
end)())
