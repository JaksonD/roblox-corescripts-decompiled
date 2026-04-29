local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local createItemSelectionStore = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local v5 = React.createContext(nil)

return {
	Provider = function(t1: {[any]: any}) --[[ ItemSelectionStoreProvider ]] -- line: 20
		-- upvalues: React (copy), createItemSelectionStore (copy), v5 (copy)
		local v7 = React.useMemo(function() -- line: 22
			-- upvalues: createItemSelectionStore (copy)
			return createItemSelectionStore()
		end, {})

		return React.createElement(v5.Provider, {
			value = v7
		}, t1.children)
	end,
	useItemSelectionStore = function() --[[ useItemSelectionStore ]] -- line: 29
		-- upvalues: React (copy), v5 (copy)
		local v8 = React.useContext(v5)

		if not v8 then
			error("useItemSelectionStore must be used within an ItemSelectionStoreProvider")
		end

		return v8
	end
}
