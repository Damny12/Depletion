/// @desc counts amount of items in an array
/// @param {array} array array
/// @param {any*} item item to count
/// @returns {real} amount of item
function count(array, item){
	var _return = 0
	for (var i=0; i<array_length(array); i++){
		if (item==array[i]){
			_return+=1
		}
	}
	return _return
}