local l_LogService_0 = game:GetService("LogService");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(script.Parent.Parent.Parent.Constants);
local l_MainWindow_0 = v2.DefaultFontSize.MainWindow;
local l_Log_0 = v2.Font.Log;
local l_MaxStringSize_0 = v2.LogFormatting.MaxStringSize;
local l_EnumToMsgTypeName_0 = v2.EnumToMsgTypeName;
local v7 = require(script.Parent.Parent.Parent.CircularBuffer);
local v8 = require(script.Parent.Parent.Parent.Signal);
local v9 = tonumber(settings():GetFVariable("NewDevConsoleMaxLogCount"));
local v10 = {
    "ClassDescriptor failed to learn", 
    "EventDescriptor failed to learn", 
    "Type failed to learn"
};
local v11 = require(script.Parent.Parent.Parent.Util.convertTimeStamp);
local v12 = {};
v12.__index = v12;
local function v20(v13, v14, v15, v16) --[[ Line: 34 ]] --[[ Name: messageEntry ]]
    -- upvalues: l_MaxStringSize_0 (copy), l_TextService_0 (copy), l_MainWindow_0 (copy), l_Log_0 (copy)
    local v17 = nil;
    local v18 = #v13;
    v17 = if v18 < l_MaxStringSize_0 then string.format("%s -- %s", v14, v13) else string.format("%s -- %s", v14, (string.sub(v13, 1, l_MaxStringSize_0)));
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v17, l_MainWindow_0, l_Log_0, Vector2.new());
    if v16 and next(v16) == nil then
        v16 = nil;
    end;
    return {
        Message = v17, 
        CharCount = v18, 
        Type = v15, 
        Dims = l_l_TextService_0_TextSize_0, 
        Context = v16, 
        Expanded = false
    };
end;
local function v25(v21) --[[ Line: 61 ]] --[[ Name: ignoreWarningMessageOnAdd ]]
    -- upvalues: v10 (copy)
    if v21.Type ~= Enum.MessageType.MessageWarning.Value then
        return false;
    else
        local v22 = false;
        for _, v24 in ipairs(v10) do
            if string.find(v21.Message, v24) ~= nil then
                return true;
            end;
        end;
        return v22;
    end;
end;
local function v29(v26, v27, v28) --[[ Line: 78 ]] --[[ Name: isMessageFiltered ]]
    -- upvalues: l_EnumToMsgTypeName_0 (copy)
    if #v28 == 0 and not next(v27) then
        return false;
    elseif next(v27) and not v27[l_EnumToMsgTypeName_0[v26.Type]] then
        return false;
    elseif #v28 > 0 and string.find(v26.Message:lower(), v28:lower()) == nil then
        return false;
    else
        return true;
    end;
end;
local _ = function(v30) --[[ Line: 99 ]] --[[ Name: validActiveFilters ]]
    local v31 = false;
    for _, v33 in pairs(v30) do
        v31 = v31 or v33;
    end;
    return v31;
end;
local function v44(v35, v36, v37, v38) --[[ Line: 107 ]] --[[ Name: filterMessages ]]
    -- upvalues: v29 (copy), v20 (copy)
    v35:reset();
    local v39 = false;
    for _, v41 in pairs(v37) do
        v39 = v39 or v41;
    end;
    local l_v39_0 = v39;
    if #v38 == 0 and not l_v39_0 then
        return;
    else
        v39 = 0;
        local v43 = v36:next();
        while v43 do
            if v29(v43, v37, v38) then
                v39 = v39 + 1;
                v35:push_back(v43);
            end;
            v43 = v36:next();
        end;
        if v39 == 0 then
            if #v38 > 0 then
                v35:push_back((v20(string.format("\"%s\" was not found", v38), "", 0)));
                return;
            else
                v35:push_back((v20("No Messages were found", "", 0)));
            end;
        end;
        return;
    end;
