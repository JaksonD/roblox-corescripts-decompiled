return function(s1: string?) --[[ shouldSuppressUnreadForTabMetadata ]] -- line: 8
	if s1 == nil or s1 == "" then
		return false
	end

	return string.sub(s1, 1, 18) == "Roblox.ChatEnabled" or string.sub(s1, 1, 14) == "Roblox.Welcome"
end
