local CorePackages = game:GetService("CorePackages")
local TeleportService = game:GetService("TeleportService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Foundation = require(CorePackages.Packages.Foundation)
local React = require(CorePackages.Packages.React)
local ReactOtter = require(CorePackages.Packages.ReactOtter)
local SignalsReact = require(CorePackages.Packages.SignalsReact)
local CoreScriptsCommon = require(CorePackages.Workspace.Packages.CoreScriptsCommon)
local CoreScriptsRoactCommon = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon)
local DataHydration = require(CorePackages.Workspace.Packages.DataHydration)
local Localization = require(CorePackages.Workspace.Packages.Localization)
local View = Foundation.View
local useTokens = Foundation.Hooks.useTokens
local SettingsShowSignal = CoreScriptsCommon.SettingsShowSignal
local Traversal = CoreScriptsRoactCommon.Traversal
local DataHydrationTypes = DataHydration.DataHydrationTypes
local getGameInfoStore = DataHydration.Game.getGameInfoStore
local Constants = Traversal.Constants
local TeleportBackButton = Traversal.TeleportBackButton
local TraversalTelemetry = Traversal.TraversalTelemetry
local _ = Traversal.useHistoryItems
local useLocalization = Localization.Hooks.useLocalization
local _ = Traversal.Flags.FFlagUseTeleportTraversalHistory
local _ = Traversal.Flags.FFlagUseLocalTraversalHistory
local FFlagAddTraversalBackButtonAnimation = Traversal.Flags.FFlagAddTraversalBackButtonAnimation
local v26 = game:DefineFastFlag("FixTraversalBackButtonAnimation", false)

