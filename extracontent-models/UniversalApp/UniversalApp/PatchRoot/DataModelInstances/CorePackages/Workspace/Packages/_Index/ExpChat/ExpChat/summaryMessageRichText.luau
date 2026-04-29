local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatParent = ExpChat.Parent
local Foundation = require(ExpChatParent.Foundation)
local UIBlox = require(ExpChatParent.UIBlox)
local Config = require(ExpChat.Config)
local FStringExpChatSummaryPrefixText = require(ExpChat.Flags.FStringExpChatSummaryPrefixText)
local FFlagExpChatPolishSummaryMessageUI = require(ExpChat.Flags.FFlagExpChatPolishSummaryMessageUI)

return {
	getSummaryIconPrefix = function(n1: number?) --[[ getSummaryIconPrefix ]] -- line: 35
		-- upvalues: FFlagExpChatPolishSummaryMessageUI (copy), TextChatService (copy), Config (copy), Foundation (copy), FStringExpChatSummaryPrefixText (copy)
		if FFlagExpChatPolishSummaryMessageUI then
			local v14

			if n1 then
				v14 = math.max(0, n1 - 2)
			else
				local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

				v14 = if not ChatWindowConfiguration then math.max(0, Config.ChatWindowTextSize - 2) else math.max(0, ChatWindowConfiguration.TextSize - 2)
			end

			local v16 = math.ceil(v14 * 3 / 4)

			if v16 % 2 == 1 then
				v16 += 1
			end

			return `<font weight='600' size="{ math.max(0, v16) }" family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{ Foundation.Enums.IconName.Nebula }</font>{ FStringExpChatSummaryPrefixText }`
		end

		return `<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>{ Foundation.Enums.IconName.Nebula }</font>{ FStringExpChatSummaryPrefixText }`
	end,
	wrapInSummaryMutedStyle = function(s1: string, s2: string?, n2: number?) --[[ wrapInSummaryMutedStyle ]] -- line: 46
		-- upvalues: FFlagExpChatPolishSummaryMessageUI (copy), UIBlox (copy), TextChatService (copy), Config (copy)
		if FFlagExpChatPolishSummaryMessageUI then
			local v20 = UIBlox.App.Style.Colors.LightGrey:ToHex()
			local v21

			if n2 then
				v21 = math.max(0, n2 - 2)
			else
				local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")

				v21 = if not ChatWindowConfiguration then math.max(0, Config.ChatWindowTextSize - 2) else math.max(0, ChatWindowConfiguration.TextSize - 2)
			end

			return `<font color='#{ v20 }' weight='600' size="{ v21 }">{ s1 }</font>`
		end

		return `<font color='#{ s2 or "BCBEC8" }' size="{ Config.ChatWindowTextSize - 2 }">{ s1 }</font>`
	end
}
