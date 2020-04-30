


Pioneer = {
    
button = {},
    
staticimage = {},
    
label = {}
,
font = {}}


local PlayList = {---<radio>http://stream.nonstopplay.co.uk/nsp-192k-mp3|NON STOP</radio>
{"http://air2.radiorecord.ru:9003/rapclassics_320", "LS FM"}, ---{"playlist/Песня под номером.mp3", "Sound 1 - название песни"},
{"http://air2.radiorecord.ru:9003/cadillac_320", "Cadillac FM"},
{"http://air.radiorecord.ru:8102/club_320", "Club FM"},
{"http://139.162.14.151:9090/160mp3", "Retro FM"},
{"http://air2.radiorecord.ru:9003/synth_320", "Synthwave FM"},
{"http://air2.radiorecord.ru:9003/2step_320", "2 step FM"},
{"http://air2.radiorecord.ru:9003/trap_320", "Trap FM"},
{"http://air.radiorecord.ru:8102/rock_320", "Rock Wave"},
}
local SoundDist = 25
local sound = {}
local soundnum = {}
local volume = {}
localPlayer = getLocalPlayer()
addEventHandler("onClientResourceStart", resourceRoot,
 function(res)

    if res == getThisResource() then
        -----------------------------------------------------------------------------------------------------------
        Pioneer.staticimage[1] = guiCreateStaticImageEx(742, 900, 216, 127, "files/pioneer.png", false)
        
        guiSetProperty(Pioneer.staticimage[1], "ImageColours", "tl:FF686868 tr:FF686868 bl:FF686868 br:FF686868")

        
        Pioneer.staticimage[2] = guiCreateStaticImageEx(181, 28, 25, 19, "files/but1.png", false, Pioneer.staticimage[1])
        Pioneer.staticimage[3] = guiCreateStaticImageEx(182, 60, 25, 19, "files/but2.png", false, Pioneer.staticimage[1])
        
        Pioneer.staticimage[4] = guiCreateStaticImageEx(8, 61, 25, 19, "files/but3.png", false, Pioneer.staticimage[1])
        
        Pioneer.staticimage[5] = guiCreateStaticImageEx(10, 28, 25, 19, "files/but4.png", false, Pioneer.staticimage[1])
        
        Pioneer.staticimage[6] = guiCreateStaticImageEx(179, 92, 25, 19, "files/but5.png", false, Pioneer.staticimage[1])
        
        Pioneer.staticimage[7] = guiCreateStaticImageEx(3, 89, 38, 25, "files/but6.png", false, Pioneer.staticimage[1])
  
        -----------------------------------------------------------------------------------------------------------       
        Pioneer.font[0] = dxCreateFont("files/digit.ttf", 19)
  
        Pioneer.font[1] = dxCreateFont("files/digit.ttf", 15)
  
        Pioneer.font[2] = dxCreateFont("files/digit.ttf", 17)
        -----------------------------------------------------------------------------------------------------------
        guiSetVisible(Pioneer.staticimage[1], false)
        bindKey("m", "down", PioneerMenu, localPlayer )
        -----------------------------------------------------------------------------------------------------------
    end
end
)

addEventHandler("onClientResourceStop", resourceRoot,
 function(res)

    if res == getThisResource() then
        if isElement(Pioneer.staticimage[1]) then destroyElement(Pioneer.staticimage[1]) end
        if isElement(Pioneer.staticimage[2]) then destroyElement(Pioneer.staticimage[2]) end
        if isElement(Pioneer.staticimage[3]) then destroyElement(Pioneer.staticimage[3]) end
        if isElement(Pioneer.staticimage[4]) then destroyElement(Pioneer.staticimage[4]) end
        if isElement(Pioneer.staticimage[5]) then destroyElement(Pioneer.staticimage[5]) end
        if isElement(Pioneer.staticimage[6]) then destroyElement(Pioneer.staticimage[6]) end
        if isElement(Pioneer.staticimage[7]) then destroyElement(Pioneer.staticimage[7]) end
        if isElement(Pioneer.font[0]) then destroyElement(Pioneer.font[0]) end
        if isElement(Pioneer.font[1]) then destroyElement(Pioneer.font[1]) end
        if isElement(Pioneer.font[2]) then destroyElement(Pioneer.font[2]) end
        Pioneer.staticimage[1] = nil
        Pioneer.staticimage[2] = nil
        Pioneer.staticimage[3] = nil
        Pioneer.staticimage[4] = nil
        Pioneer.staticimage[5] = nil
        Pioneer.staticimage[6] = nil
        Pioneer.staticimage[7] = nil
        Pioneer.font[0] = nil
        Pioneer.font[1] = nil
        Pioneer.font[2] = nil
        SoundDist = nil
        for k, vehicle in ipairs(getElementsByType("vehicle")) do
            if isElement(sound[vehicle]) then destroyElement(sound[vehicle]) end
            sound[vehicle] = nil
            soundnum[vehicle] = nil
            volume[vehicle] = nil
        end
    end
end
)

