local l_Parent_0 = script:FindFirstAncestor("MarkdownCore").Parent;
local v1 = require(l_Parent_0.Dev.JestGlobals);
local l_beforeAll_0 = v1.beforeAll;
local l_expect_0 = v1.expect;
local l_jest_0 = v1.jest;
local function v17(_, v6, v7) --[[ Line: 7 ]] --[[ Name: toWarnWith ]]
    -- upvalues: l_jest_0 (copy), l_expect_0 (copy)
    local v8 = false;
    local v9 = "";
    local v13 = l_jest_0.spyOn(l_jest_0.globalEnv, "warn").mockImplementation(function(v10) --[[ Line: 10 ]]
        -- upvalues: l_expect_0 (ref), v7 (copy), v8 (ref), v9 (ref)
        print("WARN", v10);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
            -- upvalues: l_expect_0 (ref), v10 (copy), v7 (ref)
            l_expect_0(v10).toEqual(v7);
        end);
        if l_status_0 then
            v8 = true;
            v9 = l_result_0;
        end;
    end);
    local l_status_1, l_result_1 = pcall(v6);
    if not l_status_1 then
        v13:mockRestore();
        error(l_result_1);
    end;
    local v16 = nil;
    v16 = v8 and function() --[[ Line: 29 ]]
        -- upvalues: v7 (copy), v9 (ref)
        return (("Expected never to warn with string containing \"%*\" but got \"%*\""):format(v7, v9));
    end or function() --[[ Line: 33 ]]
        -- upvalues: v7 (copy)
        return (("Expected to warn with string containing \"%*\" but did not find a match"):format(v7));
    end;
    v13:mockRestore();
    return {
        message = v16, 
        pass = v8
    };
end;
local function v26(_, v19) --[[ Line: 44 ]] --[[ Name: toWarn ]]
    -- upvalues: l_jest_0 (copy)
    local v20 = 0;
    local v22 = l_jest_0.spyOn(l_jest_0.globalEnv, "warn").mockImplementation(function(v21) --[[ Line: 46 ]]
        -- upvalues: v20 (ref)
        print("WARN", v21);
        v20 = v20 + 1;
    end);
    local l_status_2, l_result_2 = pcall(v19);
    if not l_status_2 then
        v22:mockRestore();
        error(l_result_2);
    end;
    local v25 = nil;
    v25 = v20 > 0 and function() --[[ Line: 59 ]]
        -- upvalues: v20 (ref)
        return (("Expected never to warn but got %* warnings"):format(v20));
    end or function() --[[ Line: 63 ]]
        return "Expected to warn but never did";
    end;
    v22:mockRestore();
    return {
        message = v25, 
        pass = v20 > 0
    };
end;
l_beforeAll_0(function() --[[ Line: 75 ]]
    -- upvalues: l_expect_0 (copy), v17 (copy), v26 (copy)
    l_expect_0.extend({
        toWarnWith = v17, 
        toWarn = v26
    });
end);