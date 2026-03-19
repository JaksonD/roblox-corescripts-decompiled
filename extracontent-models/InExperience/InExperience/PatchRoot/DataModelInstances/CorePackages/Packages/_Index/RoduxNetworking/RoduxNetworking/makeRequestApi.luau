local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.makeActionCreator);
local v2 = require(l_Parent_0.RequestBuilder);
local v3 = require(l_Parent_0.NetworkStatus);
local v4 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.Types);
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), v2 (copy)
    local l_keyPath_0 = v6.keyPath;
    local l_killRequestWithFilteredIds_0 = v6.killRequestWithFilteredIds;
    local v10 = v3({
        keyPath = l_keyPath_0, 
        killRequestWithFilteredIds = l_killRequestWithFilteredIds_0
    });
    return function(v11, v12) --[[ Line: 21 ]]
        -- upvalues: v1 (ref), v4 (ref), v2 (ref), v10 (copy), v6 (copy), v7 (copy)
        local v13 = v1(v11);
        local v14 = nil;
        local function v18(v15, v16) --[[ Line: 25 ]]
            -- upvalues: v14 (ref), v4 (ref)
            if v16.mockNetworkImpl then
                error("Request already mocked - you may need to call `Mock.clear` between tests/uses");
            end;
            if type(v15) ~= "function" and type(v15) ~= v16.defaultType then
                error(v16.argumentName .. " must be a " .. v16.defaultType .. " or function");
            end;
            v14 = function(...) --[[ Line: 39 ]]
                -- upvalues: v15 (copy), v4 (ref), v16 (copy)
                local v17 = type(v15) == "function" and v15(...) or v15;
                return v4[v16.defaultResolveMethod](v17);
            end;
        end;
        local function v31(v19, ...) --[[ Line: 46 ]]
            -- upvalues: v12 (copy), v2 (ref), v10 (ref), v14 (ref), v6 (ref), v7 (ref), v13 (copy), v4 (ref)
            local v22 = v12(function(v20, v21) --[[ Line: 47 ]]
                -- upvalues: v2 (ref)
                return v2.new(v20, v21);
            end, v19, ...);
            return function(v23) --[[ Line: 51 ]]
                -- upvalues: v10 (ref), v22 (copy), v14 (ref), v6 (ref), v7 (ref), v13 (ref), v4 (ref)
                return v10.setStatus(v23, v22:getIds(), v22:makeKeyMapper(), function(v24, v25) --[[ Line: 52 ]]
                    -- upvalues: v14 (ref), v6 (ref), v22 (ref), v7 (ref), v13 (ref), v4 (ref)
                    local v26 = v14 or v6.networkImpl;
                    local v27 = v22:makeOptions();
                    local v28 = v22:getNamedIds();
                    return v26(v22:makeUrl(v25), v7, v27):andThen(function(v29) --[[ Line: 58 ]]
                        -- upvalues: v24 (copy), v13 (ref), v25 (copy), v28 (copy), v27 (copy), v22 (ref)
                        v24:dispatch(v13.Succeeded(v25, v29.responseBody, v28, v27, v22:getAdditionalData()));
                        return v29;
                    end, function(v30) --[[ Line: 62 ]]
                        -- upvalues: v24 (copy), v13 (ref), v25 (copy), v28 (copy), v27 (copy), v22 (ref), v4 (ref)
                        v24:dispatch(v13.Failed(v25, v30, v28, v27, v22:getAdditionalData()));
                        return v4.reject(v30);
                    end);
                end);
            end;
        end;
        local function v37(v32, v33) --[[ Line: 72 ]]
            -- upvalues: v12 (copy), v2 (ref), v10 (ref)
            local v36 = v12(function(v34, v35) --[[ Line: 73 ]]
                -- upvalues: v2 (ref)
                return v2.new(v34, v35);
            end, v33):makeKeyMapper()(v33);
            return v10.getStatus(v32, v36);
        end;
        return {
            Mock = {
                reply = function(v38) --[[ Line: 84 ]] --[[ Name: reply ]]
                    -- upvalues: v18 (copy), v14 (ref)
                    return v18(v38, {
                        defaultResolveMethod = "resolve", 
                        argumentName = "mockResponse", 
                        defaultType = "table", 
                        mockNetworkImpl = v14
                    });
                end, 
                replyWithError = function(v39) --[[ Line: 93 ]] --[[ Name: replyWithError ]]
                    -- upvalues: v18 (copy), v14 (ref)
                    return v18(v39, {
                        defaultResolveMethod = "reject", 
                        argumentName = "mockError", 
                        defaultType = "string", 
                        mockNetworkImpl = v14
                    });
                end, 
                clear = function() --[[ Line: 102 ]] --[[ Name: clear ]]
                    -- upvalues: v14 (ref)
                    v14 = nil;
                end
            }, 
            getStatus = v37, 
            API = v31, 
            Succeeded = v13.Succeeded, 
            Failed = v13.Failed
        };
    end;
end;