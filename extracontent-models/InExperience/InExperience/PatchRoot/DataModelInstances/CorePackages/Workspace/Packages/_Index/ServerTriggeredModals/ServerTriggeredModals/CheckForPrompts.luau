local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local ServerTriggeredModalsParent = ServerTriggeredModals.Parent
local React = require(ServerTriggeredModalsParent.React)
local RobloxAppEnums = require(ServerTriggeredModalsParent.RobloxAppEnums)
local CentralOverlay = require(ServerTriggeredModalsParent.CentralOverlay)
local useSignalState = require(ServerTriggeredModalsParent.SignalsReact).useSignalState
local useDispatch = require(ServerTriggeredModalsParent.RoactUtils).Hooks.RoactRodux.useDispatch
local RoactNavigation = require(ServerTriggeredModalsParent.RoactNavigation)
local SharedFlags = require(ServerTriggeredModalsParent.SharedFlags)
local SduiSharedUtilities = require(ServerTriggeredModalsParent.SduiSharedUtilities)
local AppPage = RobloxAppEnums.AppPage
local CentralOverlayType = RobloxAppEnums.CentralOverlayType
local SetCentralOverlay = CentralOverlay.Actions.SetCentralOverlay
local SduiLoadTimer = SduiSharedUtilities.SduiLoadTimer
local getSduiApiStore = SduiSharedUtilities.getSduiApiStore
local useModalSignalStore = require(ServerTriggeredModals.SignalStores.useModalSignalStore)
local EntryPoint = require(ServerTriggeredModals.EntryPoint)
local fetchPrompts = require(ServerTriggeredModals.SduiV2.fetchPrompts)
local PromptsEntryPoint = require(ServerTriggeredModals.SduiV2.PromptsEntryPoint)
local FFlagSduiAllowNoConfigsBuilt = SharedFlags.FFlagSduiAllowNoConfigsBuilt
local v21 = RoactNavigation.withNavigationFocus(function(t1: {[any]: any}) --[[ CheckForPrompts ]] -- line: 32
	-- upvalues: useDispatch (copy), useModalSignalStore (copy), useSignalState (copy), EntryPoint (copy), React (copy), PromptsEntryPoint (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy), fetchPrompts (copy), getSduiApiStore (copy), SetCentralOverlay (copy), CentralOverlayType (copy), AppPage (copy)
	local v23 = useDispatch()
	local v24 = useModalSignalStore()
	local v25 = useSignalState(v24.getMetadataGetter(EntryPoint.HomepageLaunch))
	local v26 = useSignalState(v24.getHasShownGetter(EntryPoint.HomepageLaunch))
	local isFocused = t1.isFocused
	local v28 = React.useMemo(function() -- line: 39
		-- upvalues: PromptsEntryPoint (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiLoadTimer (copy)
		return {
			entryPoint = PromptsEntryPoint.HomepageLaunch,
			surfaceKey = "HomepagePrompts",
			configKey = "HomepagePrompts",
			clearOnEmptyResponse = true,
			allowNoConfigsBuilt = not not FFlagSduiAllowNoConfigsBuilt or nil,
			loadTimer = SduiLoadTimer.createLoadTimer("HomepagePrompts")
		}
	end, {})

	React.useEffect(function() -- line: 50
		-- upvalues: fetchPrompts (copy), v28 (copy)
		fetchPrompts(v28)
	end, { v28 })

	local v29 = React.useCallback(function(p1) -- line: 55
		-- upvalues: getSduiApiStore (copy)
		local v32 = getSduiApiStore().getData("HomepagePrompts").data(p1)

		return v32 and v32.HomepagePrompts
	end, {})
	local v30 = useSignalState(v29)

	React.useEffect(function() -- line: 62
		-- upvalues: v26 (copy), v25 (copy), isFocused (copy), v30 (copy), v24 (copy), EntryPoint (copy), v23 (copy), SetCentralOverlay (copy), CentralOverlayType (copy), AppPage (copy)
		if v26 then
			return
		end

		if v25 then
			return
		end

		if not isFocused then
			return
		end

		if not v30 then
			return
		end

		v24.setHasShown(EntryPoint.HomepageLaunch, true)
		v23(SetCentralOverlay(CentralOverlayType.SduiPromptModal, {
			configKey = "HomepagePrompts",
			appPage = AppPage.Home,
			modalId = v30.identifier,
			modalType = v30.robloxComponentType
		}))
	end, {
		v26,
		v25,
		isFocused,
		v23,
		v24,
		v30
	})

	return nil
end)

return React.memo(v21)
