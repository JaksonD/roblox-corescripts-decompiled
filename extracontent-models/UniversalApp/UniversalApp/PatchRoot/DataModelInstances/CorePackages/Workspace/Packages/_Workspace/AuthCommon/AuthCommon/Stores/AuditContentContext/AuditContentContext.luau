local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableAuditSystem);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useState_0 = v2.useState;
local l_useMemo_0 = v2.useMemo;
local l_useContext_0 = v2.useContext;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v12 = v2.createContext({
    capturedAuditContent = {}, 
    additionalAuditContent = {}, 
    setCapturedAuditContentItem = function() --[[ Line: 52 ]] --[[ Name: setCapturedAuditContentItem ]]

    end, 
    removeCapturedAuditContentItem = function() --[[ Line: 53 ]] --[[ Name: removeCapturedAuditContentItem ]]

    end, 
    setAdditionalAuditContentItem = function() --[[ Line: 54 ]] --[[ Name: setAdditionalAuditContentItem ]]

    end, 
    removeAdditionalAuditContentItem = function() --[[ Line: 55 ]] --[[ Name: removeAdditionalAuditContentItem ]]

    end
});
return {
    Context = v12, 
    Provider = function(v13) --[[ Line: 61 ]] --[[ Name: AuditContentProvider ]]
        -- upvalues: l_useState_0 (copy), l_useCallback_0 (copy), v3 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useMemo_0 (copy), v2 (copy), v12 (copy)
        local v14, v15 = l_useState_0({});
        local v16, v17 = l_useState_0({});
        local v21 = l_useCallback_0(function(v18, v19) --[[ Line: 66 ]]
            -- upvalues: v15 (copy), v3 (ref)
            v15(function(v20) --[[ Line: 67 ]]
                -- upvalues: v3 (ref), v18 (copy), v19 (copy)
                return (v3.Dictionary.join(v20, {
                    [v18] = v19
                }));
            end);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v15
        } else l_dependencyArray_0(v15));
        local v24 = l_useCallback_0(function(v22) --[[ Line: 80 ]]
            -- upvalues: v15 (copy), v3 (ref)
            v15(function(v23) --[[ Line: 81 ]]
                -- upvalues: v3 (ref), v22 (copy)
                return (v3.Dictionary.join(v23, {
                    [v22] = v3.None
                }));
            end);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v15
        } else l_dependencyArray_0(v15));
        local v28 = l_useCallback_0(function(v25, v26) --[[ Line: 94 ]]
            -- upvalues: v17 (copy), v3 (ref)
            v17(function(v27) --[[ Line: 95 ]]
                -- upvalues: v3 (ref), v25 (copy), v26 (copy)
                return v3.Dictionary.join(v27, {
                    [v25] = v26
                });
            end);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v17
        } else l_dependencyArray_0(v17));
        local v31 = l_useCallback_0(function(v29) --[[ Line: 107 ]]
            -- upvalues: v17 (copy), v3 (ref)
            v17(function(v30) --[[ Line: 108 ]]
                -- upvalues: v3 (ref), v29 (copy)
                return v3.Dictionary.join(v30, {
                    [v29] = v3.None
                });
            end);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v17
        } else l_dependencyArray_0(v17));
        local v32 = l_useMemo_0(function() --[[ Line: 120 ]]
            -- upvalues: v14 (copy), v16 (copy), v21 (copy), v24 (copy), v28 (copy), v31 (copy)
            return {
                capturedAuditContent = v14, 
                additionalAuditContent = v16, 
                setCapturedAuditContentItem = v21, 
                removeCapturedAuditContentItem = v24, 
                setAdditionalAuditContentItem = v28, 
                removeAdditionalAuditContentItem = v31
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v14, 
            v16
        } else l_dependencyArray_0(v14, v16));
        return v2.createElement(v12.Provider, {
            value = v32
        }, v13.children);
    end, 
    useCapturedAuditContent = function(v33, v34) --[[ Line: 147 ]] --[[ Name: useCapturedAuditContent ]]
        -- upvalues: l_useContext_0 (copy), v12 (copy), l_useEffect_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
        local v35 = l_useContext_0(v12);
        l_useEffect_0(function() --[[ Line: 151 ]]
            -- upvalues: v4 (ref), v33 (copy), v34 (copy), v35 (copy)
            if not v4() then
                return;
            elseif not v33 or not v34 then
                return;
            else
                v35.setCapturedAuditContentItem(v33, v34);
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v33, 
            v34
        } else l_dependencyArray_0(v33, v34));
        l_useEffect_0(function() --[[ Line: 164 ]]
            -- upvalues: v4 (ref), v33 (copy), v35 (copy)
            return function() --[[ Line: 165 ]]
                -- upvalues: v4 (ref), v33 (ref), v35 (ref)
                if not v4() then
                    return;
                else
                    if v33 then
                        v35.removeCapturedAuditContentItem(v33);
                    end;
                    return;
                end;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v33
        } else l_dependencyArray_0(v33));
    end, 
    useAdditionalAuditContent = function(v36, v37) --[[ Line: 184 ]] --[[ Name: useAdditionalAuditContent ]]
        -- upvalues: l_useContext_0 (copy), v12 (copy), l_useEffect_0 (copy), v4 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
        local v38 = l_useContext_0(v12);
        l_useEffect_0(function() --[[ Line: 188 ]]
            -- upvalues: v4 (ref), v36 (copy), v37 (copy), v38 (copy)
            if not v4() then
                return;
            elseif not v36 or not v37 then
                return;
            else
                v38.setAdditionalAuditContentItem(v36, v37);
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v36, 
            v37
        } else l_dependencyArray_0(v36, v37));
        l_useEffect_0(function() --[[ Line: 201 ]]
            -- upvalues: v4 (ref), v36 (copy), v38 (copy)
            return function() --[[ Line: 202 ]]
                -- upvalues: v4 (ref), v36 (ref), v38 (ref)
                if not v4() then
                    return;
                else
                    if v36 then
                        v38.removeAdditionalAuditContentItem(v36);
                    end;
                    return;
                end;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v36
        } else l_dependencyArray_0(v36));
    end, 
    useAuditContentContext = function() --[[ Line: 217 ]] --[[ Name: useAuditContentContext ]]
        -- upvalues: l_useContext_0 (copy), v12 (copy)
        local v39 = l_useContext_0(v12);
        return {
            capturedAuditContent = v39.capturedAuditContent, 
            additionalAuditContent = v39.additionalAuditContent, 
            setCapturedAuditContentItem = v39.setCapturedAuditContentItem, 
            removeCapturedAuditContentItem = v39.removeCapturedAuditContentItem, 
            setAdditionalAuditContentItem = v39.setAdditionalAuditContentItem, 
            removeAdditionalAuditContentItem = v39.removeAdditionalAuditContentItem
        };
    end
};