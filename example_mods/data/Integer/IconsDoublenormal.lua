--Automatic Search so you won't need to type the entire path unless you have the icons on a different path (This will only work if you want an automatic search from the 4 characters icons just make sure that all the icons are at 300*150 and you don't want to type the path of their icons--
--Important for P4 icon it would onl work if you are using my extra character script that i added here
auto = false

--Just in case you don't want them above or below icon p1 and p2 then set this on true to put them in the same y position
behind = true

--This just change if you want the extra character took the P3 icon position and viceverse
switch = false

--Modes--
--3rd icon only
--You can do an auto if you only want gf's icon unless you set switch on true
--Set on true when you want only P3 being the enemy and there isn't a character which takes the place of P4
P3P = false

--Set on true when you want only a P3 being the player's ally and there isn't a character which takes the place of P4
P3E = true

--By default it will bring both icons so let them on false to bring P3 and P4 icons so plz don't set both as true .-.

--This is for those people who didn't set auto on true

--Quick explanation P3 is for player's ally icon and P4 is for being the opponent's ally below there are other modes of this script if you only want a third icon
--Just write the path of your icons make sure the resolution of them are 300*150 the winning icons support is below 
P3 = "icons/icon-Game"
P4 = "icons/icon-Air" 

--I swear to god that this not necessarily and now the code is big mess with it
--I mean i can just get the icons with a function but nah i'm too lazy for that

--DO NOT TOUCH THIS--

function onCreatePost() --Made by me Aldoidk04 :33333
if not switch then
  if auto then
  autoP3 = "icons/icon-"..getPath("gf")
  autoP4 = "icons/icon-"..getPath("extra")
     if P3E then
     autoP4 = autoP3
     automatic2()
     elseif P3P then
     automatic1()
     else
     automatic1()
     automatic2()
     end
  else
    if P3E then
		P4 = P3
		icon2()
	elseif P3P then
		icon1()
	else
		icon1()
		icon2()
	end
end
else
if auto then
autoP3 = "icons/icon-"..getPath("extra")
autoP4 = "icons/icon-"..getPath("gf")
if P3E then
autoP4 = autoP3
automatic2()
elseif P3P then
automatic1()
else
automatic1()
automatic2()
end
else
if P3E then
		P4 = P3
		icon2()
	elseif P3P then
		icon1()
	else
		icon1()
		icon2()
	end
end
end
end

function getPath(icon) --I even had the idea to make automatically get the icons P1 and P2 but it would be a mess that tbh
if icon == "gf" then
the = getProperty("gf.healthIcon")
elseif icon == "extra" then
the = getProperty("extra.healthIcon")
   else
      the = "face"
   end
   return the
end


function automatic1()
makeLuaSprite('iconP3',nil,0,0)
	loadGraphic('iconP3', autoP3, 150)
	addAnimation('iconP3', autoP3, {0, 1}, 0)
	setObjectOrder('iconP3', getObjectOrder('iconP2') + 1)
	setObjectCamera('iconP3', "camHUD")
        setProperty('iconP3.flipX',true)
end

function automatic2()
makeLuaSprite('iconP4',nil,0,0)
	loadGraphic('iconP4', autoP4, 150)
	addAnimation('iconP4', autoP4, {0, 1}, 0)
	setObjectOrder('iconP4', getObjectOrder('iconP2') + 1)
	setObjectCamera('iconP4', "camHUD")
end


--The rest is just the logic of the script :p sorry if is a big mess
function icon1()
	makeLuaSprite('iconP3',nil,0,0)
loadGraphic('iconP3', P3, 150)
	addAnimation('iconP3', P3, {0, 1}, 0)
	setObjectOrder('iconP3', getObjectOrder('iconP1') + 1)
	setProperty("iconP3.flipX", true)
	setObjectCamera('iconP3', "camHUD")
end

function icon2()
	makeLuaSprite('iconP4',nil,0,0)
	loadGraphic('iconP4', P4, 150)
	addAnimation('iconP4', P4, {0, 1}, 0)
	setObjectOrder('iconP4', getObjectOrder('iconP2') + 1)
	setObjectCamera('iconP4', "camHUD")
end


function onEvent(n,v1,v2)--This will only work with auto is set on true
if n == 'Change Character' then
if v1 == 'gf' then
autoP3 = "icons/icon-"..getPath("gf")
automatic1()
end
elseif n == 'Change 4th Character' then
autoP4 = "icons/icon-"..getPath("extra")
automatic2()
end
end


function onUpdatePost()
	h = getProperty('health')

	for i = 3, 4 do
		local ic = 'iconP'..(i - 2)
	--Oh yeah if you want them with the same alpha from the actual icons just remove the 2 lines lol
		setProperty('iconP'..i..'.alpha',getProperty(ic..'.alpha'))
		setProperty('iconP'..i..'.angle',getProperty(ic..'.angle'))
		setProperty('iconP'..i..'.x',getProperty(ic..'.x') + (i == 3 and 80 or -80))
--If you want to make them smaller i would recommend you to just write -0.1
		setProperty('iconP'..i..'.scale.x', getProperty(ic..'.scale.x'))
		setProperty('iconP'..i..'.scale.y', getProperty(ic..'.scale.y'))
--Normal shit thx to daniel to make it easier at least for normal icons
setProperty('iconP3.animation.curAnim.curFrame', h < 0.4 and 1 or 0)
	setProperty('iconP4.animation.curAnim.curFrame', h > 1.63 and 1 or 0)
if behind then
		setProperty('iconP'..i..'.y',getProperty(ic..'.y'))
else
setProperty('iconP'..i..'.y',getProperty(ic..'.y') + (downscroll and -20 or 20))
end
end
end



