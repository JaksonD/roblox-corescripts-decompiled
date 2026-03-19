local l_LogService_0 = game:GetService("LogService");
local v1 = require(script.Parent.Parent.Parent.CircularBuffer);
local v2 = require(script.Parent.Parent.Parent.Signal);
local l_ChartHeaderNames_0 = require(script.Parent.Parent.Parent.Constants).NetworkFormatting.ChartHeaderNames;
local v4 = tonumber(settings():GetFVariable("NewDevConsoleMaxHttpCount"));
local v17 = {
    [l_ChartHeaderNames_0[1]] = function(v5, v6) --[[ Line: 12 ]]
        return v5.Num < v6.Num;
    end, 
    [l_ChartHeaderNames_0[2]] = function(v7, v8) --[[ Line: 15 ]]
        return v7.Method < v8.Method;
    end, 
    [l_ChartHeaderNames_0[3]] = function(v9, v10) --[[ Line: 18 ]]
        return v9.Status < v10.Status;
    end, 
    [l_ChartHeaderNames_0[4]] = function(v11, v12) --[[ Line: 21 ]]
        return v11.Time < v12.Time;
    end, 
    [l_ChartHeaderNames_0[5]] = function(v13, v14) --[[ Line: 24 ]]
        return v13.RequestType < v14.RequestType;
    end, 
    [l_ChartHeaderNames_0[6]] = function(v15, v16) --[[ Line: 27 ]]
        return v15.Url < v16.Url;
    end
};
local function _(v18, v19, v20, v21, v22, v23, v24) --[[ Line: 32 ]] --[[ Name: newHttpEntry ]]
    return {
        Num = v18, 
        Method = v19, 
        Status = v20, 
        Time = v21, 
        RequestType = v22, 
        Url = v23, 
        Response = v24
    };
end;
local v26 = {};
v26.__index = v26;
v26.new = function(v27) --[[ Line: 47 ]] --[[ Name: new ]]
    -- upvalues: v26 (copy), l_LogService_0 (copy), v2 (copy), v1 (copy), v4 (copy), l_ChartHeaderNames_0 (copy)
    local v28 = {};
    setmetatable(v28, v26);
    v28._isRunning = false;
    v28._isClient = v27;
    v28._httpResultSignal = v27 and l_LogService_0.HttpResultOut or l_LogService_0.ServerHttpResultOut;
    v28._httpEntryAdded = v2.new();
    v28._httpSummaryTable = {};
    v28._httpSummaryCount = 0;
    v28._httpEntryBuffer = v1.new(v4);
    v28._httpLifeTimeEntryCount = 0;
    v28._sortType = l_ChartHeaderNames_0[1];
    return v28;
end;
v26.addHttpEntry = function(v29, v30) --[[ Line: 65 ]] --[[ Name: addHttpEntry ]]
    v29._httpLifeTimeEntryCount = v29._httpLifeTimeEntryCount + 1;
    local l__httpLifeTimeEntryCount_0 = v29._httpLifeTimeEntryCount;
    local l_Method_0 = v30.Method;
    local l_Status_0 = v30.Status;
    local l_Time_0 = v30.Time;
    local l_RequestType_0 = v30.RequestType;
    local l_URL_0 = v30.URL;
    local l_Response_0 = v30.Response;
    local v38 = {
        Num = l__httpLifeTimeEntryCount_0, 
        Method = l_Method_0, 
        Status = l_Status_0, 
        Time = l_Time_0, 
        RequestType = l_RequestType_0, 
        Url = l_URL_0, 
        Response = l_Response_0
    };
    v29._httpEntryBuffer:push_back(v38);
    l__httpLifeTimeEntryCount_0 = v30.RequestType;
    l_Method_0 = v29._httpSummaryTable[l__httpLifeTimeEntryCount_0];
    if not l_Method_0 then
        v29._httpSummaryCount = v29._httpSummaryCount + 1;
        v29._httpSummaryTable[l__httpLifeTimeEntryCount_0] = {
            RequestType = l__httpLifeTimeEntryCount_0, 
            RequestCount = 1, 
            FailedCount = 0, 
            AverageTime = v30.Time, 
            MinTime = v30.Time, 
            MaxTime = v30.Time
        };
        if v30.Status >= 400 then
            v29._httpSummaryTable[v30.RequestType].FailedCount = 1;
            return;
        end;
    else
        l_Method_0.RequestCount = l_Method_0.RequestCount + 1;
        if v30.Status >= 400 then
            l_Method_0.FailedCount = l_Method_0.FailedCount + 1;
        end;
        l_Method_0.AverageTime = (l_Method_0.AverageTime * l_Method_0.RequestCount + v30.Time - l_Method_0.AverageTime) / l_Method_0.RequestCount;
        if v30.Time < l_Method_0.MinTime then
            l_Method_0.MinTime = v30.Time;
        end;
        if v30.Time > l_Method_0.MaxTime then
            l_Method_0.MaxTime = v30.Time;
        end;
    end;
