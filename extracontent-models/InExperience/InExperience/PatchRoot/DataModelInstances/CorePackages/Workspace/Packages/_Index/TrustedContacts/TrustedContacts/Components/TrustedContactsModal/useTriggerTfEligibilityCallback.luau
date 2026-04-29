local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local DataHydration = require(TrustedContactsParent.DataHydration)
local AmpApiProvider = require(TrustedContactsParent.AmpUpsell).AmpApiProvider
local AmpEnums = require(TrustedContactsParent.AmpUpsell).AmpEnums
local useSignalState = require(TrustedContactsParent.SignalsReact).useSignalState
local Signals = require(TrustedContactsParent.Signals)
local TrustedConnectionStatus = require(TrustedContacts.Enums).TrustedConnectionStatus
local VIEW_TF_ELIGIBILITY_CHECK = require(TrustedContacts.Common.VIEW_TF_ELIGIBILITY_CHECK)
local v11 = DataHydration.TrustedConnections.TrustedConnectionsStore.get()

return function(t1: {[any]: any}) --[[ useTriggerTfEligibilityCallback ]] -- line: 26
	-- upvalues: React (copy), v11 (copy), Signals (copy), useSignalState (copy), DataHydration (copy), TrustedConnectionStatus (copy), AmpApiProvider (copy), VIEW_TF_ELIGIBILITY_CHECK (copy), AmpEnums (copy)
	local userId = t1.userId
	local onTriggerAgePrecheck = t1.onTriggerAgePrecheck
	local onError = t1.onError
	local onShowTfCard = t1.onShowTfCard
	local v17 = React.useMemo(function() -- line: 32
		-- upvalues: v11 (copy), userId (copy)
		return v11.getStatus(userId)
	end, { userId })
	local v18 = React.useMemo(function() -- line: 36
		-- upvalues: Signals (copy), v17 (copy)
		return Signals.createComputed(function(p1) -- line: 37
			-- upvalues: v17 (copy)
			return v17.data(p1)
		end)
	end, { v17 })
	local v19 = React.useMemo(function() -- line: 42
		-- upvalues: Signals (copy), v17 (copy)
		return Signals.createComputed(function(p2) -- line: 43
			-- upvalues: v17 (copy)
			return v17.status(p2)
		end)
	end, { v17 })
	local v20 = useSignalState(v18)
	local v21 = useSignalState(v19)

	React.useEffect(function() -- line: 51
		-- upvalues: v21 (copy), DataHydration (copy), onError (copy), v20 (copy), TrustedConnectionStatus (copy), onShowTfCard (copy), AmpApiProvider (copy), VIEW_TF_ELIGIBILITY_CHECK (copy), AmpEnums (copy), onTriggerAgePrecheck (copy)
		if v21 == DataHydration.DataStatus.NotReady then
			return
		end

		if v21 == DataHydration.DataStatus.Failed then
			onError()

			return
		end

		if v20 == TrustedConnectionStatus.TrustedFriends then
			onShowTfCard()

			return
		end

		if v20 ~= TrustedConnectionStatus.TrustedFriends then
			local v22 = AmpApiProvider.upsellFeatureAccess(VIEW_TF_ELIGIBILITY_CHECK.featureName, {}, VIEW_TF_ELIGIBILITY_CHECK.nameSpace)

			if v22.access == AmpEnums.AccessResponseEnum.Granted then
				onShowTfCard()

				return
			end

			if v22.recourse == AmpEnums.ActionTypeEnum.AgeEstimation then
				onTriggerAgePrecheck()

				return
			end

			onError()

			return
		end
	end, {
		v21,
		v20,
		onShowTfCard,
		onTriggerAgePrecheck,
		onError
	})

	return nil
end
