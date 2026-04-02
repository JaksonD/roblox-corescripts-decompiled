local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v6 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SetRangesAndSliderValuesFromBodyColor3s);
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
return function(v14, v15) --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v13 (copy), v12 (copy), v4 (copy), v10 (copy), v11 (copy), l_Logging_0 (copy), v6 (copy)
    v3.isType(v14, "function", "RefetchAvatarData thunk expects networkImpl to be a function");
    return function(v16, _) --[[ Line: 29 ]]
        -- upvalues: v13 (ref), v14 (copy), v15 (copy), v12 (ref), v4 (ref), v10 (ref), v11 (ref), l_Logging_0 (ref), v6 (ref)
        return v13.GetAvatarData(v14, {
            checkAssetAvailability = v15
        }):andThen(function(v18) --[[ Line: 31 ]]
            -- upvalues: v12 (ref), v4 (ref), v16 (copy), v10 (ref), v11 (ref)
            local v19 = v12.tableToCamelCaseKeys(v18.responseBody);
            if not v19 then
                return;
            else
                local v20 = v19.bodyColor3s or {};
                local v21 = v12.convertBodyColor3HexesToColor3s(v20);
                local v22 = v4.Dictionary.join(v19, {
                    bodyColor3s = v21
                });
                v16:dispatch(v10(v22));
                local l_DefaultBodyColorRanges_0 = v16:getState().AvatarExperience.AvatarEditor.DefaultBodyColorRanges;
                if l_DefaultBodyColorRanges_0 and #l_DefaultBodyColorRanges_0 > 0 then
                    v16:dispatch(v11(v21));
                end;
                return;
            end;
        end):catch(function(v24) --[[ Line: 49 ]]
            -- upvalues: l_Logging_0 (ref), v6 (ref)
            l_Logging_0.warn("WebApi failure in RefetchAvatarData: " .. tostring(v24));
            return v6.reject(v24);
        end);
    end;
end;