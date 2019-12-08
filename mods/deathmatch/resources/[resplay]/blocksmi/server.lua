newbie = { }
local xmlFile = xmlLoadFile ( "cmd.xml" )
local node = xmlFindChild( xmlFile, "commands", 0 )

function commandexecuted( player, commandName, otherPlayer )
	if source then
		player = source
	end
	if not getElementData(player,"cmdflood") then
		setElementData(player,"cmdflood",0)
	elseif getElementData(player,"cmdflood")>= 23 then
		setElementData(player,"cmdflood",0)
	    banPlayer ( player, false, true, true, getRootElement ( ), 'попытка спама', 7200 )
		return
	end
	setElementData(player,"cmdflood",getElementData(player,"cmdflood")+1)
	setTimer(reducecmd,4000,1,player)
end
--addEventHandler("onPlayerChat",getRootElement(),commandexecuted)

	
function resourcestart()
	local commands = xmlNodeGetValue ( node ) 
	if commands then
		newbie = fromJSON(commands)
		outputDebugString("CMDFLOOD list: "..commands) 
		for key, value in ipairs( newbie ) do
			addCommandHandler( value,commandexecuted,false,false)
			outputChatBox(value)
		end
	end
end
addEventHandler("onResourceStart",getResourceRootElement(),resourcestart)

function reducecmd(player)
	if getElementData(player,"cmdflood")>=1 then
		setElementData(player,"cmdflood",getElementData(player,"cmdflood")-1)
	end
end

function checkcommand(player,command)
	if hasObjectPermissionTo (player, "command.kick", true )  then
		for key, value in ipairs( newbie ) do
			outputChatBox(key..". "..value,player,255,255,2)
		end
	end
end
addCommandHandler("checkcommands",checkcommand)

function addcommand(player,command,arg1)
	if hasObjectPermissionTo (player, "command.kick", true )  then
		for key, value in ipairs( newbie ) do
			if value == arg1 then
				outputChatBox("command already there",player,255,255,2)
				return
			end
		end
		table.insert(newbie,arg1)	
		local commands = toJSON( newbie )
		local add =  xmlNodeSetValue (node,commands)
		xmlSaveFile ( xmlFile)
		if add then 
		outputChatBox("Command "..arg1.." added to list.",player,0,255,0)
		addCommandHandler(arg1,commandexecuted,false,false)
		end
	end
end
addCommandHandler("addcommand",addcommand)

function delcommand(player,command,arg1)
	if hasObjectPermissionTo (player, "command.kick", true )  then
			for key, value in ipairs( newbie ) do
				if value == arg1 then
					outputChatBox("Command deleted.",player,255,255,2)
					table.remove(newbie,key)
					removeCommandHandler(value)
					local commands = toJSON( newbie )
					local add =  xmlNodeSetValue (node,commands)
					xmlSaveFile (xmlFile)
					return
				end
			end
			outputChatBox("No such command.",player,255,2,2)
	end
end
addCommandHandler("delcommand",delcommand)

