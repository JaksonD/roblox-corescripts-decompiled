local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PolicyProvider);
local l_Logger_0 = v1.Logger;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.PolicyTypes);
local function v11(v6, v7) --[[ Line: 15 ]] --[[ Name: mergePolicies ]]
    -- upvalues: v4 (copy)
    local v8 = {};
    for _, v10 in ipairs(v7) do
        v8 = v4.Dictionary.join(v8, v10(v6));
    end;
    return v8;
end;
return function(v12) --[[ Line: 25 ]]
    -- upvalues: v3 (copy), v1 (copy), v11 (copy), l_Logger_0 (copy)
    assert(v12, "expected getPolicyImpl");
    return function(v13) --[[ Line: 28 ]] --[[ Name: useAppPolicy ]]
        -- upvalues: v3 (ref), v1 (ref), v11 (ref), v12 (copy), l_Logger_0 (ref)
        local v14 = v3.useContext(v1.AppPolicyContext);
        assert(v14, "Not a descendent of PolicyProvider");
        local function v16() --[[ Line: 32 ]] --[[ Name: getInitialPolicy ]]
            -- upvalues: v14 (copy), v11 (ref), v12 (ref), l_Logger_0 (ref)
            if v14.staticExternalPolicy then
                return (v11(v14.staticExternalPolicy, v14.presentationPolicy));
            else
                local v15 = v12.read();
                if v15 then
                    return (v11(v15, v14.presentationPolicy));
                else
                    l_Logger_0:trace("No app policy data available");
                    return (v11({}, v14.presentationPolicy));
                end;
            end;
        end;
        local v17, v18 = v3.useState(v16);
        v3.useEffect(function() --[[ Line: 50 ]]
            -- upvalues: v14 (copy), v12 (ref), l_Logger_0 (ref), v18 (copy), v11 (ref)
            local v19 = nil;
            if not v14.staticExternalPolicy then
                v19 = v12.onPolicyChanged(function(v20) --[[ Line: 53 ]]
                    -- upvalues: l_Logger_0 (ref), v18 (ref), v11 (ref), v14 (ref)
                    l_Logger_0:trace("Received policy update");
                    v18((v11(v20, v14.presentationPolicy)));
                end);
            end;
            return function() --[[ Line: 59 ]]
                -- upvalues: v19 (ref)
                if v19 then
                    v19:Disconnect();
                end;
            end;
        end, {
            v14
        });
        return v13(v17);
    end;
end;