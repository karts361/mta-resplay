addEvent "onControlPressed"
addEvent "onEditorSuspended"
addEvent "onEditorResumed"
local rootElement = getRootElement()
local addedCommands = {}
local commandState = {}
local keyStateToBool = { down = true, up = false }
local keybinds = {}
local keybinds_backup = {}
local keyStates = { down = true, up = true, both = true }

function bindControl(control, keyState, handlerFunction, ...)
	if not keyStates[keyState] then return false end
	if not control then return false end
	local hitState = "down"
	if keyState == "down" or keyState == "both" then
		keybinds[control] = keybinds[control] or {}
		keybinds[control][hitState] = keybinds[control][hitState] or {}
		keybinds[control][hitState][handlerFunction] = {...}
	end
	hitState = "up"
	if keyState == "up" or keyState == "both" then
		keybinds[control] = keybinds[control] or {}
		keybinds[control][hitState] = keybinds[control][hitState] or {}
		keybinds[control][hitState][handlerFunction] = {...}
	end
	return true
end


function unbindControl(control, keyState, handlerFunction)
	if not control then return false end
	--Handle the optional arguments just like bindKey
	if keyState then
		if handlerFunction then
			--The control may not be necessarilly be binded
			if(keybinds[control]) then
				if(keybinds[control][keyState]) then
					keybinds[control][keyState][handlerFunction] = nil
				end
			end
		else
			if(keybinds[control]) then
				keybinds[control][keyState] = nil
			end
		end
	else
		keybinds[control] = nil
	end
	return true
end

function getCommandState(command)
	return commandState[command]
end

addEventHandler("onControlPressed",  rootElement,
	function(key, keyState)
		commandState[key] = keyStateToBool[keyState]
		if keybinds[key] then
			if keybinds[key][keyState] then
				for handlerFunction, args in pairs(keybinds[key][keyState]) do
					handlerFunction(key, keyState, unpack(args))
				end
			end
		end
	end
)

addEventHandler("onEditorSuspended", rootElement,
	function()
		keybinds_backup = deepcopy(keybinds)
		for control,keyStateTable in pairs(keybinds) do
			for keyState,functionTable in pairs(keyStateTable) do
				for handlerFunction, argumentsTable in pairs(functionTable) do
					unbindControl(control, keyState, handlerFunction)
				end
			end
		end
	end
)

addEventHandler("onEditorResumed", rootElement,
	function()
		for control,keyStateTable in pairs(keybinds_backup) do
			for keyState,functionTable in pairs(keyStateTable) do
				for handlerFunction, argumentsTable in pairs(functionTable) do
					bindControl(control, keyState, handlerFunction, unpack(argumentsTable))
				end
			end
		end
	end
)

function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
