local u1 = nil
local t1 = {}
local t2 = {
	getSceneOverrides = function() --[[ getSceneOverrides ]] -- line: 22
		-- upvalues: u1 (ref)
		return u1
	end,
	setSceneOverrides = function(p1) --[[ setSceneOverrides ]] -- line: 25
		-- upvalues: u1 (ref), t1 (copy)
		u1 = p1

		for _, v6 in t1 do
			v6(p1)
		end
	end,
	subscribe = function(p2) --[[ subscribe ]] -- line: 31
		-- upvalues: t1 (copy)
		table.insert(t1, p2)

		return function() -- line: 33
			-- upvalues: t1 (copy), p2 (copy)
			local v8 = table.find(t1, p2)

			if v8 then
				table.remove(t1, v8)
			end
		end
	end
}

return function() --[[ getSceneOverridesStore ]] -- line: 42
	-- upvalues: t2 (copy)
	return t2
end
