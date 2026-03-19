local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialProof");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local v7 = require(l_Parent_0.RoactUtils);
local l_useDispatch_0 = v7.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v11 = require(l_Parent_0.Cryo);
local v12 = require(l_script_FirstAncestor_0.Networking.NetworkingSocialProof);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_script_FirstAncestor_0.Common.Enums);
return function(v15) --[[ Line: 27 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useState_0 (copy), l_useRef_0 (copy), l_useSelector_0 (copy), v13 (copy), l_getDeepValue_0 (copy), l_useEffect_0 (copy), v11 (copy), l_useCallback_0 (copy), v12 (copy)
    local v16 = l_useDispatch_0();
    local l_entityId_0 = v15.entityId;
    local l_entityType_0 = v15.entityType;
    local l_connectionType_0 = v15.connectionType;
    local v20, v21 = l_useState_0(false);
    local v22, v23 = l_useState_0(true);
    local v24, v25 = l_useState_0(nil);
    local v26, v27 = l_useState_0("");
    local v28, v29 = l_useState_0({});
    local v30 = l_useRef_0(true);
    local v31, v32 = l_useState_0(0);
    local v36 = l_useSelector_0(function(v33) --[[ Line: 42 ]]
        -- upvalues: v13 (ref), l_connectionType_0 (copy), l_entityType_0 (copy), l_entityId_0 (copy), l_getDeepValue_0 (ref)
        local v34 = v33[v13.RODUX_KEY].ConnectionsByEntityId or {};
        local v35 = string.format("%s.%s.%s", l_connectionType_0, l_entityType_0, l_entityId_0);
        return l_getDeepValue_0(v34, v35) or {};
    end);
    l_useEffect_0(function() --[[ Line: 48 ]]
        -- upvalues: v36 (copy), v28 (copy), v32 (copy), v23 (copy), v27 (copy), v29 (copy), v11 (ref)
        if not v36.userIds then
            return;
        else
            local l_userIds_0 = v36.userIds;
            local v38 = #v28 + #l_userIds_0;
            local v39 = v36.totalConnections or 0;
            local v40 = v38 < v39;
            v32(v39);
            v23(v40);
            v27((tostring(v38)));
            v29(function(v41) --[[ Line: 65 ]]
                -- upvalues: v11 (ref), l_userIds_0 (copy)
                return v11.List.join(v41, l_userIds_0);
            end);
            return;
        end;
    end, {
        v36.userIds, 
        v36.totalConnections
    });
    local v44 = l_useCallback_0(function() --[[ Line: 70 ]]
        -- upvalues: v20 (copy), v22 (copy), v21 (copy), v25 (copy), l_entityId_0 (copy), l_entityType_0 (copy), l_connectionType_0 (copy), v26 (copy), v16 (copy), v12 (ref), v30 (copy)
        if v20 or not v22 then
            return;
        else
            v21(true);
            v25(nil);
            local v42 = {
                entityId = l_entityId_0, 
                entityType = l_entityType_0, 
                connectionType = l_connectionType_0, 
                cursor = v26
            };
            v16(v12.GetConnectionsByEntityId.API(v42)):andThen(function() --[[ Line: 86 ]]
                -- upvalues: v30 (ref), v21 (ref)
                if v30.current then
                    v21(false);
                end;
            end):catch(function(v43) --[[ Line: 91 ]]
                -- upvalues: v30 (ref), v21 (ref), v25 (ref)
                if v30.current then
                    v21(false);
                    v25(v43);
                end;
            end);
            return;
        end;
    end, {
        v26, 
        v20, 
        v22, 
        l_entityId_0, 
        l_entityType_0, 
        l_connectionType_0, 
        v16
    });
    local v45 = l_useCallback_0(function() --[[ Line: 99 ]]
        -- upvalues: v29 (copy), v23 (copy), v21 (copy), v25 (copy)
        v29({});
        v23(true);
        v21(false);
        v25(nil);
    end, {});
    l_useEffect_0(function() --[[ Line: 107 ]]
        -- upvalues: l_entityId_0 (copy), l_entityType_0 (copy), l_connectionType_0 (copy), v36 (copy), v44 (copy)
        if l_entityId_0 and l_entityType_0 and l_connectionType_0 and not v36.userIds then
            v44();
        end;
    end, {
        l_entityId_0, 
        l_entityType_0, 
        l_connectionType_0, 
        v36.userIds
    });
    return {
        userIds = v28, 
        isLoading = v20, 
        hasMore = v22, 
        error = v24, 
        fetchPage = v44, 
        reset = v45, 
        totalConnections = v31
    };
end;