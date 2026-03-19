local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local _ = require(l_Parent_0.LuauPolyfill);
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactWorkTags);
local l_HostComponent_0 = v4.HostComponent;
local l_LazyComponent_0 = v4.LazyComponent;
local l_SuspenseComponent_0 = v4.SuspenseComponent;
local l_SuspenseListComponent_0 = v4.SuspenseListComponent;
local l_FunctionComponent_0 = v4.FunctionComponent;
local l_IndeterminateComponent_0 = v4.IndeterminateComponent;
local l_ForwardRef_0 = v4.ForwardRef;
local l_SimpleMemoComponent_0 = v4.SimpleMemoComponent;
local l_ClassComponent_0 = v4.ClassComponent;
local l_ReactComponentStackFrame_0 = require(l_Parent_0.Shared).ReactComponentStackFrame;
local l_describeBuiltInComponentFrame_0 = l_ReactComponentStackFrame_0.describeBuiltInComponentFrame;
local l_describeFunctionComponentFrame_0 = l_ReactComponentStackFrame_0.describeFunctionComponentFrame;
local l_describeClassComponentFrame_0 = l_ReactComponentStackFrame_0.describeClassComponentFrame;
local function v22(v18) --[[ Line: 39 ]] --[[ Name: describeFiber ]]
    -- upvalues: v1 (copy), l_HostComponent_0 (copy), l_describeBuiltInComponentFrame_0 (copy), l_LazyComponent_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_FunctionComponent_0 (copy), l_IndeterminateComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_describeFunctionComponentFrame_0 (copy), l_ForwardRef_0 (copy), l_ClassComponent_0 (copy), l_describeClassComponentFrame_0 (copy)
    local v19 = nil;
    if v1.__DEV__ then
        local l__debugOwner_0 = v18._debugOwner;
        if l__debugOwner_0 then
            v19 = l__debugOwner_0.type;
        end;
    end;
    local v21 = nil;
    if v1.__DEV__ then
        v21 = v18._debugSource;
    end;
    if v18.tag == l_HostComponent_0 then
        return l_describeBuiltInComponentFrame_0(v18.type, v21, v19);
    elseif v18.tag == l_LazyComponent_0 then
        return l_describeBuiltInComponentFrame_0("Lazy", v21, v19);
    elseif v18.tag == l_SuspenseComponent_0 then
        return l_describeBuiltInComponentFrame_0("Suspense", v21, v19);
    elseif v18.tag == l_SuspenseListComponent_0 then
        return l_describeBuiltInComponentFrame_0("SuspenseList", v21, v19);
    elseif v18.tag == l_FunctionComponent_0 or v18.tag == l_IndeterminateComponent_0 or v18.tag == l_SimpleMemoComponent_0 then
        return l_describeFunctionComponentFrame_0(v18.type, v21, v19);
    elseif v18.tag == l_ForwardRef_0 then
        return l_describeFunctionComponentFrame_0(v18.type.render, v21, v19);
    elseif v18.tag == l_ClassComponent_0 then
        return l_describeClassComponentFrame_0(v18.type, v21, v19);
    else
        return "";
    end;
end;
return {
    getStackByFiberInDevAndProd = function(v23) --[[ Line: 77 ]] --[[ Name: getStackByFiberInDevAndProd ]]
        -- upvalues: v22 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 78 ]]
            -- upvalues: v23 (copy), v22 (ref)
            local v24 = "";
            local l_v23_0 = v23;
            repeat
                v24 = v24 .. v22(l_v23_0);
                l_v23_0 = l_v23_0.return_;
            until l_v23_0 == nil;
            return v24;
        end);
        if not l_status_0 then
            if typeof(l_result_0) == "table" and l_result_0.message and l_result_0.stack then
                return "\nError generating stack: " .. l_result_0.message .. "\n" .. tostring(l_result_0.stack);
            else
                return "\nError generating stack: " .. tostring(l_result_0);
            end;
        else
            return l_result_0;
        end;
    end
};