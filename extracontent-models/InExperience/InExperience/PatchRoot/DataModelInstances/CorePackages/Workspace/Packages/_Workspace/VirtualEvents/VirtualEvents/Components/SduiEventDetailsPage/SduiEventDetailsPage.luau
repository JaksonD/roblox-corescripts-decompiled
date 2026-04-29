local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local IXPService = game:GetService("IXPService")
local fetchEventDetailsPage = require(script.Parent.fetchEventDetailsPage)
local getEventDetailsPageKey = require(script.Parent.getEventDetailsPageKey)

require(Parent.Navigation)

local Foundation = require(Parent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local React = require(Parent.React)
local useNavigation = require(Parent.Navigation).useNavigation
local useRouteName = require(Parent.Navigation).useRouteName
local useNavigationFocus = require(Parent.Navigation).useNavigationFocus
local SduiSharedUtilities = require(Parent.SduiSharedUtilities)
local SduiPageEntryPoint = SduiSharedUtilities.SduiPageEntryPoint
local SduiLoadTimer = SduiSharedUtilities.SduiLoadTimer
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagLuaAppSduiEventDetailsLogExposure = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure
local FStringLuaAppSduiEventDetailsIxpLayer = require(Parent.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer
local FFlagSduiPageEntryUseSharedHooks = require(Parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks

return React.memo(function(t1: {[any]: any}) --[[ SduiEventDetailsPage ]] -- line: 49
	-- upvalues: useTokens (copy), getEventDetailsPageKey (copy), React (copy), SduiLoadTimer (copy), AppPage (copy), useNavigation (copy), useRouteName (copy), useNavigationFocus (copy), fetchEventDetailsPage (copy), FFlagLuaAppSduiEventDetailsLogExposure (copy), IXPService (copy), FStringLuaAppSduiEventDetailsIxpLayer (copy), Foundation (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy)
	local v24 = useTokens()
	local v25 = t1.navigation and t1.navigation.getParam("extraProps")
	local v26 = t1.eventId or v25 and v25.eventId or t1.navigation and t1.navigation.getParam("detail")
	local v27 = getEventDetailsPageKey(v26)
	local v28 = React.useMemo(function() -- line: 57
		-- upvalues: t1 (copy), SduiLoadTimer (copy), AppPage (copy)
		local v34 = t1
		local v35 = v34.navigation and v34.navigation.getParam("extraProps")

		return v34.pageTimer or v35 and v35.pageTimer or SduiLoadTimer.createLoadTimer(AppPage.EventDetails)
	end, {})
	local v29 = useNavigation()
	local v30 = useRouteName()
	local v31 = useNavigationFocus()
	local v32 = React.useCallback(function() -- line: 65
		-- upvalues: v30 (copy), AppPage (copy), v31 (copy), v29 (copy)
		if v30 == AppPage.EventDetails and v31 then
			v29.goBack()
		end
	end, {
		v29,
		v30,
		v31
	})

	React.useEffect(function() -- line: 71
		-- upvalues: v26 (copy), fetchEventDetailsPage (copy), v28 (copy)
		if v26 then
			fetchEventDetailsPage(v26, v28)
		end
	end, {
		v26,
		v28
	})
	React.useEffect(function() -- line: 77
		-- upvalues: v26 (copy), FFlagLuaAppSduiEventDetailsLogExposure (copy), IXPService (copy), FStringLuaAppSduiEventDetailsIxpLayer (copy)
		if v26 and FFlagLuaAppSduiEventDetailsLogExposure then
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppSduiEventDetailsIxpLayer)
		end
	end, { v26 })

	local v33 = React.useRef(nil)

	if v26 == nil then
		return nil
	end

	return React.createElement(Foundation.Sheet.Root, {
		isOpen = v31,
		snapPoints = { 1 },
		displaySize = Foundation.Enums.DialogSize.Large,
		onClose = v32
	}, {
		Header = React.createElement(Foundation.Sheet.Header, {
			hasCloseAffordance = true
		}),
		Content = React.createElement(Foundation.Sheet.Content, {
			scrollingFrameRef = v33
		}, React.createElement(SduiPageEntryPoint, {
			appPage = AppPage.EventDetails,
			configKey = v27,
			identifier = if not FFlagSduiPageEntryUseSharedHooks then v27 .. "_" .. "event_details_feed" else "event_details_feed",
			pageTimer = v28,
			includeNavigationHeaderBar = false,
			backgroundStyle = v24.Color.None,
			disableRootPadding = true,
			scrollingFrameRef = v33
		})),
		Actions = React.createElement(Foundation.Sheet.Actions, nil, React.createElement(SduiPageEntryPoint, {
			appPage = AppPage.EventDetails,
			configKey = v27,
			identifier = if not FFlagSduiPageEntryUseSharedHooks then v27 .. "_" .. "event_details_action_bar" else "event_details_action_bar",
			pageTimer = v28,
			includeNavigationHeaderBar = false,
			backgroundStyle = v24.Color.None,
			disableRootPadding = true,
			scrollingFrameRef = v33
		}))
	})
end)
