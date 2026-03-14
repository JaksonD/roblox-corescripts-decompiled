local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.SetShareInviteLink);
local v6 = require(l_Actions_0.ClearShareInviteLink);
local v7 = {};
return function(v8) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), v5 (copy), v6 (copy)
    local l_shareLinksNetworking_0 = v8.shareLinksNetworking;
    return v3.createReducer(v7, {
        [l_shareLinksNetworking_0.GenerateLink.Succeeded.name] = function(v10, v11) --[[ Line: 17 ]]
            -- upvalues: v2 (ref)
            return v2.Dictionary.join(v10, {
                ShareInviteLink = v11.responseBody
            });
        end, 
        [v5.name] = function(v12, v13) --[[ Line: 21 ]]
            -- upvalues: v2 (ref)
            return v2.Dictionary.join(v12, {
                ShareInviteLink = v13.shareInviteLink
            });
        end, 
        [v6.name] = function(v14, _) --[[ Line: 25 ]]
            -- upvalues: v2 (ref)
            return v2.Dictionary.join(v14, {
                ShareInviteLink = v2.None
            });
        end
    });
end;