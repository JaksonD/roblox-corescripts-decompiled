local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.RobloxAppEnums);
local v4 = require(l_Parent_0.RobloxAppHooks);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.PeopleService);
local l_View_0 = v5.View;
local v8 = require(l_script_FirstAncestor_0.Components.Buttons.PersonButton);
local l_useDeviceOrientation_0 = v4.useDeviceOrientation;
local v10 = require(l_script_FirstAncestor_0.Configs.PersonButtonConfigs);
local l_GetFFlagAddPeoplePageCardLayout_0 = v6.getService("Flags").GetFFlagAddPeoplePageCardLayout;
local function v18(v12) --[[ Line: 22 ]] --[[ Name: MemoizedButton ]]
    -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (copy), v2 (copy), v6 (copy), v8 (copy)
    local l_config_0 = v12.config;
    local v14 = if l_GetFFlagAddPeoplePageCardLayout_0() then v2.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v6 (ref)
        return v6.getService("Constants");
    end, {}) else nil;
    local v16 = v2.useCallback(function(v15) --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        v12.onButtonMount(v15, v12.buttonId);
    end, {
        v12.onButtonMount
    });
    local v17 = if l_GetFFlagAddPeoplePageCardLayout_0() then v2.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: l_config_0 (copy), v14 (copy)
        if l_config_0.id == v14.PERSON_BUTTONS.BLOCK_PLAYER then
            l_config_0.onActivated("ingame_menu");
            return;
        elseif l_config_0.id == v14.PERSON_BUTTONS.REPORT_PLAYER then
            l_config_0.onActivated("MenuPlayerList");
            return;
        else
            l_config_0.onActivated(v14.ANALYTICS.ENTRY_POINT.PEOPLE_LIST);
            return;
        end;
    end, {
        l_config_0.id, 
        l_config_0.onActivated
    }) else nil;
    return v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v2 (ref), v8 (ref), l_config_0 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v17 (copy), v16 (copy)
        return v2.createElement(v8, {
            text = l_config_0.text, 
            icon = {
                on = l_config_0.onIcon, 
                off = l_config_0.offIcon
            }, 
            animatedIcon = l_config_0.animatedIcon, 
            buttonState = l_config_0.buttonState, 
            LayoutOrder = l_config_0.layoutOrder, 
            onActivated = if l_GetFFlagAddPeoplePageCardLayout_0() then v17 else l_config_0.onActivated, 
            isGrayedOut = l_config_0.isGrayedOut, 
            isDisabled = l_config_0.isDisabled, 
            isBuilderIcon = l_config_0.isBuilderIcon, 
            buttonVariant = l_config_0.buttonVariant, 
            onMount = v16
        });
    end, {
        l_config_0.text, 
        l_config_0.onIcon, 
        l_config_0.offIcon, 
        l_config_0.animatedIcon, 
        l_config_0.buttonState, 
        l_config_0.layoutOrder, 
        l_config_0.onActivated, 
        l_config_0.isGrayedOut, 
        l_config_0.isDisabled, 
        l_config_0.isBuilderIcon, 
        l_config_0.buttonVariant, 
        v16
    });
