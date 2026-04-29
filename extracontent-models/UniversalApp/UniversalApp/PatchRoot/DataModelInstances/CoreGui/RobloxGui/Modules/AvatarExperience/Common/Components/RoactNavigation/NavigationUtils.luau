local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Actions = require(CorePackages.Packages.RoactNavigation).Actions
local Cryo = require(CorePackages.Packages.Cryo)

require(CorePackages.Packages.Dash)

local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local Modules = CoreGui.RobloxGui.Modules
local v7 = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.navutils")
local AvatarExperienceActions = require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions)

require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)

local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen

require(Modules.AvatarExperience.Catalog.SearchTypes)

local FFlagAXEnableExpiredUserLookCheckout = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXEnableExpiredUserLookCheckout
local t1 = {
	instantTransitionConfig = function() --[[ instantTransitionConfig ]] -- line: 29
		return {
			transitionSpec = {
				frequency = 100000,
				dampingRatio = 1
			}
		}
	end
}

function t1.navigateToSearch(p1, s1: string, p2) -- line: 38
	-- upvalues: t1 (copy), AvatarScreen (copy), AvatarExperienceActions (copy), Actions (copy)
	t1.closeFiltersAndItemDetails(p1)
	t1.closeTryOnManager(p1)

	local t2 = {
		AvatarScreen.CatalogSearch,
		AvatarScreen.CatalogSearchLanding
	}

	p1.dispatch(AvatarExperienceActions.clearScreens(t2))
	p1.dispatch(Actions.navigate({
		routeName = AvatarScreen.CatalogSearch,
		params = {
			detail = s1,
			searchParams = p2
		},
		key = tostring(s1)
	}))
end
function t1.isWithinViewContext(p3, s2: string) -- line: 65
	-- upvalues: Cryo (copy), Logging (copy)
	if p3 and (p3.previousPages and #s2 > 0) then
		local previousPages = p3.previousPages

		return #Cryo.List.filter(previousPages, function(p4) -- line: 68
			-- upvalues: s2 (copy)
			return p4.name == s2
		end) > 0
	end

	Logging.warn("NavigationUtils.isWithinViewContext() failed because you forget to provide a valid avatarRoute")

	return false
end
function t1.isFirstItemDetailsPage(p5) -- line: 84
	return p5 and p5.getParam("isFirstItemDetails")
end
function t1.closeFocusedScreen(p6) -- line: 96
	-- upvalues: Actions (copy)
	p6.dispatch(Actions.back(nil))
end
function t1.closeFiltersAndItemDetails(p7) -- line: 108
	-- upvalues: AvatarScreen (copy), FFlagAXEnableExpiredUserLookCheckout (copy), AvatarExperienceActions (copy)
	local t3 = {
		AvatarScreen.ItemDetails,
		AvatarScreen.SortAndFilters,
		AvatarScreen.OutfitDetails,
		AvatarScreen.LookDetails
	}

	if FFlagAXEnableExpiredUserLookCheckout then
		table.insert(t3, AvatarScreen.ExpiredUserLookActionBar)
	end

	p7.dispatch(AvatarExperienceActions.clearScreens(t3))
end
function t1.closeExpiredUserLookActionBar(p8) -- line: 129
	-- upvalues: AvatarExperienceActions (copy), AvatarScreen (copy)
	p8.dispatch(AvatarExperienceActions.clearScreens({ AvatarScreen.ExpiredUserLookActionBar }))
end
function t1.closeMySharedAvatars(p9) -- line: 135
	-- upvalues: AvatarScreen (copy), AvatarExperienceActions (copy)
	local t4 = {
		AvatarScreen.MySharedAvatars,
		AvatarScreen.LookDetails
	}

	p9.dispatch(AvatarExperienceActions.clearScreens(t4))
end
function t1.closeLookComposer(p10) -- line: 144
	-- upvalues: AvatarScreen (copy), AvatarExperienceActions (copy)
	local t5 = {
		AvatarScreen.LookComposerPage,
		AvatarScreen.LookDetails
	}

	p10.dispatch(AvatarExperienceActions.clearScreens(t5))
