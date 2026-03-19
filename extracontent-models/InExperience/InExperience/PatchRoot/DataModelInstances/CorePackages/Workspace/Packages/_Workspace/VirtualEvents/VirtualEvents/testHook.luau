local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.withMockProviders);
return function(v4) --[[ Line: 7 ]] --[[ Name: testHook ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    local v6 = v2.createRoot(l_ScreenGui_0);
    local v7 = v3({
        HookTester = v1.createElement(function() --[[ Line: 11 ]] --[[ Name: HookTester ]]
            -- upvalues: v4 (copy)
            v4();
            return nil;
        end)
    });
    v2.act(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v7 (copy)
        v6:render(v7);
    end);
end;