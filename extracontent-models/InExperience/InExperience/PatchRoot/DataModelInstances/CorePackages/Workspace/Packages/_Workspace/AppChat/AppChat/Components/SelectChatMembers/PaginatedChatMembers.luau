local Parent = script:FindFirstAncestor("AppChat").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local FlatList = require(Parent.VirtualizedList).FlatList
local FFlagEnableAppChatFocusableFixes = require(Parent.SharedFlags).FFlagEnableAppChatFocusableFixes
local v6 = game:DefineFastInt("AppChatPerfChatMembersPaginationWindowSize", 2)
local v7 = game:DefineFastInt("AppChatPerfChatMembersPaginationInitialRender", 8)
local v8 = game:DefineFastInt("AppChatPerfChatMembersPaginationOnEndReachedUnits", 1)

local function v9(p1, p2) -- line: 24
	return (tostring(p1 or p2))
end

local t1 = {
	ScrollBarThickness = 0,
	Name = "PaginatedChatMembers",
	BackgroundTransparency = 1
}
local t2 = {
	BackgroundTransparency = 1
}

return React.memo(function(t3: {[any]: any}) --[[ PaginatedChatMembers ]] -- line: 37
	-- upvalues: React (copy), FFlagEnableAppChatFocusableFixes (copy), v6 (copy), v7 (copy), v8 (copy), Foundation (copy), FlatList (copy), t1 (copy), t2 (copy), v9 (copy)
	local v15 = React.useRef(nil)

	React.useEffect(function() -- line: 40
		-- upvalues: FFlagEnableAppChatFocusableFixes (copy), v15 (copy)
		if FFlagEnableAppChatFocusableFixes and v15.current then
			local v20 = v15.current:getNativeScrollRef()

			if v20 and v20._nativeRef and v20._nativeRef.current then
				v20._nativeRef.current.Selectable = false
			end
		end
	end, {})

	local v16 = v6
	local v17 = v7
	local v18 = v8
	local v19 = React.useCallback(function() -- line: 53
		-- upvalues: t3 (copy)
		if t3.fetchMoreFriends then
			t3.fetchMoreFriends()
		end
	end, { t3.fetchMoreFriends })

	return React.createElement(Foundation.View, {
		tag = "size-full col gap-small"
	}, {
		Header = if not t3.headerText then nil else React.createElement(Foundation.Text, {
			tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom text-title-large padding-x-medium",
			Text = t3.headerText,
			LayoutOrder = 1
		}),
		ListContainer = React.createElement(Foundation.View, {
			LayoutOrder = 2,
			tag = "size-full-0 fill"
		}, {
			List = React.createElement(FlatList, {
				style = t1,
				contentContainerStyle = t2,
				renderItem = t3.renderItem,
				data = t3.userIds,
				windowSize = v16,
				initialNumToRender = v17,
				onEndReachedThreshold = v18,
				onEndReached = v19,
				keyExtractor = v9,
				ref = if not FFlagEnableAppChatFocusableFixes then nil else v15
			})
		})
	})
end)
