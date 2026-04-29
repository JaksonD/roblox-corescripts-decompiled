local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")

require(CorePackages.Packages.Dash)

local React = require(CorePackages.Packages.React)
local Foundation = require(CorePackages.Packages.Foundation)
local View = Foundation.View
local Tabs = Foundation.Tabs
local FillBehavior = Foundation.Enums.FillBehavior
local InputSize = Foundation.Enums.InputSize
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization

require(CorePackages.Workspace.Packages.Navigation)

local FocusNavigationUtils = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtils.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local usePageSideMargin = require(CorePackages.Workspace.Packages.CollectionViews).usePageSideMargin
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local useRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local Modules = CoreGui.RobloxGui.Modules
local PersonalizationTopBar = require(Modules.Personalization.PersonalizationTopBar)
local createHomeSubTabNavigator = require(script.Parent.createHomeSubTabNavigator)
local CompositionTags = require(CorePackages.Workspace.Packages.AppComposition).CompositionTags
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaScrollAway = SharedFlags.FFlagAppIaScrollAway
local FFlagAppIaHomeSubTabAnalytics = SharedFlags.FFlagAppIaHomeSubTabAnalytics
local FFlagAppIaStatusBar = SharedFlags.FFlagAppIaStatusBar
local FFlagLuaAppChartsStickyHeader = SharedFlags.FFlagLuaAppChartsStickyHeader
local FFlagLuaAppCompositionHome = SharedFlags.FFlagLuaAppCompositionHome
local FFlagLuaAppCompositionHomeHeaderFullBleed = SharedFlags.FFlagLuaAppCompositionHomeHeaderFullBleed
local v31 = game:DefineFastFlag("AppIaHomeSubTabFrame", false)
local v32 = createHomeSubTabNavigator()
local v33 = if not FFlagAppIaHomeSubTabAnalytics then nil else {
	[AppPage.Home] = Enum.AppShellActionType.TapHomePageTab,
	[AppPage.Games] = Enum.AppShellActionType.TapGamePageTab
}
local v34 = React.forwardRef(function(t1: {[any]: any}, p1) -- line: 69
	-- upvalues: useLocalization (copy), FFlagAppIaHomeSubTabAnalytics (copy), useRoactService (copy), AppNotificationService (copy), React (copy), v33 (copy), AppPage (copy), useDesignTokens (copy), useSelector (copy), FormFactor (copy), FillBehavior (copy), FFlagLuaAppCompositionHome (copy), usePageSideMargin (copy), FFlagAppIaStatusBar (copy), FFlagAppIaScrollAway (copy), FFlagLuaAppChartsStickyHeader (copy), v31 (copy), View (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagLuaAppCompositionHomeHeaderFullBleed (copy), CompositionTags (copy), PersonalizationTopBar (copy), Tabs (copy), InputSize (copy), v32 (copy)
	local v39 = useLocalization({
		Charts = "CommonUI.Features.Label.Charts",
		ForYou = "CommonUI.Features.Label.ForYou"
	})
	local v40 = if not FFlagAppIaHomeSubTabAnalytics then nil else useRoactService(AppNotificationService)
	local state = t1.navigation.state
	local routeName = state.routes[state.index].routeName
	local v43 = React.useCallback(function(p2) -- line: 79
		-- upvalues: FFlagAppIaHomeSubTabAnalytics (copy), routeName (copy), t1 (copy), v33 (copy), v40 (copy)
		if FFlagAppIaHomeSubTabAnalytics then
			if p2 == routeName then
				return
			end

			t1.navigation.navigate(p2)

			local v57 = v33[p2]

			if v57 then
				v40:ActionTaken(v57)

				return
			end
		else
			t1.navigation.navigate(p2)
		end
	end, {
		t1.navigation,
		if not FFlagAppIaHomeSubTabAnalytics then nil else v40
	})
	local t2 = {
		{
			id = AppPage.Home,
			text = v39.ForYou
		},
		{
			id = AppPage.Games,
			text = v39.Charts
		}
	}
	local v45 = useDesignTokens()
	local v46 = if useSelector(function(p3) -- line: 107
		return p3.FormFactor
	end) ~= FormFactor.COMPACT then FillBehavior.Fit else FillBehavior.Fill
	local v47 = nil

	if not FFlagLuaAppCompositionHome then
		v47 = usePageSideMargin()
	end

	local v48 = if not FFlagAppIaStatusBar then nil else useSelector(function(p4) -- line: 119
		return p4.TopBar.statusBarHeight
	end)
	local v49 = nil
	local u50 = nil
	local v51 = nil
	local v52 = nil
	local u53 = nil

	if FFlagAppIaScrollAway then
		local v54

		v49, v54 = React.useState(0)
		u50 = v54

		if FFlagLuaAppChartsStickyHeader then
			local v55

			v52, v55 = React.useBinding(0)
			u53 = v55
		end

		v51 = React.useCallback(function(p5) -- line: 133
			-- upvalues: u50 (ref), FFlagLuaAppChartsStickyHeader (copy), u53 (ref)
			u50(p5.AbsoluteSize.Y)

			if FFlagLuaAppChartsStickyHeader then
				u53(p5.AbsoluteSize.Y)
			end
		end, {})
	end

	return React.createElement(if not v31 then View else "Frame", {
		BackgroundColor3 = if not v31 then nil else v45.LuaApps.App.Page.BackgroundColor,
		BackgroundTransparency = if not v31 then nil else v45.LuaApps.App.Page.BackgroundTransparency,
		BorderSizePixel = if not v31 then nil else 0,
		Size = if not v31 then nil else UDim2.fromScale(1, 1),
		backgroundStyle = if v31 then nil else {
			Color3 = v45.LuaApps.App.Page.BackgroundColor,
			Transparency = v45.LuaApps.App.Page.BackgroundTransparency
		},
		tag = if v31 then nil else {
			["size-full"] = true,
			col = not FFlagAppIaScrollAway
		},
		ref = p1
	}, {
		UIListLayout = if not v31 or FFlagAppIaScrollAway then nil else React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		HeaderFocusRoot = React.createElement(FocusNavigableSurfaceWrapper, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.HeaderView,
			frameProps = {
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = if not v31 then nil else -1,
				Size = UDim2.fromScale(1, 0),
				ZIndex = 2,
				[React.Tag] = if not FFlagLuaAppCompositionHomeHeaderFullBleed then if not FFlagLuaAppCompositionHome then nil else CompositionTags.ContentRegion.Header else nil
			}
		}, {
			StatusBarBackground = if not FFlagAppIaStatusBar then nil else React.createElement(if not v31 then View else "Frame", {
				BackgroundColor3 = if not v31 then nil else v45.LuaApps.App.Page.BackgroundColor,
				BorderSizePixel = if not v31 then nil else 0,
				backgroundStyle = if v31 then nil else {
					Color3 = v45.LuaApps.App.Page.BackgroundColor,
					Transparency = 0
				},
				Size = UDim2.new(1, 0, 0, v48),
				ZIndex = 2
			}),
			Header = React.createElement(if not v31 then View else "Frame", {
				AutomaticSize = if not v31 then nil else Enum.AutomaticSize.Y,
				BackgroundColor3 = if not v31 then nil else v45.LuaApps.App.Page.BackgroundColor,
				BorderSizePixel = if not v31 then nil else 0,
				Size = if not v31 then nil else UDim2.fromScale(1, 0),
				[React.Change.AbsoluteSize] = if not v31 or not FFlagAppIaScrollAway then nil else v51,
				[React.Tag] = if not v31 or (not FFlagLuaAppCompositionHomeHeaderFullBleed or not FFlagLuaAppCompositionHome) then nil else CompositionTags.ContentRegion.Header,
				tag = if v31 then nil else (not FFlagLuaAppCompositionHomeHeaderFullBleed or not FFlagLuaAppCompositionHome) and "col size-full-0 auto-y" or `col size-full-0 auto-y { CompositionTags.ContentRegion.Header }`,
				backgroundStyle = if v31 then nil else {
					Color3 = v45.LuaApps.App.Page.BackgroundColor,
					Transparency = 0
				},
				onAbsoluteSizeChanged = if v31 or not FFlagAppIaScrollAway then nil else v51
			}, {
				UIListLayout = if not v31 then nil else React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AppHeaderBar = React.createElement(if not v31 then View else "Frame", {
					AutomaticSize = if not v31 then nil else Enum.AutomaticSize.Y,
					BackgroundTransparency = if not v31 then nil else 1,
					Size = if not v31 then nil else UDim2.fromScale(1, 0),
					tag = if v31 then nil else "size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					PersonalizationTopBar = React.createElement(PersonalizationTopBar, {
						sideMarginOverride = if not FFlagLuaAppCompositionHome then nil else 0
					})
				}),
				SubTabs = React.createElement(if not v31 then View else "Frame", {
					AutomaticSize = if not v31 then nil else Enum.AutomaticSize.Y,
					BackgroundTransparency = if not v31 then nil else 1,
					Size = if not v31 then nil else UDim2.fromScale(1, 0),
					tag = if v31 then nil else "size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					UIPadding = if FFlagLuaAppCompositionHome then nil else React.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, v47),
						PaddingRight = UDim.new(0, v47)
					}),
					Tabs = React.createElement(Tabs, {
						activeTabId = routeName,
						onActivated = v43,
						tabs = t2,
						size = InputSize.Medium,
						fillBehavior = v46
					})
				})
			})
		}),
		HomeSubTabNavigator = React.createElement(v32, {
			navigation = t1.navigation,
			screenProps = if not FFlagAppIaScrollAway then nil else {
				headerHeight = v49,
				headerHeightBinding = if not FFlagLuaAppChartsStickyHeader then nil else v52
			}
		})
	})
end)

v34.router = v32.router

return v34
