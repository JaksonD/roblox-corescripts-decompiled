local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local v3 = require(script.Parent.console);
local v4 = {};
local l_describeUnknownElementTypeFrameInDEV_0 = require(script.Parent.ReactComponentStackFrame).describeUnknownElementTypeFrameInDEV;
local v6 = require(script.Parent.ReactSharedInternals);
local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local l_ReactDebugCurrentFrame_0 = v6.ReactDebugCurrentFrame;
local function _(v9) --[[ Line: 34 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: v1 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy)
    if v1.__DEV__ then
        if v9 then
            local l__owner_0 = v9._owner;
            local v11 = l_describeUnknownElementTypeFrameInDEV_0(v9.type, v9._source, if l__owner_0 ~= nil then l__owner_0.type else nil);
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v11);
            return;
        else
            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
        end;
    end;
end;
return function(v13, v14, v15, v16, v17, v18) --[[ Line: 51 ]] --[[ Name: checkPropTypes ]]
    -- upvalues: v1 (copy), v3 (copy), l_Error_0 (copy), l_describeError_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_ReactDebugCurrentFrame_0 (copy), v4 (copy)
    if v1.__DEV__ or v1.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if v13 and v14 then
            v3.warn("You've defined both propTypes and validateProps on " .. (v17 or "a component"));
        end;
        if v14 then
            if typeof(v14) ~= "function" then
                v3.error(("validateProps must be a function, but it is a %s.\nCheck the definition of the component %q."):format(typeof(v14), v17 or ""));
            else
                local v19, v20 = v14(v15);
                if not v19 then
                    v20 = v20 or "<Validator function did not supply a message>";
                    local v21 = string.format("validateProps failed on a %s type in %s: %s", v16, v17 or "<UNKNOWN Component>", (tostring(v20)));
                    error(v21);
                end;
            end;
        end;
        if v13 then
            assert(typeof(v13) == "table", "propTypes needs to be a table");
            for v22, _ in v13 do
                local _, v26 = xpcall(function() --[[ Line: 118 ]]
                    -- upvalues: v13 (copy), v22 (copy), l_Error_0 (ref), v17 (copy), v16 (copy), v15 (copy)
                    if typeof(v13[v22]) ~= "function" then
                        local v24 = l_Error_0.new((v17 or "React class") .. ": " .. v16 .. " type `" .. v22 .. "` is invalid; " .. "it must be a function, usually from the `prop-types` package, but received `" .. typeof(v13[v22]) .. "`." .. "This often happens because of typos such as `PropTypes.function` instead of `PropTypes.func`.");
                        v24.name = "Invariant Violation";
                        error(v24);
                    end;
                    return v13[v22](v15, v22, v17, v16, nil, "SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED");
                end, l_describeError_0);
                local v27 = typeof(v26) == "table";
                if v26 ~= nil and not v27 then
                    if v1.__DEV__ then
                        if v18 then
                            local l__owner_1 = v18._owner;
                            local v29 = l_describeUnknownElementTypeFrameInDEV_0(v18.type, v18._source, if l__owner_1 ~= nil then l__owner_1.type else nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v29);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v3.error(string.format("%s: type specification of %s `%s` is invalid; the type checker function must return `nil` or an `Error` but returned a %s. You may have forgotten to pass an argument to the type checker creator (arrayOf, instanceOf, objectOf, oneOf, oneOfType, and shape all require an argument).", v17 or "React class", v16, v22, (typeof(v26))));
                    if v1.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
                if v27 and v4[v26.message] == nil then
                    v4[tostring(v26.message)] = true;
                    if v1.__DEV__ then
                        if v18 then
                            local l__owner_2 = v18._owner;
                            local v31 = l_describeUnknownElementTypeFrameInDEV_0(v18.type, v18._source, if l__owner_2 ~= nil then l__owner_2.type else nil);
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(v31);
                        else
                            l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                        end;
                    end;
                    v3.warn(string.format("Failed %s type: %s", v16, (tostring(v26.message))));
                    if v1.__DEV__ then
                        l_ReactDebugCurrentFrame_0.setExtraStackFrame(nil);
                    end;
                end;
            end;
        end;
    end;
end;