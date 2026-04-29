local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local Players = game:GetService("Players")
local v4 = game:DefineFastFlag("FFlagLogFirstGuacRead", false)
local v5 = game:DefineFastFlag("FFlagLogAllGuacRead", false)
local v6 = game:DefineFastFlag("CacheReadParsePolicy", false)
local v7 = game:DefineFastFlag("FixPolicyStalePlayerUpdates", false)
local default = nil

if v4 then
	local CorePackages = game:GetService("CorePackages")

	default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
end

return function(p1) -- line: 17
	-- upvalues: HttpService (copy), MemStorageService (copy), Players (copy), v6 (copy), v7 (copy), v5 (copy), default (ref), v4 (copy)
	local v11 = p1 or {}

	v11.HttpService = v11.HttpService or HttpService
	v11.MemStorageService = v11.MemStorageService or MemStorageService
	v11.PlayersService = v11.PlayersService or Players
	assert(v11.HttpService, "expected dependencies.HttpService")
	assert(v11.MemStorageService, "expected dependencies.MemStorageService")
	assert(v11.PlayersService, "expected dependencies.PlayersService")

	local HttpService2 = v11.HttpService
	local MemStorageService2 = v11.MemStorageService
	local PlayersService = v11.PlayersService
	local u15 = false

	return function(p2) -- line: 32
		-- upvalues: PlayersService (copy), HttpService2 (copy), v6 (copy), MemStorageService2 (copy), v7 (copy), v5 (copy), default (ref), v4 (copy), u15 (ref)
		assert(p2, "expected behavior")

		local u17 = nil
		local u18 = nil
		local u19 = nil
		local u20 = nil
		local BindableEvent = Instance.new("BindableEvent")

		local function onPolicyUpdated(p3) -- line: 52
			-- upvalues: u19 (ref), HttpService2 (copy), u20 (ref), BindableEvent (copy)
			if p3 ~= u19 and (p3 and #p3 > 0) then
				local ok, result = pcall(function() -- line: 56
					-- upvalues: HttpService2 (copy), p3 (copy)
					return HttpService2:JSONDecode(p3)
				end)

				if ok then
					u19 = p3
					u20 = result
					BindableEvent:Fire(result)
				end
			end
		end

		if v6 then
			local u23 = nil

			local function localPlayerChanged() -- line: 87
				-- upvalues: u23 (ref), PlayersService (copy), v7 (copy), u20 (ref), u19 (ref), u18 (ref), p2 (copy), u17 (ref), MemStorageService2 (copy), onPolicyUpdated (copy)
				if u23 then
					u23:Disconnect()
					u23 = nil
				end

				if PlayersService.LocalPlayer then
					u23 = PlayersService.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function() -- line: 93
						-- upvalues: v7 (copy), u20 (ref), u19 (ref), u18 (ref), PlayersService (copy), p2 (copy), u17 (ref), MemStorageService2 (copy), onPolicyUpdated (copy)
						if v7 then
							u20 = nil
							u19 = nil

							if u18 then
								u18:Disconnect()
								u18 = nil

								local n1 = -1
								local LocalPlayer = PlayersService.LocalPlayer

								if LocalPlayer and LocalPlayer.UserId > 0 then
									n1 = LocalPlayer.UserId
								end

								local v49 = "GUAC:" .. n1 .. ":" .. p2

								u17 = v49
								u18 = MemStorageService2:BindAndFire(v49, onPolicyUpdated)

								return
							end

							u17 = nil

							return
						end

						u20 = nil
					end)
				end

				if v7 then
					u20 = nil
					u19 = nil

					if u18 then
						u18:Disconnect()
						u18 = nil

						local n2 = -1
						local LocalPlayer = PlayersService.LocalPlayer

						if LocalPlayer and LocalPlayer.UserId > 0 then
							n2 = LocalPlayer.UserId
						end

						local v35 = "GUAC:" .. n2 .. ":" .. p2

						u17 = v35
						u18 = MemStorageService2:BindAndFire(v35, onPolicyUpdated)

						return
					end

					u17 = nil

					return
				end

				u20 = nil
			end

			PlayersService:GetPropertyChangedSignal("LocalPlayer"):Connect(localPlayerChanged)
			localPlayerChanged()
		end

		return {
			read = function() --[[ read ]] -- line: 112
				-- upvalues: v6 (copy), u20 (ref), PlayersService (copy), p2 (copy), MemStorageService2 (copy), HttpService2 (copy), v5 (copy), default (ref), v4 (copy), u15 (ref), u19 (ref)
				if v6 and u20 then
					return u20
				end

				local n3 = -1
				local LocalPlayer = PlayersService.LocalPlayer

				if LocalPlayer and LocalPlayer.UserId > 0 then
					n3 = LocalPlayer.UserId
				end

				local v38 = "GUAC:" .. n3 .. ":" .. p2
				local Item = MemStorageService2:GetItem(v38)

				if Item and #Item > 0 then
					local ok, result = pcall(function() -- line: 119
						-- upvalues: HttpService2 (copy), Item (copy)
						return HttpService2:JSONDecode(Item)
					end)

					if ok then
						if v5 then
							default:logEvent("lua_policy_read_success")
						elseif v4 and not u15 then
							default:logEvent("lua_policy_read_success")
							u15 = true
						end

						u20 = result
						u19 = Item

						return result
					end
				end

				return nil
			end,
			onPolicyChanged = function(p4) --[[ onPolicyChanged ]] -- line: 141
				-- upvalues: PlayersService (copy), p2 (copy), BindableEvent (copy), u18 (ref), u17 (ref), u20 (ref), MemStorageService2 (copy), onPolicyUpdated (copy)
				local n4 = -1
				local LocalPlayer = PlayersService.LocalPlayer

				if LocalPlayer and LocalPlayer.UserId > 0 then
					n4 = LocalPlayer.UserId
				end

				local v45 = "GUAC:" .. n4 .. ":" .. p2
				local connection = BindableEvent.Event:Connect(p4)

				if u18 and v45 == u17 then
					if u20 then
						p4(u20)

						return connection
					end
				else
					if u18 then
						u18:Disconnect()
					end

					u17 = v45
					u18 = MemStorageService2:BindAndFire(v45, onPolicyUpdated)
				end

				return connection
			end
		}
	end
end
