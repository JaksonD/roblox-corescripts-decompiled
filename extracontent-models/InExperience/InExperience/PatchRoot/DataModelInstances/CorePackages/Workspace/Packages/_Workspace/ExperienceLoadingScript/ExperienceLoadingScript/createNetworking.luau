local l_Parent_0 = script:FindFirstAncestor("ExperienceLoadingScript").Parent;
local l_HttpService_0 = game:GetService("HttpService");
return require(l_Parent_0.Http).NetworkLayers.requestInternalWrapper(l_HttpService_0);