local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_useIdFallback_0 = require(script.Parent.utils).useIdFallback;
local v3 = require(script.Parent.PresenceContext);
local function _() --[[ Line: 36 ]] --[[ Name: newChildrenMap ]]
    return {};
end;
return function(v5) --[[ Line: 40 ]] --[[ Name: PresenceChild ]]
    -- upvalues: v1 (copy), l_useIdFallback_0 (copy), v3 (copy)
    if not v5.children or typeof(v5.children) == "string" then
        error("PresenceChild: children must be a React.Element");
    end;
    if not v5.children.type then
        error("PresenceChild: children must be a React.Element");
    end;
    if v5.onExitComplete and typeof(v5.onExitComplete) ~= "function" and not v5.onExitComplete._isMockFunction then
        error("PresenceChild: onExitComplete must be a function");
    end;
    local l_children_0 = v5.children;
    local l_isPresent_0 = v5.isPresent;
    local l_onExitComplete_0 = v5.onExitComplete;
    local l_passThroughData_0 = v5.passThroughData;
    local l_presenceId_0 = v5.presenceId;
    local l_current_0 = v1.useRef({}).current;
    local v12 = l_presenceId_0 or l_useIdFallback_0();
    local function v17(v13) --[[ Line: 76 ]] --[[ Name: handleExitComplete ]]
        -- upvalues: l_current_0 (copy), l_onExitComplete_0 (copy)
        l_current_0[v13] = true;
        local v14 = true;
        for _, v16 in pairs(l_current_0) do
            if not v16 then
                v14 = false;
                break;
            end;
        end;
        if v14 and l_onExitComplete_0 then
            l_onExitComplete_0();
        end;
    end;
    local v18 = l_isPresent_0 ~= false;
    local v19 = {
        id = v12, 
        isPresent = v18, 
        passThroughData = l_passThroughData_0, 
        onExitComplete = v17
    };
    if l_isPresent_0 ~= nil then
        for v20, _ in pairs(l_current_0) do
            l_current_0[v20] = false;
        end;
    end;
    return v1.createElement(v3.Provider, {
        value = v19
    }, l_children_0);
end;