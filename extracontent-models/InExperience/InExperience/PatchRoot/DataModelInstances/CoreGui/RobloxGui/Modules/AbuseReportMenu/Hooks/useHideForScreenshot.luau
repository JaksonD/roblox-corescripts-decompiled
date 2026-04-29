local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local React = require(CorePackages.Packages.React)
local v5 = game:DefineFastInt("AbuseReportMenuScreenshotReduceMotionWaitFrames", 20)
local v6 = game:DefineFastInt("AbuseReportMenuScreenshotWaitFrames", 10)
local FFlagIEMTabFocusNav = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local UserGameSettings = UserSettings():GetService("UserGameSettings")

return function(p1, p2, p3, p4, p5, p6) -- line: 28
	-- upvalues: React (copy), FFlagIEMTabFocusNav (copy), GuiService (copy), RunService (copy), UserGameSettings (copy), v5 (copy), v6 (copy)
	local v15, v16 = React.useState(false)
	local v17 = if not FFlagIEMTabFocusNav then nil else React.useRef(nil)

	React.useEffect(function() -- line: 38
		-- upvalues: p2 (copy), v15 (copy), FFlagIEMTabFocusNav (copy), v17 (copy), GuiService (copy), v16 (copy), p1 (copy), p3 (copy), RunService (copy), p5 (copy), UserGameSettings (copy), v5 (copy), v6 (copy), p4 (copy), p6 (copy)
		if p2 then
			if v15 then
				if FFlagIEMTabFocusNav and v17.current and v17.current:IsDescendantOf(game) then
					GuiService.SelectedCoreObject = v17.current
					v17.current = nil
				end

				v16(false)

				return
			end

			if p1 then
				if FFlagIEMTabFocusNav then
					v17.current = GuiService.SelectedCoreObject
				end

				v16(true)
				p3()

				local connection = nil
				local n1 = 0
				local n2 = 0
				local connection2 = nil
				local elapsed = os.clock()

				connection = RunService.Heartbeat:Connect(function() -- line: 60
					-- upvalues: n1 (ref), p5 (copy), connection (ref)
					if n1 == 1 then
						p5()
						connection:Disconnect()

						return
					end

					n1 += 1
				end)
				connection2 = RunService.Heartbeat:Connect(function() -- line: 71
					-- upvalues: elapsed (copy), UserGameSettings (copy), v5 (copy), v6 (copy), n2 (ref), connection2 (ref), p4 (copy)
					if os.clock() - elapsed >= (if not UserGameSettings.ReducedMotion then v6 / 60 else v5 / 60) and n2 >= if not UserGameSettings.ReducedMotion then v6 else v5 then
						connection2:Disconnect()
						p4()

						return
					end

					n2 += 1
				end)

				return
			end
		elseif not v15 then
			p6()
		end
	end, { p2 })
end
