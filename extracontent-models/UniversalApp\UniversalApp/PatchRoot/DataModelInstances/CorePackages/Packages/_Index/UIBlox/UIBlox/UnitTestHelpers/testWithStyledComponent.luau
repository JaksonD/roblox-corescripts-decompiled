local l_CoreGui_0 = game:GetService("CoreGui");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v5 = require(l_Parent_2.Roact);
local v6 = require(l_Parent_0.dumpInstanceTree);
local v7 = require(l_Parent_1.Utility.mockStyleComponent);
return function(v8, v9, v10) --[[ Line: 33 ]] --[[ Name: testWithStyledComponent ]]
    -- upvalues: v5 (copy), v7 (copy), l_HttpService_0 (copy), l_CoreGui_0 (copy), v6 (copy)
    local v11 = v5.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        StyleProvider = v7({
            TestComponent = v5.createElement(v8, v9)
        })
    });
    local v12 = ("TestApp-%s"):format(l_HttpService_0:GenerateGUID());
    local v13 = v5.mount(v11, l_CoreGui_0, v12);
    local v14 = ("game.CoreGui.%s.Children.TestComponent"):format(v12);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 46 ]]
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