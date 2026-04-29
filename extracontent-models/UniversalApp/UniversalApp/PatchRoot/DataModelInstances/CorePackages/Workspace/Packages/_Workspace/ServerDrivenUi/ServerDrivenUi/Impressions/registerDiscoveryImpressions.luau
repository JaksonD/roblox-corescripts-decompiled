local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local ServerDrivenUiParent = ServerDrivenUi.Parent
local SduiCoreSystem = require(ServerDrivenUiParent.SduiCoreSystem)
local SduiImpressionEventType = SduiCoreSystem.SduiImpressionEventType
local getSduiImpressionHandlerRegistry = SduiCoreSystem.getSduiImpressionHandlerRegistry
local FFlagSduiExperienceDetailsSupport = require(ServerDrivenUiParent.SharedFlags).FFlagSduiExperienceDetailsSupport

return function() --[[ registerDiscoveryImpressions ]] -- line: 13
	-- upvalues: SduiImpressionEventType (copy), ServerDrivenUi (copy), FFlagSduiExperienceDetailsSupport (copy), getSduiImpressionHandlerRegistry (copy)
	local t1 = {
		[SduiImpressionEventType.gameImpressions] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 16
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Impressions.SduiGameImpressionsHandler)
			end,
			skipItemImpressionsLog = false
		},
		[SduiImpressionEventType.socialLinksImpressions] = if not FFlagSduiExperienceDetailsSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 23
				-- upvalues: ServerDrivenUi (copy)
				return require(ServerDrivenUi.Impressions.SduiSocialLinksImpressionsHandler)
			end,
			skipItemImpressionsLog = false
		}
	}

	getSduiImpressionHandlerRegistry().registerImpressionHandlerConfigs(t1)
end
