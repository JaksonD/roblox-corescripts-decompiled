local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return require(l_script_FirstAncestor_0.Networking.myRoduxNetworking).POST(script.Name, function(v3, v4, v5) --[[ Line: 19 ]]
    -- upvalues: l_Url_0 (copy)
    return v3(l_Url_0.ECONOMY_URL):path("v1"):path("purchases"):path("products"):id(v4):body(v5 or {});
end);