function PioneerMenu (key, state, thePlayer )
    if getPedOccupiedVehicle(localPlayer) and getVehicleController(getPedOccupiedVehicle(localPlayer))==localPlayer then
        if (guiGetVisible(Pioneer.staticimage[1]) == false) then 
            guiSetVisible(Pioneer.staticimage[1], true)
            showCursor(true)
        else
            guiSetVisible(Pioneer.staticimage[1], false)
            showCursor(false)
        end
    end
end
function onGuiClickPanel (button, state, absoluteX, absoluteY)
  vehicle = getPedOccupiedVehicle(localPlayer)
  if vehicle and getVehicleController(vehicle) == localPlayer then
    if (source == Pioneer.staticimage[3]) then        
        triggerServerEvent("nextSoundServer", getRootElement(), vehicle)
    elseif (source == Pioneer.staticimage[4]) then
        triggerServerEvent("prevSoundServer", getRootElement(), vehicle)
    elseif (source == Pioneer.staticimage[6]) then
        triggerServerEvent("uvolSoundServer", getRootElement(), vehicle)
    elseif (source == Pioneer.staticimage[7]) then
        triggerServerEvent("dvolSoundServer", getRootElement(), vehicle)
    elseif (source == Pioneer.staticimage[2]) then
        triggerServerEvent("playSoundServer", getRootElement(), vehicle)
    elseif (source == Pioneer.staticimage[5]) then
        triggerServerEvent("stopSoundServer", getRootElement(), vehicle)
    end
  end
end
addEventHandler ("onClientGUIClick", getRootElement(), onGuiClickPanel)


addEventHandler("onClientRender", root,
    
function()

    vehicle = getPedOccupiedVehicle(localPlayer)
    if vehicle and getVehicleController(vehicle) == localPlayer then
        for k, v in ipairs(getAttachedElements(vehicle)) do
            if sound[vehicle] and isElement(sound[vehicle]) and sound[vehicle] == v then
                if (guiGetVisible(Pioneer.staticimage[1]) == true) then 
                    --vol = getSoundVolume(sound[vehicle])
                    pos = math.floor ( getSoundPosition(sound[vehicle]) )
                    len = math.floor ( getSoundLength(sound[vehicle]) )
                    dxDrawTextEx(math.floor(volume[vehicle]), 680, 1627, 919, 269, tocolor(255, 165, 0, 255), 0.5, Pioneer.font[1], "center", "center", false, false, true, false, false)
        
                    dxDrawTextEx(math.floor(soundnum[vehicle]).."/"..math.floor(#PlayList), 668, 1627, 1131, 269, tocolor(255, 165, 0, 255), 0.5, Pioneer.font[1], "center", "center", false, false, true, false, false)
        
                    dxDrawTextEx(PlayList[soundnum[vehicle]][2], 568, 1645, 1131, 297, tocolor(255, 165, 0, 255), 0.8, Pioneer.font[1], "center", "center", false, false, true, false, false)
        
                    dxDrawTextEx(convertTime (pos), 668, 1674, 945, 319, tocolor(255, 165, 0, 255), 0.5, Pioneer.font[2], "center", "center", false, false, true, false, false)
        
                    dxDrawTextEx(convertTime (len), 656, 1674, 1131, 319, tocolor(255, 165, 0, 255), 0.5, Pioneer.font[2], "center", "center", false, false, true, false, false)
        
                end
            end
        end  
    end
end
)


function msToMinutes ( ms )
    m = math.floor ( ms/60000 )
    s = math.floor( (ms/1000)%60 ) -- Will return round integers, instead of big long floats.
    return m, s
end

function convertTime (seconds)
  seconds = tonumber(seconds)
  if seconds <= 0 then
    return "00:00"
  else
    hours = string.format("%02.f", math.floor(seconds/3600))
    mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)))
    secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60))
    --if hours > 0 then
        --return hours..":"..mins..":"..secs
    --else
        return mins..":"..secs
    --end
  end
end


function guiCreateStaticImageEx (x, y, w, h, file, bool, parent)
    myx, myy = 1280, 1024
    sx, sy = guiGetScreenSize ()
    return guiCreateStaticImage ( sx*(x/myx), sy*(y/myy), sx*(w/myx), sy*(h/myy), file, bool, parent)
