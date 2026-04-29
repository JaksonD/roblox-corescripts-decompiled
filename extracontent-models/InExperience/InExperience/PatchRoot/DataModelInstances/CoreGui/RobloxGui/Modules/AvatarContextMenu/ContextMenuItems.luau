local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local TextChatService = game:GetService("TextChatService")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local Modules = RobloxGui:WaitForChild("Modules")
local RobloxTranslator = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GameTranslator = require(RobloxGui.Modules.GameTranslator)
local AvatarContextMenu = Modules:WaitForChild("AvatarContextMenu")
local ContextMenuUtil = require(AvatarContextMenu:WaitForChild("ContextMenuUtil"))
local ThemeHandler = require(AvatarContextMenu.ThemeHandler)
local BlockingUtility = require(CorePackages.Workspace.Packages.BlockingUtility)
local t = require(CorePackages.Packages.t)
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local ExpChat = require(CorePackages.Workspace.Packages.ExpChat)
local FFlagAvatarContextMenuItemsChatButtonRefactor = require(Modules.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor)
local FFlagWhisperEmoteOnAvatarContextMenuWithExpChat = require(Modules.Common.Flags.FFlagWhisperEmoteOnAvatarContextMenuWithExpChat)
local LocalPlayer = Players.LocalPlayer

while not LocalPlayer do
	Players.PlayerAdded:wait()
	LocalPlayer = Players.LocalPlayer
end

local t1 = {
	[Enum.AvatarContextMenuOption.Chat] = true,
	[Enum.AvatarContextMenuOption.Friend] = true,
	[Enum.AvatarContextMenuOption.Emote] = true,
	[Enum.AvatarContextMenuOption.InspectMenu] = true
}
local t2 = {}
local n1 = 0
local t3 = {}

t3.__index = t3

function t3.UpdateInspectMenuEnabled(_) -- line: 72
	-- upvalues: GuiService (copy), t1 (copy)
	local InspectMenuEnabled = GuiService:GetInspectMenuEnabled()

	if InspectMenuEnabled ~= t1[Enum.AvatarContextMenuOption.InspectMenu] then
		t1[Enum.AvatarContextMenuOption.InspectMenu] = InspectMenuEnabled
	end
end
function t3.ClearMenuItems(p2) -- line: 80
	local children = p2.MenuItemFrame:GetChildren()

	for i = 1, #children do
		if children[i]:IsA("GuiObject") then
			children[i]:Destroy()
		end
	end
end
function t3.AddCustomAvatarMenuItem(_, p4, p5) -- line: 89
	-- upvalues: n1 (ref), t2 (copy)
	n1 += 1
	t2[p4] = {
		event = p5,
		layoutOrder = n1
	}
end
function t3.RemoveCustomAvatarMenuItem(_, p7) -- line: 97
	-- upvalues: t2 (copy)
	t2[p7] = nil
end
function t3.IsContextAvatarEnumItem(_, p9) -- line: 101
	local EnumItems = Enum.AvatarContextMenuOption:GetEnumItems()

	for i = 1, #EnumItems do
		if p9 == EnumItems[i] then
			return true
		end
	end

	return false
end
function t3.EnableDefaultMenuItem(_, p11) -- line: 111
	-- upvalues: t1 (copy)
	t1[p11] = true
end
function t3.RemoveDefaultMenuItem(_, p13) -- line: 115
	-- upvalues: t1 (copy)
	t1[p13] = false
end
function t3.RegisterCoreMethods(p14) -- line: 119
	-- upvalues: StarterGui (copy)
	StarterGui:RegisterSetCore("AddAvatarContextMenuOption", function(p15) --[[ addMenuItemFunc ]] -- line: 120
		-- upvalues: p14 (copy)
		if type(p15) == "table" then
			local s1 = ""

			if p15[1] and type(p15[1]) == "string" then
				s1 = p15[1]
			else
				error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			end

			if p15[2] and typeof(p15[2]) == "Instance" and p15[2].ClassName == "BindableEvent" then
				p14:AddCustomAvatarMenuItem(s1, p15[2])

				return
			end

			error("AddAvatarContextMenuOption second table entry must be a BindableEvent")

			return
		end

		if typeof(p15) == "EnumItem" then
			if p14:IsContextAvatarEnumItem(p15) then
				p14:EnableDefaultMenuItem(p15)

				return
			end

			error("AddAvatarContextMenuOption given EnumItem is not valid")

			return
		end

		error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
	end)
	StarterGui:RegisterSetCore("RemoveAvatarContextMenuOption", function(p16) --[[ removeMenuItemFunc ]] -- line: 145
		-- upvalues: p14 (copy)
		if type(p16) == "string" then
			p14:RemoveCustomAvatarMenuItem(p16)

			return
		end

		if typeof(p16) == "EnumItem" then
			if p14:IsContextAvatarEnumItem(p16) then
				p14:RemoveDefaultMenuItem(p16)

				return
			end

			error("RemoveAvatarContextMenuOption given EnumItem is not valid")

			return
		end

		error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption")
	end)
