local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local useSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return function() --[[ useDispatchPendingCatalogDeepLink ]] -- line: 28
	-- upvalues: useDispatch (copy), GetCatalogCategoriesStore (copy), useSignalState (copy), React (copy)
	local v7 = useDispatch()
	local v8 = GetCatalogCategoriesStore.getCatalogCategoriesStore()
	local v9 = useSignalState(v8.getHasFetchedCategories)
	local v10 = React.useRef(false)

	React.useEffect(function() -- line: 34
		-- upvalues: v8 (copy), v9 (copy), v10 (copy), v7 (copy)
		local getPendingDeepLinkAction = v8.getPendingDeepLinkAction
		local clearPendingDeepLinkAction = v8.clearPendingDeepLinkAction

		if not getPendingDeepLinkAction or not clearPendingDeepLinkAction then
			return
		end

		if v9 and not v10.current then
			local v13 = getPendingDeepLinkAction(false)

			if v13 then
				v10.current = true
				v7(v13)
				clearPendingDeepLinkAction()
			end
		end
	end, {
		v9,
		v8,
		v7
	})
end
