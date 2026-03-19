local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = game:DefineFastInt("IAFlyoutTooltipOneDaySeconds", 86400);
local v2 = 7 * v1;
local v3 = {};
v3.__index = v3;
v3.tooltipSeenTimeHelper = function(v4, v5, v6) --[[ Line: 23 ]] --[[ Name: tooltipSeenTimeHelper ]]
    -- upvalues: v1 (copy), v2 (copy)
    if not v5 or not v6 then
        return false;
    else
        local v7 = v4:_getTime() - v6;
        if v5 < 3 and v1 < v7 then
            return true;
        elseif v5 == 3 and v2 < v7 then
            return true;
        else
            return false;
        end;
    end;
end;
v3.updateTooltipAppStorageValue = function(v8, v9) --[[ Line: 38 ]] --[[ Name: updateTooltipAppStorageValue ]]
    -- upvalues: l_AppStorageService_0 (copy)
    if v9 and v9 >= 0 then
        v9 = v9 + 1;
        local v10 = v8:_getTime();
        local v11 = string.format("%d,%d", v10, v9);
        v8._tooltipInfo = v11;
        l_AppStorageService_0:SetItem("IAFlyoutEntryPointTooltip", v11);
        l_AppStorageService_0:Flush();
    end;
end;
local function _() --[[ Line: 49 ]] --[[ Name: readStorage ]]
    -- upvalues: l_AppStorageService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 50 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("IAFlyoutEntryPointTooltip");
    end);
    if l_status_0 then
        return l_result_0;
    else
        return nil;
    end;
end;
v3.new = function() --[[ Line: 59 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_AppStorageService_0 (copy)
    local v15 = setmetatable({
        _hasChecked = false, 
        _tooltipInfo = nil, 
        _getTime = function() --[[ Line: 63 ]] --[[ Name: _getTime ]]
            return os.time();
        end
    }, v3);
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 50 ]]
        -- upvalues: l_AppStorageService_0 (ref)
        return l_AppStorageService_0:GetItem("IAFlyoutEntryPointTooltip");
    end);
    v15._tooltipInfo = if l_status_1 then l_result_1 else nil;
    return v15;
end;
v3.setTimeProvider = function(v18, v19) --[[ Line: 71 ]] --[[ Name: setTimeProvider ]]
    v18._getTime = v19;
end;
v3.flyoutSidePanelOpened = function(v20) --[[ Line: 75 ]] --[[ Name: flyoutSidePanelOpened ]]
    -- upvalues: l_AppStorageService_0 (copy)
    if v20._tooltipInfo ~= "FLYOUT_OPENED" then
        v20._tooltipInfo = "FLYOUT_OPENED";
        l_AppStorageService_0:SetItem("IAFlyoutEntryPointTooltip", "FLYOUT_OPENED");
        l_AppStorageService_0:Flush();
    end;
end;
v3.getTooltipCount = function(v21) --[[ Line: 83 ]] --[[ Name: getTooltipCount ]]
    if v21._tooltipInfo == "" then
        return 1;
    else
        if string.find(v21._tooltipInfo, ",") then
            local _, v23 = string.match(v21._tooltipInfo, "(%d+),(%d+)");
            local v24 = tonumber(v23);
            if v24 then
                return v24 + 1;
            end;
        end;
        return 0;
    end;
end;
v3.isTooltipActive = function(v25) --[[ Line: 96 ]] --[[ Name: isTooltipActive ]]
    if v25._hasChecked then
        return false;
    else
        v25._hasChecked = true;
        if v25._tooltipInfo == "FLYOUT_OPENED" then
            return false;
        elseif v25._tooltipInfo == "" then
            v25:updateTooltipAppStorageValue(0);
            return true;
        else
            if string.find(v25._tooltipInfo, ",") then
                local v26, v27 = string.match(v25._tooltipInfo, "(%d+),(%d+)");
                local v28 = tonumber(v27);
                if v25:tooltipSeenTimeHelper(v28, (tonumber(v26))) then
                    v25:updateTooltipAppStorageValue(v28);
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
return v3.new();