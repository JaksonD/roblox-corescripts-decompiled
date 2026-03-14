local l_Parent_0 = script:FindFirstAncestor("ChallengeDialog").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local v3 = require(l_Parent_0.Rodux);
local v4 = v3.Store.new(function() --[[ Line: 8 ]]
    return {};
end, {}, {
    v3.thunkMiddleware
});
return {
    createTreeWithProviders = function(v5, v6, v7) --[[ Line: 12 ]]
        -- upvalues: v1 (copy), v2 (copy), v4 (copy)
        local v8 = v1.createFragment({
            storeProvider = v1.createElement(v2.StoreProvider, {
                store = if v7 ~= nil then v7 else v4
            }, {
                myElement = v1.createElement(v5, v6)
            })
        });
        local v9 = v1.mount(v8);
        return v9, function() --[[ Line: 23 ]]
            -- upvalues: v1 (ref), v9 (copy)
            v1.unmount(v9);
        end;
    end
};