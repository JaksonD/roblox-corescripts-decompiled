local l_Parent_0 = script:FindFirstAncestor("LogReporting").Parent;
local l_FFlagEnableLuaLogReporterMultipleLogs_0 = require(l_Parent_0.SharedFlags).FFlagEnableLuaLogReporterMultipleLogs;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local v3 = Random.new();
local function v8(v4) --[[ Line: 10 ]] --[[ Name: generateHexString ]]
    -- upvalues: v3 (ref)
    local v5 = "";
    for _ = 1, v4 do
        local v7 = v3:NextInteger(1, 16);
        v5 = v5 .. string.sub("0123456789abcdef", v7, v7);
    end;
    return v5;
end;
local function _(v9) --[[ Line: 20 ]] --[[ Name: setHexStringSeed ]]
    -- upvalues: v3 (ref)
    v3 = Random.new(v9);
end;
local function v21(v11, v12, v13) --[[ Line: 24 ]] --[[ Name: generateLogMetadata ]]
    -- upvalues: v3 (ref), v8 (copy), l_Base64_0 (copy)
    local v14 = math.floor(tick() * 1000 + v11);
    v3 = Random.new(v14);
    local v15 = v8(10);
    local v16 = string.format("%s-%s-%s-%s-%s", v8(8), v8(4), v8(4), v8(4), (v8(12)));
    local v17 = v8(64);
    local v18 = {
        reportId = v15, 
        userId = v11 and tostring(v11) or "", 
        placeId = tostring(v12), 
        voiceEnabled = v13
    };
    local v19 = string.format("https://console.backtrace.rbx.com/p/LogReports/debug?time=hour&filters=%s", l_Base64_0.Encode("[[\"reportId\",\"equal\",\"" .. v15 .. "\"]]"):sub(0, -2));
    local v20 = l_Base64_0.Encode(v17):sub(0, -2);
    return {
        url = v19, 
        reportId = v15, 
        fingerprint = v20, 
        uuid = v16, 
        desc = "clientDump", 
        attributes = v18
    };
end;
return function(v22, v23, v24, v25) --[[ Line: 70 ]] --[[ Name: reportDeviceLogs ]]
    -- upvalues: v21 (copy), l_FFlagEnableLuaLogReporterMultipleLogs_0 (copy)
    local v26 = v21(v23, v24, v25);
    if l_FFlagEnableLuaLogReporterMultipleLogs_0 and game:GetEngineFeature("LogReporterMultipleLogs") then
        v22:ReportMultipleLogs(v26.fingerprint, v26.uuid, v26.desc, v26.attributes, {}, 2);
    else
        v22:ReportLog(v26.fingerprint, v26.uuid, v26.desc, v26.attributes, {});
    end;
    return {
        url = v26.url, 
        reportId = v26.reportId
    };
end;