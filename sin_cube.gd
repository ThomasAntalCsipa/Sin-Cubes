extends ColorRect

# "time" variable
var t : float = 0
# sin of t and cos of t
var st
var ct
# abs of sin of t and abs of cos of t
var ast
var act

# half versions
var hst
var hct

# spesial half versions
var shst
var shct

# last frame's sin of t
var lst = 0
 #slope of sin of t
 #it can go downwards -1
 #it can go upwards    1
var sst


func _process(delta: float) -> void:
	
	t += delta
	
	# makes it so t dose not go infin
	# 4 pi so halfs work to
	t = fmod(t, PI * 4)
	
	st = sin(t)
	ct = cos(t)
	
	ast = abs(st)
	act = abs(ct)
	
	hst = sin(t * 0.5)
	hct = cos(t * 0.5)
	
	#both has a spesific offset to make sometihn cool
	shst = sin((t + (PI * 0.5)) * 0.5)
	shct = cos((t + (PI * 0.5)) * 0.5)
	
	if lst < st:
		sst = 1
	elif lst > st:
		sst = -1
	
	
	#if sin(t) > 0:
		#
		#if st + PI / 2 < ct + PI / 2:
			#scale.x = st
			#scale.y = ct
			#modulate = "#0000ff"
			#
		#elif st > ct:
			#scale.x = st
			#scale.y = ct
			#modulate = "#ff0000"
		#
	#elif sin(t) < 0:
		#
		#if st + PI / 2 < ct + PI / 2:
			#scale.x = st
			#scale.y = ct
			#modulate = "#0000ff"
			#
		#elif st + PI / 2 > ct + PI / 2:
			#scale.x = st
			#scale.y = ct
			#modulate = "#ff0000"
	
	
	#if sst > 0 and st > 0:
		##
		#scale.x = sin((t * 2) + PI / 2) * st / ast
		#scale.y = st / ast
		##print(1)
		##
	#elif sst < 0 and st > 0:
		##
		#scale.x = ct / act
		#scale.y = sin((t * 2) + PI / 2) * ct / act
		##print(2)
		##
	#elif sst < 0 and st < 0:
		##
		#scale.x = sin((t * 2) + PI / 2) * st / ast
		#scale.y = st / ast
		##print(3)
		##
	#elif sst > 0 and st < 0:
		##
		#scale.x = ct / act
		#scale.y = sin((t * 2) + PI / 2) * ct / act
		##print(4)
	
	#if snapped(ast, 0.001) == snapped(sin(fmod(t, PI / 2)), 0.001):
		#
		#scale.x = sin((t * 2) + PI / 2) * ct / act
		#scale.y = st / ast
		#modulate = "#0000ff"
		#
	#elif snapped(ast ,0.001) == snapped(sin(fmod(t, PI / 2) + PI / 2), 0.001):
		#
		#scale.x = ct / act
		#scale.y = sin((t * 2) + PI / 2) * -st / ast
		#modulate = "#ff0000"
	#
	#print( )
	#print(t)
	#print(ast == sin(fmod(abs(t), PI / 2)))
	#print(abs(shst))
	#print(abs(shct) / shct)
	
	
	# this works bc it devides it up to four parts
	# part 1 and 3 use the x
	# 2 and 4 uses y
	# the 1/-1 modifier changes every second part
	if ct > 0:
		
		scale.x = st * (abs(shct) / shct)
		
		#modulate = "#ff0000"
	
	elif ct < 0:
		
		scale.y = st * (abs(shct) / shct)
		
		#modulate = "#0000ff"
	
	#scale.x = sin(2.1*t)
	#scale.y = st
	
	#rotation = t
	#rotation = t * ct
	#rotation = st * st * 2 * PI
	rotation = 0
	
	#modulate = "#ffffff"
	
	lst = st
