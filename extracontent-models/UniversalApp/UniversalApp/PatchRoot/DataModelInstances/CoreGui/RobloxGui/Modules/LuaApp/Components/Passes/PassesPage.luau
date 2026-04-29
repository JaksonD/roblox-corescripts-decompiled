local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local ApiFetchGamePasses = require(Modules.LuaApp.Thunks.Games.ApiFetchGamePasses)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local t = require(CorePackages.Packages.t)
local withLocalization = require(Modules.LuaApp.withLocalization)
local Cryo = require(CorePackages.Packages.Cryo)
local AppNavBar = require(CorePackages.Workspace.Packages.AppNavBar)
local EdpStoreAnalytics = require(CorePackages.Workspace.Packages.EdpStoreAnalytics)
local Constants = EdpStoreAnalytics.Constants
local EdpStoreImpressionsDetector = EdpStoreAnalytics.EdpStoreImpressionsDetector
local UIBlox = require(CorePackages.Packages.UIBlox)
local withStyle = UIBlox.Style.withStyle
local useTextSizeOffset = UIBlox.Core.Style.useTextSizeOffset
local AppCommonLib = require(CorePackages.Workspace.Packages.AppCommonLib)
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local GetFFlagEnableEdpStoreClickLogging = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging)
local GetFFlagEnableEdpStoreGridPositionLogging = require(Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)
local ApiFetchPassesThumbnails = require(Modules.LuaApp.Thunks.ApiFetchPassesThumbnails)
local ApiFetchGameDeveloperProducts = require(Modules.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts)
local TopBar = require(Modules.LuaApp.Components.TopBar.TopBar)
local PassesGrid = require(Modules.LuaApp.Components.Passes.PassesGrid)
local SubscriptionsGrid = require(Modules.LuaApp.Components.Subscription.SubscriptionsGrid)
local DeveloperProductsGrid = require(Modules.LuaApp.Components.DeveloperProduct.DeveloperProductsGrid)
local VerifiedBadges = require(CorePackages.Workspace.Packages.VerifiedBadges)
local GetFFlagEnableDevSubsInRobux = require(Modules.LuaApp.Flags.GetFFlagEnableDevSubsInRobux)
local FFlagAppIaScrollAway = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway
local v31 = Roact.PureComponent:extend("PassesPage")

v31.validateProps = t.strictInterface({
	universeId = t.string,
	viewWidth = if not GetFFlagEnableEdpStoreGridPositionLogging() then nil else t.optional(t.number),
	networking = t.callback,
	passes = t.optional(t.table),
	showSubscriptionProducts = t.optional(t.boolean),
	developerProducts = t.optional(t.table),
	rootPlaceId = t.optional(t.string),
	localUserId = t.optional(t.string),
	creatorName = t.optional(t.string),
	creatorVerified = t.optional(t.boolean),
	topBarHeight = if not FFlagAppIaScrollAway then nil else t.number,
	requestPassesThumbnails = t.callback,
	fetchGamePasses = t.callback,
	fetchGameDeveloperProducts = t.callback,
	textSizeOffset = t.number
})

function v31.init(p1) -- line: 72
	-- upvalues: Roact (copy), AppCommonLib (copy)
	p1.gamePassRef = Roact.createRef()
	p1.developerProductsRef = Roact.createRef()
	p1.subscriptionsRef = Roact.createRef()
	p1.storeContainerRef = Roact.createRef()
	p1.scrollViewPositionChangedSignal = Roact.createRef()
	p1.scrollViewPositionChangedSignal.current = AppCommonLib.Signal.new()

	function p1.scrollViewPositionChangedSignalCallback(_) -- line: 81
		-- upvalues: p1 (copy)
		p1.scrollViewPositionChangedSignal.current:fire()
	end
	function p1.fetchPassesThumbnails(p3, p4) -- line: 85
		-- upvalues: p1 (copy)
		if p3 then
			local t1 = {}

			for _, v in ipairs(p3) do
				table.insert(t1, v.id)
			end

			p1.props.requestPassesThumbnails(p4, t1)
		end
	end
	function p1.fetchGameDeveloperProducts(p5, p6, p7, p8) -- line: 96
		-- upvalues: p1 (copy)
		p1.props.fetchGameDeveloperProducts(p5, p6, p7, p8)
	end
