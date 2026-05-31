if (currentTick==tickWait and !done){
    done=true
}
if (!waitForKey){
    currentTick+=1
}else if(event_type==ev_keypress){
    done=true
}