end
function t3.CreateCustomMenuItems(p17) -- line: 161
	-- upvalues: t2 (copy), RbxAnalyticsService (copy), GameTranslator (copy), ContextMenuUtil (copy), ThemeHandler (copy)
	for k, v in pairs(t2) do
		local v57 = k

		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuCustomButton", "name: " .. tostring(v57))

		local v58 = GameTranslator:TranslateGameText(p17.MenuItemFrame, v57)
		local v59 = ContextMenuUtil:MakeStyledButton("CustomButton", v58, UDim2.new(0.96, 0, 0, 52), function() --[[ customButtonFunc ]] -- line: 164
			-- upvalues: p17 (copy), v (copy)
			if p17.CloseMenuFunc then
				p17:CloseMenuFunc()
			end

			v.event:Fire(p17.SelectedPlayer)
		end, ThemeHandler:GetTheme())

		v59.Name = "CustomButton"
		v59.LayoutOrder = v.layoutOrder
		v59.Parent = p17.MenuItemFrame
	end
end

local s2 = "Add Friend"
local s3 = "Friends"
local s4 = "Friend Request Pending"
local s5 = "Accept Friend Request"
local s6 = "Player Blocked"

function t3.CreateFriendButton(p18, p19, p20) -- line: 195
	-- upvalues: s2 (ref), RobloxTranslator (copy), s3 (ref), s4 (ref), s5 (ref), s6 (ref), RbxAnalyticsService (copy), LocalPlayer (ref), ContextMenuUtil (copy), ThemeHandler (copy), n1 (ref)
	s2 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.AddFriend")
	s3 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.Friends")
	s4 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending")
	s5 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest")
	s6 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked")

	local FriendStatus = p18.MenuItemFrame:FindFirstChild("FriendStatus")

	if FriendStatus then
		FriendStatus:Destroy()
		FriendStatus = nil
	end

	local u64 = nil
	local v65, v66 = ContextMenuUtil:MakeStyledButton("FriendStatus", s2, UDim2.new(0.96, 0, 0, 52), function() -- line: 212
		-- upvalues: u64 (ref), FriendStatus (ref), s4 (ref), RbxAnalyticsService (copy), LocalPlayer (ref), p18 (copy)
		if u64 and FriendStatus.Selectable then
			FriendStatus.Selectable = false
			u64.TextTransparency = 0.75
			u64.Text = s4
			RbxAnalyticsService:ReportCounter("AvatarContextMenu-RequestFriendship")
			RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu")
			LocalPlayer:RequestFriendship(p18.SelectedPlayer)
		end
	end, ThemeHandler:GetTheme())

	FriendStatus = v65
	u64 = v66

	if p20 then
		FriendStatus.Selectable = false
		u64.TextTransparency = 0.75
		u64.Text = s6
	elseif p19 == Enum.FriendStatus.Friend then
		FriendStatus.Selectable = false
		u64.TextTransparency = 0.75
		u64.Text = s3
	elseif p19 == Enum.FriendStatus.FriendRequestSent then
		FriendStatus.Selectable = false
		u64.TextTransparency = 0.75
		u64.Text = s4
	elseif p19 == Enum.FriendStatus.FriendRequestReceived then
		u64.Text = s5
	else
		FriendStatus.Selectable = true
		u64.TextTransparency = 0
	end

	FriendStatus.LayoutOrder = n1 + 1
	FriendStatus.Parent = p18.MenuItemFrame
end
function t3.UpdateFriendButton(p21, p22, p23) -- line: 254
	if p21.MenuItemFrame:FindFirstChild("FriendStatus") then
		p21:CreateFriendButton(p22, p23)
	end
