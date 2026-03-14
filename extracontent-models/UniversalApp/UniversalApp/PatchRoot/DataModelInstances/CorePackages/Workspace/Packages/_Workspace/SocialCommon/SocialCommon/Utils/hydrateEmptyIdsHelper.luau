local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.Promise);
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.LuauPolyfill);
return function(v4) --[[ Line: 18 ]] --[[ Name: hydrateEmptyIdsHelper ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_ids_0 = v4.ids;
    local l_selector_0 = v4.selector;
    local l_hydrate_0 = v4.hydrate;
    if not l_ids_0 then
        return v1.resolve();
    else
        local v9 = v2.List.filter(l_ids_0, function(v8) --[[ Line: 27 ]]
            -- upvalues: l_selector_0 (copy)
            return l_selector_0(v8) == nil;
        end);
        if #v9 > 0 then
            return (l_hydrate_0(v9));
        else
            return (v1.resolve());
        end;
    end;
end;