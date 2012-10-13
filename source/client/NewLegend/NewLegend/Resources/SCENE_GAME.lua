
SCENE_GAME = {}
SCENE_GAME.layerFarm 	= nil		--层
SCENE_GAME.scene		= nil		--场景
SCENE_GAME.ballData		= {}
SCENE_GAME.ballLine		 = 5
SCENE_GAME.ballCel		 = 6

--初始化
SCENE_GAME.loadScene = function(width,height)
	if SCENE_GAME.isLoad == true then	
		return true
	end
	SCENE_GAME.width = width
	SCENE_GAME.height = height
	
	SCENE_GAME.layerFarm = CCLayer:create()
	-- add in farm background
	local bg = CCSprite:create("bk.png")
	bg:setPosition(width / 2 , height / 2)
	SCENE_GAME.layerFarm:addChild(bg)
	

	
	--增加宝石阵列
	local animate 	={}
	local frame		={}
	math.randomseed( os.time() )
	
	for i=1,SCENE_GAME.ballLine do
		SCENE_GAME.ballData[i]  = {}
		SCENE_GAME.ballData[i].line = {}
		for j=1,SCENE_GAME.ballCel do  
			SCENE_GAME.ballData[i].line[j] = {}
			SCENE_GAME.ballData[i].line[j].ballType 	= math.random(1,4) ; 
			SCENE_GAME.ballData[i].line[j].x				= j*106 -50
			SCENE_GAME.ballData[i].line[j].y				= i*106 -50
			SCENE_GAME.ballData[i].line[j].vx			= 0
			SCENE_GAME.ballData[i].line[j].vy			= 0
			SCENE_GAME.ballData[i].line[j].flag			= 0
			SCENE_GAME.ballData[i].line[j].sprite		= nil
		end
	end
	
	local	fineNane 		={}
	fineNane[1]	={"b1.png" ,"b1.png" }
	fineNane[2]	={"b2.png" ,"b2.png" }
	fineNane[3]	={"b3.png" ,"b3.png" }
	fineNane[4]	={"b4.png" ,"b4.png" }
	for i=1,4 do
		animate[i],frame[i] = COMMON.creatAniFromImgs(fineNane[i],106,106,1,0.5)
	end	
	
	
	for i=1,SCENE_GAME.ballLine do
		for j=1,SCENE_GAME.ballCel do  		
			local  index = 1
			index = SCENE_GAME.ballData[i].line[j].ballType 
			SCENE_GAME.ballData[i].line[j].sprite = COMMON.creatSpriteFromAni( animate[ index ]  ,frame[index],	SCENE_GAME.ballData[i].line[j].x,	SCENE_GAME.ballData[i].line[j].y )
			SCENE_GAME.layerFarm:addChild(SCENE_GAME.ballData[i].line[j].sprite)	
		end
	end	
	
	local sk = CCSprite:create("skill.png")
	sk:setPosition(width / 2 , height * 21/ 32+5)
	SCENE_GAME.layerFarm:addChild(sk)
	
	local p1 = CCSprite:create("p1.png")
	p1:setPosition(width / 4 , height * 21/ 32+180)
	SCENE_GAME.layerFarm:addChild(p1)
	
	local p2 = CCSprite:create("p2.png")
	p2:setPosition(width*3/4 , height * 21/ 32+180)
	SCENE_GAME.layerFarm:addChild(p2)	
	
    SCENE_GAME.layerFarm:registerScriptTouchHandler(SCENE_GAME.onTouch)
    SCENE_GAME.layerFarm:setTouchEnabled(true)
		
	
    SCENE_GAME.scene = CCScene:create()
    SCENE_GAME.scene:addChild(SCENE_GAME.layerFarm)
	

	
	SCENE_GAME.isLoad = true
	return true
end

--场景结束
SCENE_GAME.isEnd = function()
	return SCENE_GAME.endFlag
end

--帧响应-------------------------------------------------------------------------------------------------------
SCENE_GAME.update = function(delTime)
    if SCENE_GAME.isLoad == nil then	
		return false
	end	
	

end

--消息响应-----------------------------------------------------------------------------------------------------
SCENE_GAME.onTouchBegan = function(x,y)
	SCENE_GAME.touchBeginPoint ={x = x, y = y}
	

	
	local  indexX,indexY=SCENE_GAME.GetBallIndex (x,y)
	if (indexX>0  and indexX<7)and(indexY>0 and indexY<7) then
		SCENE_GAME.ballData[indexY].line[indexX].sprite:setVisible(false)		
		SCENE_GAME.ballData[indexY].line[indexX].sprite:setPositionX(1000)
	end 
	return true
end

SCENE_GAME.onTouchMoved = function(x,y)
	if SCENE_GAME.touchBeginPoint then
		SCENE_GAME.touchBeginPoint ={x = x, y = y}
	end
	return true
end

SCENE_GAME.onTouchEnded = function(x,y)
	SCENE_GAME.touchBeginPoint = nil
	return true
end

SCENE_GAME.onTouch = function(eventType, x, y)
	if eventType == CCTOUCHBEGAN then
		return SCENE_GAME.onTouchBegan(x, y)
	elseif eventType == CCTOUCHMOVED then
		return SCENE_GAME.onTouchMoved(x, y)
	else
		return SCENE_GAME.onTouchEnded(x, y)
	end
end

--本场景专用----------------------------------------------------------------------------------------------------------
SCENE_GAME.GetBallIndex = function(x,y)
	local  indexX = math.ceil(x/106)
	local  indexY = math.ceil(y/106)
	return indexX,indexY
end
