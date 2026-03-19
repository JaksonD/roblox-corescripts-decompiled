local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Networking.Networking);
return v2.createReducer({}, {
    [v3.ShareLinksNetworking.GetOrGenerateLink.Succeeded.name] = function(_, v5) --[[ Line: 10 ]]
        return v5.responseBody;
    end
});