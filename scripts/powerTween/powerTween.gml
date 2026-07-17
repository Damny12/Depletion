/// @desc
/// @param {real} a
/// @param {any*} b
/// @param {real} amt percentage
/// @param {real} pow
/// @returns {real}
function powerTween(a,b,amt,pow){
	return a + (power(amt,pow)*(b-a))
}