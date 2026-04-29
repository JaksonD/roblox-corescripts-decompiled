local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("PlayWithRewardState").Parent
local mutedError = require(Parent.Loggers).mutedError
local t = require(Parent.t)
local v5 = t.interface({
	titleText = t.string,
	subtitleText = t.string,
	buttonText = t.string,
	coachmarkTitleText = t.string,
	coachmarkSubtitleText = t.string,
	showButton = t.boolean
})
local t1 = {}
local t2 = {
	titleText = "",
	subtitleText = "",
	buttonText = "",
	coachmarkTitleText = "",
	coachmarkSubtitleText = "",
	showButton = false
}

function t1.fromJsonData(s1: string) -- line: 36
	-- upvalues: t2 (copy), HttpService (copy), v5 (copy), mutedError (copy)
	local v9 = table.clone(t2)
	local ok, result = pcall(function() -- line: 39
		-- upvalues: HttpService (copy), s1 (copy)
		return HttpService:JSONDecode(s1)
	end)

	if ok then
		local v12, v13 = v5(result)

		if not v12 then
			mutedError(`PlayWithRewardExperimentData invalid: { tostring(v13) }`)

			return v9
		end

		v9.titleText = result.titleText
		v9.subtitleText = result.subtitleText
		v9.buttonText = result.buttonText
		v9.coachmarkTitleText = result.coachmarkTitleText
		v9.coachmarkSubtitleText = result.coachmarkSubtitleText
		v9.showButton = result.showButton
	end

	return v9
end

return t1
