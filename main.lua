display.setStatusBar( display.HiddenStatusBar )

display.setDefault( "anchorX", 0 )
display.setDefault( "anchorY", 0 )

-- Convert Code ( HEX > RGB )
local function CC(hex)
    local r = tonumber(hex:sub(1, 2), 16) / 255
    local g = tonumber(hex:sub(3, 4), 16) / 255
    local b = tonumber(hex:sub(5, 6), 16) / 255
    local a = 255 / 255
    if #hex == 8 then a = tonumber(hex:sub(7, 8), 16) / 255 end
    return r, g, b, a
end
-- var
local _W = display.contentWidth
local _H = display.contentHeight

local map1 = display.newImage("/map/1.png",0,0)
map1:scale(2.4,2.4)
local map2 = display.newImage("/map/2.png",0,0)
map2:scale(1.9,1.9)
map2.x = map1.x + map1.width * 2.4
local map3 = display.newImage("/map/3.png",0,0)
map3:scale(1.05,1.05)
map3.x = map2.x + map2.width * 1.9
local map4 = display.newImage("/map/4.png",0,0)
map4:scale(1,1)
map4.x = map3.x + map3.width * 1.05

function movedMap(event)
	map1.x = map1.x - 5
	map2.x = map2.x - 5
	map3.x = map3.x - 5
	map4.x = map4.x - 5
if map1.x<-1 * map1.width * 2.4 - _W then
	map1.x = map4.x + map4.width *1
end
if map2.x<-1 * map2.width * 1.9 - _W then
	map2.x = map1.x + map1.width *2.4
end
if map3.x<-1 * map3.width *1.05 - _W then
	map3.x = map2.x + map2.width *1.9
end
if map4.x<-1 * map4.width * 1.05 - _W then
	map4.x = map3.x + map3.width *1.05
end
end
local bar = display.newRect(0, _H/ 3*2+60,_W,50)
bar:setFillColor(CC("ff6607"))
Runtime:addEventListener("enterFrame",movedMap)

local cookieDate =
{
	width = 100;
	height = 100;
	numFrames = 7;
	SheetContentWidth = 700,
	SheetContentHeight = 100
}
local sheetData =
{
	{name = "run",frams = {1,2,3,4,5,6}, time = 500,loopCount = 0},
	{name = "jump",frams = {7},time = 500,loopCount=0}
}
local sheet = graphics.newImageSheet("/character/on_cookie.png",cookieData)

local cookieAnimation = display.newSprite(sheet,sheetData)
cookieAnimation.x = _W/2-75
cookieAnimation.Y = _H/3*2-40
cookieAnimation:play()
--up
local function jump1(event)
end
--down
local function jump2(event)
end