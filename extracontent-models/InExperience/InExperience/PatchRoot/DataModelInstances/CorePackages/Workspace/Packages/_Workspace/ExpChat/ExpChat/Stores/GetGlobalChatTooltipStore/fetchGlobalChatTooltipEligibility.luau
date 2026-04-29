local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local UrlBuilder = require(Parent.UrlBuilder)
local UrlBuilder2 = UrlBuilder.UrlBuilder
local UrlBase = UrlBuilder.UrlBase
local v6 = require(Parent.ExpChatShared).Logger:new("ExpChat/" .. script.Name)
local v7 = UrlBuilder2.new({
	base = UrlBase.APIS,
	path = "modals-api/v1/prompts",
	query = {
		entryPoint = "InExperienceChatWindowOpen",
		promptStyle = "Modal"
	}
})()
local v8 = UrlBuilder2.new({
	base = UrlBase.APIS,
	path = "modals-api/v1/prompts/impression"
})()
local u9 = nil

return {
	fetchEligibility = function(p1: ((...any) -> ...any)?, p2: ((...any) -> ...any)?) --[[ fetchGlobalChatTooltipEligibility ]] -- line: 66
		-- upvalues: u9 (ref), HttpService (copy), v7 (copy), v6 (copy)
		if u9 ~= nil then
			if p1 then
				p1({
					shouldShowTooltip = u9
				})
			end

			return
		end

		HttpService:RequestInternal({
			Url = v7,
			Method = "GET",
			Headers = {
				Accept = "application/json"
			}
		}):Start(function(_, p4) -- line: 82
			-- upvalues: HttpService (copy), u9 (ref), p1 (copy), v6 (copy), p2 (copy)
			if p4.StatusCode == 200 then
				local ok, result = pcall(function() -- line: 84
					-- upvalues: HttpService (copy), p4 (copy)
					return HttpService:JSONDecode(p4.Body)
				end)

				if ok and result then
					local customPrompts = result.customPrompts
					local v20 = customPrompts ~= nil and (type(customPrompts) == "table" and customPrompts.GlobalChatTooltip ~= nil)

					u9 = v20

					if p1 then
						p1({
							shouldShowTooltip = v20
						})

						return
					end
				else
					u9 = false
					v6:error("Failed to decode GlobalChatTooltip eligibility response")

					if p2 then
						p2()

						return
					end
				end
			else
				u9 = false
				v6:error("GlobalChatTooltip eligibility request failed: {} {}", tostring(p4.StatusCode), p4.StatusMessage or "")

				if p2 then
					p2()
				end
			end
		end)
	end,
	reportImpression = function() --[[ reportImpression ]] -- line: 34
		-- upvalues: HttpService (copy), v8 (copy), v6 (copy)
		local json = HttpService:JSONEncode({
			promptType = "GlobalChatTooltip",
			promptId = "GlobalChatTooltip"
		})

		HttpService:RequestInternal({
			Url = v8,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = json
		}):Start(function(_, p6) -- line: 49
			-- upvalues: v6 (copy)
			if p6.StatusCode == 200 then
				v6:debug("GlobalChatTooltip impression reported")

				return
			end

			v6:error("GlobalChatTooltip impression failed: {} {}", tostring(p6.StatusCode), p6.StatusMessage or "")
		end)
	end
}
