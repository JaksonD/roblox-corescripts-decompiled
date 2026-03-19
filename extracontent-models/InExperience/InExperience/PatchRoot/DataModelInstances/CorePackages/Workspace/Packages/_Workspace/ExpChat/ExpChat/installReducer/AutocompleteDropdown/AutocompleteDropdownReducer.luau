local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.AutocompleteDropdownActivated);
local v6 = require(l_Actions_0.AutocompleteDropdownResultsChanged);
local v7 = require(l_Actions_0.AutocompleteDropdownSelectionChanged);
local v8 = require(l_Actions_0.AutocompleteDropdownTypeChanged);
local v9 = require(l_Actions_0.AutocompleteDropdownDeactivated);
local v10 = {
    activated = false, 
    results = {}, 
    selectedIndex = 1, 
    autocompleteType = "none"
};
return v2.createReducer(v10, {
    [v5.name] = function(v11, v12) --[[ Line: 28 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v11, {
            activated = v12.activated
        });
    end, 
    [v6.name] = function(v13, v14) --[[ Line: 31 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v13, {
            results = v14.results, 
            selectedIndex = 1
        });
    end, 
    [v7.name] = function(v15, v16) --[[ Line: 40 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v15, {
            selectedIndex = v16.selectedIndex
        });
    end, 
    [v8.name] = function(v17, v18) --[[ Line: 46 ]]
        -- upvalues: l_Dictionary_0 (copy)
        if v18.autocompleteType ~= v17.autocompleteType then
            return l_Dictionary_0.join(v17, {
                autocompleteType = v18.autocompleteType, 
                activated = false, 
                results = {}, 
                selectedIndex = 1
            });
        else
            return v17;
        end;
    end, 
    [v9.name] = function(v19, _) --[[ Line: 57 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v19, {
            autocompleteType = "none", 
            activated = false, 
            results = {}, 
            selectedIndex = 1
        });
    end
});