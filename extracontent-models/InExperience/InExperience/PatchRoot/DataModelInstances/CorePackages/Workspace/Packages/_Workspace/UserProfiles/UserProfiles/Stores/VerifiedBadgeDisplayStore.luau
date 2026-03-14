local l_Parent_0 = script:FindFirstAncestor("UserProfiles").Parent;
local v1 = require(l_Parent_0.Signals);
local l_createSignal_0 = v1.createSignal;
local l_createComputed_0 = v1.createComputed;
local v4 = require(script.Parent.UserProfileStore);
local v5 = {};
local v6 = v4.get();
local function _(v7) --[[ Line: 22 ]] --[[ Name: getOrCreateUserSignal ]]
    -- upvalues: v5 (ref), l_createSignal_0 (copy)
    if not v5[v7] then
        local v8, v9 = l_createSignal_0(false);
        v5[v7] = {
            getter = v8, 
            setter = v9
        };
    end;
    return v5[v7];
end;
local function v15(v11, v12) --[[ Line: 30 ]] --[[ Name: setBadgeVisibility ]]
    -- upvalues: v5 (ref), l_createSignal_0 (copy)
    if not v5[v11] then
        local v13, v14 = l_createSignal_0(false);
        v5[v11] = {
            getter = v13, 
            setter = v14
        };
    end;
    v5[v11].setter(v12);
end;
local function v21(v16, v17) --[[ Line: 35 ]] --[[ Name: hasUserVerifiedBadge ]]
    -- upvalues: v6 (copy)
    local v18 = v6.fetchNamesByUserIds({
        (tostring(v16))
    });
    local l_status_0, l_result_0 = pcall(v18, v17);
    if not l_status_0 then
        l_result_0 = {
            status = "failed", 
            data = {}
        };
    end;
    if l_result_0.status == "success" and #l_result_0.data > 0 and l_result_0.data[1].getIsVerified then
        return l_result_0.data[1].getIsVerified(v17);
    else
        return false;
    end;
end;
local function v29(v22) --[[ Line: 51 ]] --[[ Name: getBadgeVisibilitySignal ]]
    -- upvalues: v5 (ref), l_createSignal_0 (copy), l_createComputed_0 (copy), v21 (copy)
    if not v5[v22] then
        local v23, v24 = l_createSignal_0(false);
        v5[v22] = {
            getter = v23, 
            setter = v24
        };
    end;
    local v25 = v5[v22];
    return l_createComputed_0(function(v26) --[[ Line: 54 ]]
        -- upvalues: v21 (ref), v22 (copy), v25 (copy)
        local v27 = v21(v22, v26);
        local v28 = v25.getter(v26);
        return v27 and v28;
    end);
end;
local function v35(v30) --[[ Line: 61 ]] --[[ Name: isBadgeVisible ]]
    -- upvalues: v21 (copy), v5 (ref), l_createSignal_0 (copy)
    local v31 = v21(v30, false);
    if not v5[v30] then
        local v32, v33 = l_createSignal_0(false);
        v5[v30] = {
            getter = v32, 
            setter = v33
        };
    end;
    local v34 = v5[v30].getter(false);
    return v31 and v34;
end;
local function v36() --[[ Line: 69 ]] --[[ Name: reset ]]
    -- upvalues: v5 (ref)
    v5 = {};
end;
local v37 = {
    setBadgeVisibility = v15, 
    getBadgeVisibilitySignal = v29, 
    isBadgeVisible = v35, 
    reset = v36
};
return {
    get = function() --[[ Line: 81 ]] --[[ Name: get ]]
        -- upvalues: v37 (copy)
        return v37;
    end
};