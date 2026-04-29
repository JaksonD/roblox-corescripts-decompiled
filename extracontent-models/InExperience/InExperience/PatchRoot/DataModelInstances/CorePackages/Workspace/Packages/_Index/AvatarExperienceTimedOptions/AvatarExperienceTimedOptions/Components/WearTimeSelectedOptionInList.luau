local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local useWearTimeSelectedOptionViewModel = require(script.Parent.useWearTimeSelectedOptionViewModel)
local WearTimeSelectedOptionInListView = require(script.Parent.WearTimeSelectedOptionInListView)

require(Parent.AvatarExperienceCommon)

return function(t1: {[any]: any}) --[[ WearTimeSelectedOptionContainer ]] -- line: 19
	-- upvalues: useWearTimeSelectedOptionViewModel (copy), WearTimeSelectedOptionInListView (copy)
	local v5 = useWearTimeSelectedOptionViewModel(t1)

	return WearTimeSelectedOptionInListView(v5)
end
