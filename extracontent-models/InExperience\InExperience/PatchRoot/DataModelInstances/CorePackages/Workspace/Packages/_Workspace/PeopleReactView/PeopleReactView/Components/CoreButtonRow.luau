local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v9 = require(l_Parent_0.Foundation);
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.PeopleService);
local l_View_0 = v9.View;
local v13 = require(l_script_FirstAncestor_0.Components.Buttons.CoreButton);
local v14 = require(l_script_FirstAncestor_0.Configs.CoreButtonConfigs);
local l_GetFFlagAddPeoplePageCardLayout_0 = v11.getService("Flags").GetFFlagAddPeoplePageCardLayout;
local function v20(v16) --[[ Line: 19 ]] --[[ Name: MemoizedButton ]]
    -- upvalues: v10 (copy), v13 (copy)
    local l_config_0 = v16.config;
    local v19 = v10.useCallback(function(v18) --[[ Line: 25 ]]
        -- upvalues: v16 (copy), l_config_0 (copy)
        v16.onButtonMount(v18, l_config_0.id);
    end, {
        v16.onButtonMount, 
        l_config_0.id
    });
    return v10.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v10 (ref), v13 (ref), l_config_0 (copy), v19 (copy)
        return v10.createElement(v13, {
            text = l_config_0.text, 
            icon = {
                on = l_config_0.onIcon, 
                off = l_config_0.offIcon
            }, 
            animatedIcon = l_config_0.animatedIcon, 
            buttonState = l_config_0.buttonState, 
            isNewIcon = l_config_0.isNewIcon, 
            LayoutOrder = l_config_0.layoutOrder, 
            onActivated = l_config_0.onActivated, 
            onMount = v19
        });
    end, {
        l_config_0.text, 
        l_config_0.onIcon, 
        l_config_0.offIcon, 
        l_config_0.animatedIcon, 
        l_config_0.buttonState, 
        l_config_0.isNewIcon, 
        l_config_0.layoutOrder, 
        l_config_0.onActivated, 
        v19
    });
end;
return function(v21) --[[ Line: 57 ]]
    -- upvalues: v14 (copy), v10 (copy), v11 (copy), v20 (copy), l_View_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy)
    local v22 = v14(v21.chromeEnabled);
    local v23 = v10.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v11 (ref)
        return v11.getService("FocusNavigationService");
    end, {});
    local v24 = v10.useRef(nil);
    local v25 = v10.useRef({});
    local v28 = v10.useCallback(function(v26, v27) --[[ Line: 70 ]]
        -- upvalues: v25 (copy)
        if v26 then
            v25.current[v27] = v26;
            return;
        else
            v25.current[v27] = nil;
            return;
        end;
    end, {});
    local v32 = v10.useCallback(function(v29) --[[ Line: 78 ]]
        -- upvalues: v24 (copy), v11 (ref), v23 (copy)
        v24.current = v29;
        if v29 then
            local function v31() --[[ Line: 82 ]]
                -- upvalues: v11 (ref), v24 (ref)
                local v30 = v11.getService("SettingsHubService").hubRef();
                if v30 and v30.ScrollToFrame and v24.current then
                    v30:ScrollToFrame(v24.current, true);
                end;
            end;
            v23.registerScrollCallback(-1, v31);
        end;
    end, {
        v23
    });
    local v36 = v10.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v22 (copy)
        local v33 = {};
        for _, v35 in ipairs(v22) do
            if v35.shouldShow() then
                table.insert(v33, v35.id);
            end;
        end;
        table.sort(v33);
        return table.concat(v33, ",");
    end, {
        v22
    });
    v10.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v22 (copy), v25 (copy), v23 (copy)
        local v37 = {};
        for _, v39 in ipairs(v22) do
            if v39.shouldShow() then
                local v40 = v25.current[v39.id];
                if v40 then
                    table.insert(v37, v40);
                end;
            end;
        end;
        if #v37 > 0 then
            table.sort(v37, function(v41, v42) --[[ Line: 119 ]]
                return v41.LayoutOrder < v42.LayoutOrder;
            end);
            v23.registerButtonRow(-1, v37, 0);
        end;
    end, {
        v23, 
        v36
    });
    v10.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v23 (copy)
        return function() --[[ Line: 129 ]]
            -- upvalues: v23 (ref)
            v23.unregisterScrollCallback(-1);
            v23.unregisterButtonRow(-1);
        end;
    end, {
        v23
    });
    local v46 = v10.useMemo(function() --[[ Line: 136 ]]
        -- upvalues: v22 (copy), v10 (ref), v20 (ref), v28 (copy)
        local v43 = {};
        for _, v45 in ipairs(v22) do
            if v45.shouldShow() then
                table.insert(v43, v10.createElement(v20, {
                    key = v45.id, 
                    config = v45, 
                    onButtonMount = v28
                }));
            end;
        end;
        return v43;
    end, {
        v22, 
        v28
    });
    if #v46 == 0 then
        return nil;
    else
        local function _() --[[ Line: 162 ]] --[[ Name: getButtonElements ]]
            -- upvalues: v46 (copy)
            local v47 = {};
            for v48, v49 in ipairs(v46) do
                v47["Button" .. v48] = v49;
            end;
            return v47;
        end;
        local l_createElement_0 = v10.createElement;
        local l_l_View_0_0 = l_View_0;
        local v53 = {
            tag = "size-full-0 auto-y row gap-large", 
            LayoutOrder = if l_GetFFlagAddPeoplePageCardLayout_0() then v21.LayoutOrder else 1, 
            ref = v32
        };
        local v54 = {};
        local v55 = {};
        for v56, v57 in ipairs(v46) do
            v55["Button" .. v56] = v57;
        end;
        local l_v55_0 = v55;
        v6(v54, 1, l_v55_0);
        return l_createElement_0(l_l_View_0_0, v53, v54);
    end;
end;