local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Stores.createItemSelectionStore);
local v4 = v2.createContext(nil);
return {
    Provider = function(v5) --[[ Line: 20 ]] --[[ Name: ItemSelectionStoreProvider ]]
        -- upvalues: v2 (copy), v3 (copy), v4 (copy)
        local v6 = v2.useMemo(function() --[[ Line: 22 ]]
            -- upvalues: v3 (ref)
            return v3();
        end, {});
        return v2.createElement(v4.Provider, {
            value = v6
        }, v5.children);
    end, 
    useItemSelectionStore = function() --[[ Line: 29 ]] --[[ Name: useItemSelectionStore ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v7 = v2.useContext(v4);
        if not v7 then
            error("useItemSelectionStore must be used within an ItemSelectionStoreProvider");
        end;
        return v7;
    end
};