end;
v26.setSortType = function(v39, v40) --[[ Line: 117 ]] --[[ Name: setSortType ]]
    -- upvalues: v17 (copy)
    if v17[v40] then
        v39._sortType = v40;
        v39._httpEntryAdded:Fire(v39._httpSummaryTable, v39._httpSummaryCount, v39:getSortedEntries());
        return;
    else
        error(string.format("attempted to pass invalid sortType: %s", (tostring(v40))), 2);
        return;
    end;
end;
v26.getSortType = function(v41) --[[ Line: 130 ]] --[[ Name: getSortType ]]
    return v41._sortType;
end;
v26.resetHttpEntryList = function(v42) --[[ Line: 134 ]] --[[ Name: resetHttpEntryList ]]
    -- upvalues: l_LogService_0 (copy)
    v42._httpSummaryTable = {};
    v42._httpEntryBuffer:reset();
    v42._httpLifeTimeEntryCount = 0;
    if v42._isClient then
        local l_l_LogService_0_HttpResultHistory_0 = l_LogService_0:GetHttpResultHistory();
        if l_l_LogService_0_HttpResultHistory_0 then
            for _, v45 in pairs(l_l_LogService_0_HttpResultHistory_0) do
                v42:addHttpEntry(v45);
            end;
        end;
    end;
end;
v26.Signal = function(v46) --[[ Line: 149 ]] --[[ Name: Signal ]]
    return v46._httpEntryAdded;
end;
v26.getSortedEntries = function(v47) --[[ Line: 153 ]] --[[ Name: getSortedEntries ]]
    -- upvalues: v17 (copy)
    local v48 = v47._httpEntryBuffer:iterator();
    local v49 = v48:next();
    local v50 = {};
    local v51 = 1;
    while v49 do
        v50[v51] = v49;
        v51 = v51 + 1;
        v49 = v48:next();
    end;
    table.sort(v50, v17[v47._sortType]);
    return v50;
end;
v26.getCurrentData = function(v52) --[[ Line: 170 ]] --[[ Name: getCurrentData ]]
    return {
        summaryTable = v52._httpSummaryTable, 
        summaryCount = v52._httpSummaryCount, 
        entryList = v52:getSortedEntries()
    };
end;
v26.isRunning = function(v53) --[[ Line: 178 ]] --[[ Name: isRunning ]]
    return v53._isRunning;
end;
v26.start = function(v54) --[[ Line: 182 ]] --[[ Name: start ]]
    -- upvalues: l_LogService_0 (copy)
    if not v54._httpResultConnection then
        if v54._additionHttpSetup then
            v54._additionHttpSetup();
        end;
        v54._httpResultConnection = v54._httpResultSignal:connect(function(v55) --[[ Line: 188 ]]
            -- upvalues: v54 (copy)
            v54:addHttpEntry(v55);
            v54._httpEntryAdded:Fire(v54._httpSummaryTable, v54._httpSummaryCount, v54:getSortedEntries());
        end);
        v54:resetHttpEntryList();
        if not v54._isClient then
            v54._onHttpResultApprovedConnection = l_LogService_0.OnHttpResultApproved:connect(function(v56) --[[ Line: 200 ]]
                -- upvalues: l_LogService_0 (ref), v54 (copy)
                l_LogService_0:RequestHttpResultApproved();
                if v56 then
                    v54._onHttpResultApprovedConnection:Disconnect();
                    v54._onHttpResultApprovedConnection = nil;
                end;
            end);
            l_LogService_0:RequestServerHttpResult();
        end;
        v54._isRunning = true;
    end;
end;
v26.stop = function(v57) --[[ Line: 213 ]] --[[ Name: stop ]]
    if v57._httpResultConnection then
        v57._httpResultConnection:Disconnect();
        v57._httpResultConnection = nil;
    end;
    v57._isRunning = false;
end;
return v26;