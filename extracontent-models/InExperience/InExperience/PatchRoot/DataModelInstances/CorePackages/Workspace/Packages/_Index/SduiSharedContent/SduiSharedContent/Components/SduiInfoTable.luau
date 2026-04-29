local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local React = require(Parent.React)
local SduiCoreSystem = require(Parent.SduiCoreSystem)
local AppBlox = require(Parent.AppBlox)
local Foundation = require(Parent.Foundation)
local InfoTable = AppBlox.InfoTable
local View = Foundation.View
local getSduiComponentWrapper = SduiCoreSystem.getSduiComponentWrapper
local SharedFlags = require(Parent.SharedFlags)
local FFlagSduiServerCompat = SharedFlags.FFlagSduiServerCompat
local FFlagSduiExperienceDetailsSupport = SharedFlags.FFlagSduiExperienceDetailsSupport

return React.memo(function(t1: {[any]: any}) --[[ SduiInfoTable ]] -- line: 34
	-- upvalues: FFlagSduiServerCompat (copy), getSduiComponentWrapper (copy), React (copy), FFlagSduiExperienceDetailsSupport (copy), View (copy), InfoTable (copy)
	local v13 = if not FFlagSduiServerCompat then t1.LayoutOrder else t1.layoutOrder
	local t2 = {}
	local v15 = (not t1.numColumns or not (t1.numColumns > 0)) and 1 or t1.numColumns
	local v16 = #t1.items

	for v17, v18 in t1.items do
		local v19 = getSduiComponentWrapper(v18)

		t2[v17] = React.createElement(v19, {
			componentConfig = v18,
			sduiContext = t1.sduiContext,
			parentAnalyticsContext = t1.analyticsContext,
			extraLocalProps = {
				numColumns = t1.numColumns,
				isLastInSingleColumn = if v15 ~= 1 then nil else v17 == v16
			}
		})
	end

	if FFlagSduiExperienceDetailsSupport then
		return React.createElement(View, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = v13
		}, {
			Header = if not t1.headerComponent then nil else React.cloneElement(t1.headerComponent, if not FFlagSduiServerCompat then {
				LayoutOrder = 1
			} else {
				layoutOrder = 1
			}),
			Content = React.createElement(InfoTable, {
				LayoutOrder = 2,
				numColumns = t1.numColumns,
				gridTag = t1.gridTag,
				items = t2
			})
		})
	end

	return React.createElement(InfoTable, {
		LayoutOrder = v13,
		numColumns = t1.numColumns,
		gridTag = t1.gridTag,
		items = t2
	})
end)