end
function t3.CreateInspectAndBuyButton(p24) -- line: 261
	-- upvalues: t1 (copy), GuiService (copy), ContextMenuUtil (copy), RobloxTranslator (copy), ThemeHandler (copy), n1 (ref)
	local v71 = ContextMenuUtil:MakeStyledButton("View", RobloxTranslator:FormatByKey("InGame.InspectMenu.Action.View"), UDim2.new(0.96, 0, 0, 52), function() --[[ browseItems ]] -- line: 262
		-- upvalues: p24 (copy), t1 (copy), GuiService (copy)
		if p24.CloseMenuFunc then
			p24:CloseMenuFunc()
		end

		if not t1[Enum.AvatarContextMenuOption.InspectMenu] then
			warn("The Inspect Menu is not currently available.")

			return
		end

		GuiService:InspectPlayerFromUserIdWithCtx(p24.SelectedPlayer.UserId, "avatarContextMenu")
	end, ThemeHandler:GetTheme())

	v71.LayoutOrder = n1 + 4
	v71.Parent = p24.MenuItemFrame
end

local function findFirstTextChannel() -- line: 287
	-- upvalues: TextChatService (copy), Players (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)

	if RBXGeneral then
		return RBXGeneral
	end

	for _, v in ipairs(TextChatService:GetDescendants()) do
		if not v:IsA("TextSource") or v.UserId ~= Players.LocalPlayer.UserId or v.CanSend ~= true then
			continue
		end

		local vParent = v.Parent

		if vParent:IsA("TextChannel") then
			return vParent
		end
	end

	return nil
end

function t3.CreateEmoteButton(p25) -- line: 321
	-- upvalues: RbxAnalyticsService (copy), Players (copy), findFirstTextChannel (copy), RobloxTranslator (copy), ContextMenuUtil (copy), ThemeHandler (copy), n1 (ref)
	local v80 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.Wave")
	local v81 = ContextMenuUtil:MakeStyledButton("Wave", v80, UDim2.new(0.96, 0, 0, 52), function() --[[ wave ]] -- line: 322
		-- upvalues: p25 (copy), RbxAnalyticsService (copy), Players (copy), findFirstTextChannel (copy)
		if p25.CloseMenuFunc then
			p25:CloseMenuFunc()
		end

		RbxAnalyticsService:ReportCounter("AvatarContextMenu-Wave")
		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(game.PlaceId))
		Players:Chat("/e wave")

		local TextChatService2 = p25.TextChatService
		local ok, _ = pcall(function() -- line: 309
			local _ = Enum.ChatVersion.LegacyChatService
		end)

		if not not ok and TextChatService2.ChatVersion == Enum.ChatVersion.TextChatService then
			local v122 = findFirstTextChannel()

			if v122 then
				v122:SendAsync("/e wave")
			end
		end
	end, ThemeHandler:GetTheme())

	v81.LayoutOrder = n1 + 5
	v81.Parent = p25.MenuItemFrame
end

local v34 = t.interface({
	localPlayerChatEnabled = t.boolean,
	localPlayerCanChatWithSelectedPlayer = t.boolean
})

