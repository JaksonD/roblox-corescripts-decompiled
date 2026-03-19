local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAuditSystem);
local l_useState_0 = v2.useState;
local l_useMemo_0 = v2.useMemo;
local l_useContext_0 = v2.useContext;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v11 = v2.createContext({
    capturedAuditContent = {}, 
    additionalAuditContent = {}, 
    setCapturedAuditContentItem = function() --[[ Line: 49 ]] --[[ Name: setCapturedAuditContentItem ]]

    end, 
    removeCapturedAuditContentItem = function() --[[ Line: 50 ]] --[[ Name: removeCapturedAuditContentItem ]]

    end, 
    setAdditionalAuditContentItem = function() --[[ Line: 51 ]] --[[ Name: setAdditionalAuditContentItem ]]

    end, 
    removeAdditionalAuditContentItem = function() --[[ Line: 52 ]] --[[ Name: removeAdditionalAuditContentItem ]]

    end
});
return {
    Context = v11, 
    Provider = function(v12) --[[ Line: 58 ]] --[[ Name: AuditContentProvider ]]
        -- upvalues: l_useState_0 (copy), l_useCallback_0 (copy), v3 (copy), l_dependencyArray_0 (copy), l_useMemo_0 (copy), v2 (copy), v11 (copy)
        local v13, v14 = l_useState_0({});
        local v15, v16 = l_useState_0({});
        local v20 = l_useCallback_0(function(v17, v18) --[[ Line: 62 ]]
            -- upvalues: v14 (copy), v3 (ref)
            v14(function(v19) --[[ Line: 63 ]]
                -- upvalues: v3 (ref), v17 (copy), v18 (copy)
                return (v3.Dictionary.join(v19, {
                    [v17] = v18
                }));
            end);
        end, l_dependencyArray_0(v14));
        local v23 = l_useCallback_0(function(v21) --[[ Line: 71 ]]
            -- upvalues: v14 (copy), v3 (ref)
            v14(function(v22) --[[ Line: 72 ]]
                -- upvalues: v3 (ref), v21 (copy)
                return (v3.Dictionary.join(v22, {
                    [v21] = v3.None
                }));
            end);
        end, l_dependencyArray_0(v14));
        local v27 = l_useCallback_0(function(v24, v25) --[[ Line: 80 ]]
            -- upvalues: v16 (copy), v3 (ref)
            v16(function(v26) --[[ Line: 81 ]]
                -- upvalues: v3 (ref), v24 (copy), v25 (copy)
                return v3.Dictionary.join(v26, {
                    [v24] = v25
                });
            end);
        end, l_dependencyArray_0(v16));
        local v30 = l_useCallback_0(function(v28) --[[ Line: 88 ]]
            -- upvalues: v16 (copy), v3 (ref)
            v16(function(v29) --[[ Line: 89 ]]
                -- upvalues: v3 (ref), v28 (copy)
                return v3.Dictionary.join(v29, {
                    [v28] = v3.None
                });
            end);
        end, l_dependencyArray_0(v16));
        local v31 = l_useMemo_0(function() --[[ Line: 96 ]]
            -- upvalues: v13 (copy), v15 (copy), v20 (copy), v23 (copy), v27 (copy), v30 (copy)
            return {
                capturedAuditContent = v13, 
                additionalAuditContent = v15, 
                setCapturedAuditContentItem = v20, 
                removeCapturedAuditContentItem = v23, 
                setAdditionalAuditContentItem = v27, 
                removeAdditionalAuditContentItem = v30
            };
        end, l_dependencyArray_0(v13, v15));
        return v2.createElement(v11.Provider, {
            value = v31
        }, v12.children);
    end, 
    useCapturedAuditContent = function(v32, v33) --[[ Line: 119 ]] --[[ Name: useCapturedAuditContent ]]
        -- upvalues: l_useContext_0 (copy), v11 (copy), l_useEffect_0 (copy), v4 (copy), l_dependencyArray_0 (copy)
        local v34 = l_useContext_0(v11);
        l_useEffect_0(function() --[[ Line: 123 ]]
            -- upvalues: v4 (ref), v32 (copy), v33 (copy), v34 (copy)
            if not v4() then
                return;
            elseif not v32 or not v33 then
                return;
            else
                v34.setCapturedAuditContentItem(v32, v33);
                return;
            end;
        end, l_dependencyArray_0(v32, v33));
        l_useEffect_0(function() --[[ Line: 136 ]]
            -- upvalues: v4 (ref), v32 (copy), v34 (copy)
            return function() --[[ Line: 137 ]]
                -- upvalues: v4 (ref), v32 (ref), v34 (ref)
                if not v4() then
                    return;
                else
                    if v32 then
                        v34.removeCapturedAuditContentItem(v32);
                    end;
                    return;
                end;
            end;
        end, l_dependencyArray_0(v32));
    end, 
    useAdditionalAuditContent = function(v35, v36) --[[ Line: 156 ]] --[[ Name: useAdditionalAuditContent ]]
        -- upvalues: l_useContext_0 (copy), v11 (copy), l_useEffect_0 (copy), v4 (copy), l_dependencyArray_0 (copy)
        local v37 = l_useContext_0(v11);
        l_useEffect_0(function() --[[ Line: 160 ]]
            -- upvalues: v4 (ref), v35 (copy), v36 (copy), v37 (copy)
            if not v4() then
                return;
            elseif not v35 or not v36 then
                return;
            else
                v37.setAdditionalAuditContentItem(v35, v36);
                return;
            end;
        end, l_dependencyArray_0(v35, v36));
        l_useEffect_0(function() --[[ Line: 173 ]]
            -- upvalues: v4 (ref), v35 (copy), v37 (copy)
            return function() --[[ Line: 174 ]]
                -- upvalues: v4 (ref), v35 (ref), v37 (ref)
                if not v4() then
                    return;
                else
                    if v35 then
                        v37.removeAdditionalAuditContentItem(v35);
                    end;
                    return;
                end;
            end;
        end, l_dependencyArray_0(v35));
    end, 
    useAuditContentContext = function() --[[ Line: 189 ]] --[[ Name: useAuditContentContext ]]
        -- upvalues: l_useContext_0 (copy), v11 (copy)
        local v38 = l_useContext_0(v11);
        return {
            capturedAuditContent = v38.capturedAuditContent, 
            additionalAuditContent = v38.additionalAuditContent, 
            setCapturedAuditContentItem = v38.setCapturedAuditContentItem, 
            removeCapturedAuditContentItem = v38.removeCapturedAuditContentItem, 
            setAdditionalAuditContentItem = v38.setAdditionalAuditContentItem, 
            removeAdditionalAuditContentItem = v38.removeAdditionalAuditContentItem
        };
    end
};