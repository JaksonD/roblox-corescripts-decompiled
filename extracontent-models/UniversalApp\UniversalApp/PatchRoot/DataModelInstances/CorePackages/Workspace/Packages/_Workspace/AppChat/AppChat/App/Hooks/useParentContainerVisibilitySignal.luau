local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_script_FirstAncestor_0.Actions.EnteredChatFromEntryPoint);
local l_setAppChatVisible_0 = require(l_script_FirstAncestor_0.App.AppChatVisible).setAppChatVisible;
local v6 = require(l_script_FirstAncestor_0.Contexts.ParentContainer.ParentContainerContext);
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
return function() --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v6 (copy), l_useDispatch_0 (copy), l_setAppChatVisible_0 (copy), v4 (copy)
    local v8 = v2.useContext(v6);
    local l_visibilitySignal_0 = v8.visibilitySignal;
    local l_getShouldSetAppChatVisible_0 = v8.getShouldSetAppChatVisible;
    local l_entryPoint_0 = v8.entryPoint;
    local v12 = l_useDispatch_0();
    v2.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: l_visibilitySignal_0 (copy), l_getShouldSetAppChatVisible_0 (copy), l_setAppChatVisible_0 (ref), v12 (copy), v4 (ref), l_entryPoint_0 (copy)
        local v13 = nil;
        v13 = l_visibilitySignal_0:connect(function(...) --[[ Line: 23 ]]
            -- upvalues: l_getShouldSetAppChatVisible_0 (ref), l_setAppChatVisible_0 (ref), v12 (ref), v4 (ref), l_entryPoint_0 (ref)
            if l_getShouldSetAppChatVisible_0(...) then
                l_setAppChatVisible_0(true);
                v12(v4(l_entryPoint_0));
                return;
            else
                l_setAppChatVisible_0(false);
                return;
            end;
        end);
        return function() --[[ Line: 32 ]]
            -- upvalues: v13 (ref)
            if v13 then
                v13:disconnect();
            end;
        end;
    end, {
        l_setAppChatVisible_0, 
        v12, 
        l_visibilitySignal_0, 
        l_getShouldSetAppChatVisible_0, 
        l_entryPoint_0
    });
end;