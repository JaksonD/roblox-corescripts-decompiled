local v0 = require(script.Parent.createPageTracker);
local function v4(v1, v2) --[[ Line: 10 ]] --[[ Name: getTracker ]]
    -- upvalues: v0 (copy)
    if v1.trackers[v2] == nil then
        local v3 = v0();
        v1.trackers[v2] = v3;
    end;
    return v1.trackers[v2];
end;
local function v8(v5, v6) --[[ Line: 18 ]] --[[ Name: removeTracker ]]
    local v7 = v5.trackers[v6];
    if v7 then
        v7:stop();
        v5.trackers[v6] = nil;
    end;
end;
local function _() --[[ Line: 27 ]] --[[ Name: createFactory ]]
    -- upvalues: v4 (copy), v8 (copy)
    return {
        trackers = {}, 
        getTracker = v4, 
        removeTracker = v8
    };
end;
local v10 = nil;
return {
    getInstance = function() --[[ Line: 39 ]] --[[ Name: getInstance ]]
        -- upvalues: v10 (ref), v4 (copy), v8 (copy)
        if not v10 then
            v10 = {
                trackers = {}, 
                getTracker = v4, 
                removeTracker = v8
            };
        end;
        return v10;
    end
};