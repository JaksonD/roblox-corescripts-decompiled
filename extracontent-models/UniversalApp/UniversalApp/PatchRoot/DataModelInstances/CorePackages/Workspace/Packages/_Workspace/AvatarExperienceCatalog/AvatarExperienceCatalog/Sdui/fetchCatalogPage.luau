local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local Promise = require(Parent.Promise)

require(Parent.LuauPolyfill)

local SduiSharedUtilities = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilities.SduiResponseType
local getSduiApiStore = SduiSharedUtilities.getSduiApiStore
local SduiApiStorePostConfigContentType = SduiSharedUtilities.SduiApiStorePostConfigContentType
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local FFlagAXFetchCatalogPageReturnsPromise = require(Parent.AvatarExperienceFlags).FFlagAXFetchCatalogPageReturnsPromise
local getCatalogPageUrl = require(script.Parent.Utils.getCatalogPageUrl)
local getCatalogConfigKey = require(script.Parent.Utils.getCatalogConfigKey)

return function(t1: {[any]: any}, p1) --[[ fetchCatalogPage ]] -- line: 28
	-- upvalues: Parent (copy), getSduiApiStore (copy), SduiResponseType (copy), getCatalogPageUrl (copy), AvatarScreen (copy), getCatalogConfigKey (copy), SduiApiStorePostConfigContentType (copy), FFlagAXFetchCatalogPageReturnsPromise (copy), Promise (copy)
	local marketplace_catalog_page = require(Parent.ServiceContractsProto).apppageplatform.marketplacecatalog.marketplace_catalog_page
	local v14 = getSduiApiStore().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = getCatalogPageUrl(),
		surfaceKey = AvatarScreen.Catalog,
		configKey = getCatalogConfigKey(t1.context, t1.screenSize),
		loadTimer = p1,
		apiProto = marketplace_catalog_page.MarketplaceCatalogPageResponse,
		postConfig = {
			body = t1,
			contentType = SduiApiStorePostConfigContentType.Json
		}
	})

	if FFlagAXFetchCatalogPageReturnsPromise then
		return v14 or Promise.resolve()
	end

	return nil
end
