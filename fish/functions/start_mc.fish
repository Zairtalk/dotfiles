function start_mc --wraps='s docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY="4G" -v /home/zairtalk/minecraft-data:/data itzg/minecraft-server' --description 'alias start_mc=s docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY="4G" -v /home/zairtalk/minecraft-data:/data itzg/minecraft-server'
  s docker run -it -p 25565:25565 -e EULA=TRUE -e MEMORY="4G" -v /home/zairtalk/minecraft-data:/data itzg/minecraft-server $argv; 
end
