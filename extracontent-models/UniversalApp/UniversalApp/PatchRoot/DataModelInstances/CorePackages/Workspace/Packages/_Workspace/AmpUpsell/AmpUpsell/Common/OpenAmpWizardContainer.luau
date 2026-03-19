local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
return function(v4, v5, v6, v7, v8, v9) --[[ Line: 8 ]]
    -- upvalues: l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_NavigateBack_0 (copy)
    return function(v10) --[[ Line: 16 ]]
        -- upvalues: l_NavigateDown_0 (ref), l_AppPage_0 (ref), v4 (copy), v6 (copy), v7 (copy), v9 (copy), v8 (copy), l_NavigateBack_0 (ref), v5 (copy)
        v10:dispatch(l_NavigateDown_0({
            name = l_AppPage_0.AmpWizardContainer, 
            extraProps = {
                featureName = v4, 
                recourseData = v6, 
                entryPointEventCtx = v7, 
                nameSpace = v9, 
                extraParameters = v8, 
                completionCallback = function(v11, v12) --[[ Line: 25 ]] --[[ Name: completionCallback ]]
                    -- upvalues: v10 (copy), l_NavigateBack_0 (ref), v5 (ref)
                    v10:dispatch(l_NavigateBack_0());
                    v5(v11, v12);
                end
            }
        }, true));
    end;
end;