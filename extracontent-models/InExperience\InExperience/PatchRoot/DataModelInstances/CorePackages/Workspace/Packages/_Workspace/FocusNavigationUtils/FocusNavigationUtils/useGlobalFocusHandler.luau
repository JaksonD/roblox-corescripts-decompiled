local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_SessionService_0 = game:GetService("SessionService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local l_MessageBus_0 = require(l_Parent_0.MessageBus).MessageBus;
local v8 = require(l_Parent_0.LoggingProtocol);
local v9 = require(l_Parent_0.Navigation);
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v11 = require(l_Parent_0.Responsive);
local l_SessionType_0 = require(l_Parent_0.Sessionization).SessionType;
local v13 = require(l_script_FirstAncestor_0.useLastInputMethod);
local v14 = require(l_script_FirstAncestor_0.useLastInputMode);
local l_useFocusGuiObject_0 = v6.useFocusGuiObject;
local l_useFocusedGuiObject_0 = v6.useFocusedGuiObject;
local l_useRegistryEntry_0 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceRegistry).useRegistryEntry;
local v18 = require(l_script_FirstAncestor_0.FocusNavigableSurfaceIdentifierEnum);
local v19 = require(l_script_FirstAncestor_0.useAutoFocus);
local v20 = require(l_script_FirstAncestor_0.useDescendantHasFocus);
local v21 = game:DefineFastFlag("TenFootUiCorrectAutoFocusLoggingBehavior", false);
local v22 = game:DefineFastInt("AutoFocusFailsafeThreshold", 5);
local l_FFlagEnablePeekViewFocusNav_0 = require(l_Parent_0.SharedFlags).FFlagEnablePeekViewFocusNav;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v25 = require(l_Parent_0.SharedFlags);
local l_FFlagAppIaHomeSubTab_0 = v25.FFlagAppIaHomeSubTab;
local l_FFlagLuaAppResponsiveEnginePreferredInput_0 = v25.FFlagLuaAppResponsiveEnginePreferredInput;
local v28 = {
    [Enum.UserInputType.MouseButton1] = true, 
    [Enum.UserInputType.MouseButton2] = true, 
    [Enum.UserInputType.MouseButton3] = true, 
    [Enum.UserInputType.Touch] = true
};
local v29 = l_MessageBus_0.Subscriber.new();
local l_default_0 = v8.default;
local function v32(v31) --[[ Line: 48 ]] --[[ Name: gameLeaveMessageValidator ]]
    if typeof(v31) == "table" then
        return true;
    else
        return false;
    end;
end;
local function _(v33) --[[ Line: 56 ]] --[[ Name: createGlobalFocusFailureDetection ]]
    -- upvalues: l_RunService_0 (copy), v22 (copy)
    local v34 = 0;
    return (l_RunService_0.Heartbeat:Connect(function(v35) --[[ Line: 58 ]]
        -- upvalues: v34 (ref), v22 (ref), v33 (copy)
        v34 = v34 + v35;
        if v22 < v34 then
            v33();
            v34 = 0;
        end;
    end));
end;
local function v41(v37) --[[ Line: 72 ]] --[[ Name: createGameLeaveSubscription ]]
    -- upvalues: l_MessageBus_0 (copy), v29 (copy), v32 (copy), v22 (copy)
    local v38 = l_MessageBus_0.getMessageId("Game", "onGameLeave");
    local v39 = nil;
    v29:subscribe({
        mid = v38, 
        validateParams = v32
    }, function(_) --[[ Line: 79 ]]
        -- upvalues: v39 (ref), v22 (ref), v37 (copy)
        v39 = task.delay(v22, function() --[[ Line: 80 ]]
            -- upvalues: v37 (ref)
            v37();
        end);
    end);
    return {
        unsubscribe = function() --[[ Line: 85 ]] --[[ Name: unsubscribe ]]
            -- upvalues: v29 (ref), v38 (copy), v39 (ref)
            v29:unsubscribeWithMsgId(v38);
            if v39 then
                task.cancel(v39);
            end;
        end
    };
