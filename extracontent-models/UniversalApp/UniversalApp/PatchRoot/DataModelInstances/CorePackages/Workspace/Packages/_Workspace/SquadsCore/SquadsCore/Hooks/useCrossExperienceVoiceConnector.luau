local Players = game:GetService("Players")
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")
local SquadsCore = script:FindFirstAncestor("SquadsCore")
local SquadsCoreParent = SquadsCore.Parent
local useCurrentSquadMember = require(script.Parent.useCurrentSquadMember)
local useIsLocalPlayerPartyVoiceEligible = require(script.Parent.useIsLocalPlayerPartyVoiceEligible)
local useIsCurrentSquadPartyVoiceEligible = require(script.Parent.useIsCurrentSquadPartyVoiceEligible)
local SquadExternalContractContext = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local SquadPromptType = require(SquadsCore.Enums.SquadPromptType)
local displayEuConsentPrompt = require(SquadsCore.Utils.displayEuConsentPrompt)
local getTableAppStorageKey = require(SquadsCore.Utils.appStorageAccess).getTableAppStorageKey
local useCurrentSquadId = require(SquadsCore.Hooks.useCurrentSquadId)
local CrossExperienceVoice = require(SquadsCoreParent.CrossExperienceVoice)
local LuauPolyfill = require(SquadsCoreParent.LuauPolyfill)
local React = require(SquadsCoreParent.React)
local dependencyArray = require(SquadsCoreParent.RoactUtils).Hooks.dependencyArray
local useDispatch = require(SquadsCoreParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useStore = require(SquadsCoreParent.RoactUtils).Hooks.RoactRodux.useStore
local SharedFlags = require(SquadsCoreParent.SharedFlags)
local getFFlagEnableCrossExpVoiceMemoryCheck = SharedFlags.getFFlagEnableCrossExpVoiceMemoryCheck
local FFlagEnableVoiceEuConsentPrompt = SharedFlags.FFlagEnableVoiceEuConsentPrompt
local clearInterval = LuauPolyfill.clearInterval
local setInterval = LuauPolyfill.setInterval
local default = CrossExperienceVoice.CrossExperienceVoiceManager.default
local useIsBackgroundDMActive = CrossExperienceVoice.Hooks.useIsBackgroundDMActive
local useIsVoiceRetriableError = CrossExperienceVoice.Hooks.useIsVoiceRetriableError
local SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY = require(SquadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY
local SQUAD_VOICE_EU_MODAL_SEEN_KEY = require(SquadsCore.Common.Constants).SQUAD_VOICE_EU_MODAL_SEEN_KEY
local v29 = game:DefineFastFlag("EnableDisconnectPartyVoiceIfNeeded", false)
local v30 = game:DefineFastFlag("EnablePartyVoiceRestrictionStatus", false)
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local v32 = game:DefineFastInt("PartyVoiceRestrictionStatusMaxAttempts", 10)

function useCrossExperienceVoiceConnector() -- line: 46
	-- upvalues: Players (copy), useCurrentSquadId (copy), useCurrentSquadMember (copy), useDispatch (copy), React (copy), SquadExternalContractContext (copy), useStore (copy), useIsCurrentSquadPartyVoiceEligible (copy), useIsBackgroundDMActive (copy), useIsLocalPlayerPartyVoiceEligible (copy), useIsVoiceRetriableError (copy), v30 (copy), ThirdPartyUserService (copy), v29 (copy), v32 (copy), setInterval (copy), clearInterval (copy), FFlagEnableVoiceEuConsentPrompt (copy), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), displayEuConsentPrompt (copy), default (copy), SquadPromptType (copy), getFFlagEnableCrossExpVoiceMemoryCheck (copy)
	local v33 = Players and (not not Players.LocalPlayer and Players.LocalPlayer.UserId) or 0
	local v34 = useCurrentSquadId() or ""
	local v35 = useCurrentSquadMember(v33)
	local v36 = useDispatch()
	local v37 = React.useContext(SquadExternalContractContext)
	local v38 = useStore()
	local v39 = React.useRef(nil)
	local v40 = useIsCurrentSquadPartyVoiceEligible()
	local v41 = useIsBackgroundDMActive()
	local v42, v43 = useIsLocalPlayerPartyVoiceEligible()
	local v44 = useIsVoiceRetriableError()
	local u45 = nil
	local u46 = nil

	if v30 then
		local v47, v48 = React.useState(if not ThirdPartyUserService or not ThirdPartyUserService:IsChatRestrictionSupported() then Enum.ChatRestrictionStatus.NotRestricted else ThirdPartyUserService:GetVoiceChatRestrictionStatus())

		u45 = v47
		u46 = v48
	end

	local v49, v50 = React.useState(false)
	local v51 = v34 and (v34 ~= "" and (v35 and (not v41 and (v40 and (v42 and (not v44 and (not v30 or Enum.ChatRestrictionStatus.NotRestricted == u45)))))))
	local v52 = not not v29 and ((not v34 or (v34 == "" or (not v35 or (v40 == false or (not v43 and not v42 or v44))))) and v41)

	if v30 then
		React.useEffect(function() -- line: 95
			-- upvalues: u45 (ref), ThirdPartyUserService (copy), u46 (ref), v32 (copy), setInterval (copy), clearInterval (copy)
			if u45 ~= Enum.ChatRestrictionStatus.Unknown then
				return
			end

			if not ThirdPartyUserService or not ThirdPartyUserService:IsChatRestrictionSupported() then
				u46(Enum.ChatRestrictionStatus.NotRestricted)

				return
			end

			local n1 = 0
			local v56 = setInterval(function() -- line: 106
				-- upvalues: n1 (ref), ThirdPartyUserService (copy), u46 (ref), v32 (copy)
				n1 += 1

				local VoiceChatRestrictionStatus = ThirdPartyUserService:GetVoiceChatRestrictionStatus()

				if VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
					u46(VoiceChatRestrictionStatus)

					return
				end

				if n1 >= v32 then
					u46(Enum.ChatRestrictionStatus.Restricted)
				end
			end, 4000)

			n1 += 1

			local VoiceChatRestrictionStatus = ThirdPartyUserService:GetVoiceChatRestrictionStatus()

			if VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.NotRestricted or VoiceChatRestrictionStatus == Enum.ChatRestrictionStatus.Restricted then
				u46(VoiceChatRestrictionStatus)
			elseif v32 <= n1 then
				u46(Enum.ChatRestrictionStatus.Restricted)
			end

			return function() -- line: 123
				-- upvalues: clearInterval (copy), v56 (copy)
				clearInterval(v56)
			end
		end, { u45 })
	end

	React.useEffect(function() -- line: 131
		-- upvalues: FFlagEnableVoiceEuConsentPrompt (copy), v51 (copy), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), v33 (copy), v50 (copy)
		if FFlagEnableVoiceEuConsentPrompt and (v51 and getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)[tostring(v33)]) then
			v50(true)
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v33, v51) else {
		v33,
		v51
	})
	React.useEffect(function() -- line: 147
		-- upvalues: FFlagEnableVoiceEuConsentPrompt (copy), v51 (copy), v33 (copy), getTableAppStorageKey (copy), SQUAD_VOICE_EU_MODAL_SEEN_KEY (copy), SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY (copy), v36 (copy), displayEuConsentPrompt (copy), v37 (copy)
		if FFlagEnableVoiceEuConsentPrompt and v51 then
			local str = tostring(v33)
			local v59 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_SEEN_KEY)

			if not v59[str] then
				local v60 = getTableAppStorageKey(SQUAD_VOICE_EU_MODAL_CONSENT_GIVEN_KEY)

				v36(displayEuConsentPrompt(v37.setSquadPrompt, str, v59, v60))
			end
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v33, displayEuConsentPrompt, v51, v37.setSquadPrompt) else {
		v33,
		displayEuConsentPrompt,
		v51,
		v37.setSquadPrompt
	})
	React.useEffect(function() -- line: 179
		-- upvalues: FFlagEnableVoiceEuConsentPrompt (copy), default (copy), v50 (copy)
		if FFlagEnableVoiceEuConsentPrompt then
			local connection = default.VoiceEuModalConsented.Event:Connect(function() -- line: 182
				-- upvalues: v50 (copy)
				v50(true)
			end)

			return function() -- line: 186
				-- upvalues: connection (copy)
				connection:Disconnect()
			end
		end

		return function() -- line: 190
		end
	end, {})
	React.useEffect(function() -- line: 193
		-- upvalues: v41 (copy), default (copy)
		if v41 then
			default:setAsConnected()

			return
		end

		default:setAsDisconnected()
	end, { v41 })

	local v53 = React.useCallback(function(s1: string, b1: boolean?, b2: boolean?) -- line: 201
		-- upvalues: default (copy)
		default:join({
			partyId = s1,
			force = b1,
			shouldIgnoreMemoryWarning = b2
		})
	end, {})

	React.useEffect(function() -- line: 210
		-- upvalues: v51 (copy), FFlagEnableVoiceEuConsentPrompt (copy), v49 (copy), default (copy), v53 (copy), v34 (copy), v37 (copy), v38 (copy), SquadPromptType (copy)
		if not v51 or FFlagEnableVoiceEuConsentPrompt and not v49 then
			return
		end

		if default:performJoinFeasibilityCheck() then
			v53(v34)

			return
		end

		v37.setSquadPrompt(v38, {
			hideCancelButton = false,
			promptType = SquadPromptType.JoinWithLowMemory,
			onConfirm = function() --[[ onConfirm ]] -- line: 223
			end,
			onCancel = function() --[[ onCancel ]] -- line: 224
				-- upvalues: v53 (copy), v34 (copy)
				v53(v34, true, true)
			end
		})
	end, {
		v51,
		if not FFlagEnableVoiceEuConsentPrompt then nil else v49
	})

	local v54 = React.useCallback(function() -- line: 233
		-- upvalues: default (copy)
		default:leave()
	end, {})

	React.useEffect(function() -- line: 237
		-- upvalues: v29 (copy), v52 (copy), v54 (copy)
		if v29 and v52 then
			v54()
		end
	end, {
		v52,
		v54
	})
	React.useEffect(function() -- line: 244
		-- upvalues: getFFlagEnableCrossExpVoiceMemoryCheck (copy), v39 (copy), default (copy), v37 (copy), v38 (copy), SquadPromptType (copy), v54 (copy)
		if not getFFlagEnableCrossExpVoiceMemoryCheck() then
			return function() -- line: 246
			end
		end

		v39.current = default.MemoryLow.Event:Connect(function() -- line: 256
			-- upvalues: v39 (copy), v37 (copy), v38 (copy), SquadPromptType (copy), v54 (copy)
			if v39.current then
				v39.current:Disconnect()
				v39.current = nil
			end

			v37.setSquadPrompt(v38, {
				hideCancelButton = false,
				promptType = SquadPromptType.DisconnectVoiceDueToLowMemory,
				onConfirm = function() --[[ onConfirm ]] -- line: 263
					-- upvalues: v54 (copy)
					v54()
				end
			})
		end)

		return function() -- line: 268
			-- upvalues: v39 (copy)
			if v39.current then
				v39.current:Disconnect()
				v39.current = nil
			end
		end
	end)

	return v54
end

return useCrossExperienceVoiceConnector