end
function v31.render(p9) -- line: 101
	-- upvalues: ImpressionsTagUtility (copy), Constants (copy), Roact (copy), EdpStoreImpressionsDetector (copy), withStyle (copy), TopBar (copy), FFlagAppIaScrollAway (copy), AppNavBar (copy), withLocalization (copy), SubscriptionsGrid (copy), GetFFlagEnableDevSubsInRobux (copy), PassesGrid (copy), GetFFlagEnableEdpStoreClickLogging (copy), GetFFlagEnableEdpStoreGridPositionLogging (copy), DeveloperProductsGrid (copy)
	local universeId = p9.props.universeId
	local passes = p9.props.passes
	local v38 = passes and #passes > 0
	local showSubscriptionProducts = p9.props.showSubscriptionProducts
	local developerProducts = p9.props.developerProducts
	local v41 = developerProducts and #developerProducts > 0

	local function u42(p10) -- line: 117
		-- upvalues: p9 (copy)
		p9.storeContainerRef.current = p10
	end
	local function u43(p11) -- line: 120
		-- upvalues: p9 (copy), ImpressionsTagUtility (copy), Constants (copy)
		p9.gamePassRef.current = p11
		ImpressionsTagUtility.AddTag(p9.gamePassRef, Constants.ImpressionsTags.GamePasses, 1)
	end
	local function u44(p12) -- line: 124
		-- upvalues: p9 (copy), ImpressionsTagUtility (copy), Constants (copy)
		p9.developerProductsRef.current = p12
		ImpressionsTagUtility.AddTag(p9.developerProductsRef, Constants.ImpressionsTags.DeveloperProducts, 1)
	end
	local function u45(p13) -- line: 132
		-- upvalues: p9 (copy), ImpressionsTagUtility (copy), Constants (copy)
		p9.subscriptionsRef.current = p13
		ImpressionsTagUtility.AddTag(p9.subscriptionsRef, Constants.ImpressionsTags.Subscriptions, 1)
	end

	local u46 = Roact.createElement(EdpStoreImpressionsDetector, {
		parentRef = p9.storeContainerRef,
		scrollViewPositionChangedSignal = p9.scrollViewPositionChangedSignal,
		impressionsTag = Constants.ImpressionsTags.GamePasses,
		parameters = {
			universeId = p9.props.universeId,
			productType = Constants.StoreEnums.ProductType.GamePasses,
			locationType = Constants.StoreEnums.LocationType.Store
		}
	})
	local u47 = Roact.createElement(EdpStoreImpressionsDetector, {
		parentRef = p9.storeContainerRef,
		scrollViewPositionChangedSignal = p9.scrollViewPositionChangedSignal,
		impressionsTag = Constants.ImpressionsTags.DeveloperProducts,
		parameters = {
			universeId = p9.props.universeId,
			productType = Constants.StoreEnums.ProductType.DeveloperProducts,
			locationType = Constants.StoreEnums.LocationType.Store
		}
	})
	local u48 = Roact.createElement(EdpStoreImpressionsDetector, {
		parentRef = p9.storeContainerRef,
		scrollViewPositionChangedSignal = p9.scrollViewPositionChangedSignal,
		impressionsTag = Constants.ImpressionsTags.Subscriptions,
		parameters = {
			universeId = p9.props.universeId,
			productType = Constants.StoreEnums.ProductType.Subscriptions,
			locationType = Constants.StoreEnums.LocationType.Store
		}
	})

	return withStyle(function(p14) -- line: 167
		-- upvalues: Roact (copy), TopBar (copy), FFlagAppIaScrollAway (copy), AppNavBar (copy), p9 (copy), u42 (ref), withLocalization (copy), u46 (ref), u47 (ref), u48 (ref), showSubscriptionProducts (copy), u45 (ref), SubscriptionsGrid (copy), universeId (copy), GetFFlagEnableDevSubsInRobux (copy), v38 (copy), u43 (ref), PassesGrid (copy), passes (copy), GetFFlagEnableEdpStoreClickLogging (copy), Constants (copy), GetFFlagEnableEdpStoreGridPositionLogging (copy), v41 (copy), u44 (ref), DeveloperProductsGrid (copy), developerProducts (copy)
		return Roact.createElement("Frame", {
			Name = "PassesContent",
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = p14.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p14.Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0
		}, {
			TopBar = Roact.createElement(TopBar.Container, {
				leftItem = TopBar.BackButton,
				rightItems = { TopBar.BuyRobuxButton }
			}),
			PageContent = Roact.createElement(TopBar.PageContent, {}, {
				MainPadding = Roact.createElement("UIPadding", {
					PaddingTop = UDim.new(0, (not FFlagAppIaScrollAway or not AppNavBar.getScrollAwayEnabled()) and 24 or 24 + p9.props.topBarHeight),
					PaddingBottom = UDim.new(0, 24),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				PassesArea = Roact.createElement("ScrollingFrame", {
					Name = "PassesArea",
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					ClipsDescendants = false,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollBarThickness = 0,
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ElasticBehavior = Enum.ElasticBehavior.Always,
					[Roact.Ref] = u42
				}, {
					GridLayoutContainer = withLocalization({
						subscriptions = "Feature.Subscription.Heading.Subscriptions",
						passes = "Feature.GamePass.Heading.PassesForThisGame",
						developerProducts = "Feature.DeveloperProducts.Heading.Products"
					})(function(p15) -- line: 209
						-- upvalues: Roact (copy), p9 (copy), u46 (ref), u47 (ref), u48 (ref), showSubscriptionProducts (copy), p14 (copy), u45 (ref), SubscriptionsGrid (copy), universeId (copy), GetFFlagEnableDevSubsInRobux (copy), v38 (copy), u43 (ref), PassesGrid (copy), passes (copy), GetFFlagEnableEdpStoreClickLogging (copy), Constants (copy), GetFFlagEnableEdpStoreGridPositionLogging (copy), v41 (copy), u44 (ref), DeveloperProductsGrid (copy), developerProducts (copy)
						return Roact.createElement("Frame", {
							Size = UDim2.new(1, 0, 0, 0),
							BackgroundTransparency = 1,
							[Roact.Change.AbsolutePosition] = p9.scrollViewPositionChangedSignalCallback
						}, {
							GamePassesImpressionDetector = u46,
							DeveloperProductsImpressionDetector = u47,
							SubscriptionsImpressionDetector = u48,
							UIListLayout = Roact.createElement("UIListLayout", {
								SortOrder = Enum.SortOrder.LayoutOrder,
								FillDirection = Enum.FillDirection.Vertical,
								Padding = UDim.new(0, 24)
							}),
							SubscriptionHeader = if not showSubscriptionProducts then nil else Roact.createElement("TextLabel", {
								Text = p15.subscriptions,
								BackgroundTransparency = 1,
								TextColor3 = p14.Theme.TextDefault.Color,
								TextSize = p14.Font.BaseSize * p14.Font.Header2.RelativeSize,
								Font = p14.Font.Header2.Font,
								LayoutOrder = 0,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Left,
								[Roact.Ref] = u45
							}),
							SubscriptionsGrid = if not showSubscriptionProducts then nil else Roact.createElement(SubscriptionsGrid, {
								universeId = universeId,
								layoutOrder = 1,
								creatorName = if not GetFFlagEnableDevSubsInRobux() then nil else p9.props.creatorName,
								creatorVerified = if not GetFFlagEnableDevSubsInRobux() then nil else p9.props.creatorVerified
							}),
							Passes = if not v38 then nil else Roact.createElement("TextLabel", {
								Text = p15.passes,
								BackgroundTransparency = 1,
								TextColor3 = p14.Theme.TextDefault.Color,
								TextSize = p14.Font.BaseSize * p14.Font.Header2.RelativeSize,
								Font = p14.Font.Header2.Font,
								LayoutOrder = 2,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Left,
								[Roact.Ref] = u43
							}),
							PassesGrid = if not v38 then nil else Roact.createElement(PassesGrid, {
								universeId = universeId,
								passes = passes,
								layoutOrder = 3,
								textSizeOffset = p9.props.textSizeOffset,
								locationType = if not GetFFlagEnableEdpStoreClickLogging() then nil else Constants.StoreEnums.LocationType.Store,
								viewWidth = if not GetFFlagEnableEdpStoreGridPositionLogging() then nil else p9.props.viewWidth
							}),
							DeveloperProductHeader = if not v41 then nil else Roact.createElement("TextLabel", {
								Text = p15.developerProducts,
								BackgroundTransparency = 1,
								TextColor3 = p14.Theme.TextDefault.Color,
								TextSize = p14.Font.BaseSize * p14.Font.Header2.RelativeSize,
								Font = p14.Font.Header2.Font,
								LayoutOrder = 4,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								TextXAlignment = Enum.TextXAlignment.Left,
								[Roact.Ref] = u44
							}),
							DeveloperProductsGrid = if not v41 then nil else Roact.createElement(DeveloperProductsGrid, {
								universeId = universeId,
								developerProducts = developerProducts,
								layoutOrder = 5,
								locationType = Constants.StoreEnums.LocationType.Store
							})
						})
					end)
				})
			})
		})
	end)
end
function v31.didMount(p16) -- line: 310
	local passes = p16.props.passes
	local networking = p16.props.networking
	local developerProducts = p16.props.developerProducts
	local universeId = p16.props.universeId
	local rootPlaceId = p16.props.rootPlaceId
	local localUserId = p16.props.localUserId

	if passes ~= nil then
		p16.fetchPassesThumbnails(passes, networking)
	end

	if developerProducts ~= nil then
		p16.fetchGameDeveloperProducts(networking, universeId, rootPlaceId, localUserId)
	end
end
function v31.didUpdate(p17, p18, _) -- line: 327
	if p18.passes ~= p17.props.passes then
		p17.fetchPassesThumbnails(p17.props.passes, p17.props.networking)
	end
end

local v32 = RoactRodux.connect(function(p20, p21) -- line: 333
	-- upvalues: GetFFlagEnableDevSubsInRobux (copy), VerifiedBadges (copy), FFlagAppIaScrollAway (copy)
	local v61 = GetFFlagEnableDevSubsInRobux() and VerifiedBadges.isCreatorOfGameVerified(p20, {
		universeId = p21.universeId,
		shouldUseV2GameDetails = true
	})

	return {
		passes = p20.GamePasses[tostring(p21.universeId)],
		showSubscriptionProducts = p20.GameSubscriptionProducts[p21.universeId] and #p20.GameSubscriptionProducts[p21.universeId] > 0,
		developerProducts = p20.GameDeveloperProducts[tostring(p21.universeId)],
		rootPlaceId = if not p20.GameDetails or not p20.GameDetails[p21.universeId] then nil else p20.GameDetails[p21.universeId].rootPlaceId,
		localUserId = p20.LocalUserId,
		creatorName = if not GetFFlagEnableDevSubsInRobux() or (not p20.GameDetails or not p20.GameDetails[p21.universeId]) then nil else p20.GameDetails[p21.universeId].creator.name,
		creatorVerified = if not GetFFlagEnableDevSubsInRobux() then nil else v61,
		topBarHeight = if not FFlagAppIaScrollAway then nil else p20.TopBar.topBarHeight
	}
end, function(p22) -- line: 356
	-- upvalues: ApiFetchPassesThumbnails (copy), ApiFetchGamePasses (copy), ApiFetchGameDeveloperProducts (copy)
	return {
		requestPassesThumbnails = function(p23, p24) --[[ requestPassesThumbnails ]] -- line: 358
			-- upvalues: p22 (copy), ApiFetchPassesThumbnails (copy)
			return p22(ApiFetchPassesThumbnails(p23, p24))
		end,
		fetchGamePasses = function(p25, p26) --[[ fetchGamePasses ]] -- line: 361
			-- upvalues: p22 (copy), ApiFetchGamePasses (copy)
			return p22(ApiFetchGamePasses(p25, p26))
		end,
		fetchGameDeveloperProducts = function(p27, p28, p29, p30) --[[ fetchGameDeveloperProducts ]] -- line: 364
			-- upvalues: p22 (copy), ApiFetchGameDeveloperProducts (copy)
			return p22(ApiFetchGameDeveloperProducts(p27, p28, p29, p30))
		end
	}
end)(v31)
local u33 = RoactServices.connect({
	networking = RoactNetworking
})(v32)

return function(p31) -- line: 373
	-- upvalues: useTextSizeOffset (copy), Cryo (copy), Roact (copy), u33 (ref)
	local v64 = useTextSizeOffset()
	local v65 = Cryo.Dictionary.join(p31, {
		textSizeOffset = v64
	})

	return Roact.createElement(u33, v65)
end
