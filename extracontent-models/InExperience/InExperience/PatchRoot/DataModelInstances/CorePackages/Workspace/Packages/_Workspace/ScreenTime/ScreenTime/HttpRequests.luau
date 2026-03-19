local l_Parent_0 = script:FindFirstAncestor("ScreenTime").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v4 = require(l_Parent_0.ArgCheck);
local v5 = {
    GET_INSTRUCTIONS = "timed-entertainment-allowance/v1/instructions", 
    REPORT_EXECUTION = "timed-entertainment-allowance/v1/reportExecute"
};
local v6 = {
    GET_INSTRUCTIONS = {
        errorCode = "number", 
        instructions = "table"
    }, 
    INSTRUCTION = {
        type = "number", 
        instructionName = "string", 
        serialId = "string", 
        title = "string", 
        message = "string", 
        url = "string", 
        modalType = "number", 
        data = "string"
    }, 
    REPORT_EXECUTION = {
        errorCode = "number"
    }
};
local v7 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = v5.GET_INSTRUCTIONS
})();
local v8 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = v5.REPORT_EXECUTION
})();
local v9 = l_UrlBuilder_0.new({
    base = l_Url_0.AUTH_URL, 
    path = "v1/logout"
})();
local function v14(v10, v11) --[[ Line: 60 ]] --[[ Name: checkFormat ]]
    for v12, v13 in pairs(v10) do
        assert(v11[v12] ~= nil, "Missing key");
        assert(type(v11[v12]) == v13, "Wrong type");
    end;
end;
return {
    httpService = nil, 
    new = function(v15, v16) --[[ Line: 77 ]] --[[ Name: new ]]
        -- upvalues: v4 (copy)
        v4.isNotNil(v16, "httpService");
        local v17 = {
            httpService = v16
        };
        setmetatable(v17, v15);
        v15.__index = v15;
        return v17;
    end, 
    getInstructions = function(v18, v19) --[[ Line: 99 ]] --[[ Name: getInstructions ]]
        -- upvalues: v4 (copy), v7 (copy), v14 (copy), v6 (copy), l_Logging_0 (copy)
        v4.isNotNil(v18.httpService, "httpService");
        v4.isNotNil(v19, "callback");
        v18.httpService:RequestInternal({
            Url = v7, 
            Method = "GET"
        }):Start(function(v20, v21) --[[ Line: 106 ]]
            -- upvalues: v18 (copy), v14 (ref), v6 (ref), l_Logging_0 (ref), v7 (ref), v19 (copy)
            local v22 = nil;
            local v23 = nil;
            local v24 = false;
            local v25 = {};
            if not v20 then
                v22 = false;
                v23 = "Connection error";
            elseif v21.StatusCode == 401 then
                v22 = false;
                v24 = true;
                v23 = "Unauthorized";
            elseif v21.StatusCode < 200 or v21.StatusCode >= 400 then
                v22 = false;
                v23 = "Status code: " .. v21.StatusCode;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 123 ]]
                    -- upvalues: v18 (ref), v21 (copy), v14 (ref), v6 (ref), v25 (ref)
                    local v26 = v18.httpService:JSONDecode(v21.Body);
                    v14(v6.GET_INSTRUCTIONS, v26);
                    assert(v26.errorCode == 0, "Error code is not 0");
                    for _, v28 in ipairs(v26.instructions) do
                        v14(v6.INSTRUCTION, v28);
                    end;
                    v25 = v26.instructions;
                end);
                v22 = l_status_0;
                v23 = l_result_0;
            end;
            if not v22 then
                l_Logging_0.warn("HttpRequests" .. " getInstructions failed: " .. v7 .. ", " .. v23);
            end;
            v19(v22, v24, v25);
        end);
    end, 
    reportExecution = function(v31, v32, v33, v34) --[[ Line: 148 ]] --[[ Name: reportExecution ]]
        -- upvalues: v4 (copy), v8 (copy), v14 (copy), v6 (copy), l_Logging_0 (copy)
        v4.isNotNil(v31.httpService, "httpService");
        local v35 = os.date("%Y-%m-%dT%H:%M:%SZ");
        local v36 = v31.httpService:JSONEncode({
            instructionName = v32, 
            serialId = v33, 
            execTime = v35
        });
        v31.httpService:RequestInternal({
            Url = v8, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json"
            }, 
            Body = v36
        }):Start(function(v37, v38) --[[ Line: 165 ]]
            -- upvalues: v31 (copy), v14 (ref), v6 (ref), l_Logging_0 (ref), v8 (ref), v34 (copy)
            local v39 = nil;
            local v40 = nil;
            if not v37 then
                v39 = false;
                v40 = "Connection error";
            elseif v38.StatusCode < 200 and v38.StatusCode >= 400 then
                v39 = false;
                v40 = "Status code: " .. v38.StatusCode;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 176 ]]
                    -- upvalues: v31 (ref), v38 (copy), v14 (ref), v6 (ref)
                    local v41 = v31.httpService:JSONDecode(v38.Body);
                    v14(v6.REPORT_EXECUTION, v41);
                    assert(v41.errorCode == 0, "Error code is not 0");
                end);
                v39 = l_status_1;
                v40 = l_result_1;
            end;
            if not v39 then
                l_Logging_0.warn("HttpRequests" .. " reportExecution failed: " .. v8 .. ", " .. v40);
            end;
            if v34 ~= nil then
                v34(v39);
            end;
        end);
    end, 
    logout = function(v44) --[[ Line: 191 ]] --[[ Name: logout ]]
        -- upvalues: v4 (copy), v9 (copy)
        v4.isNotNil(v44.httpService, "httpService");
        local v45 = v44.httpService:RequestInternal({
            Url = v9, 
            Method = "POST", 
            Headers = {
                ["Content-Type"] = "application/json"
            }, 
            Body = ""
        });
        pcall(function() --[[ Line: 201 ]]
            -- upvalues: v45 (copy)
            v45:Start(function(_, _) --[[ Line: 202 ]]

            end);
        end);
    end
};