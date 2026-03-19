local v0 = require(script.Parent.Platform);
local v1 = require(script.Parent.Parent.Icon);
local function _(v2, v3) --[[ Line: 4 ]] --[[ Name: merge ]]
    for v4, v5 in v3 do
        v2[v4] = v5;
    end;
    return v2;
end;
local v7 = {
    ButtonA = v1.PsX, 
    ButtonB = v1.PsCircle, 
    ButtonX = v1.PsSquare, 
    ButtonY = v1.PsTriagle, 
    ButtonL1 = v1.PsL1, 
    ButtonL2 = v1.PsL2, 
    ButtonL3 = v1.PsL3, 
    ButtonR1 = v1.PsR1, 
    ButtonR2 = v1.PsR2, 
    ButtonR3 = v1.PsR3, 
    Thumbstick1 = v1.PsStickLeft, 
    Thumbstick2 = v1.PsStickRight, 
    DPadDown = v1.PsDpadDown, 
    DPadUp = v1.PsDpadUp, 
    DPadLeft = v1.PsDpadLeft, 
    DPadRight = v1.PsDpadRight
};
local v8 = {};
local l_PS4_0 = v0.PS4;
for v10, v11 in {
    ButtonStart = v1.Ps4Options, 
    ButtonSelect = v1.Ps4Share
} do
    v7[v10] = v11;
end;
v8[l_PS4_0] = v7;
l_PS4_0 = v0.PS5;
for v12, v13 in {
    ButtonStart = v1.Ps5Options, 
    ButtonSelect = v1.Ps5Share
} do
    v7[v12] = v13;
end;
v8[l_PS4_0] = v7;
v8[v0.Xbox] = {
    ButtonA = v1.XboxA, 
    ButtonB = v1.XboxB, 
    ButtonX = v1.XboxX, 
    ButtonY = v1.XboxY, 
    ButtonL1 = v1.XboxLb, 
    ButtonL2 = v1.XboxLt, 
    ButtonL3 = v1.XboxStickLeft, 
    ButtonR1 = v1.XboxRb, 
    ButtonR2 = v1.XboxRt, 
    ButtonR3 = v1.XboxStickRight, 
    ButtonStart = v1.XboxMenu, 
    ButtonSelect = v1.XboxView, 
    Thumbstick1 = v1.XboxStickLeftDirectional, 
    Thumbstick2 = v1.XboxStickRightDirectional, 
    DPadDown = v1.XboxDpadDown, 
    DPadUp = v1.XboxDpadUp, 
    DPadLeft = v1.XboxDpadLeft, 
    DPadRight = v1.XboxDpadRight
};
v8[v0.Default] = {
    LeftAlt = v1.KeyAlt, 
    RightAlt = v1.KeyAlt, 
    Down = v1.KeyArrowDown, 
    Up = v1.KeyArrowUp, 
    Left = v1.KeyArrowLeft, 
    Right = v1.KeyArrowRight, 
    Asterisk = v1.KeyAsterisk, 
    Backspace = v1.KeyBackspace, 
    CapsLock = v1.KeyCapsLock, 
    Caret = v1.KeyCaret, 
    Comma = v1.KeyComma, 
    LeftControl = v1.KeyControl, 
    RightControl = v1.KeyControl, 
    Backquote = v1.KeyGraveAccent, 
    Period = v1.KeyPeriod, 
    Return = v1.KeyReturn, 
    LeftShift = v1.KeyShift, 
    RightShift = v1.KeyShift, 
    Space = v1.KeySpace, 
    Tab = v1.KeyTab
};
return v8;