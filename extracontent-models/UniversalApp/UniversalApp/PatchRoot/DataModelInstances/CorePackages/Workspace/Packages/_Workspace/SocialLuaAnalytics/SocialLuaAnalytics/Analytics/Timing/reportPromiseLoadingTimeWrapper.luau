local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_EventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).EventTypes;
local _ = require(l_Parent_0.LuauPolyfill);
local v6 = require(script.Parent.Timers);
return function(v7, v8, v9) --[[ Line: 54 ]] --[[ Name: reportPromiseLoadingTimeWrapper ]]
    -- upvalues: v6 (copy), l_EventTypes_0 (copy), l_RetrievalStatus_0 (copy), v2 (copy)
    return function(...) --[[ Line: 59 ]] --[[ Name: reportPromiseLoadingTime ]]
        -- upvalues: v6 (ref), v9 (copy), v8 (copy), l_EventTypes_0 (ref), v7 (copy), l_RetrievalStatus_0 (ref), v2 (ref)
        local v10 = {
            ...
        };
        local v11 = v6();
        local v12 = v11.start();
        local function v17(v13, v14) --[[ Line: 65 ]]
            -- upvalues: v9 (ref), v11 (copy), v12 (copy), v8 (ref), v10 (copy), l_EventTypes_0 (ref)
            if v9 and v9.fireEvent then
                local v15 = v11.stop(v12);
                local v16 = v8(unpack(v10)) or {};
                v9.fireEvent(l_EventTypes_0.LoadingTime, {
                    fetch = v16.fetch, 
                    nextPage = v16.nextPage, 
                    status = v13, 
                    result = v14
                }, v15);
            end;
        end;
        return v7(...):andThen(function(v18) --[[ Line: 80 ]]
            -- upvalues: v17 (copy), l_RetrievalStatus_0 (ref)
            pcall(function() --[[ Line: 81 ]]
                -- upvalues: v17 (ref), l_RetrievalStatus_0 (ref), v18 (copy)
                v17(l_RetrievalStatus_0.Done, v18);
            end);
            return v18;
        end):catch(function(v19) --[[ Line: 86 ]]
            -- upvalues: v17 (copy), l_RetrievalStatus_0 (ref), v2 (ref)
            pcall(function() --[[ Line: 87 ]]
                -- upvalues: v17 (ref), l_RetrievalStatus_0 (ref)
                v17(l_RetrievalStatus_0.Failed);
            end);
            return v2.reject(v19);
        end);
    end;
end;