local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.ArgCheck);
local v4 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v7 = require(l_Modules_0.LuaApp.Http.HttpError);
local v8 = require(l_Modules_0.LuaApp.Http.HttpResponse);
local v24 = {
    simpleSuccessRequest = function(v9) --[[ Line: 19 ]] --[[ Name: simpleSuccessRequest ]]
        -- upvalues: v4 (copy), v8 (copy), l_StatusCodes_0 (copy)
        assert(v9 ~= nil, "Expected responseBody not to be nil");
        return function(v10, _, _) --[[ Line: 23 ]]
            -- upvalues: v4 (ref), v8 (ref), v9 (copy), l_StatusCodes_0 (ref)
            return v4.resolve(v8.new(v10, v9, 0, l_StatusCodes_0.OK));
        end;
    end, 
    simpleOngoingRequest = function() --[[ Line: 28 ]] --[[ Name: simpleOngoingRequest ]]
        -- upvalues: v4 (copy)
        return function(_, _, _) --[[ Line: 30 ]]
            -- upvalues: v4 (ref)
            return v4.new(function(_, _) --[[ Line: 31 ]]

            end);
        end;
    end, 
    simpleFailRequest = function(v18, v19, v20) --[[ Line: 37 ]] --[[ Name: simpleFailRequest ]]
        -- upvalues: v4 (copy), v7 (copy)
        assert(v18 ~= nil, "Expected errKind not to be nil");
        if v19 == nil then
            v19 = "Fake request failed";
        end;
        assert(v19, "Cannot be nil");
        return function(v21, _, _) --[[ Line: 44 ]]
            -- upvalues: v4 (ref), v7 (ref), v18 (copy), v19 (ref), v20 (copy)
            return v4.reject(v7.new(v21, v18, v19, v20));
        end;
    end
};
v24.failThenSuccessRequests = function(v25, v26, v27, v28, v29) --[[ Line: 49 ]] --[[ Name: failThenSuccessRequests ]]
    -- upvalues: v24 (copy)
    if not v27 then
        v27 = 1;
    end;
    local v30 = 0;
    return function(v31, v32, v33) --[[ Line: 61 ]]
        -- upvalues: v30 (ref), v27 (ref), v24 (ref), v26 (copy), v28 (copy), v29 (copy), v25 (copy)
        if v30 < v27 then
            v30 = v30 + 1;
            return v24.simpleFailRequest(v26, v28, v29)(v31, v32, v33);
        else
            return v24.simpleSuccessRequest(v25)(v31, v32, v33);
        end;
    end;
end;
local v34 = v2.interface({
    url = v2.string, 
    usePatterns = v2.optional(v2.boolean), 
    request = v2.callback
});
local v35 = v2.tuple(v2.array(v34), v2.string);
local function v41(v36, v37) --[[ Line: 89 ]] --[[ Name: _getRequestCallbackForUrl ]]
    -- upvalues: v3 (copy), v35 (copy)
    v3.assert(v35(v36, v37));
    for _, v39 in ipairs(v36) do
        local _ = nil;
        if if v39.usePatterns then v37:match(v39.url) else v37:find(v39.url, nil, true) then
            return v39.request;
        end;
    end;
    return nil;
end;
local v42 = v2.array(v34);
v24.mockEndpoints = function(v43) --[[ Line: 132 ]] --[[ Name: mockEndpoints ]]
    -- upvalues: v3 (copy), v42 (copy), v41 (copy)
    v3.assert(v42(v43));
    return function(v44, v45, v46) --[[ Line: 135 ]]
        -- upvalues: v41 (ref), v43 (copy)
        local v47 = v41(v43, v44);
        assert(v47, ("Url %q needs a request associated with it. (mockEndpoints requires all APIs to be mocked)"):format(v44));
        return v47(v44, v45, v46);
    end;
end;
return v24;