local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local Signals = require(Parent.Signals)

require(Parent.AXCommon)

return function() --[[ createItemSelectionStore ]] -- line: 38
	-- upvalues: Signals (copy)
	local v3, v4 = Signals.createSignal({})
	local t1 = {}

	return {
		getItemDataMap = v3,
		getItemData = function(s1: string) --[[ getItemData ]] -- line: 44
			-- upvalues: t1 (copy), Signals (copy), v3 (copy)
			if t1[s1] == nil then
				t1[s1] = Signals.createComputed(function(p1) -- line: 46
					-- upvalues: v3 (copy), s1 (copy)
					return v3(p1)[s1]
				end)
			end

			return t1[s1]
		end,
		setItemData = function(s2: string, t2: {[any]: any}) --[[ setItemData ]] -- line: 54
			-- upvalues: v3 (copy), v4 (copy)
			local v9 = table.clone(v3(false))

			v9[s2] = t2
			v4(v9)
		end,
		clearItemData = function(s3: string) --[[ clearItemData ]] -- line: 60
			-- upvalues: v3 (copy), v4 (copy)
			local v11 = table.clone(v3(false))

			v11[s3] = nil
			v4(v11)
		end,
		clearAll = function() --[[ clearAll ]] -- line: 66
			-- upvalues: v4 (copy)
			v4({})
		end
	}
end
