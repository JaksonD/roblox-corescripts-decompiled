local v0 = {};
local v1 = nil;
local v2 = nil;
local v3 = false;
local v4 = nil;
local function v5() --[[ Line: 17 ]] --[[ Name: defaultClock ]]
    return os.clock();
end;
v0._setClockForTesting = function(v6) --[[ Line: 24 ]] --[[ Name: _setClockForTesting ]]
    -- upvalues: v5 (ref)
    v5 = v6;
end;
v0.markClosed = function() --[[ Line: 31 ]] --[[ Name: markClosed ]]
    -- upvalues: v3 (ref), v1 (ref), v5 (ref), v4 (ref)
    if v3 or v1 == nil then
        v1 = v5();
    end;
    v3 = false;
    v4 = nil;
end;
v0.updateMetadata = function(v7, v8, v9, v10) --[[ Line: 46 ]] --[[ Name: updateMetadata ]]
    -- upvalues: v4 (ref)
    v4 = {
        url = v7, 
        title = v8, 
        isVisible = v9, 
        hasBackButton = v10
    };
end;
v0.markOpen = function(v11, v12, v13, v14) --[[ Line: 67 ]] --[[ Name: markOpen ]]
    -- upvalues: v3 (ref), v2 (ref), v5 (ref), v0 (copy)
    if not v3 or v2 == nil then
        v2 = v5();
    end;
    v3 = true;
    v0.updateMetadata(v11, v12, v13, v14);
end;
v0.isOpen = function() --[[ Line: 79 ]] --[[ Name: isOpen ]]
    -- upvalues: v3 (ref)
    return v3;
end;
v0.wasLastClosed = function() --[[ Line: 87 ]] --[[ Name: wasLastClosed ]]
    -- upvalues: v1 (ref), v5 (ref)
    if v1 == nil then
        return -1;
    else
        return v5() - v1;
    end;
end;
v0.getOpenDuration = function() --[[ Line: 99 ]] --[[ Name: getOpenDuration ]]
    -- upvalues: v2 (ref), v5 (ref)
    if v2 == nil then
        return -1;
    else
        return v5() - v2;
    end;
end;
v0.wasClosedWithin = function(v15) --[[ Line: 112 ]] --[[ Name: wasClosedWithin ]]
    -- upvalues: v1 (ref), v5 (ref)
    if v1 == nil then
        return false;
    else
        return v5() - v1 <= v15;
    end;
end;
v0.isOpenNoLongerThan = function(v16, v17) --[[ Line: 127 ]] --[[ Name: isOpenNoLongerThan ]]
    -- upvalues: v3 (ref), v2 (ref), v5 (ref)
    if not v16 then
        return v3;
    elseif v2 == nil or v3 and v17 <= v5() - v2 then
        return false;
    else
        return v3;
    end;
end;
v0.getWebViewMetadata = function() --[[ Line: 143 ]] --[[ Name: getWebViewMetadata ]]
    -- upvalues: v4 (ref)
    return v4;
end;
return v0;