return React.memo(function(_: {[any]: any}) --[[ TraversalBackButton ]] -- line: 36
	-- upvalues: useTokens (copy), React (copy), TeleportService (copy), Constants (copy), SettingsShowSignal (copy), TraversalTelemetry (copy), useLocalization (copy), getGameInfoStore (copy), DataHydrationTypes (copy), SignalsReact (copy), v26 (copy), FFlagAddTraversalBackButtonAnimation (copy), ReactOtter (copy), UserGameSettings (copy), View (copy), TeleportBackButton (copy)
	local v28 = useTokens()
	local v29 = React.useRef(nil)
	local v30, v31 = TeleportService:GetThirdPartyTeleportInfo(false)

	if v30 <= Constants.NO_UNIVERSE_ID or v31 <= Constants.NO_PLACE_ID then
		return nil
	end

	local v32, v33 = React.useState(false)

	React.useEffect(function() -- line: 46
		-- upvalues: SettingsShowSignal (copy), v33 (copy)
		local v48 = SettingsShowSignal:connect(function(p1) -- line: 47
			-- upvalues: v33 (copy)
			v33(p1)
		end)

		return function() -- line: 50
			-- upvalues: v48 (copy)
			v48:Disconnect()
		end
	end, {})
	React.useEffect(function() -- line: 55
		-- upvalues: v32 (copy), TraversalTelemetry (copy), v30 (copy)
		if v32 then
			TraversalTelemetry.sendBackButtonActionEvent({
				integration_id = "back_button",
				destination_universe_id = v30,
				event_type = "impression"
			})
		end
	end, {
		v32,
		v30
	})

	local v34 = useLocalization({
		defaultBackButtonText = "CoreScripts.TopBar.Traversal.BackButtonDefault"
	})
	local v35 = React.useCallback(function(p2) -- line: 69
		-- upvalues: getGameInfoStore (copy), v30 (copy), DataHydrationTypes (copy), v34 (copy)
		local v50 = getGameInfoStore(p2).getAndFetchGameInfo((tostring(v30)))
		local v51 = v50.data(p2)
		local v52 = v50.status(p2)

		if not v51 or v52 ~= DataHydrationTypes.DataStatus.Ready then
			return v34.defaultBackButtonText
		end

		return v51.name
	end, {
		v30,
		getGameInfoStore
	})
	local v36 = SignalsReact.useSignalState(v35)
	local u37 = nil

	if v26 then
		u37 = React.useRef(nil)
	end

	local v38 = v28.Size.Size_2500 * 2
	local u39 = nil
	local u40 = nil
	local u41 = nil
	local v42 = nil
	local u43 = nil
	local v44 = nil
	local v45 = nil

	if FFlagAddTraversalBackButtonAnimation then
		u39 = React.useRef(nil)
		u40 = React.useRef(nil)

		if v26 then
			u41 = React.useRef(nil)
		end

		local v46 = React.useMemo(function() -- line: 100
			-- upvalues: v28 (copy)
			return {
				duration = v28.Time.Time_300,
				easingStyle = v28.Ease.StandardOut
			}
		end, { v28 })
		local v47

		v42, v47 = ReactOtter.useAnimatedBinding(0, function(n1: number) -- line: 106
			-- upvalues: u39 (ref), v26 (copy), u41 (ref), u40 (ref)
			u39.current = nil

			if v26 then
				if not u41.current and u40.current and n1 == 1 then
					u41.current = u40.current
				end

				if n1 == 0 then
					u40.current = 0

					return
				end
			else
				u40.current = nil
			end
		end)
		u43 = v47
		React.useEffect(function() -- line: 119
			-- upvalues: v32 (copy), v26 (copy), u37 (ref), v36 (copy), u41 (ref), v29 (copy), u43 (ref), ReactOtter (copy), v46 (copy)
			if v32 then
				if v26 then
					if u37.current ~= v36 then
						u41.current = nil
						u37.current = v36

						if v29.current then
							u43(ReactOtter.ease(0.99, v46))
						end
					else
						u43(ReactOtter.ease(1, v46))
					end
				else
					u43(ReactOtter.ease(1, v46))
				end
			else
				u43(ReactOtter.ease(0, v46))
			end

			if v26 and u37.current == nil then
				u37.current = v36
			end
		end, {
			v32,
			v46,
			v36
		})
		v44 = React.useCallback(function(n2: number) -- line: 142
			-- upvalues: v26 (copy), u41 (ref), v32 (copy), v29 (copy), u39 (ref), u40 (ref), v38 (copy)
			if v26 then
				if u41.current then
					return UDim2.new(0, n2 * u41.current, 0, 0)
				end

				local v56

				if v32 and v29.current then
					local AbsoluteSizeX = v29.current.AbsoluteSize.X

					if not u39.current then
						u39.current = v29.current.AbsoluteSize.X
					end

					if u40.current and AbsoluteSizeX <= u40.current then
						return UDim2.new(0, if not v26 then u40.current else AbsoluteSizeX, 0, 0)
					end

					if u39.current and AbsoluteSizeX ~= u39.current then
						u40.current = AbsoluteSizeX
					end

					v56 = n2 * v38
				else
					v56 = n2 * (u40.current or v38)
				end

				return UDim2.new(0, v56, 0, 0)
			end

			if v32 and v29.current then
				local AbsoluteSizeX = v29.current.AbsoluteSize.X

				if not u39.current then
					u39.current = v29.current.AbsoluteSize.X
				end

				if u40.current and AbsoluteSizeX <= u40.current then
					return UDim2.new(0, u40.current, 0, 0)
				end

				if u39.current and AbsoluteSizeX ~= u39.current then
					u40.current = AbsoluteSizeX
				end
			end

			local v58 = n2 * v38

			return UDim2.new(0, v58, 0, 0)
		end, { v32 })
		v45 = React.useCallback(function(p3) -- line: 182
			-- upvalues: v32 (copy)
			return p3 > 0 or v32
		end, { v32 })
	end

	if FFlagAddTraversalBackButtonAnimation and not UserGameSettings.ReducedMotion then
		return React.createElement(View, {
			tag = "auto-y",
			Visible = v42:map(v45),
			Size = v42:map(v44),
			ZIndex = -1
		}, {
			TraversalBackButton = React.createElement(TeleportBackButton, {
				text = v36,
				textLimitWidth = v38,
				ref = v29
			})
		})
	end

	return v32 and React.createElement(View, {
		tag = "auto-xy shrink"
	}, {
		TraversalBackButton = React.createElement(TeleportBackButton, {
			text = v36,
			textLimitWidth = v38,
			ref = v29
		})
	})
end)