end;
v12.checkErrorWarningCounter = function(v45, v46) --[[ Line: 137 ]] --[[ Name: checkErrorWarningCounter ]]
    if v46 == Enum.MessageType.MessageWarning.Value then
        v45._warningCount = v45._warningCount + 1;
        v45._errorWarningSignal:Fire(v45._errorCount, v45._warningCount);
        return;
    else
        if v46 == Enum.MessageType.MessageError.Value then
            v45._errorCount = v45._errorCount + 1;
            v45._errorWarningSignal:Fire(v45._errorCount, v45._warningCount);
        end;
        return;
    end;
end;
v12.new = function(v47) --[[ Line: 147 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v7 (copy), v9 (copy), l_EnumToMsgTypeName_0 (copy), v8 (copy)
    local v48 = {};
    setmetatable(v48, v12);
    v48._initialized = false;
    v48._isRunning = false;
    v48._isClient = v47;
    v48._logData = v7.new(v9);
    v48._logDataSearched = v7.new(v9);
    v48._searchTerm = "";
    v48._commandLineHistory = v7.new(100);
    v48._commandLineIndex = 0;
    v48._filters = {};
    for _, v50 in pairs(l_EnumToMsgTypeName_0) do
        v48._filters[v50] = true;
    end;
    v48._errorCount = v47 and 0;
    v48._warningCount = v47 and 0;
    v48._logDataUpdate = v8.new();
    v48._errorWarningSignal = v47 and v8.new();
    v48._filterUpdated = v8.new();
    return v48;
end;
v12.Signal = function(v51) --[[ Line: 176 ]] --[[ Name: Signal ]]
    return v51._logDataUpdate;
end;
v12.errorWarningSignal = function(v52) --[[ Line: 180 ]] --[[ Name: errorWarningSignal ]]
    return v52._errorWarningSignal;
end;
v12.filterUpdatedSignal = function(v53) --[[ Line: 184 ]] --[[ Name: filterUpdatedSignal ]]
    return v53._filterUpdated;
end;
v12.setSearchTerm = function(v54, v55) --[[ Line: 188 ]] --[[ Name: setSearchTerm ]]
    -- upvalues: v44 (copy)
    if v54._searchTerm ~= v55 then
        v54._searchTerm = v55;
        if v54._searchTerm == "" then
            v54._logDataSearched:reset();
            v54._logDataUpdate:Fire(v54._logData);
            return;
        else
            v44(v54._logDataSearched, v54._logData:iterator(), v54._filters, v54._searchTerm);
            v54._logDataUpdate:Fire(v54._logDataSearched);
        end;
    end;
end;
v12.getSearchTerm = function(v56) --[[ Line: 207 ]] --[[ Name: getSearchTerm ]]
    return v56._searchTerm;
end;
v12.getCommandLineHistory = function(v57) --[[ Line: 211 ]] --[[ Name: getCommandLineHistory ]]
    return v57._commandLineHistory;
end;
v12.getCommandLineIndex = function(v58) --[[ Line: 215 ]] --[[ Name: getCommandLineIndex ]]
    return v58._commandLineIndex;
end;
v12.setCommandLineIndex = function(v59, v60) --[[ Line: 219 ]] --[[ Name: setCommandLineIndex ]]
    v59._commandLineIndex = v60;
end;
v12.getFilters = function(v61) --[[ Line: 223 ]] --[[ Name: getFilters ]]
    return v61._filters;
end;
v12.setFilter = function(v62, v63, v64) --[[ Line: 227 ]] --[[ Name: setFilter ]]
    -- upvalues: v44 (copy)
    local v65 = v62._filters[v63];
    v62._filters[v63] = v64;
    local l__filters_0 = v62._filters;
    local v67 = false;
    for _, v69 in pairs(l__filters_0) do
        v67 = v67 or v69;
    end;
    if not v67 then
        v62._filters[v63] = v65;
        return;
    else
        v44(v62._logDataSearched, v62._logData:iterator(), v62._filters, v62._searchTerm);
        v62._logDataUpdate:Fire(v62._logDataSearched);
        v62._filterUpdated:Fire();
        return;
    end;
end;
v12.setFilters = function(v70, v71) --[[ Line: 246 ]] --[[ Name: setFilters ]]
    -- upvalues: v44 (copy)
    v70._filters = v71;
    local v72 = false;
    for _, v74 in pairs(v71) do
        v72 = v72 or v74;
    end;
    if not v72 then
        v70._logDataSearched:reset();
        v70._logDataUpdate:Fire(v70._logData);
        return;
    else
        v44(v70._logDataSearched, v70._logData:iterator(), v70._filters, v70._searchTerm);
        v70._logDataUpdate:Fire(v70._logDataSearched);
        v70._filterUpdated:Fire();
        return;
    end;
end;
v12.getLogData = function(v75) --[[ Line: 265 ]] --[[ Name: getLogData ]]
    if #v75._logDataSearched:getData() > 0 then
        return v75._logDataSearched;
    else
        return v75._logData;
    end;
end;
v12.getErrorWarningCount = function(v76) --[[ Line: 272 ]] --[[ Name: getErrorWarningCount ]]
    return v76._errorCount, v76._warningCount;
end;
v12.isRunning = function(v77) --[[ Line: 276 ]] --[[ Name: isRunning ]]
    return v77._initialized;
end;
v12.start = function(v78) --[[ Line: 280 ]] --[[ Name: start ]]
    -- upvalues: l_LogService_0 (copy), v20 (copy), v11 (copy), v25 (copy), v29 (copy)
    if v78._isClient then
        if not v78._initialized then
            v78._initialized = true;
            if #{} == 0 then
                local l_l_LogService_0_LogHistory_0 = l_LogService_0:GetLogHistory();
                for _, v81 in ipairs(l_l_LogService_0_LogHistory_0) do
                    local v82 = v20(v81.message or "[DevConsole Error 1]", v11(v81.timestamp), v81.messageType.Value, v81.context);
                    if not v25(v82) then
                        v78:checkErrorWarningCounter(v81.messageType.Value);
                        v78._logData:push_back(v82);
                    end;
                end;
            end;
        end;
        v78._connection = l_LogService_0.MessageOut:connect(function(v83, v84, v85) --[[ Line: 302 ]]
            -- upvalues: v20 (ref), v11 (ref), v25 (ref), v78 (copy), v29 (ref)
            local v86 = v20(v83 or "[DevConsole Error 2]", v11(os.time()), v84.Value, v85);
            if not v25(v86) then
                v78:checkErrorWarningCounter(v84.Value);
                v78._logData:push_back(v86);
                if #v78._logDataSearched:getData() > 0 then
                    if v29(v86, v78._filters, v78._searchTerm) then
                        v78._logDataSearched:push_back(v86);
                        v78._logDataUpdate:Fire(v78._logDataSearched);
                        return;
                    end;
                else
                    v78._logDataUpdate:Fire(v78._logData);
                end;
            end;
        end);
    else
        v78._connection = l_LogService_0.ServerMessageOut:connect(function(v87, v88, v89, v90) --[[ Line: 325 ]]
            -- upvalues: v20 (ref), v11 (ref), v25 (ref), v78 (copy), v29 (ref)
            local v91 = v20(v87 or "[DevConsole Error 3]", v11(v89), v88.Value, v90);
            if not v25(v91) then
                v78._logData:push_back(v91);
                if #v78._logDataSearched:getData() > 0 then
                    if v29(v91, v78._filters, v78._searchTerm) then
                        v78._logDataSearched:push_back(v91);
                        v78._logDataUpdate:Fire(v78._logDataSearched);
                        return;
                    end;
                else
                    v78._logDataUpdate:Fire(v78._logData);
                end;
            end;
        end);
        l_LogService_0:RequestServerOutput();
    end;
    v78._isRunning = true;
end;
v12.stop = function(v92) --[[ Line: 353 ]] --[[ Name: stop ]]
    v92._initialized = false;
    v92._isRunning = false;
    if v92._connection then
        v92._connection:Disconnect();
    end;
end;
return v12;