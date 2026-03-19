local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Cryo);
local v4 = require(l_Parent_1.Rodux);
local v5 = require(l_Actions_0.SetShareInviteLink);
local v6 = require(l_Actions_0.ClearShareInviteLink);
local v7 = {};
return function(v8) --[[ Line: 14 ]]
    -- upvalues: v4 (copy), v7 (copy), v3 (copy), v5 (copy), v6 (copy)
    local l_shareLinksNetworking_0 = v8.shareLinksNetworking;
    return v4.createReducer(v7, {
        [l_shareLinksNetworking_0.GenerateLink.Succeeded.name] = function(v10, v11) --[[ Line: 18 ]]
            -- upvalues: v3 (ref)
            return v3.Dictionary.join(v10, {
                ShareInviteLink = v11.responseBody
            });
        end, 
        [v5.name] = function(v12, v13) --[[ Line: 22 ]]
            -- upvalues: v3 (ref)
            return v3.Dictionary.join(v12, {
                ShareInviteLink = v13.shareInviteLink
            });
        end, 
        [v6.name] = function(v14, _) --[[ Line: 26 ]]
            -- upvalues: v3 (ref)
            return v3.Dictionary.join(v14, {
                ShareInviteLink = v3.None
            });
        end
    });
end;