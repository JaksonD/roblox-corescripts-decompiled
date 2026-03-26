local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = v1.createContext(nil);
return {
    LoaderContext = v2, 
    LoaderProvider = function(v3) --[[ Line: 36 ]] --[[ Name: LoaderProvider ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v4 = v1.useRef({});
        local v5 = v1.useRef(v3.loaders);
        v5.current = v3.loaders;
        v1.useEffect(function() --[[ Line: 41 ]]
            -- upvalues: v3 (copy), v4 (copy)
            if not v3.open then
                v4.current = {};
            end;
        end, {
            v3.open
        });
        local l_current_0 = v1.useRef({
            registryRef = v5, 
            cacheRef = v4
        }).current;
        return v1.createElement(v2.Provider, {
            value = l_current_0
        }, v3.children);
    end, 
    useLoaderContext = function() --[[ Line: 56 ]] --[[ Name: useLoaderContext ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v7 = v1.useContext(v2);
        if not v7 then
            error("useLoaderContext must be used within a <LoaderProvider>");
        end;
        return v7;
    end
};