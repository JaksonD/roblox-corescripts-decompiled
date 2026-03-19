local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.SafeFlags).createGetFFlag("ReactIsolatedGlobalsEnabled")() then
    return _G;
else
    local function _(v1, v2) --[[ Line: 49 ]] --[[ Name: loadFromGlobal ]]
        local v3 = _G[v1];
        if v3 ~= nil then
            return v3;
        else
            return v2;
        end;
    end;
    local v5 = {};
    local l___DEV___0 = _G.__DEV__;
    v5.__DEV__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__PROFILE__;
    v5.__PROFILE__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__EXPERIMENTAL__;
    v5.__EXPERIMENTAL__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__DEBUG__;
    v5.__DEBUG__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__YOLO__;
    v5.__YOLO__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__;
    v5.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__REACT_DEVTOOLS_GLOBAL_HOOK__;
    v5.__REACT_DEVTOOLS_GLOBAL_HOOK__ = if l___DEV___0 ~= nil then l___DEV___0 else nil;
    l___DEV___0 = _G.__REACT_DEVTOOLS_ATTACH__;
    v5.__REACT_DEVTOOLS_ATTACH__ = if l___DEV___0 ~= nil then l___DEV___0 else nil;
    l___DEV___0 = _G.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__;
    v5.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__;
    v5.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__REACT_DEVTOOLS_COMPONENT_FILTERS__;
    v5.__REACT_DEVTOOLS_COMPONENT_FILTERS__ = if l___DEV___0 ~= nil then l___DEV___0 else nil;
    l___DEV___0 = _G.__LOCALSTORAGE__;
    v5.__LOCALSTORAGE__ = if l___DEV___0 ~= nil then l___DEV___0 else nil;
    l___DEV___0 = _G.__SESSIONSTORAGE__;
    v5.__SESSIONSTORAGE__ = if l___DEV___0 ~= nil then l___DEV___0 else nil;
    l___DEV___0 = _G.__COMPAT_WARNINGS__;
    v5.__COMPAT_WARNINGS__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__TESTEZ_RUNNING_TEST__;
    v5.__TESTEZ_RUNNING_TEST__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__ROACT_17_MOCK_SCHEDULER__;
    v5.__ROACT_17_MOCK_SCHEDULER__ = l___DEV___0 ~= nil and l___DEV___0;
    l___DEV___0 = _G.__ROACT_17_INLINE_ACT__;
    v5.__ROACT_17_INLINE_ACT__ = l___DEV___0 ~= nil and l___DEV___0;
    return v5;
end;