function t3.CreateChatButton(p26, p27) -- line: 357
	-- upvalues: FFlagWhisperEmoteOnAvatarContextMenuWithExpChat (copy), RbxAnalyticsService (copy), findFirstTextChannel (copy), ExpChat (copy), RobloxGui (copy), LocalPlayer (ref), RobloxTranslator (copy), ContextMenuUtil (copy), ThemeHandler (copy), n1 (ref), FFlagAvatarContextMenuItemsChatButtonRefactor (copy), ArgCheck (copy), v34 (copy), Chat (copy), RunService (copy)
	local v84 = FFlagWhisperEmoteOnAvatarContextMenuWithExpChat

	if not v84 then
		local TextChatService3 = p26.TextChatService
		local ok, _ = pcall(function() -- line: 309
			local _ = Enum.ChatVersion.LegacyChatService
		end)

		if not not ok and TextChatService3.ChatVersion == Enum.ChatVersion.TextChatService then
			return
		end
	end

	local u88 = false
	local v89 = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.Chat")
	local v90, v91 = ContextMenuUtil:MakeStyledButton("ChatStatus", v89, UDim2.new(0.96, 0, 0, 52), function() --[[ chatFunc ]] -- line: 364
		-- upvalues: u88 (ref), p26 (copy), RbxAnalyticsService (copy), v84 (copy), findFirstTextChannel (copy), ExpChat (copy), RobloxGui (copy), LocalPlayer (ref)
		if u88 then
			return
		end

		if p26.CloseMenuFunc then
			p26:CloseMenuFunc()
		end

		RbxAnalyticsService:ReportCounter("AvatarContextMenu-Chat")
		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(game.PlaceId))

		if v84 then
			local TextChatService4 = p26.TextChatService
			local ok, _ = pcall(function() -- line: 309
				local _ = Enum.ChatVersion.LegacyChatService
			end)

			if not not ok and TextChatService4.ChatVersion == Enum.ChatVersion.TextChatService then
				local v127 = findFirstTextChannel()

				if v127 then
					task.spawn(function() -- line: 379
						-- upvalues: v127 (copy), p26 (copy)
						v127:SendAsync("/w @" .. p26.SelectedPlayer.Name)
					end)

					if ExpChat.Events and ExpChat.Events.AvatarContextMenuWhisperSelected then
						ExpChat.Events.AvatarContextMenuWhisperSelected()

						return
					end
				end

				return
			end
		end

		local ChatSelector = require(RobloxGui.Modules.ChatSelector)

		ChatSelector:SetVisible(true)

		if not ChatSelector:EnterWhisperState(p26.SelectedPlayer) then
			local ChatBar = nil

			pcall(function() -- line: 393
				-- upvalues: ChatBar (ref), LocalPlayer (ref)
				ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
			end)

			if ChatBar then
				ChatBar.Text = "/w " .. p26.SelectedPlayer.Name
			end

			ChatSelector:FocusChatBar()
		end
	end, ThemeHandler:GetTheme())

	v90.LayoutOrder = n1 + 3

	local localPlayerChatEnabled

	if FFlagAvatarContextMenuItemsChatButtonRefactor then
		ArgCheck.assert(v34(p27))
		localPlayerChatEnabled = p27.localPlayerChatEnabled
	else
		local ok, result = pcall(function() -- line: 419
			-- upvalues: Chat (copy), LocalPlayer (ref)
			return Chat:CanUserChatAsync(LocalPlayer.UserId)
		end)

		localPlayerChatEnabled = ok and (RunService:IsStudio() or result)
	end

	if localPlayerChatEnabled then
		v90.Parent = p26.MenuItemFrame

		if not if not FFlagAvatarContextMenuItemsChatButtonRefactor then ContextMenuUtil:GetCanChatWith(p26.SelectedPlayer) else p27.localPlayerCanChatWithSelectedPlayer then
			u88 = true
			v90.Selectable = false
			v91.TextTransparency = 0.75
			v91.Text = RobloxTranslator:FormatByKey("Corescripts.AvatarContextMenu.ChatDisabled")
		end
	else
		v90.Parent = nil
	end
end
function t3.RemoveLastButtonUnderline(p28) -- line: 446
	local children = p28.MenuItemFrame:GetChildren()
	local v97 = nil
	local n2 = -1

	for _, v in pairs(children) do
		if v:IsA("GuiObject") and n2 < v.LayoutOrder then
			n2 = v.LayoutOrder
			v97 = v
		end
	end

	if v97 then
		local Underline = v97:FindFirstChild("Underline")

		if Underline then
			Underline:Destroy()
		end
	end
end
function t3.BuildContextMenuItems(p29, p30, p31) -- line: 464
	-- upvalues: ContextMenuUtil (copy), BlockingUtility (copy), t1 (copy)
	if not p30 then
		return
	end

	local FriendStatus = ContextMenuUtil:GetFriendStatus(p30)
	local v106 = BlockingUtility:IsPlayerBlockedByUserId(p30.UserId)

	p29:ClearMenuItems()
	p29:SetSelectedPlayer(p30)

	if t1[Enum.AvatarContextMenuOption.Friend] then
		p29:CreateFriendButton(FriendStatus, v106)
	end

	if t1[Enum.AvatarContextMenuOption.Chat] then
		p29:CreateChatButton(p31)
	end

	if t1[Enum.AvatarContextMenuOption.Emote] then
		p29:CreateEmoteButton()
	end

	if t1[Enum.AvatarContextMenuOption.InspectMenu] then
		p29:CreateInspectAndBuyButton()
	end

	p29:CreateCustomMenuItems()
	p29:RemoveLastButtonUnderline()
end
function t3.SetSelectedPlayer(p32, p33) -- line: 491
	p32.SelectedPlayer = p33
end
function t3.SetCloseMenuFunc(p34, p35) -- line: 495
	p34.CloseMenuFunc = p35
end
function t3.new(p36, p37) -- line: 499
	-- upvalues: t3 (copy), TextChatService (copy)
	local v113 = setmetatable({}, t3)

	v113.MenuItemFrame = p36
	v113.SelectedPlayer = nil
	v113.TextChatService = p37 and p37.TextChatService or TextChatService
	v113:RegisterCoreMethods()
	t3:UpdateInspectMenuEnabled()

	return v113
end

GuiService.InspectMenuEnabledChangedSignal:Connect(function(p38) -- line: 513
	-- upvalues: t3 (copy)
	if not p38 then
		t3:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)

		return
	end

	t3:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
end)

return t3
