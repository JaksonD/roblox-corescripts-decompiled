local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local useWearTimeSelectedOptionViewModel = require(script.Parent.useWearTimeSelectedOptionViewModel)
local WearTimeSelectedOptionView = require(script.Parent.WearTimeSelectedOptionView)

require(Parent.AvatarExperienceCommon)

return function(t1: {[any]: any}) --[[ WearTimeSelectedOptionContainer ]] -- line: 19
	-- upvalues: useWearTimeSelectedOptionViewModel (copy), WearTimeSelectedOptionView (copy)
	local v5 = useWearTimeSelectedOptionViewModel(t1)

	return WearTimeSelectedOptionView(v5)
end
