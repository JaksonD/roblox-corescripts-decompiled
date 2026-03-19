local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v4 = {};
local function v10(v5, v6) --[[ Line: 12 ]] --[[ Name: mapValues ]]
    local v7 = {};
    for v8, v9 in pairs(v5) do
        v7[v8] = v6(v9, v8);
    end;
    return v7;
end;
local function _(v11, v12) --[[ Line: 20 ]] --[[ Name: transformInput ]]
    -- upvalues: v10 (copy)
    if type(v12._collectionFormat) ~= "table" then
        return v11;
    else
        return (v10(v11, function(v13, v14) --[[ Line: 24 ]]
            -- upvalues: v12 (copy)
            if v12._collectionFormat[v14] == "csv" then
                return table.concat(v13, ",");
            else
                return v13;
            end;
        end));
    end;
end;
local function v21(v16, v17) --[[ Line: 33 ]] --[[ Name: getBody ]]
    -- upvalues: l_HttpService_0 (copy)
    local v18 = nil;
    if type(v17) == "table" then
        v18 = {};
        for _, v20 in ipairs(v17) do
            v18[v20] = v16[v20];
            if v18[v20] == nil then
                v18[v20] = "##NULL##TOKEN##";
            end;
        end;
    elseif type(v17) == "string" then
        v18 = v16[v17];
    else
        return nil;
    end;
    v18 = l_HttpService_0:JSONEncode(v18);
    return (string.gsub(v18, "\"##NULL##TOKEN##\"", "null"));
end;
v4.endpoint = function(v22, v23) --[[ Line: 55 ]] --[[ Name: endpoint ]]
    -- upvalues: v2 (copy), v10 (copy), v3 (copy), v21 (copy)
    return function(v24, v25) --[[ Line: 56 ]]
        -- upvalues: v2 (ref), v22 (copy), v23 (copy), v10 (ref), v3 (ref), v21 (ref)
        v2.matchesInterface(v25, v22.input, "input", v23);
        local l_v25_0 = v25;
        local l_input_0 = v22.input;
        local l_l_input_0_0 = l_input_0 --[[ copy: 3 -> 4 ]];
        v25 = if type(l_input_0._collectionFormat) ~= "table" then l_v25_0 else v10(l_v25_0, function(v29, v30) --[[ Line: 24 ]]
            -- upvalues: l_l_input_0_0 (copy)
            if l_l_input_0_0._collectionFormat[v30] == "csv" then
                return table.concat(v29, ",");
            else
                return v29;
            end;
        end);
        l_v25_0 = v3.fromString(v22.url)(v25);
        l_input_0 = {};
        if v22.body then
            l_input_0.postBody = v21(v25, v22.body);
        end;
        return v24(l_v25_0, v22.method, l_input_0):andThen(function(v31) --[[ Line: 64 ]]
            -- upvalues: v2 (ref), v22 (ref), v23 (ref)
            v2.matchesInterface(v31.responseBody, v22.output, "output", v23);
            return v31;
        end);
    end;
end;
v4.new = function(v32) --[[ Line: 71 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v4 (copy)
    local l_definitions_0 = v32.definitions;
    return (v10(v32.endpoints, function(v34) --[[ Line: 74 ]]
        -- upvalues: v4 (ref), l_definitions_0 (copy)
        return v4.endpoint(v34, l_definitions_0);
    end));
end;
return v4;