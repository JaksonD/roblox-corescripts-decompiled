local Parent = script:FindFirstAncestor("IdentityVerification").Parent
local React = require(Parent.React)
local Promise = require(Parent.Promise)
local IDVApiProvider = require(script.Parent.Parent.Utils.IDVApiProvider)
local Enums = require(script.Parent.Parent.Common.Enums)
local IDVSessionStatusEnum = Enums.IDVSessionStatusEnum
local IDVSessionErrorEnum = Enums.IDVSessionErrorEnum
local GetFIntIDVPollDelay = require(script.Parent.Parent.Flags.GetFIntIDVPollDelay)
local GetFIntIDVMaxRetries = require(script.Parent.Parent.Flags.GetFIntIDVMaxRetries)
local GetFFlagIDVGuardStartPollingAfterUnmount = require(script.Parent.Parent.Flags.GetFFlagIDVGuardStartPollingAfterUnmount)
local v11 = GetFIntIDVPollDelay()
local v12 = GetFIntIDVMaxRetries()
local v13 = GetFFlagIDVGuardStartPollingAfterUnmount()

return function(t1: {[any]: any}) --[[ usePollIDVStatus ]] -- line: 37
	-- upvalues: v12 (copy), v11 (copy), React (copy), IDVSessionStatusEnum (copy), IDVApiProvider (copy), IDVSessionErrorEnum (copy), Promise (copy), v13 (copy)
	local v16 = t1.retries or v12
	local v17 = t1.delay or v11
	local onStatusUpdate = t1.onStatusUpdate
	local u19 = nil

	u19 = React.useCallback(function(s1: string, n1: number, p1, p2) -- line: 44
		-- upvalues: IDVSessionStatusEnum (copy), IDVApiProvider (copy), onStatusUpdate (copy), IDVSessionErrorEnum (copy), v17 (copy), u19 (ref)
		if n1 == 0 then
			p2({
				sessionStatus = IDVSessionStatusEnum.Expired
			})

			return
		end

		IDVApiProvider.getVerifiedStatus(s1):andThen(function(p3) -- line: 51
			-- upvalues: onStatusUpdate (copy), n1 (copy), IDVSessionStatusEnum (copy), IDVSessionErrorEnum (copy), p2 (copy), p1 (copy), v17 (copy), u19 (ref), s1 (copy)
			local isVerified = p3.isVerified
			local sessionStatus = p3.sessionStatus
			local sessionErrorCode = p3.sessionErrorCode
			local ageEstimationNextStep = p3.ageEstimationNextStep

			if onStatusUpdate then
				onStatusUpdate({
					sessionStatus = sessionStatus,
					retriesLeft = n1
				})
			end

			if isVerified and sessionStatus == IDVSessionStatusEnum.Stored then
				if sessionErrorCode == IDVSessionErrorEnum.UnknownError and ageEstimationNextStep == nil then
					return p2({
						sessionStatus = IDVSessionStatusEnum.Failure
					})
				end

				return p1()
			end

			if sessionStatus == IDVSessionStatusEnum.RequiresManualReview or (sessionStatus == IDVSessionStatusEnum.RequiresRetry or sessionStatus == IDVSessionStatusEnum.Expired) then
				p2({
					sessionStatus = sessionStatus
				})

				return
			end

			task.spawn(function() -- line: 71
				-- upvalues: v17 (copy), u19 (ref), s1 (copy), n1 (copy), p1 (copy), p2 (copy)
				task.wait(v17)

				if u19 then
					u19(s1, n1 - 1, p1, p2)
				end
			end)
		end):catch(function(_) -- line: 79
			-- upvalues: p2 (copy), IDVSessionStatusEnum (copy)
			p2({
				sessionStatus = IDVSessionStatusEnum.RequiresRetry
			})
		end)
	end, {
		v17,
		onStatusUpdate
	})

	return React.useCallback(function(p5) -- line: 84
		-- upvalues: Promise (copy), v13 (copy), u19 (ref), v16 (copy)
		return Promise.new(function(p6, p7) -- line: 85
			-- upvalues: v13 (copy), u19 (ref), p5 (copy), v16 (copy)
			if v13 then
				if u19 then
					u19(p5, v16, p6, p7)

					return
				end

				p6()

				return
			end

			u19(p5, v16, p6, p7)
		end)
	end, {
		u19,
		v16
	}), (React.useCallback(function() -- line: 98
		-- upvalues: u19 (ref)
		u19 = nil
	end, {}))
end
