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
local function v19(v13, v14, v15) --[[ Line: 25 ]] --[[ Name: messageEntry ]]
    -- upvalues: l_MaxStringSize_0 (copy), l_TextService_0 (copy), l_MainWindow_0 (copy), l_Log_0 (copy)
    local v16 = nil;
    local v17 = #v13;
    v16 = if v17 < l_MaxStringSize_0 then string.format("%s -- %s", v14, v13) else string.format("%s -- %s", v14, (string.sub(v13, 1, l_MaxStringSize_0)));
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v16, l_MainWindow_0, l_Log_0, Vector2.new());
    return {
        Message = v16, 
        CharCount = v17, 
        Type = v15, 
        Dims = l_l_TextService_0_TextSize_0
    };
end;
local function v24(v20) --[[ Line: 46 ]] --[[ Name: ignoreWarningMessageOnAdd ]]
    -- upvalues: v10 (copy)
    if v20.Type ~= Enum.MessageType.MessageWarning.Value then
        return false;
    else
        local v21 = false;
        for _, v23 in ipairs(v10) do
            if string.find(v20.Message, v23) ~= nil then
                return true;
            end;
        end;
        return v21;
    end;
end;
local function v28(v25, v26, v27) --[[ Line: 63 ]] --[[ Name: isMessageFiltered ]]
    -- upvalues: l_EnumToMsgTypeName_0 (copy)
    if #v27 == 0 and not next(v26) then
        return false;
    elseif next(v26) and not v26[l_EnumToMsgTypeName_0[v25.Type]] then
        return false;
    elseif #v27 > 0 and string.find(v25.Message:lower(), v27:lower()) == nil then
        return false;
    else
        return true;
    end;
end;
local _ = function(v29) --[[ Line: 84 ]] --[[ Name: validActiveFilters ]]
    local v30 = false;
    for _, v32 in pairs(v29) do
        v30 = v30 or v32;
    end;
    return v30;
end;
local function v43(v34, v35, v36, v37) --[[ Line: 92 ]] --[[ Name: filterMessages ]]
    -- upvalues: v28 (copy), v19 (copy)
    v34:reset();
    local v38 = false;
    for _, v40 in pairs(v36) do
        v38 = v38 or v40;
    end;
    local l_v38_0 = v38;
    if #v37 == 0 and not l_v38_0 then
        return;
    else
        v38 = 0;
        local v42 = v35:next();
        while v42 do
            if v28(v42, v36, v37) then
                v38 = v38 + 1;
                v34:push_back(v42);
            end;
            v42 = v35:next();
        end;
        if v38 == 0 then
            if #v37 > 0 then
                v34:push_back((v19(string.format("\"%s\" was not found", v37), "", 0)));
                return;
            else
                v34:push_back((v19("No Messages were found", "", 0)));
            end;
        end;
        return;
    end;
end;
v12.checkErrorWarningCounter = function(v44, v45) --[[ Line: 122 ]] --[[ Name: checkErrorWarningCounter ]]
    if v45 == Enum.MessageType.MessageWarning.Value then
        v44._warningCount = v44._warningCount + 1;
        v44._errorWarningSignal:Fire(v44._errorCount, v44._warningCount);
        return;
    else
        if v45 == Enum.MessageType.MessageError.Value then
            v44._errorCount = v44._errorCount + 1;
            v44._errorWarningSignal:Fire(v44._errorCount, v44._warningCount);
        end;
        return;
    end;
