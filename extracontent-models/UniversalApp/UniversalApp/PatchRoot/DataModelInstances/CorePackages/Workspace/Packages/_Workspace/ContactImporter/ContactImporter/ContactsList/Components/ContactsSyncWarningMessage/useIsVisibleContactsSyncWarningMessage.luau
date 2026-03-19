local l_Parent_0 = script:FindFirstAncestor("ContactImporter").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.ContactsSyncWarningCache);
local v3 = game:DefineFastInt("ContactsSyncWarningImpressionsCountCap", 1);
local function v6() --[[ Line: 9 ]] --[[ Name: isMessageHiddenInitState ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v4 = v2.getValue() or 0;
    local v5 = true;
    if v4 >= 0 then
        v5 = v3 <= v4;
    end;
    return v5;
end;
return function() --[[ Line: 14 ]] --[[ Name: useIsVisibleContactsSyncWarningMessage ]]
    -- upvalues: v1 (copy), v6 (copy), v2 (copy)
    local v7 = v1.useState(v6);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v2 (ref)
        if not v7 then
            v2.incrementValue();
        end;
    end, {
        v7
    });
    return not v7;
end;