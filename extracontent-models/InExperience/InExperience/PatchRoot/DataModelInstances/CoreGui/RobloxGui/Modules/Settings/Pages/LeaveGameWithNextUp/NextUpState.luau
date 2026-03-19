local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry);
local v3 = {};
if v2 then
    local v4 = nil;
    local v5 = nil;
    local v6 = nil;
    v3.getNextUpComponentSortLatency = function() --[[ Line: 14 ]] --[[ Name: getNextUpComponentSortLatency ]]
        -- upvalues: v6 (ref)
        return v6;
    end;
    v3.nextUpComponentShown = function() --[[ Line: 18 ]] --[[ Name: nextUpComponentShown ]]
        -- upvalues: v4 (ref)
        v4 = time();
    end;
    v3.nextUpComponentSortDataLoaded = function() --[[ Line: 22 ]] --[[ Name: nextUpComponentSortDataLoaded ]]
        -- upvalues: v5 (ref), v6 (ref), v4 (ref)
        if v5 then
            return;
        else
            local v7 = time();
            v5 = v7;
            v6 = if v4 then v7 - v4 else 0;
            return;
        end;
    end;
    local v8 = {};
    v3.getNextUpTileImageTextureLatencies = function() --[[ Line: 35 ]] --[[ Name: getNextUpTileImageTextureLatencies ]]
        -- upvalues: v1 (copy), v8 (ref)
        return v1.Dictionary.values(v8);
    end;
    v3.nextUpTileImageTextureLoaded = function(v9) --[[ Line: 39 ]] --[[ Name: nextUpTileImageTextureLoaded ]]
        -- upvalues: v8 (ref), v5 (ref)
        local v10 = tostring(v9);
        if v8[v10] then
            return;
        else
            v8[v10] = if v5 then time() - v5 else 0;
            return;
        end;
    end;
    v3.resetNextUpLatencyTelemetry = function() --[[ Line: 50 ]] --[[ Name: resetNextUpLatencyTelemetry ]]
        -- upvalues: v5 (ref), v8 (ref), v4 (ref), v6 (ref)
        v5 = nil;
        v8 = {};
        v4 = nil;
        v6 = nil;
    end;
    return v3;
else
    local v11 = false;
    v3.setNextUpTilesLoaded = function(v12) --[[ Line: 58 ]] --[[ Name: setNextUpTilesLoaded ]]
        -- upvalues: v11 (ref)
        v11 = v12;
    end;
    v3.getNextUpTilesLoaded = function() --[[ Line: 62 ]] --[[ Name: getNextUpTilesLoaded ]]
        -- upvalues: v11 (ref)
        return v11;
    end;
    return v3;
end;