end
function t1.closeSearchLandingPageFocusedWidget(p11) -- line: 153
	-- upvalues: AvatarScreen (copy), AvatarExperienceActions (copy)
	local t6 = { AvatarScreen.SearchLandingFocusedWidgetPage }

	p11.dispatch(AvatarExperienceActions.clearScreens(t6))
end
function t1.closeSearchLandingPage(p12) -- line: 160
	-- upvalues: AvatarScreen (copy), AvatarExperienceActions (copy)
	local t7 = { AvatarScreen.CatalogSearchLanding }

	p12.dispatch(AvatarExperienceActions.clearScreens(t7))
end
function t1.closeTryOnManager(p13, t8: {[any]: any}?) -- line: 171
	-- upvalues: AvatarScreen (copy), AvatarExperienceActions (copy)
	local t9 = {
		AvatarScreen.TryOnManager,
		AvatarScreen.LookDetails
	}

	if t8 then
		t9 = t8
	end

	p13.dispatch(AvatarExperienceActions.clearScreens(t9))
end
function t1.getRootNavigation(p14) -- line: 187
	local v37 = p14

	while v37 do
		p14 = v37
		v37 = p14._dangerouslyGetParent and p14._dangerouslyGetParent() or nil
	end

	return p14
end
function t1.closeAllDialogs(p15) -- line: 196
	-- upvalues: AvatarScreen (copy)
	p15.navigate(AvatarScreen.AvatarExperienceMainStackNavigator)
end

local function v12() -- line: 200
end

function t1.removeOnOverlayClosed(p16) -- line: 219
	-- upvalues: v12 (copy), v7 (copy)
	local onOverlayClosed = (p16.state.params or {}).onOverlayClosed

	if onOverlayClosed then
		p16.setParams({
			onOverlayClosed = v12
		})
	end

	if v7.active[v7.Levels.Debug] then
		v7:debug("removeOnOverlayClosed, routeName={}", p16 and (not not p16.state and p16.state.routeName) or "<UnknownRoute>")
	end

	return onOverlayClosed
end
function t1.invokeOnOverlayClosed(p17) -- line: 233
	-- upvalues: v7 (copy), v12 (copy)
	local v44 = p17.getParam("onOverlayClosed")

	if v7.active[v7.Levels.Debug] then
		v7:debug("invokeOnOverlayClosed, routeName={}, onOverlayClosed={}", p17 and (not not p17.state and p17.state.routeName) or "<UnknownRoute>", if v44 ~= v12 then v44 ~= nil and "callback" or "nil" else "no-op")
	end

	if v44 then
		v44()
	end
end
function t1.closeOverlay(p18) -- line: 258
	-- upvalues: t1 (copy)
	t1.invokeOnOverlayClosed(p18)
	p18.goBack()
end
function t1.navigateFromOverlay(p19, ...) -- line: 273
	-- upvalues: t1 (copy)
	t1.invokeOnOverlayClosed(p19)
	p19.navigate(...)
end
function t1.navigateToNextOverlay(p20, s3: string, p21, ...) -- line: 286
	-- upvalues: t1 (copy), v7 (copy), v12 (copy), Cryo (copy)
	local v50 = t1.removeOnOverlayClosed(p20)

	if v7.active[v7.Levels.Debug] then
		v7:debug("navigateToNextOverlay {} -> {}, onOverlayClosed={}", p20 and (not not p20.state and p20.state.routeName) or "<UnknownRoute>", s3, if v50 ~= v12 then v50 ~= nil and "callback" or "nil" else "no-op")
	end

	local v51 = Cryo.Dictionary.join(p21 or {}, {
		onOverlayClosed = v50
	})

	p20.replace(s3, v51, ...)
end
function t1.getActiveScreenNavigationState(p22) -- line: 303
	while p22.routes do
		p22 = p22.routes[p22.index]
	end

	return p22
end

return t1
