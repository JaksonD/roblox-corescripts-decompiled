local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent;
local l_GetFFlagPeoplePageEnablePersonSignalStore_0 = require(l_Parent_0.Flags).GetFFlagPeoplePageEnablePersonSignalStore;
local v3 = nil;
v3 = if l_GetFFlagPeoplePageEnablePersonSignalStore_0() then require(l_Parent_0.ServiceLocator).get("PeopleListStore") else require(l_Parent_0.PeopleListStore);
local v4 = require(l_Parent_0.PeopleUtility);
local v5 = require(l_Parent_0.Integration.SettingsHubService);
return ((function() --[[ Line: 42 ]] --[[ Name: createFocusNavigationService ]]
    -- upvalues: v5 (copy), l_GuiService_0 (copy), v3 (ref), v4 (copy)
    local v6 = {};
    local v7 = {};
    local v8 = {};
    local v9 = {};
    local v10 = {};
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = false;
    local function v17(v15, v16) --[[ Line: 55 ]] --[[ Name: registerFrame ]]
        -- upvalues: v9 (copy)
        v9[v16] = v15;
    end;
    local function v19(v18) --[[ Line: 59 ]] --[[ Name: unregisterFrame ]]
        -- upvalues: v9 (copy)
        v9[v18] = nil;
    end;
    local function v22(v20, v21) --[[ Line: 63 ]] --[[ Name: registerScrollCallback ]]
        -- upvalues: v10 (copy)
        v10[v20] = v21;
    end;
    local function v24(v23) --[[ Line: 67 ]] --[[ Name: unregisterScrollCallback ]]
        -- upvalues: v10 (copy)
        v10[v23] = nil;
    end;
    local function v26() --[[ Line: 71 ]] --[[ Name: saveScrollPosition ]]
        -- upvalues: v5 (ref), v13 (ref)
        local v25 = v5.hubRef();
        if v25 and v25.PageView then
            v13 = v25.PageView.CanvasPosition;
        end;
    end;
    local function _() --[[ Line: 78 ]] --[[ Name: restoreScrollPosition ]]
        -- upvalues: v13 (ref), v5 (ref), v14 (ref)
        if v13 then
            local v27 = v5.hubRef();
            if v27 and v27.PageView then
                v27.PageView.CanvasPosition = v13;
                v13 = nil;
                v14 = false;
            end;
        end;
    end;
    local function v38() --[[ Line: 89 ]] --[[ Name: getFirstPersonButton ]]
        -- upvalues: v6 (copy), v8 (copy)
        local v29 = nil;
        local v30 = 1e999;
        for v31, v32 in pairs(v6) do
            if v31 ~= -1 then
                local v33 = v8[v31];
                if v33 < v30 then
                    local v34 = nil;
                    local v35 = 1e999;
                    for _, v37 in pairs(v32) do
                        if v37.LayoutOrder and v37.LayoutOrder < v35 then
                            v35 = v37.LayoutOrder;
                            v34 = v37;
                        end;
                    end;
                    if v34 then
                        v30 = v33;
                        v29 = v34;
                    end;
                end;
            end;
        end;
        return v29;
    end;
    local function v49() --[[ Line: 122 ]] --[[ Name: handleSelectionChange ]]
        -- upvalues: l_GuiService_0 (ref), v12 (ref), v7 (copy), v38 (copy), v14 (ref), v13 (ref), v5 (ref), v10 (copy), v9 (copy)
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        if v12 and l_SelectedCoreObject_0 then
            local v40 = v7[v12];
            local v41 = v7[l_SelectedCoreObject_0];
            if v40 and v40 < 0 and v41 and v41 >= 0 then
                local v42 = v38();
                if v42 then
                    local l_v42_0 = v42 --[[ copy: 3 -> 5 ]];
                    task.defer(function() --[[ Line: 133 ]]
                        -- upvalues: l_GuiService_0 (ref), l_v42_0 (copy)
                        l_GuiService_0.SelectedCoreObject = l_v42_0;
                    end);
                end;
            end;
        end;
        if l_SelectedCoreObject_0 then
            local v44 = v7[l_SelectedCoreObject_0];
            if v44 then
                if v14 and v13 then
                    if v13 then
                        local v45 = v5.hubRef();
                        if v45 and v45.PageView then
                            v45.PageView.CanvasPosition = v13;
                            v13 = nil;
                            v14 = false;
                        end;
                    end;
                    return;
                else
                    local v46 = v10[v44];
                    if v46 then
                        v46();
                    else
                        local v47 = v9[v44];
                        if v47 then
                            local v48 = v5.hubRef();
                            if v48 then
                                task.defer(function() --[[ Line: 158 ]]
                                    -- upvalues: v48 (copy), v47 (copy)
                                    v48:ScrollToFrame(v47, true);
                                end);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        v12 = l_SelectedCoreObject_0;
    end;
    local function _() --[[ Line: 170 ]] --[[ Name: initializeSelectionListener ]]
        -- upvalues: v11 (ref), l_GuiService_0 (ref), v49 (copy)
        if not v11 then
            v11 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v49);
        end;
    end;
    local function _() --[[ Line: 177 ]] --[[ Name: disconnectSelectionListener ]]
        -- upvalues: v11 (ref)
        if v11 then
            v11:Disconnect();
            v11 = nil;
        end;
    end;
    local function v58(v52, v53, v54) --[[ Line: 184 ]] --[[ Name: registerButtonRow ]]
        -- upvalues: v6 (copy), v8 (copy), v7 (copy), v11 (ref), l_GuiService_0 (ref), v49 (copy)
        if not v6[v52] then
            v6[v52] = {};
        end;
        v8[v52] = v54;
        for _, v56 in ipairs(v53) do
            local l_Name_0 = v56.Name;
            v6[v52][l_Name_0] = v56;
            v7[v56] = v52;
        end;
        if not v11 then
            v11 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(v49);
        end;
    end;
    local function v63(v59) --[[ Line: 203 ]] --[[ Name: unregisterButtonRow ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), v10 (copy), v11 (ref)
        local v60 = v6[v59];
        if v60 then
            for _, v62 in pairs(v60) do
                v7[v62] = nil;
            end;
        end;
        v6[v59] = nil;
        v8[v59] = nil;
        v10[v59] = nil;
        if not next(v6) and v11 then
            v11:Disconnect();
            v11 = nil;
        end;
    end;
    local function _() --[[ Line: 224 ]] --[[ Name: getFocusedPersonInfo ]]
        -- upvalues: l_GuiService_0 (ref), v7 (copy)
        local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
        if l_SelectedCoreObject_1 then
            local v65 = v7[l_SelectedCoreObject_1];
            local l_Name_1 = l_SelectedCoreObject_1.Name;
            if v65 and l_Name_1 then
                return v65, l_Name_1;
            end;
        end;
        return nil, nil;
    end;
    local function v75(v68, v69) --[[ Line: 240 ]] --[[ Name: findButtonForUser ]]
        -- upvalues: v6 (copy)
        local v70 = v6[v68];
        if not v70 then
            return nil;
        else
            local v71 = v70[v69];
            if v71 then
                return v71;
            else
                local v72 = nil;
                for _, v74 in pairs(v70) do
                    if not v72 or v74.LayoutOrder < v72.LayoutOrder then
                        v72 = v74;
                    end;
                end;
                return v72;
            end;
        end;
    end;
    local function _(v76, v77) --[[ Line: 262 ]] --[[ Name: findNearestPerson ]]
        -- upvalues: v8 (copy)
        if #v77 == 0 then
            return nil;
        else
            local v78 = v8[v76];
            if not v78 then
                return v77[1].UserId;
            elseif v77[v78] then
                return v77[v78].UserId;
            elseif v78 > 1 and v77[v78 - 1] then
                return v77[v78 - 1].UserId;
            else
                return v77[1].UserId;
            end;
        end;
    end;
    local function v95(v80) --[[ Line: 284 ]] --[[ Name: handlePersonRemoved ]]
        -- upvalues: v3 (ref), l_GuiService_0 (ref), v7 (copy), v8 (copy), v6 (copy), v75 (copy)
        local v81 = false;
        local v82 = v3.people(false);
        for _, v84 in ipairs(v82) do
            if v84.UserId == v80 then
                return;
            end;
        end;
        local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
        local v86, v87;
        if l_SelectedCoreObject_2 then
            local v88 = v7[l_SelectedCoreObject_2];
            local l_Name_2 = l_SelectedCoreObject_2.Name;
            if v88 and l_Name_2 then
                v86 = v88;
                v87 = l_Name_2;
                v81 = true;
            end;
        end;
        if not v81 then
            v86 = nil;
            v87 = nil;
        end;
        v81 = false;
        if v86 ~= v80 or not v87 then
            return;
        else
            if #v82 == 0 then
                l_SelectedCoreObject_2 = nil;
            else
                local v90 = v8[v80];
                l_SelectedCoreObject_2 = if not v90 then v82[1].UserId else if v82[v90] then v82[v90].UserId else if v90 > 1 and v82[v90 - 1] then v82[v90 - 1].UserId else v82[1].UserId;
            end;
            if l_SelectedCoreObject_2 and v6[l_SelectedCoreObject_2] then
                local v91 = v75(l_SelectedCoreObject_2, v87);
                if v91 then
                    task.defer(function() --[[ Line: 301 ]]
                        -- upvalues: l_GuiService_0 (ref), v91 (copy)
                        l_GuiService_0.SelectedCoreObject = v91;
                    end);
                    return;
                end;
            end;
            for v92, _ in pairs(v6) do
                if v92 ~= v80 then
                    local v94 = v75(v92, v87);
                    if v94 then
                        task.defer(function() --[[ Line: 313 ]]
                            -- upvalues: l_GuiService_0 (ref), v94 (copy)
                            l_GuiService_0.SelectedCoreObject = v94;
                        end);
                        return;
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v103(v96) --[[ Line: 322 ]] --[[ Name: hasSelectablePlatformButton ]]
        -- upvalues: v3 (ref), v4 (ref)
        if not v96 then
            return false;
        else
            local v97 = v3.getPlatformName(v96);
            local v98 = v3.getPlatformProfileId(v96);
            local v99 = v97(false);
            local v100 = v98(false);
            local v101 = v99 and type(v99) == "string" and string.len(v99) > 0;
            local v102 = v4.canShowPlatformProfile(v100 or "");
            return v101 and v102;
        end;
    end;
    local function v105(v104) --[[ Line: 340 ]] --[[ Name: setBlockingModalRestoreMode ]]
        -- upvalues: v14 (ref)
        v14 = v104;
    end;
    return {
        registerButtonRow = v58, 
        unregisterButtonRow = v63, 
        registerFrame = v17, 
        unregisterFrame = v19, 
        registerScrollCallback = v22, 
        unregisterScrollCallback = v24, 
        handlePersonRemoved = v95, 
        hasSelectablePlatformButton = v103, 
        saveScrollPosition = v26, 
        setBlockingModalRestoreMode = v105, 
        getFirstPersonButton = v38
    };
end)());