end;
return function(v19) --[[ Line: 85 ]]
    -- upvalues: v10 (copy), l_useDeviceOrientation_0 (copy), v3 (copy), v2 (copy), v6 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v18 (copy), l_View_0 (copy)
    local v20 = v10(v19.userId);
    local v21 = l_useDeviceOrientation_0() == v3.DeviceOrientationMode.Portrait;
    local v22 = v2.useMemo(function() --[[ Line: 90 ]]
        -- upvalues: v6 (ref)
        return v6.getService("FocusNavigationService");
    end, {});
    local v23 = v2.useRef({});
    local v26 = v2.useCallback(function(v24, v25) --[[ Line: 96 ]]
        -- upvalues: v23 (copy)
        if v24 then
            v23.current[v25] = v24;
            return;
        else
            v23.current[v25] = nil;
            return;
        end;
    end, {});
    local v32 = v2.useMemo(function() --[[ Line: 104 ]]
        -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (ref), v20 (copy)
        local v27 = {};
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            for _, v29 in v20 do
                if v29.shouldShow() then
                    table.insert(v27, v29.id);
                end;
            end;
        else
            for _, v31 in ipairs(v20) do
                if v31.shouldShow() then
                    table.insert(v27, v31.id);
                end;
            end;
        end;
        table.sort(v27);
        return table.concat(v27, ",");
    end, {
        v20
    });
    v2.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (ref), v20 (copy), v23 (copy), v19 (copy), v22 (copy)
        local v33 = {};
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            for _, v35 in v20 do
                if v35.shouldShow() then
                    local v36 = v23.current[v35.id];
                    if v36 then
                        table.insert(v33, v36);
                    end;
                end;
            end;
        else
            for _, v38 in ipairs(v20) do
                if v38.shouldShow() then
                    local v39 = v23.current[v38.id];
                    if v39 then
                        table.insert(v33, v39);
                    end;
                end;
            end;
        end;
        if #v33 > 0 then
            table.sort(v33, function(v40, v41) --[[ Line: 148 ]]
                return v40.LayoutOrder < v41.LayoutOrder;
            end);
            local v42 = v19.index or 0;
            v22.registerButtonRow(v19.userId, v33, v42);
        end;
    end, {
        v19.userId, 
        v19.index, 
        v22, 
        v32
    });
    v2.useEffect(function() --[[ Line: 158 ]]
        -- upvalues: v22 (copy), v19 (copy)
        return function() --[[ Line: 159 ]]
            -- upvalues: v22 (ref), v19 (ref)
            v22.handlePersonRemoved(v19.userId);
            v22.unregisterButtonRow(v19.userId);
        end;
    end, {
        v19.userId, 
        v22
    });
    local v43 = v2.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v22 (copy), v19 (copy)
        return v22.hasSelectablePlatformButton(v19.userId);
    end, {
        v19.userId, 
        v22
    });
    local v44 = v2.useMemo(function() --[[ Line: 169 ]]
        -- upvalues: v43 (copy)
        if v43 then
            return Enum.SelectionBehavior.Escape;
        else
            return Enum.SelectionBehavior.Stop;
        end;
    end, {
        v43
    });
    if not v2.useMemo(function() --[[ Line: 174 ]]
        -- upvalues: l_GetFFlagAddPeoplePageCardLayout_0 (ref), v20 (copy)
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            for _, v46 in v20 do
                if v46.shouldShow() then
                    return true;
                end;
            end;
        else
            for _, v48 in ipairs(v20) do
                if v48.shouldShow() then
                    return true;
                end;
            end;
        end;
        return false;
    end, {
        v20
    }) then
        return nil;
    else
        local v49 = {};
        if l_GetFFlagAddPeoplePageCardLayout_0() then
            for _, v51 in v20 do
                if v51.shouldShow() then
                    table.insert(v49, v2.createElement(v18, {
                        key = v51.id, 
                        config = v51, 
                        buttonId = v51.id, 
                        onButtonMount = v26
                    }));
                end;
            end;
        else
            for _, v53 in ipairs(v20) do
                if v53.shouldShow() then
                    table.insert(v49, v2.createElement(v18, {
                        key = v53.id, 
                        config = v53, 
                        buttonId = v53.id, 
                        onButtonMount = v26
                    }));
                end;
            end;
        end;
        return v2.createElement(l_View_0, {
            tag = {
                ["auto-xy row"] = true, 
                ["gap-small"] = v21, 
                ["gap-medium"] = not v21
            }, 
            LayoutOrder = 1, 
            selectionGroup = {
                SelectionBehaviorLeft = v44, 
                SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            }
        }, v49);
    end;
end;