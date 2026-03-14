local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_TextInput_0 = v3.TextInput;
local l_IconName_0 = v3.Enums.IconName;
local v8 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Common.Constants);
local v11 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local v12 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v12.clearTimeout;
local l_setTimeout_0 = v12.setTimeout;
local v15 = require(l_script_FirstAncestor_0.Analytics.AnalyticsServiceV2);
local v16 = game:DefineFastInt("MaxDisplayNameCharacters", 20);
local v17 = game:DefineFastInt("MinDisplayNameCharacters", 3);
local v18 = game:DefineFastInt("DisplayNameValidationNetworkDelay", 500);
return function(v19) --[[ Line: 33 ]]
    -- upvalues: l_useLocalization_0 (copy), v8 (copy), v11 (copy), v2 (copy), l_setTimeout_0 (copy), v18 (copy), v10 (copy), l_clearTimeout_0 (copy), v17 (copy), v15 (copy), v16 (copy), l_View_0 (copy), l_Text_0 (copy), l_TextInput_0 (copy), l_IconName_0 (copy)
    local v20 = l_useLocalization_0({
        DisplayNameCaption = v8.DisplayNameCaption
    });
    local v21 = v11();
    local v22, v23 = v2.useState(v19.initialDisplayName);
    local v24, v25 = v2.useState(false);
    local v26, v27 = v2.useState(v21.displayNameChangeError);
    local v28, v29 = v2.useState(false);
    local v30 = v2.useRef(l_setTimeout_0(function() --[[ Line: 42 ]]

    end, v18));
    v2.useEffect(function() --[[ Line: 44 ]]
        -- upvalues: v19 (copy), v24 (copy), v28 (copy)
        if v19.updateErrorState then
            v19.updateErrorState(v24 or v28);
        end;
    end, {
        v24, 
        v28
    });
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: v23 (copy), v19 (copy)
        v23(v19.initialDisplayName);
    end, {
        v19.initialDisplayName
    });
    local function v32(v31) --[[ Line: 54 ]] --[[ Name: getErrorMessage ]]
        -- upvalues: v10 (ref), v21 (copy)
        return ({
            [v10.DisplayNameValidationErrorCodes.TooShort] = v21.nameTooShortError, 
            [v10.DisplayNameValidationErrorCodes.TooLong] = v21.nameTooLongError, 
            [v10.DisplayNameValidationErrorCodes.InvalidCharacters] = v21.nameUnsupportedCharsError, 
            [v10.DisplayNameValidationErrorCodes.Moderated] = v21.nameInappropriateError, 
            [v10.DisplayNameValidationErrorCodes.Throttled] = v21.nameHasChangedError, 
            [v10.DisplayNameValidationErrorCodes.InvalidCharacterSetCombination] = v21.displayNameChangeMixedCharactersError, 
            [v10.DisplayNameValidationErrorCodes.NameNotAvailable] = v21.nameNotAvailableError
        })[v31] or v21.displayNameChangeError;
    end;
    local function v38(v33) --[[ Line: 67 ]] --[[ Name: textChanged ]]
        -- upvalues: l_clearTimeout_0 (ref), v30 (copy), v23 (copy), v25 (copy), v29 (copy), v17 (ref), v15 (ref), v27 (copy), v21 (copy), v16 (ref), l_setTimeout_0 (ref), v19 (copy), v32 (copy), v18 (ref)
        l_clearTimeout_0(v30.current);
        v33 = v33 or "";
        local v34 = utf8.len(v33) or 0;
        v23(v33);
        v25(false);
        v29(false);
        if v34 < v17 then
            v15.sendDisplayNameTooShort(v33);
            v27(v21.nameTooShortError);
            v25(true);
            return;
        elseif v16 < v34 then
            v27(v21.nameTooLongError);
            v25(true);
            return;
        else
            v29(true);
            v30.current = l_setTimeout_0(function() --[[ Line: 88 ]]
                -- upvalues: v19 (ref), v33 (ref), v25 (ref), v29 (ref), v15 (ref), v27 (ref), v32 (ref)
                v19.validateDisplayName(v33):andThen(function(_) --[[ Line: 91 ]]
                    -- upvalues: v25 (ref), v29 (ref), v19 (ref), v33 (ref)
                    v25(false);
                    v29(false);
                    v19.onDataChange(v33);
                end):catch(function(v36) --[[ Line: 96 ]]
                    -- upvalues: v15 (ref), v33 (ref), v27 (ref), v32 (ref), v25 (ref), v29 (ref)
                    local v37 = -1;
                    if v36 and v36.errors and v36.errors[1] then
                        v37 = v36.errors[1].code or -1;
                    end;
                    v15.sendFilteredDisplayName(v33);
                    v27((v32(v37)));
                    v25(true);
                    v29(false);
                end);
            end, v18);
            return;
        end;
    end;
    return v2.createElement(l_View_0, {
        tag = "auto-y col gap-medium bg-transparent", 
        LayoutOrder = 1, 
        Size = UDim2.new(1, 0, 0, 0)
    }, {
        Caption = v2.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v20.DisplayNameCaption, 
            tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left"
        }), 
        DisplayNameInput = v2.createElement(l_TextInput_0, {
            text = v22, 
            LayoutOrder = 2, 
            label = "", 
            tag = "text-body-medium text-wrap size-full-0 auto-y text-align-x-left", 
            width = UDim.new(1, 0), 
            placeholder = v19.initialDisplayName, 
            hint = if v24 then v26 else string.format("%d/%d", utf8.len(v22 or "") or 0, v16), 
            onChanged = function(v39) --[[ Line: 131 ]] --[[ Name: onChanged ]]
                -- upvalues: v38 (copy)
                v38(v39);
            end, 
            hasError = v24, 
            iconTrailing = if v22 and #v22 > 0 then {
                name = l_IconName_0.CircleX, 
                onActivated = function() --[[ Line: 138 ]] --[[ Name: onActivated ]]
                    -- upvalues: v38 (copy)
                    v38("");
                end
            } else nil, 
            textBoxRef = v19.textBoxRef
        })
    });
end;