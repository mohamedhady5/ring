if iswindows()
	LoadLib("ring_uv.dll")
but ismacosx()
	LoadLib("libringuv.dylib")
but islinux() and not isandroid()
	LoadLib("libringuv.so")
ok

Load "ring_libuv.rh"

func uv_listen oObj,nOption,cFunc 
	return uv_listen_2(oObj,nOption,uv_callback(oObj,"connect",cFunc))

func uv_tcp_connect oConnect,oSocket,oAddr,cFunc 
	return uv_tcp_connect_2(oConnect,oSocket,oAddr,
		uv_callback(oSocket,"connect",cFunc) )

func uv_walk oloop, cFunc, oArg
	return uv_walk_2(oLoop,
		uv_callback(oLoop,"walk",cFunc),
		oArg)

func uv_close handle, cFunc
	return uv_close_2(handle,
		uv_callback(handle,"close",cFunc))

func uv_timer_start handle, cFunc, timeout, repeat
	return uv_timer_start_2(handle,
		uv_callback(handle,"timer",cFunc),
		timeout,repeat)

func uv_prepare_start prepare, cFunc
	return uv_prepare_start_2(prepare,
		uv_callback(prepare,"prepare",cFunc))

func uv_check_start check, cFunc
	return uv_check_start_2(check,
		uv_callback(check,"check",cFunc))

func uv_idle_start oObj,cFunc
	return uv_idle_start_2(oObj,
		uv_callback(oObj,"idle",cFunc))

