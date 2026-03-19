local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v2.util.inspect;
local l_setTimeout_0 = v2.setTimeout;
local v5 = require(l_Parent_0.Shared);
local l_console_0 = v5.console;
local l_errorToString_0 = v5.errorToString;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactCapturedValue);
local l_showErrorDialog_0 = require(script.Parent.ReactFiberErrorDialog).showErrorDialog;
local l_ClassComponent_0 = require(script.Parent.ReactWorkTags).ClassComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
return {
    logCapturedError = function(v13, v14) --[[ Line: 34 ]]
        -- upvalues: l_showErrorDialog_0 (copy), v1 (copy), l_ClassComponent_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_inspect_0 (copy), l_setTimeout_0 (copy), l_errorToString_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
            -- upvalues: l_showErrorDialog_0 (ref), v13 (copy), v14 (copy), v1 (ref), l_ClassComponent_0 (ref), l_console_0 (ref), l_getComponentName_0 (ref), l_inspect_0 (ref)
            if l_showErrorDialog_0(v13, v14) == false then
                return nil;
            else
                local l_value_0 = v14.value;
                if v1.__DEV__ then
                    local l_source_0 = v14.source;
                    local v17 = v14.stack or "";
                    if l_value_0 ~= nil and l_value_0._suppressLogging then
                        if v13.tag == l_ClassComponent_0 then
                            return;
                        else
                            l_console_0.error(l_value_0);
                        end;
                    end;
                    local v18 = nil;
                    v18 = if l_source_0 ~= nil then l_getComponentName_0(l_source_0.type) else nil;
                    local v19 = nil;
                    v19 = if v18 then "The above error occurred in the <" .. tostring(v18) .. "> component:" else "The above error occurred in one of your React components:";
                    local _ = nil;
                    local v21 = l_getComponentName_0(v13.type);
                    local v22 = v19 .. "\n" .. v17 .. "\n\n" .. if v21 then "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. v21 .. "." else "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries.";
                    l_console_0.error(v22);
                else
                    l_console_0.error(l_inspect_0(l_value_0));
                end;
                return nil;
            end;
        end);
        if not l_status_0 then
            warn("failed to error with error: " .. l_inspect_0(l_result_0));
            l_setTimeout_0(function() --[[ Line: 126 ]]
                -- upvalues: l_errorToString_0 (ref), l_result_0 (copy)
                error(l_errorToString_0(l_result_0));
            end);
        end;
    end
};