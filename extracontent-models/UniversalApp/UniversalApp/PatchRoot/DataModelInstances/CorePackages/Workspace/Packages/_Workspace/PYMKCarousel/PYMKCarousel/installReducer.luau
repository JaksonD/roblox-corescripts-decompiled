local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Rodux_0 = v2.Rodux;
local l_RoduxNetworking_0 = v2.RoduxNetworking;
local v5 = require(script.RoduxAnalytics);
local v6 = require(script.Users);
local v7 = require(script.Friends);
local v8 = require(script.RoduxPresence);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local l_FFlagHomepagePYMKPresence_0 = require(l_Parent_0.SharedFlags).FFlagHomepagePYMKPresence;
return function(v11) --[[ Line: 16 ]]
    -- upvalues: l_Rodux_0 (copy), v6 (copy), v7 (copy), l_RoduxNetworking_0 (copy), v5 (copy), l_FFlagHomepagePYMKPresence_0 (copy), v8 (copy)
    if v11.contentType and v11.treatmentType then
        return (l_Rodux_0.combineReducers({
            Users = v6(v11), 
            Friends = v7(v11), 
            NetworkStatus = l_RoduxNetworking_0.installReducer(), 
            Analytics = v5(v11), 
            Presence = if l_FFlagHomepagePYMKPresence_0 then v8.installReducer() else nil
        }));
    else
        return nil;
    end;
end;