end;
v12.new = function(v46) --[[ Line: 132 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v7 (copy), v9 (copy), l_EnumToMsgTypeName_0 (copy), v8 (copy)
    local v47 = {};
    setmetatable(v47, v12);
    v47._initialized = false;
    v47._isRunning = false;
    v47._isClient = v46;
    v47._logData = v7.new(v9);
    v47._logDataSearched = v7.new(v9);
    v47._searchTerm = "";
    v47._commandLineHistory = v7.new(100);
    v47._commandLineIndex = 0;
    v47._filters = {};
    for _, v49 in pairs(l_EnumToMsgTypeName_0) do
        v47._filters[v49] = true;
    end;
    v47._errorCount = v46 and 0;
    v47._warningCount = v46 and 0;
    v47._logDataUpdate = v8.new();
    v47._errorWarningSignal = v46 and v8.new();
    v47._filterUpdated = v8.new();
    return v47;
end;
v12.Signal = function(v50) --[[ Line: 161 ]] --[[ Name: Signal ]]
    return v50._logDataUpdate;
end;
v12.errorWarningSignal = function(v51) --[[ Line: 165 ]] --[[ Name: errorWarningSignal ]]
    return v51._errorWarningSignal;
end;
v12.filterUpdatedSignal = function(v52) --[[ Line: 169 ]] --[[ Name: filterUpdatedSignal ]]
    return v52._filterUpdated;
end;
v12.setSearchTerm = function(v53, v54) --[[ Line: 173 ]] --[[ Name: setSearchTerm ]]
    -- upvalues: v43 (copy)
    if v53._searchTerm ~= v54 then
        v53._searchTerm = v54;
        if v53._searchTerm == "" then
            v53._logDataSearched:reset();
            v53._logDataUpdate:Fire(v53._logData);
            return;
        else
            v43(v53._logDataSearched, v53._logData:iterator(), v53._filters, v53._searchTerm);
            v53._logDataUpdate:Fire(v53._logDataSearched);
        end;
    end;
end;
v12.getSearchTerm = function(v55) --[[ Line: 192 ]] --[[ Name: getSearchTerm ]]
    return v55._searchTerm;
end;
v12.getCommandLineHistory = function(v56) --[[ Line: 196 ]] --[[ Name: getCommandLineHistory ]]
    return v56._commandLineHistory;
end;
v12.getCommandLineIndex = function(v57) --[[ Line: 200 ]] --[[ Name: getCommandLineIndex ]]
    return v57._commandLineIndex;
end;
v12.setCommandLineIndex = function(v58, v59) --[[ Line: 204 ]] --[[ Name: setCommandLineIndex ]]
    v58._commandLineIndex = v59;
end;
v12.getFilters = function(v60) --[[ Line: 208 ]] --[[ Name: getFilters ]]
    return v60._filters;
end;
v12.setFilter = function(v61, v62, v63) --[[ Line: 212 ]] --[[ Name: setFilter ]]
    -- upvalues: v43 (copy)
    local v64 = v61._filters[v62];
    v61._filters[v62] = v63;
    local l__filters_0 = v61._filters;
    local v66 = false;
    for _, v68 in pairs(l__filters_0) do
        v66 = v66 or v68;
    end;
    if not v66 then
        v61._filters[v62] = v64;
        return;
    else
        v43(v61._logDataSearched, v61._logData:iterator(), v61._filters, v61._searchTerm);
        v61._logDataUpdate:Fire(v61._logDataSearched);
        v61._filterUpdated:Fire();
        return;
    end;
end;
v12.setFilters = function(v69, v70) --[[ Line: 231 ]] --[[ Name: setFilters ]]
    -- upvalues: v43 (copy)
    v69._filters = v70;
    local v71 = false;
    for _, v73 in pairs(v70) do
        v71 = v71 or v73;
    end;
    if not v71 then
        v69._logDataSearched:reset();
        v69._logDataUpdate:Fire(v69._logData);
        return;
    else
        v43(v69._logDataSearched, v69._logData:iterator(), v69._filters, v69._searchTerm);
        v69._logDataUpdate:Fire(v69._logDataSearched);
        v69._filterUpdated:Fire();
        return;
    end;
end;
v12.getLogData = function(v74) --[[ Line: 250 ]] --[[ Name: getLogData ]]
    if #v74._logDataSearched:getData() > 0 then
        return v74._logDataSearched;
    else
        return v74._logData;
    end;
end;
v12.getErrorWarningCount = function(v75) --[[ Line: 257 ]] --[[ Name: getErrorWarningCount ]]
    return v75._errorCount, v75._warningCount;
end;
v12.isRunning = function(v76) --[[ Line: 261 ]] --[[ Name: isRunning ]]
    return v76._initialized;
end;
v12.start = function(v77) --[[ Line: 265 ]] --[[ Name: start ]]
    -- upvalues: l_LogService_0 (copy), v19 (copy), v11 (copy), v24 (copy), v28 (copy)
    if v77._isClient then
        if not v77._initialized then
            v77._initialized = true;
            if #{} == 0 then
                local l_l_LogService_0_LogHistory_0 = l_LogService_0:GetLogHistory();
                for _, v80 in ipairs(l_l_LogService_0_LogHistory_0) do
                    local v81 = v19(v80.message or "[DevConsole Error 1]", v11(v80.timestamp), v80.messageType.Value);
                    if not v24(v81) then
                        v77:checkErrorWarningCounter(v80.messageType.Value);
                        v77._logData:push_back(v81);
                    end;
                end;
            end;
        end;
        v77._connection = l_LogService_0.MessageOut:connect(function(v82, v83) --[[ Line: 286 ]]
            -- upvalues: v19 (ref), v11 (ref), v24 (ref), v77 (copy), v28 (ref)
            local v84 = v19(v82 or "[DevConsole Error 2]", v11(os.time()), v83.Value);
            if not v24(v84) then
                v77:checkErrorWarningCounter(v83.Value);
                v77._logData:push_back(v84);
                if #v77._logDataSearched:getData() > 0 then
                    if v28(v84, v77._filters, v77._searchTerm) then
                        v77._logDataSearched:push_back(v84);
                        v77._logDataUpdate:Fire(v77._logDataSearched);
                        return;
                    end;
                else
                    v77._logDataUpdate:Fire(v77._logData);
                end;
            end;
        end);
    else
        v77._connection = l_LogService_0.ServerMessageOut:connect(function(v85, v86, v87) --[[ Line: 308 ]]
            -- upvalues: v19 (ref), v11 (ref), v24 (ref), v77 (copy), v28 (ref)
            local v88 = v19(v85 or "[DevConsole Error 3]", v11(v87), v86.Value);
            if not v24(v88) then
                v77._logData:push_back(v88);
                if #v77._logDataSearched:getData() > 0 then
                    if v28(v88, v77._filters, v77._searchTerm) then
                        v77._logDataSearched:push_back(v88);
                        v77._logDataUpdate:Fire(v77._logDataSearched);
                        return;
                    end;
                else
                    v77._logDataUpdate:Fire(v77._logData);
                end;
            end;
        end);
        l_LogService_0:RequestServerOutput();
    end;
    v77._isRunning = true;
end;
v12.stop = function(v89) --[[ Line: 335 ]] --[[ Name: stop ]]
    v89._initialized = false;
    v89._isRunning = false;
    if v89._connection then
        v89._connection:Disconnect();
    end;
end;
return v12;