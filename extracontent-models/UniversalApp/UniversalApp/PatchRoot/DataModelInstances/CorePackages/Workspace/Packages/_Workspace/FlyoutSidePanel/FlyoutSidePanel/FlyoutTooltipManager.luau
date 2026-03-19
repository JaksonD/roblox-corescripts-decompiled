local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = game:DefineFastInt("IAFlyoutTooltipMaxShownCount", 5);
local v2 = game:DefineFastInt("IAFlyoutDailyTooltipMaxShownCount", 3);
local v3 = {};
v3.__index = v3;
local function _(v4, v5) --[[ Line: 23 ]] --[[ Name: isSameDate ]]
    local v6 = os.date("*t", v4);
    local v7 = os.date("*t", v5);
    local v8 = true;
    if v6.year ~= v7.year then
        v8 = true;
        if v6.month ~= v7.month then
            v8 = v6.day == v7.day;
        end;
    end;
    return v8;
end;
local function v18() --[[ Line: 29 ]] --[[ Name: readStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("IAFlyoutEntryPointTooltip");
    end);
    if l_status_0 and l_result_0 then
        if l_result_0 == "FLYOUT_OPENED" then
            return 0, 0, 0;
        elseif string.find(l_result_0, ",") then
            local v12, v13, v14 = string.match(l_result_0, "(%d+),(%d+),(%d+)");
            local v15 = tonumber(v12) or 0;
            local v16 = tonumber(v13) or 0;
            local v17 = tonumber(v14);
            if v17 then
                return v15, v16, v17;
            end;
        end;
    end;
    return 0, 0, 0;
end;
v3.new = function() --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        _hasChecked = false, 
        _dailyCount = 0, 
        _totalCount = 0, 
        _getTime = function() --[[ Line: 56 ]] --[[ Name: _getTime ]]
            return os.time();
        end
    }, v3));
end;
v3.setTimeProvider = function(v19, v20) --[[ Line: 63 ]] --[[ Name: setTimeProvider ]]
    v19._getTime = v20;
end;
v3.flyoutSidePanelOpened = function(v21) --[[ Line: 67 ]] --[[ Name: flyoutSidePanelOpened ]]
    -- upvalues: v1 (copy), l_AppStorageService_0 (copy)
    if v21._dailyCount < v1 then
        v21._dailyCount = v1;
        local v22 = v21:_getTime();
        local v23 = string.format("%d,%d,%d", v22, v21._dailyCount, v21._totalCount);
        l_AppStorageService_0:SetItem("IAFlyoutEntryPointTooltip", v23);
        l_AppStorageService_0:Flush();
    end;
end;
v3.getTooltipCount = function(v24) --[[ Line: 78 ]] --[[ Name: getTooltipCount ]]
    return v24._totalCount;
end;
v3.tooltipSeenTimeHelper = function(v25, v26) --[[ Line: 82 ]] --[[ Name: tooltipSeenTimeHelper ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v27 = v25:_getTime();
    local v28 = os.date("*t", v27);
    local v29 = os.date("*t", v26);
    local v30 = true;
    if v28.year ~= v29.year then
        v30 = true;
        if v28.month ~= v29.month then
            v30 = v28.day == v29.day;
        end;
    end;
    if not v30 then
        v25._dailyCount = 0;
    end;
    v30 = false;
    if v25._dailyCount < v2 then
        v30 = v25._totalCount < v1;
    end;
    return v30;
end;
v3.updateTooltipAppStorageValue = function(v31) --[[ Line: 92 ]] --[[ Name: updateTooltipAppStorageValue ]]
    -- upvalues: l_AppStorageService_0 (copy)
    v31._dailyCount = v31._dailyCount + 1;
    v31._totalCount = v31._totalCount + 1;
    local v32 = v31:_getTime();
    local v33 = string.format("%d,%d,%d", v32, v31._dailyCount, v31._totalCount);
    l_AppStorageService_0:SetItem("IAFlyoutEntryPointTooltip", v33);
    l_AppStorageService_0:Flush();
end;
v3.isTooltipActive = function(v34) --[[ Line: 101 ]] --[[ Name: isTooltipActive ]]
    -- upvalues: v18 (copy), v1 (copy)
    if v34._hasChecked then
        return false;
    else
        v34._hasChecked = true;
        local v35 = 0;
        local v36, v37, v38 = v18();
        v34._dailyCount = v37;
        v34._totalCount = v38;
        v35 = v36;
        if v34._dailyCount >= v1 or v34._totalCount >= v1 then
            return false;
        elseif v34:tooltipSeenTimeHelper(v35) then
            v34:updateTooltipAppStorageValue();
            return true;
        else
            return false;
        end;
    end;
end;
return v3.new();