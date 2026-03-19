local l_Parent_0 = script:FindFirstAncestor("RoactUtils").Parent;
local v1 = require(l_Parent_0.RoactRodux);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_act_0 = v3.act;
return function(v5, v6, v7) --[[ Line: 12 ]] --[[ Name: renderHookWithStore ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), l_act_0 (copy)
    local v8 = {};
    local function v10(v9) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), v6 (copy)
        v8.current = v6(v9);
        return nil;
    end;
    local function v13(v11) --[[ Line: 20 ]] --[[ Name: createRootElement ]]
        -- upvalues: v2 (ref), v10 (copy), v5 (copy), v1 (ref)
        local v12 = v2.createElement(v10, v11);
        if v5 ~= nil then
            v12 = v2.createElement(v1.StoreProvider, {
                store = v5
            }, {
                Wrapper = v12
            });
        end;
        return v12;
    end;
    local l_Frame_0 = Instance.new("Frame");
    local v15 = v3.createRoot(l_Frame_0);
    l_act_0(function() --[[ Line: 35 ]]
        -- upvalues: v15 (copy), v13 (copy), v7 (copy)
        v15:render((v13(v7 or {})));
    end);
    local function v17(v16) --[[ Line: 39 ]] --[[ Name: rerender ]]
        -- upvalues: l_act_0 (ref), v15 (copy), v13 (copy)
        l_act_0(function() --[[ Line: 40 ]]
            -- upvalues: v15 (ref), v13 (ref), v16 (copy)
            v15:render((v13(v16)));
        end);
    end;
    return {
        result = v8, 
        rerender = v17, 
        cleanup = function() --[[ Line: 45 ]] --[[ Name: cleanup ]]
            -- upvalues: v15 (copy)
            v15:unmount();
        end
    };
end;