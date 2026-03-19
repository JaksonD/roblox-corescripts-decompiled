local l_script_FirstAncestor_0 = script:FindFirstAncestor("TrustAndSafetyIxp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagReportAnythingAnnotationIXP_0 = require(l_Parent_0.SharedFlags).GetFFlagReportAnythingAnnotationIXP;
local l_GetFStringReportAnythingAnnotationIXPLayerName_0 = require(l_Parent_0.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName;
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagForceReportAnythingAnnotationEnabled);
local l_IXPServiceWrapper_0 = require(l_Parent_0.IxpServiceWrapper).IXPServiceWrapper;
local v6 = require(l_Parent_0.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: l_IXPServiceWrapper_0 (copy), v7 (copy)
    local v9 = {
        _ixpServiceWrapper = v8 or l_IXPServiceWrapper_0, 
        _initialized = false, 
        _ixpInitialized = false, 
        _optionalScreenshotEnabled = false, 
        _reportAnythingExperienceEnabled = false, 
        _reportAnythingAvatarEnabled = false, 
        _callbacks = {}
    };
    setmetatable(v9, v7);
    return v9;
end;
v7.getReportAnythingExperienceEnabled = function(v10) --[[ Line: 33 ]] --[[ Name: getReportAnythingExperienceEnabled ]]
    -- upvalues: v4 (copy)
    if v4() then
        return true;
    else
        return v10._reportAnythingExperienceEnabled or v10._optionalScreenshotEnabled;
    end;
end;
v7.getReportAnythingAvatarEnabled = function(v11) --[[ Line: 40 ]] --[[ Name: getReportAnythingAvatarEnabled ]]
    -- upvalues: v4 (copy)
    if v4() then
        return true;
    else
        return v11._reportAnythingAvatarEnabled or v11._optionalScreenshotEnabled;
    end;
end;
v7.waitForInitialization = function(v12, v13) --[[ Line: 47 ]] --[[ Name: waitForInitialization ]]
    if v12._ixpInitialized then
        v13();
        return;
    else
        table.insert(v12._callbacks, v13);
        return;
    end;
end;
v7.initialize = function(v14) --[[ Line: 55 ]] --[[ Name: initialize ]]
    -- upvalues: l_GetFFlagReportAnythingAnnotationIXP_0 (copy), l_GetFStringReportAnythingAnnotationIXPLayerName_0 (copy), v6 (copy)
    if v14._initialized then
        return;
    else
        v14._initialized = true;
        local function v17() --[[ Line: 61 ]] --[[ Name: invokeCallbacks ]]
            -- upvalues: v14 (copy)
            for _, v16 in ipairs(v14._callbacks) do
                v16();
            end;
            v14._callbacks = {};
        end;
        if not l_GetFFlagReportAnythingAnnotationIXP_0() then
            v14._ixpInitialized = true;
            v17();
            return;
        else
            task.spawn(function() --[[ Line: 74 ]]
                -- upvalues: v14 (copy), l_GetFStringReportAnythingAnnotationIXPLayerName_0 (ref), v6 (ref), v17 (copy)
                v14._ixpServiceWrapper:WaitForInitialization();
                local l_LayerData_0 = v14._ixpServiceWrapper:GetLayerData(l_GetFStringReportAnythingAnnotationIXPLayerName_0());
                if l_LayerData_0 then
                    v14._optionalScreenshotEnabled = l_LayerData_0.OptionalScreenshotEnabled or false;
                    v14._reportAnythingExperienceEnabled = l_LayerData_0.OptionalScreenshotExperience or false;
                    v14._reportAnythingAvatarEnabled = l_LayerData_0.OptionalScreenshotAvatar or false;
                end;
                v6:debug("RA Optional Screenshot enabled (Avatar and/or Experience) or Select In Scene enabled? Both Avatar and Exp: {}, Exp: {}, Avatar: {}, Select in Scene: {}. Invoking {} callbacks.", v14._optionalScreenshotEnabled, v14._reportAnythingExperienceEnabled, v14._reportAnythingAvatarEnabled, v14._selectInSceneEnabled, #v14._callbacks);
                v14._ixpInitialized = true;
                v17();
            end);
            return;
        end;
    end;
end;
v7.default = v7.new();
return v7;