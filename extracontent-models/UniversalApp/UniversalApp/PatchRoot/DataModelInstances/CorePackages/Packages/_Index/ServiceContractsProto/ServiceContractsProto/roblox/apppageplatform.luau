local _ = require(script.Parent.Parent.proto);
local v1 = require(script.badges.v1beta1);
local v2 = require(script.charts.v1beta1);
local v3 = require(script.experiencedetails.v1beta1);
local v4 = require(script.experienceevents.v1beta1);
local v5 = require(script.prompts.v1beta1);
local v6 = require(script.shared.v1beta1);
return {
    badges = v1, 
    charts = v2, 
    experiencedetails = v3, 
    experienceevents = v4, 
    prompts = v5, 
    shared = v6
};