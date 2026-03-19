local l_Parent_0 = script.Parent.Parent;
local l_FFlagLuaAppInExperienceDetailsPrompt_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt;
return {
    ExperienceUnavailable = "ExperienceUnavailable", 
    NetworkError = l_FFlagLuaAppInExperienceDetailsPrompt_0 and "NetworkError" or nil
};