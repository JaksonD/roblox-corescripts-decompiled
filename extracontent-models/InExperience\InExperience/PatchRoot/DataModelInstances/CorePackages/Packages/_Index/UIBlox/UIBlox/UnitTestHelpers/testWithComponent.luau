local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_FoundationProvider_0 = require(l_Parent_1.Foundation).FoundationProvider;
local v5 = require(l_Parent_1.Roact);
local v6 = require(l_Parent_0.dumpInstanceTree);
local function v8(v7) --[[ Line: 34 ]] --[[ Name: TestApp ]]
    -- upvalues: v5 (copy)
    return v5.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, v7[v5.Children]);
end;
return function(v9, v10) --[[ Line: 40 ]] --[[ Name: testWithComponent ]]
    -- upvalues: v5 (copy), v8 (copy), l_FoundationProvider_0 (copy), l_HttpService_0 (copy), l_CoreGui_0 (copy), v6 (copy)
    local v11 = v5.createElement(v8, nil, {
        FoundationProvider = v5.createElement(l_FoundationProvider_0, {
            theme = "Dark"
        }, {
            TestComponent = v9
        })
    });
    local v12 = ("TestApp-%s"):format(l_HttpService_0:GenerateGUID(false));
    local v13 = v5.mount(v11, l_CoreGui_0, v12);
    local v14 = ("game.CoreGui.%s.TestComponent"):format(v12);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 51 ]]
        -- upvalues: v10 (copy), v14 (copy)
        v10(v14);
    end);
    if not l_status_0 then
        print("Test instance tree:");
        v6(l_CoreGui_0:FindFirstChild(v12));
        print("Test instance tree end\n");
    end;
    v5.unmount(v13);
    if not l_status_0 then
        error(l_result_0);
    end;
end;