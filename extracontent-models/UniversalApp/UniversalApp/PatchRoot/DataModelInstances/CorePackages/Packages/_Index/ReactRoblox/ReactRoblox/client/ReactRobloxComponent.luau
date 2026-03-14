local l_Parent_0 = script.Parent.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local v2 = require(script.Parent.roblox.RobloxComponentProps);
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
return {
    setInitialProperties = v2.setInitialProperties, 
    diffProperties = function(_, _, v6, v7, _) --[[ Line: 32 ]] --[[ Name: diffProperties ]]
        -- upvalues: l_Object_0 (copy)
        local v9 = nil;
        for v10, _ in v6 do
            if v7[v10] == nil then
                v9 = v9 or table.create(2);
                table.insert(v9, v10);
                table.insert(v9, l_Object_0.None);
            end;
        end;
        for v12, v13 in v7 do
            if v13 ~= if v6 ~= nil then v6[v12] else nil then
                v9 = v9 or table.create(2);
                table.insert(v9, v12);
                table.insert(v9, v13);
            end;
        end;
        return v9;
    end, 
    updateProperties = v2.updateProperties, 
    cleanupHostComponent = v2.cleanupHostComponent
};