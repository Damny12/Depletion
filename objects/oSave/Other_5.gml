save=[]

//objects
for (var i = 0;i<instance_number(all);i++){
	objectID=instance_id[i]
	objectSelf=method(objectID,ReturnSelf)
	array_push(save,objectSelf())
}

buffer=buffer_create(string_byte_length(save)-1,buffer_fixed,1)
buffer_write(buffer,buffer_string,save)
buffer_save(buffer,"saveData.dat")
buffer_delete(buffer)
