local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local Cryo = require(CorePackages.Packages.Cryo)
local VerifiedBadges = require(CorePackages.Workspace.Packages.VerifiedBadges)
local UserLib = require(CorePackages.Workspace.Packages.UserLib)

require(AbuseReportMenu.Components.Types)

local Constants = require(AbuseReportMenu.Components.Constants)
local InExperienceCapabilities = require(CorePackages.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local FFlagInGameMenuAddChatLineReporting = require(CorePackages.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting

return {
	componentType = "modalSelector",
	getIsVisible = function(_) --[[ getIsVisible ]] -- line: 16
		return true
	end,
	getMenuItems = function(p2) --[[ getMenuItems ]] -- line: 19
		-- upvalues: Cryo (copy), UserLib (copy), VerifiedBadges (copy), InExperienceCapabilities (copy)
		return (Cryo.List.map(p2.playerObjects, function(p3) -- line: 20
			-- upvalues: UserLib (copy), VerifiedBadges (copy), InExperienceCapabilities (copy)
			local v24 = not UserLib.Utils.isPlayerVerified(p3) and "" or VerifiedBadges.emoji.verified

			return {
				label = p3.DisplayName .. v24,
				subLabel = if not InExperienceCapabilities.canDisplayPeoplesUsernames then nil else "[@" .. p3.Name .. "]",
				identifier = p3.Name
			}
		end))
	end,
	getSelectedValue = function(p4) --[[ getSelectedValue ]] -- line: 34
		-- upvalues: InExperienceCapabilities (copy)
		local allegedAbuser = p4.allegedAbuser

		if allegedAbuser then
			local DisplayName = allegedAbuser.DisplayName
			local allegedAbuserName = allegedAbuser.Name

			return DisplayName .. (not InExperienceCapabilities.canDisplayPeoplesUsernames and "" or "[@" .. allegedAbuserName .. "]")
		end

		return nil
	end,
	onUpdateSelectedOption = function(p5, p6, p7, p8) --[[ onUpdateSelectedOption ]] -- line: 45
		-- upvalues: Constants (copy), FFlagInGameMenuAddChatLineReporting (copy)
		if p5.identifier then
			local identifier = p5.identifier

			for _, v21 in p6.playerObjects do
				if identifier == v21.Name then
					local UserId = v21.UserId

					p8.analyticsDispatch({
						type = Constants.AnalyticsActions.IncrementPersonChanged
					})
					p7({
						type = Constants.PlayerMenuActions.UpdateAbuser,
						abuseId = UserId,
						abuser = v21
					})

					if FFlagInGameMenuAddChatLineReporting then
						p7({
							type = Constants.PlayerMenuActions.UpdatedSelectedChatAndOrderedMessages,
							orderedMessages = {},
							selectedMessage = nil
						})
					end
				end
			end
		end
	end,
	fieldLabel = "WhichPerson",
	componentName = "PlayerSelector"
}
