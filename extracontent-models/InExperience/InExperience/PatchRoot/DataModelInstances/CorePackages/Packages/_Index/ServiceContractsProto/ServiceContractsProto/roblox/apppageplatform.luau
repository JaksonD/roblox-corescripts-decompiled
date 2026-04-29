require(script.Parent.Parent.proto)

local v1beta1 = require(script.badges.v1beta1)
local v1beta1_2 = require(script.charts.v1beta1)
local v1beta1_3 = require(script.experiencedetails.v1beta1)
local v1beta1_4 = require(script.experienceevents.v1beta1)
local v1beta1_5 = require(script.marketplacecatalog.v1beta1)
local v1beta1_6 = require(script.prompts.v1beta1)
local v1beta1_7 = require(script.shared.v1beta1)

return {
	badges = v1beta1,
	charts = v1beta1_2,
	experiencedetails = v1beta1_3,
	experienceevents = v1beta1_4,
	marketplacecatalog = v1beta1_5,
	prompts = v1beta1_6,
	shared = v1beta1_7
}
