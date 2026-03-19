local l_Parent_0 = script:FindFirstAncestor("ProfilePlatformCommon").Parent;
local v1, v2 = require(l_Parent_0.Signals).createSignal(0);
return {
    notifyProfileRefresh = function() --[[ Line: 7 ]] --[[ Name: notifyProfileRefresh ]]
        -- upvalues: v2 (copy)
        v2(os.clock());
    end, 
    getProfileRefreshSignal = v1
};