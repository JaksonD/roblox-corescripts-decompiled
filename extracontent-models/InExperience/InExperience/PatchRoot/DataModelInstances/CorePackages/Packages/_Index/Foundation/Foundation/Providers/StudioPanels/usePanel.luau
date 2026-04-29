local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local ReactUtils = require(FoundationParent.ReactUtils)

require(Foundation.Utility.Plugin.StudioUri)
require(script.Parent.Types)

return function(t1: {[any]: any}) --[[ usePanel ]] -- line: 14
	-- upvalues: React (copy), ReactUtils (copy)
	local v6 = React.useRef(nil)
	local v7 = ReactUtils.useRefToState({
		anchorUri = t1.anchorUri,
		position = t1.position,
		depth = t1.depth,
		parentPopoverId = t1.parentPopoverId
	})
	local v8 = React.useRef(t1.onClose)

	v8.current = t1.onClose

	local v9 = React.useRef(t1.registerPanelAsync)

	v9.current = t1.registerPanelAsync

	local v10 = ReactUtils.useAsync(function() -- line: 46
		-- upvalues: t1 (copy), v9 (copy), v7 (copy), v8 (copy), v6 (copy)
		if t1.isOpen then
			local v12, v13 = v9.current(v7.current.anchorUri, v7.current.position, v8.current, v7.current.depth, v7.current.parentPopoverId)

			v6.current = v13

			return v12
		end

		if v6.current then
			v6.current()
			v6.current = nil
		end

		return nil
	end, {
		t1.isOpen,
		v7
	})
	local v11 = if v10.status ~= "ok" then nil else v10.value

	ReactUtils.useAsync(function() -- line: 69
		-- upvalues: v11 (copy), t1 (copy)
		if not v11 then
			return nil
		end

		v11.updateAsync({
			targetWidgetUri = t1.anchorUri,
			targetAnchorPoint = t1.position.targetAnchorPoint,
			subjectAnchorPoint = t1.position.subjectAnchorPoint,
			offset = t1.position.offset
		})

		return nil
	end, {
		v11,
		t1.anchorUri,
		t1.position
	})
	React.useEffect(function() -- line: 82
		-- upvalues: v6 (copy)
		return function() -- line: 83
			-- upvalues: v6 (copy)
			if v6.current then
				v6.current()
			end
		end
	end, {})

	return v11
end
