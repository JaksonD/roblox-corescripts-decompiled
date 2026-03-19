local v0 = require(script.Parent.SessionType);
local v1 = {};
v1.__index = v1;
v1.new = function(v2) --[[ Line: 37 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = setmetatable({}, v1);
    if v2 then
        v3._sessionService = v2;
    else
        v3._sessionService = game:GetService("SessionService");
    end;
    v3._currentMenuTab = nil;
    return v3;
end;
v1._setMetadata = function(v4, v5, v6, v7) --[[ Line: 50 ]] --[[ Name: _setMetadata ]]
    v4._sessionService:SetMetadata(v5, v6, v7);
end;
v1.OpenExperienceMenu = function(v8, v9) --[[ Line: 54 ]] --[[ Name: OpenExperienceMenu ]]
    -- upvalues: v0 (copy)
    v8._sessionService:SetSession(v0.StructuralIdentifier.Level2a, v0.StructuralIdentifier.ExperienceMenu, v0.Tag.level3.ExperienceMenu);
    if v9 then
        for v10, v11 in pairs(v9) do
            v8._sessionService:SetMetadata(v0.StructuralIdentifier.ExperienceMenu, v10, v11);
        end;
    end;
end;
v1.CloseExperienceMenu = function(v12) --[[ Line: 67 ]] --[[ Name: CloseExperienceMenu ]]
    -- upvalues: v0 (copy)
    v12:CloseOpenedMenuTab();
    v12._sessionService:RemoveSession(v0.StructuralIdentifier.ExperienceMenu);
end;
v1.CloseOpenedMenuTab = function(v13) --[[ Line: 72 ]] --[[ Name: CloseOpenedMenuTab ]]
    if v13._currentMenuTab then
        v13._sessionService:RemoveSession(v13._currentMenuTab);
        v13._currentMenuTab = nil;
    end;
end;
v1.OpenPeopleTab = function(v14, v15, v16) --[[ Line: 79 ]] --[[ Name: OpenPeopleTab ]]
    -- upvalues: v0 (copy)
    local v17 = v15 or v0.StructuralIdentifier.ExperienceMenu;
    v14._sessionService:SetSession(v17, v0.StructuralIdentifier.PeopleTab, v0.Tag.level3.PeopleTab);
    if v16 then
        for v18, v19 in pairs(v16) do
            v14._sessionService:SetMetadata(v0.StructuralIdentifier.PeopleTab, v18, v19);
        end;
    end;
    v14._currentMenuTab = v0.StructuralIdentifier.PeopleTab;
end;
v1.OpenSettingsTab = function(v20, v21, v22) --[[ Line: 91 ]] --[[ Name: OpenSettingsTab ]]
    -- upvalues: v0 (copy)
    local v23 = v21 or v0.StructuralIdentifier.ExperienceMenu;
    v20._sessionService:SetSession(v23, v0.StructuralIdentifier.SettingsTab, v0.Tag.level3.SettingsTab);
    if v22 then
        for v24, v25 in pairs(v22) do
            v20._sessionService:SetMetadata(v0.StructuralIdentifier.SettingsTab, v24, v25);
        end;
    end;
    v20._currentMenuTab = v0.StructuralIdentifier.SettingsTab;
end;
v1.OpenCapturesTab = function(v26, v27, v28) --[[ Line: 107 ]] --[[ Name: OpenCapturesTab ]]
    -- upvalues: v0 (copy)
    local v29 = v27 or v0.StructuralIdentifier.ExperienceMenu;
    v26._sessionService:SetSession(v29, v0.StructuralIdentifier.CapturesTab, v0.Tag.level3.CapturesTab);
    if v28 then
        for v30, v31 in pairs(v28) do
            v26._sessionService:SetMetadata(v0.StructuralIdentifier.CapturesTab, v30, v31);
        end;
    end;
    v26._currentMenuTab = v0.StructuralIdentifier.CapturesTab;
end;
v1.OpenReportTab = function(v32, v33, v34) --[[ Line: 123 ]] --[[ Name: OpenReportTab ]]
    -- upvalues: v0 (copy)
    local v35 = v33 or v0.StructuralIdentifier.ExperienceMenu;
    v32._sessionService:SetSession(v35, v0.StructuralIdentifier.ReportTab, v0.Tag.level3.ReportTab);
    if v34 then
        for v36, v37 in pairs(v34) do
            v32._sessionService:SetMetadata(v0.StructuralIdentifier.ReportTab, v36, v37);
        end;
    end;
    v32._currentMenuTab = v0.StructuralIdentifier.ReportTab;
end;
v1.OpenHelpTab = function(v38, v39, v40) --[[ Line: 135 ]] --[[ Name: OpenHelpTab ]]
    -- upvalues: v0 (copy)
    local v41 = v39 or v0.StructuralIdentifier.ExperienceMenu;
    v38._sessionService:SetSession(v41, v0.StructuralIdentifier.HelpTab, v0.Tag.level3.HelpTab);
    if v40 then
        for v42, v43 in pairs(v40) do
            v38._sessionService:SetMetadata(v0.StructuralIdentifier.HelpTab, v42, v43);
        end;
    end;
    v38._currentMenuTab = v0.StructuralIdentifier.HelpTab;
end;
v1.OpenLeaveExperience = function(v44, v45, v46) --[[ Line: 147 ]] --[[ Name: OpenLeaveExperience ]]
    -- upvalues: v0 (copy)
    local v47 = v45 or v0.StructuralIdentifier.ExperienceMenu;
    v44._sessionService:SetSession(v47, v0.StructuralIdentifier.LeaveExperience, v0.Tag.level3.LeaveExperience);
    if v46 then
        for v48, v49 in pairs(v46) do
            v44._sessionService:SetMetadata(v0.StructuralIdentifier.LeaveExperience, v48, v49);
        end;
    end;
    v44._currentMenuTab = v0.StructuralIdentifier.LeaveExperience;
end;
v1.OpenResetCharacter = function(v50, v51, v52) --[[ Line: 163 ]] --[[ Name: OpenResetCharacter ]]
    -- upvalues: v0 (copy)
    local v53 = v51 or v0.StructuralIdentifier.ExperienceMenu;
    v50._sessionService:SetSession(v53, v0.StructuralIdentifier.ResetCharacter, v0.Tag.level3.ResetCharacter);
    if v52 then
        for v54, v55 in pairs(v52) do
            v50._sessionService:SetMetadata(v0.StructuralIdentifier.ResetCharacter, v54, v55);
        end;
    end;
    v50._currentMenuTab = v0.StructuralIdentifier.ResetCharacter;
end;
v1.MenuSwitchToPage = function(v56, v57) --[[ Line: 179 ]] --[[ Name: MenuSwitchToPage ]]
    if v57 == nil then
        return;
    else
        v56:CloseOpenedMenuTab();
        local l_Name_0 = v57.Name;
        if l_Name_0 == "Players" then
            v56:OpenPeopleTab();
            return;
        elseif l_Name_0 == "Page" then
            v56:OpenSettingsTab();
            return;
        elseif l_Name_0 == "Captures" then
            v56:OpenCapturesTab();
            return;
        elseif l_Name_0 == "ReportAbuseMenuNewContainerPage" then
            v56:OpenReportTab();
            return;
        elseif l_Name_0 == "Help" then
            v56:OpenHelpTab();
            return;
        elseif l_Name_0 == "LeaveGamePage" then
            v56:OpenLeaveExperience();
            return;
        else
            if l_Name_0 == "ResetCharacter" then
                v56:OpenResetCharacter();
            end;
            return;
        end;
    end;
end;
return v1;