end;
return function(v42) --[[ Line: 97 ]] --[[ Name: useGlobalFocusHandler ]]
    -- upvalues: v13 (copy), l_useFocusGuiObject_0 (copy), l_useFocusedGuiObject_0 (copy), v5 (copy), v14 (copy), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (copy), v11 (copy), l_SessionService_0 (copy), l_SessionType_0 (copy), l_UserInputService_0 (copy), v28 (copy), v9 (copy), l_useRegistryEntry_0 (copy), v18 (copy), l_FFlagEnablePeekViewFocusNav_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), v19 (copy), v20 (copy), v21 (copy), l_mutedError_0 (copy), l_default_0 (copy), l_RunService_0 (copy), v22 (copy), v41 (copy)
    local v43 = v13();
    local v44 = l_useFocusGuiObject_0();
    local v45 = l_useFocusedGuiObject_0();
    local v46 = v5.useRef(v45);
    local v47 = v14() == "Focus";
    local v48 = if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v11.usePreferredInput() else nil;
    v5.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v45 (copy), v46 (copy), l_SessionService_0 (ref), l_SessionType_0 (ref), v43 (copy)
        if v45 ~= nil and v46.current == nil then
            l_SessionService_0:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.FocusNavigation, v43);
            v46.current = v45;
        end;
    end, {
        v45
    });
    v5.useEffect(function() --[[ Line: 119 ]]
        -- upvalues: l_UserInputService_0 (ref), l_FFlagLuaAppResponsiveEnginePreferredInput_0 (ref), v48 (copy), v11 (ref), v28 (ref), v46 (copy), l_SessionService_0 (ref), l_SessionType_0 (ref), v44 (copy)
        local v50 = l_UserInputService_0.LastInputTypeChanged:Connect(function(v49) --[[ Line: 120 ]]
            -- upvalues: l_FFlagLuaAppResponsiveEnginePreferredInput_0 (ref), v48 (ref), v11 (ref), v28 (ref), v46 (ref), l_SessionService_0 (ref), l_SessionType_0 (ref), v44 (ref)
            if if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v48 ~= v11.Input.Directional and v28[v49] else v28[v49] then
                if v46.current ~= nil then
                    l_SessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.FocusNavigation);
                    v46.current = nil;
                    v44(nil);
                    return;
                else
                    v44(nil);
                end;
            end;
        end);
        return function() --[[ Line: 135 ]]
            -- upvalues: v50 (copy)
            v50:Disconnect();
        end;
    end, if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then {
        v44, 
        v48
    } else {
        v44
    });
    local v51 = v9.useNavigation();
    local v52 = if v51 then v51.state else nil;
    local v53 = if v52 then v52.index else nil;
    local v54 = v5.useRef(v53);
    v5.useEffect(function() --[[ Line: 148 ]]
        -- upvalues: v47 (copy), v54 (copy), v53 (copy), v44 (copy)
        if v47 and v54.current ~= nil and v53 ~= nil and v54.current < v53 then
            v54.current = v53;
            v44(nil);
        end;
    end, {
        v53, 
        v47
    });
    local v55 = l_useRegistryEntry_0(v18.NavBar);
    local v56 = l_useRegistryEntry_0(v18.RouterView);
    local v57 = l_useRegistryEntry_0(v18.CentralOverlay);
    local v58 = l_useRegistryEntry_0(v18.ModerationOverlay);
    local v59 = l_useRegistryEntry_0(v18.PopUp);
    local v60 = l_useRegistryEntry_0(v18.ContextualMenu);
    local v61 = l_useRegistryEntry_0(v18.SearchBar);
    local v62 = if l_FFlagEnablePeekViewFocusNav_0 then l_useRegistryEntry_0(v18.PeekView) else nil;
    local v63 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useRegistryEntry_0(v18.SubRouterView) else nil;
    local v64 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useRegistryEntry_0(v18.Auxiliary) else nil;
    local v65 = if l_FFlagAppIaHomeSubTab_0 then l_useRegistryEntry_0(v18.HeaderView) else nil;
    local v67 = v5.useMemo(function() --[[ Line: 205 ]]
        -- upvalues: v58 (copy), v57 (copy), v60 (copy), v59 (copy), v62 (copy), v56 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v63 (copy), v55 (copy), v61 (copy), v64 (copy), l_FFlagAppIaHomeSubTab_0 (ref), v65 (copy)
        local v66 = {};
        if v58 then
            table.insert(v66, v58);
            return v66;
        elseif v57 then
            table.insert(v66, v57);
            return v66;
        elseif v60 then
            table.insert(v66, v60);
            return v66;
        elseif v59 then
            table.insert(v66, v59);
            return v66;
        elseif v62 then
            table.insert(v66, v62);
            return v66;
        else
            if v56 then
                table.insert(v66, v56);
            end;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v63 then
                table.insert(v66, v63);
            end;
            if v55 then
                table.insert(v66, v55);
            end;
            if v61 then
                table.insert(v66, v61);
            end;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v64 then
                table.insert(v66, v64);
            end;
            if l_FFlagAppIaHomeSubTab_0 and v65 then
                table.insert(v66, v65);
            end;
            return v66;
        end;
    end, {
        v58, 
        v56, 
        v55, 
        v57, 
        v60, 
        v59, 
        v62, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v63 else nil, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v64 else nil, 
        if l_FFlagAppIaHomeSubTab_0 then v65 else nil
    });
    local v68 = v19(v67, 0.1);
    local v69 = v20(v55);
    local v70 = v20(v56);
    local v71 = v20(v57);
    local v72 = v20(v58);
    local v73 = v20(v60);
    local v74 = v20(v59);
    local v75 = v20(v61);
    local v76 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v20(v63) else nil;
    local v77 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v20(v64) else nil;
    local v78 = if l_FFlagEnablePeekViewFocusNav_0 then v20(v62) else false;
    local v79 = if l_FFlagAppIaHomeSubTab_0 then v20(v65) else false;
    local v80 = nil;
    v80 = if v58 then v72 else if v57 then v71 else if v60 then v73 else if v59 then v74 else if v62 then v78 else if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v69 or v70 or v75 or v76 or v77 or l_FFlagAppIaHomeSubTab_0 and v79 else v69 or v70 or v75 or l_FFlagAppIaHomeSubTab_0 and v79;
    local v81 = (if l_FFlagLuaAppResponsiveEnginePreferredInput_0 then v48 == v11.Input.Directional or v47 else v47) and not v80 and not v42;
    v5.useEffect(function() --[[ Line: 317 ]]
        -- upvalues: v68 (copy), v81 (copy), v21 (ref), l_mutedError_0 (ref), v67 (copy), l_default_0 (ref), l_RunService_0 (ref), v22 (ref), v41 (ref)
        local v82 = nil;
        local v83 = nil;
        local function v84() --[[ Line: 321 ]] --[[ Name: setAutoFocusing ]]
            -- upvalues: v82 (ref), v68 (ref)
            if v82 then
                v82.cancel();
            end;
            v82 = v68();
        end;
        if v81 then
            if v82 then
                v82.cancel();
            end;
            v82 = v68();
            local function v85() --[[ Line: 330 ]]
                -- upvalues: v21 (ref), l_mutedError_0 (ref), v67 (ref), l_default_0 (ref), v82 (ref), v68 (ref)
                if v21 then
                    l_mutedError_0("[useGlobalFocusHandler] globalFocusHandler failed to autofocus with " .. #v67 .. " targets, retrying");
                else
                    l_default_0:logEvent("GamePadFocusFailsafeActivated", {
                        targetCount = #v67
                    });
                end;
                if v82 then
                    v82.cancel();
                end;
                v82 = v68();
            end;
            local v86 = 0;
            local l_v85_0 = v85 --[[ copy: 3 -> 5 ]];
            do
                local l_v86_0 = v86;
                v83 = l_RunService_0.Heartbeat:Connect(function(v89) --[[ Line: 58 ]]
                    -- upvalues: l_v86_0 (ref), v22 (ref), l_v85_0 (copy)
                    l_v86_0 = l_v86_0 + v89;
                    if v22 < l_v86_0 then
                        l_v85_0();
                        l_v86_0 = 0;
                    end;
                end);
            end;
        end;
        local v90 = nil;
        if v81 then
            v90 = v41(v84);
        end;
        return function() --[[ Line: 350 ]]
            -- upvalues: v82 (ref), v90 (ref), v83 (ref)
            if v82 then
                v82.cancel();
            end;
            if v90 then
                v90.unsubscribe();
            end;
            if v83 then
                v83:Disconnect();
            end;
        end;
    end, {
        v81, 
        v68, 
        v67
    });
end;