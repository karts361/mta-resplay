newbie = { }
local xmlFile = xmlLoadFile ( "cmd.xml" )
local node = xmlFindChild( xmlFile, "commands", 0 )

function generateTimeString()
	local tm = getRealTime()
	return string.format("[%02d.%02d.%d %02d:%02d:%02d] ",  tm.monthday, tm.month+1, tm.year+1900, tm.hour, tm.minute, tm.second)
end

function commandexecuted( player, commandName, otherPlayer )
	if source then
		player = source
	end
	if not getElementData(player,"cmdflood") then
		setElementData(player,"cmdflood",0)
	elseif getElementData(player,"cmdflood")>= 23 then
		outputChatBox("#00FF00"..generateTimeString().."[RESPLAY]: #00FFFF Обнаружена попытка спама, вам был выдан мут", player ,255, 255, 255, true)
		setElementData(player,"cmdflood",0)
		setPlayerMuted(player, true)
		setTimer ( autoUnmute, 300000, 1, player)
		return
	end
	setElementData(player,"cmdflood",getElementData(player,"cmdflood")+1)
	setTimer(reducecmd,4000,1,player)
end
addEventHandler("onPlayerChat",getRootElement(),commandexecuted)

	
function resourcestart()
	local commands = xmlNodeGetValue ( node ) 
	if commands then
		newbie = fromJSON(commands)
		outputDebugString("CMDFLOOD list: "..commands) 
		for key, value in ipairs( newbie ) do
			addCommandHandler( value,commandexecuted,false,false)
			--outputChatBox(value)
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
	if hasObjectPermissionTo (player, "command.chgpass", true )  then
		for key, value in ipairs( newbie ) do
			outputChatBox(key..". "..value,player,255,255,2)
		end
	end
end
addCommandHandler("checkcommands",checkcommand)

function addcommand(player,command,arg1)
	if hasObjectPermissionTo (player, "command.chgpass", true )  then
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
	if hasObjectPermissionTo (player, "command.chgpass", true )  then
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

function autoUnmute ( player )
	if ( isElement ( player ) and isPlayerMuted ( player ) ) then
		setPlayerMuted ( player, false )
	end
end