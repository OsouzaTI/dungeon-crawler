/// @description which side of a line is the point on.
/// @param Ax 
/// @param Ay 
/// @param Bx
/// @param By
/// @param Lx
/// @param Ly
function shadow_sign_test(_Ax, _Ay, _Bx, _By, _Lx, _Ly){

	return ((_Bx - _Ax) * (_Ly - _Ay) - (_By - _Ay) * (_Lx - _Ax));

}