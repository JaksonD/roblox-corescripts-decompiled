local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.RoactUtils);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Components.CaptureService.PromptConnections);
local v6 = require(l_Parent_0.Enums.PromptType);
local v7 = require(l_Parent_0.Components.CaptureService.SaveCapturesPrompt);
local v8 = require(l_Parent_0.Components.CaptureService.ShareCapturePrompt);
local v9 = require(l_Parent_0.Components.CaptureService.CapturePermissionsPromptV2);
local _ = require(l_Parent_0.Types);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local v12 = {
    [v6.SaveCaptures] = v7, 
    [v6.ShareCapture] = v8
};
if game:GetEngineFeature("CaptureServiceGalleryPermissionPrompt") then
    v12[v6.CapturePermissions] = v9;
end;
return function(_) --[[ Line: 30 ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy), v12 (copy), v2 (copy), v5 (copy)
    local v15 = l_useSelector_0(function(v14) --[[ Line: 31 ]]
        -- upvalues: v4 (ref)
        return v14[v4.RoduxKey].Prompts[1];
    end);
    local v16 = v15 and v15.PromptData;
    local v17 = v15 and v15.PromptId;
    local v18 = v15 and v15.PromptType;
    local v19 = nil;
    if v18 then
        local v20 = v12[v18];
        if v20 then
            v19 = v2.createElement(v20, {
                promptData = v16, 
                promptId = v17
            });
        else
            error((("Unexpected prompt type: %*!"):format(v18)));
        end;
    end;
    return v2.createElement(v2.Fragment, {}, {
        PromptConnections = v2.createElement(v5), 
        Prompt = v19
    });
end;