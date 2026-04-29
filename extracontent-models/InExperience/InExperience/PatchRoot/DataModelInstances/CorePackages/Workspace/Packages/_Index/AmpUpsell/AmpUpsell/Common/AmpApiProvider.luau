local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local AmpUpsellParent = AmpUpsell.Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(AmpUpsellParent.UrlBuilder).UrlBuilder
local UrlBase = require(AmpUpsellParent.UrlBuilder).UrlBase
local Fetch = require(AmpUpsellParent.Fetch)
local Promise = require(AmpUpsellParent.Promise)
local fetch = Fetch.fetch
local Response = Fetch.Response
local AccessResponseEnum = require(AmpUpsell.Common.Enums).AccessResponseEnum

require(AmpUpsell.Common.Types)

local gql = require(AmpUpsellParent.ApolloClient).gql
local Base64 = require(AmpUpsellParent.AuthCommon).Utils.Base64
local FFlagAmpWizardParseExtraParameters = require(AmpUpsellParent.SharedFlags).FFlagAmpWizardParseExtraParameters
local GetFFlagAmpGqlPassSuccessfulActions = require(AmpUpsell.Flags.GetFFlagAmpGqlPassSuccessfulActions)
local v15 = UrlBuilder.new({
	base = UrlBase.APIS,
	path = "access-management/v1/upsell-feature-access",
	query = {
		{
			name = "featureName",
			value = "{featureName}",
			optional = false
		},
		{
			name = "successfulActions",
			value = "{successfulActions}",
			optional = false
		},
		{
			name = "nameSpace",
			value = "{nameSpace}",
			optional = true
		},
		{
			name = "extraParameters",
			value = "{extraParameters}",
			optional = true
		}
	}
})
local v16 = UrlBuilder.new({
	base = UrlBase.APIS,
	path = "access-management/v1/feature-access",
	query = {
		featureNames = "{featureNames}"
	}
})

return {
	upsellFeatureAccess = function(s1: string, t1: {[any]: any}, s2: string?, t2: {[any]: any}?) --[[ upsellFeatureAccess ]] -- line: 100
		-- upvalues: Base64 (copy), HttpService (copy), fetch (copy), Promise (copy), v15 (copy), Response (copy), AccessResponseEnum (copy)
		local v26 = if not t2 then nil else Base64.Encode(HttpService:JSONEncode(t2))
		local v27 = fetch

		return (Promise.new(function(p1, p2) -- line: 54
			-- upvalues: t1 (copy), v15 (copy), s1 (copy), s2 (copy), v26 (copy), v27 (copy), Response (copy)
			local v46 = table.concat(t1, ",")
			local v47 = v15({
				featureName = s1,
				successfulActions = v46,
				nameSpace = s2,
				extraParameters = v26
			})
			local v48 = v27(v47, {
				method = "GET"
			}):catch(function() -- line: 63
				-- upvalues: Response (copy)
				return Response.error()
			end):expect()

			if v48.status == 304 then
				p2("Got Response: 304")

				return
			end

			if not v48.ok then
				p2("Failed to find upsell feature access values")

				return
			end

			local v49 = v48:json():catch(function() -- line: 81
				return nil
			end):expect()

			if not v49 then
				p2("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")

				return
			end

			p1({
				access = v49.access,
				recourse = v49.recourse,
				recourses = v49.recourses,
				shouldPrompt = v49.shouldPrompt
			})
		end):catch(function(_) -- line: 110
			-- upvalues: AccessResponseEnum (copy)
			return {
				access = AccessResponseEnum.Error
			}
		end):expect())
	end,
	upsellFeatureAccessGql = function(p4, s3: string, t3: {[any]: any}, s4: string?, t4: {[any]: any}?) --[[ upsellFeatureAccessGql ]] -- line: 174
		-- upvalues: gql (copy), FFlagAmpWizardParseExtraParameters (copy), Base64 (copy), HttpService (copy), GetFFlagAmpGqlPassSuccessfulActions (copy), AccessResponseEnum (copy)
		local v35 = gql(require(script.Parent.GetUpsellFeatureAccess))
		local v36 = nil

		if FFlagAmpWizardParseExtraParameters then
			v36 = if not t4 then nil else Base64.Encode(HttpService:JSONEncode(t4))
		end

		local v37 = p4:query({
			query = v35,
			variables = {
				featureName = s3,
				successfulActions = if not GetFFlagAmpGqlPassSuccessfulActions() then {} else t3,
				nameSpace = s4,
				extraParameters = if not FFlagAmpWizardParseExtraParameters then nil else v36
			},
			fetchPolicy = "network-only"
		}):catch(function(_) -- line: 197
			-- upvalues: AccessResponseEnum (copy)
			return {
				access = AccessResponseEnum.Error
			}
		end):expect()

		if v37.data and v37.data.getUpsellFeatureAccess.featureAccess then
			return v37.data.getUpsellFeatureAccess.featureAccess
		end

		return {
			access = AccessResponseEnum.Error
		}
	end,
	getFeatureAccess = function(t5: {[any]: any}) --[[ getFeatureAccess ]] -- line: 119
		-- upvalues: fetch (copy), Promise (copy), v16 (copy), Response (copy), AccessResponseEnum (copy)
		local v29 = fetch

		return (Promise.new(function(p6, p7) -- line: 121
			-- upvalues: t5 (copy), v16 (copy), v29 (copy), Response (copy)
			local v53 = table.concat(t5, ",")
			local v54 = v16({
				featureNames = v53
			})
			local v55 = v29(v54, {
				method = "GET"
			}):catch(function() -- line: 125
				-- upvalues: Response (copy)
				return Response.error()
			end):expect()

			if v55.status == 304 then
				p7("Got Response: 304")

				return
			end

			if not v55.ok then
				p7("Failed to find get feature access values")

				return
			end

			local v56 = v55:json():catch(function() -- line: 143
				return nil
			end):expect()

			if not v56 then
				p7("Failed to decode HTTP response as JSON for AMP Upsell Feature Access API")

				return
			end

			local t6 = {}

			for _, v59 in v56.features do
				table.insert(t6, {
					feature = v59.featureName,
					access = v59.access
				})
			end

			p6({
				featureAccessList = t6
			})
		end):catch(function(_) -- line: 166
			-- upvalues: AccessResponseEnum (copy)
			return {
				access = AccessResponseEnum.Error
			}
		end):expect())
	end
}