end

function dxDrawTextEx ( text, left, top,  right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY )
    myx, myy = 1280, 1024
    sx, sy = guiGetScreenSize ()
    return dxDrawText ( text, sx*(left/myx), sy*(top/myy),  sx*(right/myx), sy*(bottom/myy), color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY )
end


function serverPlaySound(vehicle)
    if isElement(sound[vehicle]) then
        if not isSoundPaused(sound[vehicle]) then
            setSoundPaused(sound[vehicle], true)
        else
            setSoundPaused(sound[vehicle], false)
        end
    end
    if not isElement(sound[vehicle]) then
        soundnum[vehicle] = 1
        volume[vehicle] = 40
        path = PlayList[soundnum[vehicle]][1]
        x, y, z = getElementPosition(vehicle)
        sound[vehicle] = playSound3D(path, x, y, z, true)
        setSoundMaxDistance( sound[vehicle], SoundDist )
        setSoundVolume(sound[vehicle], volume[vehicle]/100)
        attachElements(sound[vehicle], vehicle,0,0,0)
    end
end

addEvent("serverPlaySound", true)

addEventHandler("serverPlaySound", getRootElement(), serverPlaySound)

function serverStopSound(vehicle)

    if isElement(sound[vehicle]) then
        destroyElement(sound[vehicle])
        --stopSound(sound[vehicle])
    end
end

addEvent("serverStopSound", true)

addEventHandler("serverStopSound", getRootElement(), serverStopSound)

function serverNextSound(vehicle)
    if isElement(sound[vehicle]) then destroyElement(sound[vehicle]) end
    if not tonumber(volume[vehicle]) then volume[vehicle] = 100 end
    if not tonumber(soundnum[vehicle]) or soundnum[vehicle] == 0 then soundnum[vehicle] = 1 end
    soundnum[vehicle] = soundnum[vehicle] + 1
    if soundnum[vehicle] > #PlayList then
        soundnum[vehicle] = 1
    end
    path = PlayList[soundnum[vehicle]][1]
    x, y, z = getElementPosition(vehicle)
    sound[vehicle] = playSound3D(path, x, y, z, true)
    setSoundMaxDistance( sound[vehicle], SoundDist )
    setSoundVolume(sound[vehicle], volume[vehicle]/100)
    attachElements(sound[vehicle], vehicle,0,0,0)
end
addEvent("serverNextSound", true)

addEventHandler("serverNextSound", getRootElement(), serverNextSound)

function serverPrevSound(vehicle)
    if isElement(sound[vehicle]) then destroyElement(sound[vehicle]) end
    if not tonumber(volume[vehicle]) then volume[vehicle] = 100 end
    if not tonumber(soundnum[vehicle]) or soundnum[vehicle] == 0 then soundnum[vehicle] = 1 end
    soundnum[vehicle] = soundnum[vehicle] - 1
    if soundnum[vehicle] <= 0 then
        soundnum[vehicle] = #PlayList
    end
    path = PlayList[soundnum[vehicle]][1]
    x, y, z = getElementPosition(vehicle)
    sound[vehicle] = playSound3D(path, x, y, z, true)
    setSoundMaxDistance( sound[vehicle], SoundDist )
    setSoundVolume(sound[vehicle], volume[vehicle]/100)
    attachElements(sound[vehicle], vehicle,0,0,0)
end
addEvent("serverPrevSound", true)

addEventHandler("serverPrevSound", getRootElement(), serverPrevSound)

function serverUvolSound(vehicle)
    if isElement(sound[vehicle]) then
        if not tonumber(volume[vehicle]) then volume[vehicle] = 100 end
        volume[vehicle] = math.floor(volume[vehicle]+5)
        if volume[vehicle] >= 100 then
            volume[vehicle] = 100
        end
        setSoundVolume(sound[vehicle], volume[vehicle]/100)
    end
end
addEvent("serverUvolSound", true)

addEventHandler("serverUvolSound", getRootElement(), serverUvolSound)

function serverDvolSound(vehicle)
    if isElement(sound[vehicle]) then
        if not tonumber(volume[vehicle]) then volume[vehicle] = 100 end
        volume[vehicle] = math.floor(volume[vehicle]-5)
        if volume[vehicle] <= 0 then
            volume[vehicle] = 0
        end
        setSoundVolume(sound[vehicle], volume[vehicle]/100)
    end
end
addEvent("serverDvolSound", true)

addEventHandler("serverDvolSound", getRootElement(), serverDvolSound)